#include "app_config.h"
// #include "soc/rtc_wdt.h"
#include "app_utility.h"
#include "esp_pm.h"
#include "esp_sleep.h"
#include "sdkconfig.h"

#ifdef CONFIG_DEVICE_TYPE_REMOTE_GATEWAY
#define BEEP(on, off, fade, repeat) periph_led_blink(led_handle, REMOTE_GW_BUZZER_PIN, on, off, fade, repeat)
#else
#define BEEP(on, off, fade, repeat)
#endif

#define EVENT_CHECK(err, a)    \
    if ((err = a) != ESP_OK) { \
        return err;            \
    }
#define IS_NOT_STR(x)            (x == NULL || (x && strlen(x) == 0))
#define IS_STR(x)                (!IS_NOT_STR(x))
#define MAX_SIZE_MOTOR_CMD_TABLE 4
#define WAKEUP_TIME_SEC          30

static app_event_handle_t  app_event = NULL;
static esp_periph_handle_t led_handle = NULL;
static esp_periph_handle_t led_low_handle = NULL;
static esp_periph_handle_t touch_handle = NULL;
static esp_periph_handle_t button_handle = NULL;
static esp_periph_handle_t ota_handle = NULL;
static esp_periph_handle_t monitor_handle = NULL;
static esp_periph_handle_t mesh_handle = NULL;
static esp_periph_handle_t aircond_handle = NULL;
static esp_periph_handle_t thermostat_handle = NULL;

static const char *TAG = "TOUCH_APP";

static const motor_control_t motor_command_table[MAX_SIZE_MOTOR_CMD_TABLE][MAX_RELAY_TOUCH_PAD_NUM] = {
    {MOTOR_CTRL_NONE, MOTOR_CTRL_NONE, MOTOR_CTRL_NONE, MOTOR_CTRL_NONE},
    {MOTOR_SINGLE_CTRL_OPEN, MOTOR_SINGLE_CTRL_CLOSE, MOTOR_CTRL_NONE, MOTOR_CTRL_NONE},
    {MOTOR_SINGLE_CTRL_OPEN, MOTOR_SINGLE_CTRL_STOP, MOTOR_SINGLE_CTRL_CLOSE, MOTOR_CTRL_NONE},
    {MOTOR_OUT_CTRL_OPEN, MOTOR_IN_CTRL_OPEN, MOTOR_IN_CTRL_CLOSE, MOTOR_OUT_CTRL_CLOSE},
};

char *log_buffer_hex(uint8_t *buff, uint16_t size) {
    char *logBuff = (char *)calloc(sizeof(char), (size * 3) + 1);
    for (uint16_t i = 0; i < size; i++) {
        sprintf(&logBuff[i * 3], "%02x ", buff[i]);
    }
    return logBuff;
}

esp_err_t _periph_event_handle(audio_event_iface_msg_t *event, void *context) {
    esp_err_t err;
    if ((event->source_type == PERIPH_ID_MESH && event->cmd == PERIPH_MESH_FORCE_UPDATE_OTA)) {
        if (ota_handle != NULL) {
            LOGI(TAG, "OTA UPDATE");
            periph_ota_force_update(ota_handle);
        }
    }
    if ((event->source_type == PERIPH_ID_MESH && event->cmd == PERIPH_MESH_SET_BRIDGE)) {
        BridgeInfo *BridgeInfo = event->data;
        int         touch_idx = event->data_len - 1;
        int         target_switcher = BridgeInfo->targetswitcher - 1;
        if ((touch_idx >= 0 || touch_idx < MAX_RELAY_TOUCH_PAD_NUM) && BridgeInfo->targethardwareid) {
            if (strlen(BridgeInfo->targethardwareid) > MAX_ENV_SIZE) {
                return ESP_FAIL;
            }
            strcpy(g_bridge_info.bridge[touch_idx].target_hwid, BridgeInfo->targethardwareid);
            g_bridge_info.bridge[touch_idx].target_switcher = target_switcher;
            g_bridge_info.bridge[touch_idx].bridge_type = BridgeInfo->bridgetype;
            if (BridgeInfo->devicetype == GROUP_DEVICE__SwitcherGroup) {
                g_bridge_info.bridge[touch_idx].target_type = TOUCH_SWITCH;
            } else if (BridgeInfo->devicetype == GROUP_DEVICE__MotionGroup) {
                g_bridge_info.bridge[touch_idx].target_type = MOTION_SENSOR;
            }
            cfg_save_bridge();
        }
    }

    if ((event->source_type == PERIPH_ID_MESH && event->cmd == PERIPH_MESH_REMOVE_BRIDGE)) {
        BridgeInfo *BridgeInfo = event->data;
        int         touch_idx = event->data_len - 1;
        if ((touch_idx >= 0 || touch_idx < MAX_RELAY_TOUCH_PAD_NUM) && BridgeInfo->targethardwareid) {
            memset(&g_bridge_info.bridge[touch_idx], 0, sizeof(touch_bridge_t));
            cfg_save_bridge();
        }
    }

    if (event->source_type == PERIPH_ID_MESH && event->cmd == PERIPH_MESH_SET_ACTIVE_TIME) {
        LOGD(TAG, "PIR set active time");
#ifdef CONFIG_DEVICE_TYPE_PIR
        ActiveTime *activeTime = event->data;
        sys_cfg.time_start = (uint16_t)activeTime->enablestart;
        sys_cfg.time_end = (uint16_t)activeTime->enableend;
        sys_cfg.en_full_time = activeTime->enablefulltime;
        sys_cfg.day_map = activeTime->enabledaymap;
        LOGD(TAG, "Active Time: enFullTime=%d, start=%d, end=%d, dayMap=%d", sys_cfg.en_full_time, sys_cfg.time_start, sys_cfg.time_end, sys_cfg.day_map);
        cfg_save();
#endif
    }

    EVENT_CHECK(err, periph_monitor_process_events(event, context));
    if (app_event != NULL) {
        EVENT_CHECK(err, app_event_callback(app_event, event, context));
    }
    periph_mesh_touch_monitor_events(mesh_handle, event, context);
    periph_mesh_pir_monitor_events(mesh_handle, event, context);
    periph_mesh_curtain_monitor_events(mesh_handle, event, context);
    periph_mesh_remote_monitor_events(mesh_handle, event, context);
    periph_mesh_aircond_monitor_events(mesh_handle, aircond_handle, event, context);
    return ESP_OK;
}

void set_brightness_call_back(void *param) {
    LOGD(TAG, "Schedule handle: setting proper brightness");
    if (monitor_handle != NULL) {
        periph_monitor_set_touch_brightness_mode(monitor_handle);
    }
}

// static void _wdt_feed_task(void *pv)
// {
//     while (1) {
//         vTaskDelay(1000 / portTICK_RATE_MS);
//         rtc_wdt_feed();
//     }
// }

void app_main(void) {
    ENABLE_LOGGING();
    LOGI(TAG, "Booting...");
    cfg_load();
#ifdef CONFIG_DEVICE_TYPE_TOUCH
    cfg_load_touch_statistics(sys_cfg.io);
#endif
    int io_num = sys_cfg.features & 0x0F;
    for (int i = 0; i < io_num; i++) {
        LOGI(TAG, "TOUCH[%d]=%d", i, sys_cfg.io[i].state);
    }
    cfg_print();

#ifdef CONFIG_DEVICE_TYPE_REMOTE_GATEWAY
    if (cfg_check_if_has_attribute(DEVICE_ATTR_GW_HOMEBUS)) {
        if (esp_sleep_get_wakeup_cause() == ESP_SLEEP_WAKEUP_TIMER) {
            LOGW(TAG, "Wakeup from timer");
        } else {
            esp_sleep_enable_timer_wakeup(WAKEUP_TIME_SEC * 1000000);
            LOGW(TAG, "Entering deep sleep");
            esp_deep_sleep_start();
        }
    }
#endif

    // xTaskCreate(_wdt_feed_task, "wdt", 1 * 1024, NULL, 5, NULL);

    // rtc_wdt_protect_off();
    // rtc_wdt_disable();
    // rtc_wdt_set_length_of_reset_signal(RTC_WDT_SYS_RESET_SIG, RTC_WDT_LENGTH_3_2us);
    // rtc_wdt_set_stage(RTC_WDT_STAGE0, RTC_WDT_STAGE_ACTION_RESET_SYSTEM); //RTC_WDT_STAGE_ACTION_RESET_SYSTEM or RTC_WDT_STAGE_ACTION_RESET_RTC
    // rtc_wdt_set_time(RTC_WDT_STAGE0, 10000);     // timeout rtd_wdt 7000ms.
    // rtc_wdt_enable();
    // rtc_wdt_protect_on();

    // LOGE(TAG, "RTC_WDT_IS_ON=%d", rtc_wdt_is_on());

    esp_periph_config_t config = {
        .event_handle = _periph_event_handle,
        .max_parallel_connections = 1,  // Make sure only 1 connection at the same time
        .task_core = 0,
    };
    esp_periph_init(&config);

    periph_mesh_cfg_t mesh_cfg = {
        .ssid = sys_cfg.wifi_sta_ssid,
        .password = sys_cfg.wifi_sta_pass,
        .hardware_id = sys_cfg.hw_id,
        .device_token = sys_cfg.device_token,
        .access_id = sys_cfg.device_access_id,
        .access_key = sys_cfg.device_access_key,
        .model = sys_cfg.model,
        .model_group = sys_cfg.model_group,
        .hw_version = sys_cfg.hw_version,
        .http_url = DEVICE_REGISTER_ENDPOINT,
        .ws_url = sys_cfg.ws_url,
        .ws_data_type = (int)sys_cfg.ws_data_type,
        .reg_token = MANUFACTURER_TOKEN,
        .register_template =
            "${http_url}?manToken=${reg_token}"
            "&hardwareId=${hw_id}"
            "&model=${model}"
            "&fwVer=" FIRMWARE_VERSION,
        .brightness = sys_cfg.brightness,
        .reactivity = sys_cfg.reactivity,
#ifdef CONFIG_ENABLE_HOMEKIT_MODE
        .joined_gw_flag = g_gw_joined_info.flag,
        .attempt_find_gw_first = true,
#else
        .joined_gw_flag = false,
        .attempt_find_gw_first = false,
#endif
        .sceneActiveMap = sys_cfg.sceneActiveMap,
#ifdef CONFIG_DEVICE_TYPE_PIR
        .time_delay = sys_cfg.time_delay,
#else
        .time_delay = 0,
#endif
    };
    if (IS_STR(sys_cfg.device_token) && (IS_NOT_STR(sys_cfg.device_access_id) || IS_NOT_STR(sys_cfg.device_access_key))) {
        LOGW(TAG, " The device has not been configured");
    } else {
        int random_delay_ms = esp_random() % 2000;
        LOGE(TAG, "random delay: %d", random_delay_ms);
        vTaskDelay(random_delay_ms / portTICK_PERIOD_MS);
        mesh_handle = periph_mesh_init(&mesh_cfg);
        esp_periph_start(mesh_handle);
    }

#if defined(CONFIG_DEVICE_TYPE_TOUCH) || defined(CONFIG_DEVICE_TYPE_PIR) || defined(CONFIG_DEVICE_TYPE_TOUCH_CURTAIN) || defined(CONFIG_DEVICE_TYPE_THERMOSTAT)
    // periph_alarm_cfg_t alarm_cfg = {
    //     .utc_offset = 7,
    //     .auto_request_time = false,
    // };
    // esp_periph_handle_t alarm_handle = periph_alarm_init(&alarm_cfg);
    // esp_periph_start(alarm_handle);
#endif

#if defined(CONFIG_DEVICE_TYPE_TOUCH) || defined(CONFIG_DEVICE_TYPE_TOUCH_CURTAIN) || defined(CONFIG_DEVICE_TYPE_THERMOSTAT)
    vTaskDelay(1000 / portTICK_PERIOD_MS);
    uint64_t touch_mask = cfg_get_esp_touch_mask();
    if (touch_mask) {
        periph_touch_cfg_t touch_cfg = {
            .touch_driver = ESP_TOUCH_DRIVER_ESP,
            .touch_mask = touch_mask,
            .tap_threshold_percent = MAP_TOUCH_SENSITIVE(sys_cfg.reactivity),
            .long_tap_time_ms = ENTER_CONFIG_MODE_TIME_MS,
            .delta_timer_ban_tap = 50,
            .slide_window = DEFAULT_TOUCH_SLIDE_WINDOW,
            .n_sample_accept = MAP_ACCEPT_TOUCH(sys_cfg.reactivity),
        };
        touch_handle = periph_touch_init(&touch_cfg);
        esp_periph_start(touch_handle);
    }
#endif

#if defined(CONFIG_DEVICE_TYPE_TOUCH) || defined(CONFIG_DEVICE_TYPE_TOUCH_CURTAIN) || defined(CONFIG_DEVICE_TYPE_THERMOSTAT)
    uint64_t sx_touch_mask = cfg_get_sx8636_touch_mask();
    LOGI(TAG, "sx_touch_mask %04x", (uint8_t)sx_touch_mask);
    if (sx_touch_mask) {
        periph_touch_cfg_t touch_cfg = {
            .touch_driver = ESP_TOUCH_DRIVER_SX8636,
            .sx_int_pin = SX8636_INT_PIN,
            .sx_scl_pin = SX8636_I2C_SCL_PIN,
            .sx_sda_pin = SX8636_I2C_SDA_PIN,
            .sx_sensitivity = SX8636_DEFAULT_SENSITIVITY,
            .sx_port_num = SX8636_I2C_PORT_NUM,
            .touch_mask = sx_touch_mask,
            .long_tap_time_ms = ENTER_CONFIG_MODE_TIME_MS,
        };
        touch_handle = periph_touch_init(&touch_cfg);
        esp_periph_start(touch_handle);
    }
#if CONFIG_DEVICE_HARDWARE_REVERSION2
    if (io_num == DEVICE_ATTR_TOUCH3 || io_num == DEVICE_ATTR_TOUCH4) {
        dac_output_enable(DAC_CHANNEL_1);
        int dac_value = REACTIVITY_TO_DAC(sys_cfg.reactivity);  // convert reactivity percent to dac value
        dac_output_voltage(DAC_CHANNEL_1, dac_value);
    }
#endif
    // alarm_schedule_t set_brightness_in_day = {
    //     .time = TIME_DAY_START,
    //     .repeat = ALARM_DAY,
    // };
    // periph_alarm_set(&set_brightness_in_day, set_brightness_call_back);
    // alarm_schedule_t set_brightness_in_night = {
    //     .time = TIME_DAY_END,
    //     .repeat = ALARM_DAY,
    // };
    // periph_alarm_set(&set_brightness_in_night, set_brightness_call_back);
#endif

    uint64_t button_mask = cfg_get_button_mask();
    LOGI(TAG, "button_mask = %lld", button_mask);
    if (button_mask) {
        periph_button_cfg_t btn_config = {
            .gpio_mask = button_mask,
            .long_press_time_ms = ENTER_CONFIG_MODE_TIME_MS,
            .accept_press_ms = 20 * MAP_ACCEPT_TOUCH(sys_cfg.reactivity),
        };
        button_handle = periph_button_init(&btn_config);
        esp_periph_start(button_handle);
    }

    // Require for Touch LED
    periph_led_cfg_t led_cfg = {
        .tag = "periph_led_high",
        .led_speed_mode = LEDC_HIGH_SPEED_MODE,
        .led_duty_resolution = LEDC_TIMER_13_BIT,
        .led_timer_num = LEDC_TIMER_0,
        .led_freq_hz = 2730,  // 2730 support buzzer
#ifdef CONFIG_DEVICE_TYPE_REMOTE_GATEWAY
        .max_duty_percent = 50,
#else
        .max_duty_percent = DEFAULT_DAY_BRIGHTNESS,
#endif
    };
    led_handle = periph_led_init(&led_cfg);
    esp_periph_start(led_handle);

#if defined(CONFIG_DEVICE_TYPE_TOUCH) || defined(CONFIG_DEVICE_TYPE_THERMOSTAT)

#ifdef CONFIG_DEVICE_TYPE_TOUCH
    if (io_num > 4) {
#elif CONFIG_DEVICE_TYPE_THERMOSTAT
    if (THERMOSTAT_BUZZER_PIN >= 0 || THERMOSTAT_BACKLIGHT_PIN >= 0) {
#endif
        periph_led_low_cfg_t led_low_cfg = {
            .led_speed_mode = LEDC_LOW_SPEED_MODE,
            .led_duty_resolution = LEDC_TIMER_13_BIT,
            .led_timer_num = LEDC_TIMER_1,
            .led_freq_hz = 2730,
#ifdef CONFIG_DEVICE_TYPE_TOUCH
            .max_duty_percent = DEFAULT_DAY_BRIGHTNESS,
#elif defined(CONFIG_DEVICE_TYPE_THERMOSTAT)
            .max_duty_percent = 100,
#endif
        };
        led_low_handle = periph_led_low_init(&led_low_cfg);
        esp_periph_start(led_low_handle);
    }
#endif

#if defined(CONFIG_DEVICE_TYPE_THERMOSTAT)
    periph_thermostat_cfg_t thermostat_cfg = {
        .scl_pin = THERMOSTAT_I2C_SCL,
        .sda_pin = THERMOSTAT_I2C_SDA,
        .i2c_port = THERMOSTAT_I2C_PORT,
        .backlight_pin = THERMOSTAT_BACKLIGHT_PIN,
    };
    thermostat_handle = periph_thermostat_init(&thermostat_cfg);
    esp_periph_start(thermostat_handle);
#endif
    periph_blufi_cfg_t blufi_cfg = {
        .device_name = sys_cfg.blufi_name,
        .disable_auto_start = true,
        .time_out_interval_sec = 120,
    };
    esp_periph_handle_t blufi_handle = periph_blufi_init(&blufi_cfg);
    esp_periph_start(blufi_handle);

    esp_periph_handle_t motor_handle = NULL;

#ifdef CONFIG_DEVICE_TYPE_TOUCH_CURTAIN
    periph_motor_cfg_t motor_cfg;
    motor_type_t       motor_type;
    if (cfg_check_if_has_attribute(DEVICE_ATTR_TOUCH4))
        motor_type = MOTOR_TYPE_DOUBLE;
    else if (cfg_check_if_has_attribute(DEVICE_ATTR_TOUCH2))
        motor_type = MOTOR_TYPE_SINGLE;
    else
        motor_type = MOTOR_TYPE_NONE;
    if (cfg_check_if_has_feature(DEVICE_CURTAIN_UART)) {
        LOGW(TAG, "Curtain physic protocol UART");
        motor_cfg.physic = MOTOR_UART;
        motor_cfg.hw = (motor_hw_t){
            .uart.motor_uart_in_conn = {.tx_pin = MOTOR_1_TX_PIN, .rx_pin = MOTOR_1_RX_PIN, .uart_num = MOTOR_1_UART_NUM},
            .uart.motor_uart_out_conn = {.tx_pin = MOTOR_2_TX_PIN, .rx_pin = MOTOR_2_RX_PIN, .uart_num = MOTOR_2_UART_NUM},
            .uart.motor_uart_single_conn = {.tx_pin = MOTOR_1_TX_PIN, .rx_pin = MOTOR_1_RX_PIN, .uart_num = MOTOR_1_UART_NUM},
            .uart.type = motor_type,
        };
    } else if (cfg_check_if_has_feature(DEVICE_FEATURE_CURTAIN_DRYC)) {
        LOGW(TAG, "Curtain physic protocol DRYCONTACT");
        motor_cfg.physic = MOTOR_DRYCONTACT;
        motor_cfg.hw = (motor_hw_t){
            .drycontact.motor_drycontact_in_conn = {.a_pin = MOTOR_1_TX_PIN, .b_pin = MOTOR_1_RX_PIN},
            .drycontact.motor_drycontact_out_conn = {.a_pin = MOTOR_2_TX_PIN, .b_pin = MOTOR_2_RX_PIN},
            .drycontact.motor_drycontact_single_conn = {.a_pin = MOTOR_1_TX_PIN, .b_pin = MOTOR_1_RX_PIN},
            .drycontact.type = motor_type,
        };
    }
    motor_handle = periph_motor_init(&motor_cfg);
#endif

    esp_periph_handle_t remote_handle = NULL;
#ifdef CONFIG_DEVICE_TYPE_REMOTE_GATEWAY
    periph_remote_cfg_t remote_config = {
        .tx_pin = REMOTE_GW_IRTX_PIN,
        .rmt_tx_ch = 4,
        .rx_pin = REMOTE_GW_IRRX_PIN,
        .rmt_rx_ch = 1,
        .rf_tx_pin = REMOTE_GW_RFTX_PIN,
        .rf_tx_ch = 2,
        .rf_rx_pin = REMOTE_GW_RFRX_PIN,
        .rf_rx_ch = 3,
        .rf_conf =
            {
                .mosi_pin = REMOTE_GW_RFMOSI_PIN,
                .miso_pin = REMOTE_GW_RFMISO_PIN,
                .cs_pin = REMOTE_GW_RFCS_PIN,
                .sck_pin = REMOTE_GW_RFSCK_PIN,
                .conf = PA8,
                .mhz = 433.92,
            },
#ifdef CONFIG_ALWAYS_USE_COMPRESSING
        .enable_compress = true,
#else
        .enable_compress = false,
#endif
    };
    remote_handle = periph_remote_init(&remote_config);
    esp_periph_start(remote_handle);
#endif

    esp_periph_handle_t pir_handle = NULL;
#ifdef CONFIG_DEVICE_TYPE_PIR
    periph_pir_cfg_t pir_cfg = {
        .enable_led = false,
        .sensor_pin = PIR_SENSOR_PIN,
        .led_pin = PIR_LED_PIN,
        .active_high = true,
        .time_delay = sys_cfg.time_delay * 1000,
    };
    pir_handle = periph_pir_init(&pir_cfg);
    esp_periph_start(pir_handle);
#endif

#if defined(CONFIG_DEVICE_TYPE_REMOTE_GATEWAY) || defined(CONFIG_DEVICE_TYPE_THERMOSTAT)
    periph_aircond_cfg_t aircond_cfg;
#if defined(CONFIG_DEVICE_TYPE_REMOTE_GATEWAY)
    if (cfg_check_if_has_attribute(DEVICE_ATTR_GW_UART)) {
#else
    if (cfg_check_if_has_feature(DEVICE_FEATURE_THERMOSTAT_UART)) {
#endif
        LOGI(TAG, "Aircond physic protocol UART");
        aircond_cfg.physic = AIRCOND_UART;
        aircond_cfg.hw = (aircond_hardware_t){
            .uart.tx = AIRCOND_TX_PIN,
            .uart.rx = AIRCOND_RX_PIN,
            .uart.uart_no = 1,
        };
#if defined(CONFIG_DEVICE_TYPE_REMOTE_GATEWAY)
    } else if (cfg_check_if_has_attribute(DEVICE_ATTR_GW_SPI)) {
#else
    } else if (cfg_check_if_has_feature(DEVICE_FEATURE_THERMOSTAT_SPI)) {
#endif
        LOGI(TAG, "Aircond physic protocol SPI");
        aircond_cfg.physic = AIRCOND_SPI;
        aircond_cfg.hw = (aircond_hardware_t){
            .spi.miso = AIRCOND_MISO_PIN,
            .spi.mosi = AIRCOND_MOSI_PIN,
            .spi.sck = AIRCOND_SCK_PIN,
            .spi.fake_cs = AIRCOND_FAKECS_PIN,
            .spi.cs = AIRCOND_CS_PIN,
            .spi.spi_no = 1,  // HSPI HOST
        };
#if defined(CONFIG_DEVICE_TYPE_REMOTE_GATEWAY)
    } else if (cfg_check_if_has_attribute(DEVICE_ATTR_GW_HOMEBUS)) {
#else
    } else if (cfg_check_if_has_feature(DEVICE_FEATURE_THERMOSTAT_HOMEBUS)) {
#endif
        LOGI(TAG, "Aircond physic protocol HOMEBUS");
        aircond_cfg.physic = AIRCOND_HOMEBUS;
        aircond_cfg.hw = (aircond_hardware_t){
            .homebus.rx = AIRCOND_RX_PIN,
            .homebus.tx = AIRCOND_TX_PIN,
            .homebus.uart_no = 1,
        };
#if defined(CONFIG_DEVICE_TYPE_REMOTE_GATEWAY)
    } else if (cfg_check_if_has_attribute(DEVICE_ATTR_GW_RS485)) {
#elif defined(CONFIG_DEVICE_TYPE_THERMOSTAT)
    } else if (cfg_check_if_has_feature(DEVICE_FEATURE_THERMOSTAT_RS485)) {
#endif
        LOGI(TAG, "Aircond physic protocol RS485");
        aircond_cfg.physic = AIRCOND_RS485;
        aircond_cfg.hw = (aircond_hardware_t){
            .rs485.rx = AIRCOND_RX_PIN,
            .rs485.tx = AIRCOND_TX_PIN,
            .rs485.uart_no = 1,
        };
    } else {
        LOGE(TAG, "Invalid attribute");
    }
    aircond_cfg.enable_htu_sensor = false;
#if defined(CONFIG_DEVICE_TYPE_REMOTE_GATEWAY)
    if (cfg_check_if_has_feature(DEVICE_FEATURE_GW_SENSOR)) {
        aircond_cfg.enable_htu_sensor = true;
        aircond_cfg.htu_config = (esp_htu21df_config_t){
            .sda_pin = REMOTE_GW_SENSOR_SDA_PIN,
            .scl_pin = REMOTE_GW_SENSOR_SCL_PIN,
            .port_num = REMOTE_GW_SENSOR_I2C_PORT,
        };
        aircond_cfg.get_sensor_interval = GET_TEMP_HUMI_SENSOR_SEC * 1000;
    }
#else
    aircond_cfg.enable_htu_sensor = false;
    aircond_cfg.htu_config = (esp_htu21df_config_t){
        .sda_pin = -1,
        .scl_pin = -1,
        .port_num = -1,
    };
    aircond_cfg.get_sensor_interval = 0;
#endif
    aircond_handle = periph_aircond_init(&aircond_cfg);
    esp_periph_start(aircond_handle);
#endif

    periph_monitor_cfg_t monitor_cfg = {
        .io_map = sys_cfg.io,  // Make sure it is reference
        .monitor_io = sys_cfg.indicator_io,
        .io_num = sys_cfg.features & 0x0F,
        .led_periph = led_handle,
        .led_low_periph = led_low_handle,
        .motor_periph = motor_handle,
        .remote_periph = remote_handle,
        .pir_periph = pir_handle,
        .touch_periph = touch_handle,
        .btn_periph = button_handle,
        .thermostat_periph = thermostat_handle,
        .aircond_periph = aircond_handle,
    };

#ifdef CONFIG_DEVICE_TYPE_TOUCH_CURTAIN
    uint8_t device_attributes = (sys_cfg.features & (DEVICE_ATTR_TOUCH1 | DEVICE_ATTR_TOUCH2 | DEVICE_ATTR_TOUCH3 | DEVICE_ATTR_TOUCH4));
    memcpy(monitor_cfg.motor_ctrl_cmd, motor_command_table[device_attributes - 1], MAX_RELAY_TOUCH_PAD_NUM * sizeof(motor_control_t));
#endif
    monitor_handle = periph_monitor_init(&monitor_cfg);
    esp_periph_start(monitor_handle);

    if (motor_handle != NULL) {
        esp_periph_start(motor_handle);
    }

    periph_ota_cfg_t ota_cfg = {
        .update_interval_in_seconds = OTA_UPDATE_INTERVAL_SEC,
        .uri = DEVICE_OTA_ENDPOINT,
        .version = FIRMWARE_VERSION,
        .token = sys_cfg.device_token,
        .model = sys_cfg.model,
        .disable_storage = true,
        .enable_random_delay = false,
        .disable_auto_ota = true,
    };
    char *ota_buffer = NULL;
    asprintf(&ota_buffer, "${uri}?fwVer=${version}&hardwareId=%s&deviceToken=${token}&model=${model}", sys_cfg.hw_id);
    ota_cfg.update_template = (const char *)ota_buffer;
    ota_handle = periph_ota_init(&ota_cfg);
    free(ota_buffer);
    esp_periph_start(ota_handle);

    app_event_config_t event_config = {
        .monitor_handle = monitor_handle,
        .mesh_handle = mesh_handle,
        .bluefi_handle = blufi_handle,
    };
    app_event = app_event_init(event_config);
#if defined CONFIG_DEVICE_TYPE_REMOTE_GATEWAY || defined CONFIG_DEVICE_TYPE_PIR
    bool config_mode = false;
    LOGE(TAG, "sys_cfg.short_boot_counter = %d", sys_cfg.short_boot_counter);
    if (sys_cfg.short_boot_counter < 0 || sys_cfg.short_boot_counter > 2) {
        sys_cfg.short_boot_counter = 0;
    } else if (sys_cfg.short_boot_counter == 2) {
        LOGI(TAG, "Enter config mode");
        config_mode = true;
        sys_cfg.short_boot_counter = 0;
    } else {
        sys_cfg.short_boot_counter++;
    }
    if (config_mode) {
        BEEP(80, 80, false, 6);
        periph_monitor_enter_config_mode(monitor_handle);
    } else {
        BEEP(80, 80, false, 2);
    }
    cfg_save();
    save_short_boot_timer(5000);
#endif

#if CONFIG_POWER_SAVE
    esp_pm_config_esp32_t pm_config = {.max_freq_mhz = 80,
                                       .min_freq_mhz = 10,
#if CONFIG_FREERTOS_USE_TICKLESS_IDLE
                                       .light_sleep_enable = true
#endif
    };
    ESP_ERROR_CHECK(esp_pm_configure(&pm_config));
#endif
    while (1) {
        LOGD(TAG, "Memory check: Total = %ld, Internal = %d", esp_get_free_heap_size(), heap_caps_get_free_size(MALLOC_CAP_INTERNAL));
        vTaskDelay(5000 / portTICK_PERIOD_MS);
    }
}
