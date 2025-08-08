#include "app_config.h"

#include "app_utility.h"
#include "esp_storage.h"

#define CFG_ERR_CHECK(err) \
    if (err != ESP_OK) return err;

app_config_t                sys_cfg;
static esp_storage_handle_t g_storage_handle = NULL;
static const char          *GLOBAL_APP_STORAGE_KEY = "app";
static const char          *GLOBAL_TOUCH_STORAGE_KEY = "touch";
static const char          *GLOBAL_BRIDGE_STORAGE_KEY = "bridge";
static const char          *GLOBAL_GW_SEARCHING_STORAGE_KEY = "gw_searching";
static const char          *TAG = "APP_CONFIG";

#define SAVE_TIMEOUT_MS    (3 * 1000)
#define GLOBAL_TOUCH_MAGIC sizeof(touch_statistics_state_t)  // Change this when you change struct of this storage
#define BRIDGE_MAGIC       sizeof(bridge_info_t)
#define GW_SEARCHING_MAGIC sizeof(gw_joined_info_t)

touch_statistics_state_t g_statistics_storage[MAX_TOUCH_PAD_NUM];
bridge_info_t            g_bridge_info;
gw_joined_info_t         g_gw_joined_info;

#if defined(CONFIG_DEVICE_TYPE_TOUCH) || defined(CONFIG_DEVICE_TYPE_TOUCH_CURTAIN)
static hw_io_map_t hw_io_map[] = {
    TOUCH_1PAD_IO_MAP, TOUCH_2PAD_IO_MAP, TOUCH_3PAD_IO_MAP, TOUCH_4PAD_IO_MAP,
#ifdef CONFIG_DEVICE_HARDWARE_REVERSION3
    TOUCH_5PAD_IO_MAP, TOUCH_6PAD_IO_MAP,
#endif
};
#elif defined(CONFIG_DEVICE_TYPE_THERMOSTAT)
static hw_io_map_t hw_io_map[] = {THERMOSTAT_IO_MAP};
#endif

static hw_io_map_t hw_status_io =
#if defined(CONFIG_DEVICE_TYPE_TOUCH) || defined(CONFIG_DEVICE_TYPE_TOUCH_CURTAIN)
    TOUCH_1PAD_IO_MAP;
#elif defined(CONFIG_DEVICE_TYPE_REMOTE_GATEWAY)
    REMOTE_GW_STATUS_IO;
#elif defined(CONFIG_DEVICE_TYPE_PIR)
    PIR_STATUS_IO;
#elif defined(CONFIG_DEVICE_TYPE_THERMOSTAT)
    THERMOSTAT_STATUS_IO;
#endif

static const hw_features_map_t hw_features_map[] = {HW_MAP};
#if CONFIG_DISABLE_AUTO_DETECT_HARDWARE
static const hw_features_map_t hw_features_map_non_detect = {0, 0, 0, HW_REV, DEVICE_FEATURE, DEVICE_ATTRIBUTE, HARDWARE_VERSION, MODEL_PREFIX};
#endif

static esp_err_t _storage_unpack(void *context, char *buffer, int loaded_len) {
    if (loaded_len > sizeof(app_config_t)) {
        LOGE(TAG, "Invalid storage size, loaded=%d, real=%d", loaded_len, sizeof(app_config_t));
        return ESP_FAIL;
    } else if (loaded_len < sizeof(app_config_t)) {
        LOGW(TAG, "Invalid storage size, loaded=%d, real=%d", loaded_len, sizeof(app_config_t));
    }
    memcpy(&sys_cfg, buffer, loaded_len);
    return ESP_OK;
}

static esp_err_t _touch_save_unpack(void *context, char *buffer, int loaded_len) {
    if (loaded_len != sizeof(touch_statistics_state_t) * MAX_TOUCH_PAD_NUM) {
        LOGE(TAG, "Invalid _statistics_storage_unpack size, loaded=%d, real=%d", loaded_len, sizeof(touch_statistics_state_t));
        return ESP_FAIL;
    }
    memcpy(g_statistics_storage, buffer, loaded_len);
    return ESP_OK;
}

static int _storage_pack(void *context, char *buffer, int max_buffer_size) {
    if (max_buffer_size < sizeof(app_config_t)) {
        LOGE(TAG, "Invalid storage size required=%d, real=%d", max_buffer_size, sizeof(app_config_t));
        return ESP_FAIL;
    }
    memcpy(buffer, &sys_cfg, sizeof(app_config_t));
    return sizeof(app_config_t);
}

static int _touch_save_pack(void *context, char *buffer, int max_buffer_size) {
    int sz = sizeof(touch_statistics_state_t) * MAX_TOUCH_PAD_NUM;

    if (max_buffer_size < sz) {
        LOGE(TAG, "Invalid _statistics_storage_pack size required=%d, real=%d", max_buffer_size, sz);
        return ESP_FAIL;
    }
    memcpy(buffer, &g_statistics_storage, sz);
    return sz;
}

static esp_err_t _bridge_unpack(void *context, char *buffer, int loaded_len) {
    if (loaded_len != sizeof(bridge_info_t)) {
        LOGE(TAG, "Invalid bridge_info_t size, loaded=%d, real=%d", loaded_len, sizeof(bridge_info_t));
        return ESP_FAIL;
    }
    memcpy(&g_bridge_info, buffer, loaded_len);
    return ESP_OK;
}

static int _bridge_pack(void *context, char *buffer, int max_buffer_size) {
    if (max_buffer_size < sizeof(bridge_info_t)) {
        LOGE(TAG, "Invalid bridge_info_t size required=%d, real=%d", max_buffer_size, sizeof(bridge_info_t));
        return ESP_FAIL;
    }
    memcpy(buffer, &g_bridge_info, sizeof(bridge_info_t));
    return sizeof(bridge_info_t);
}

static esp_err_t _gw_searching_unpack(void *context, char *buffer, int loaded_len) {
    if (loaded_len != sizeof(gw_joined_info_t)) {
        LOGE(TAG, "Invalid gw_joined_info_t size, loaded=%d, real=%d", loaded_len, sizeof(gw_joined_info_t));
        return ESP_FAIL;
    }
    memcpy(&g_gw_joined_info, buffer, loaded_len);
    return ESP_OK;
}

static int _gw_searching_pack(void *context, char *buffer, int max_buffer_size) {
    if (max_buffer_size < sizeof(gw_joined_info_t)) {
        LOGE(TAG, "Invalid gw_joined_info_t size required=%d, real=%d", max_buffer_size, sizeof(gw_joined_info_t));
        return ESP_FAIL;
    }
    memcpy(buffer, &g_gw_joined_info, sizeof(gw_joined_info_t));
    return sizeof(gw_joined_info_t);
}

#if defined(CONFIG_DEVICE_TYPE_TOUCH) || defined(CONFIG_DEVICE_TYPE_TOUCH_CURTAIN) || defined(CONFIG_DEVICE_TYPE_THERMOSTAT)
static void _cfg_print_touch() {
    if (sys_cfg.io == NULL || sys_cfg.features_map == NULL) {
        return;
    }
    int i, num_touch = sys_cfg.features_map->device_attributes & 0x0F;
    LOGD(TAG, "NUM TOUCH = %d", num_touch);
    for (i = 0; i < num_touch; i++) {
        LOGD(TAG, "touch io=%d, led on=%d, led off=%d, relay=%d", sys_cfg.io[i].touch_gpio, sys_cfg.io[i].led_on_gpio, sys_cfg.io[i].led_off_gpio, sys_cfg.io[i].relay_gpio);
    }
}
#endif

static int _cfg_detect_hardware() {
    uint8_t bright_day = (sys_cfg.brightness >> 8) & 0xFF;
    uint8_t bright_night = sys_cfg.brightness & 0xFF;
    if (bright_day > MAX_BRIGHTNESS || bright_day < MIN_BRIGHTNESS || bright_night > MAX_BRIGHTNESS || bright_night < MIN_BRIGHTNESS) {
        bright_day = DEFAULT_DAY_BRIGHTNESS;
        bright_night = DEFAULT_NIGHT_BRIGHTNESS;
    }
    sys_cfg.brightness = (uint16_t)(bright_day << 8) | bright_night;
    if (sys_cfg.reactivity > MAX_REACTIVITY || sys_cfg.reactivity < MIN_REACTIVITY) {
        sys_cfg.reactivity = DEFAULT_REACTIVITY;
    }
    if ((int)sys_cfg.ws_data_type >= WS_DATA_MAX) {
        sys_cfg.ws_data_type = WS_DATA_BINARY;
    }
    if (strcmp(sys_cfg.ws_url, "") == 0) {
        strcpy(sys_cfg.ws_url, DEVICE_WEBSOCKET_ENDPOINT);
    }
#ifdef CONFIG_DISABLE_AUTO_DETECT_HARDWARE
    sys_cfg.features_map = &hw_features_map_non_detect;
    // https://toanhoc77.wordpress.com/2016/06/07/tinh-tong-s-day-so-tu-nhien-cach-deu-a/
    sys_cfg.io = &hw_io_map[DEVICE_ATTRIBUTE * (DEVICE_ATTRIBUTE - 1) / 2];  // 1 = 0, 2 = 0 + 1, 3 = 0 + 1 + 2, 4 = 0 + 1 + 2 + 3
    sys_cfg.indicator_io = &hw_status_io;
    sys_cfg.model_group = MODEL_GROUP;
#if defined(CONFIG_DEVICE_TYPE_TOUCH) || defined(CONFIG_DEVICE_TYPE_TOUCH_CURTAIN)
    sys_cfg.indicator_io = &hw_io_map[0];
#endif
    return (DEVICE_TYPE | DEVICE_FEATURE | DEVICE_ATTRIBUTE);
#else

#if defined(CONFIG_DEVICE_HARDWARE_REVERSION1) && defined(CONFIG_TOUCH_HEATER)
    sys_cfg.features_map = &hw_features_map[4];
    sys_cfg.indicator_io = &hw_status_io;
#ifdef CONFIG_DEVICE_TYPE_TOUCH
    int io_offset = hw_features_map[4].device_attributes * (hw_features_map[4].device_attributes - 1) / 2;
    sys_cfg.io = &hw_io_map[io_offset];
    sys_cfg.indicator_io = &hw_io_map[io_offset];
#endif
    return (DEVICE_TYPE | hw_features_map[4].device_features | hw_features_map[4].device_attributes);
#endif

#if defined(CONFIG_DEVICE_HARDWARE_REVERSION1) && defined(CONFIG_DEVICE_TYPE_TOUCH_CURTAIN)
    sys_cfg.features_map = &hw_features_map[5];
    sys_cfg.indicator_io = &hw_status_io;
    int io_offset = hw_features_map[5].device_attributes * (hw_features_map[5].device_attributes - 1) / 2;
    sys_cfg.io = &hw_io_map[io_offset];
    sys_cfg.indicator_io = &hw_io_map[io_offset];
    return (DEVICE_TYPE | hw_features_map[5].device_features | hw_features_map[5].device_attributes);
#endif
    gpio_config_t io_conf = {
        .intr_type = GPIO_INTR_DISABLE, .mode = GPIO_MODE_INPUT, .pull_up_en = 1, .pin_bit_mask = (1ULL << HARDWARE_DETECT_PIN0) | (1ULL << HARDWARE_DETECT_PIN1) | (1ULL << HARDWARE_DETECT_PIN2)};
    gpio_config(&io_conf);
    vTaskDelay(10 / portTICK_RATE_MS);

    LOGI(TAG, "PIN[%d]=%d, PIN[%d]=%d, PIN[%d]=%d", HARDWARE_DETECT_PIN0, gpio_get_level(HARDWARE_DETECT_PIN0), HARDWARE_DETECT_PIN1, gpio_get_level(HARDWARE_DETECT_PIN1), HARDWARE_DETECT_PIN2,
         gpio_get_level(HARDWARE_DETECT_PIN2));

    int i;
#ifndef CONFIG_HARDCODE_DETECT_HARDWARE
    int detect_0 = gpio_get_level(HARDWARE_DETECT_PIN0);
    int detect_1 = gpio_get_level(HARDWARE_DETECT_PIN1);
    int detect_2 = gpio_get_level(HARDWARE_DETECT_PIN2);
#else
    int detect_0 = 0;
    int detect_1 = 0;
    int detect_2 = 0;
#ifdef CONFIG_HARDCODE_HIGH_PIN_0
    detect_0 = 1;
#endif
#ifdef CONFIG_HARDCODE_HIGH_PIN_1
    detect_1 = 1;
#endif
#ifdef CONFIG_HARDCODE_HIGH_PIN_2
    detect_2 = 1;
#endif
#endif
    // detect_0 = 1;
    // detect_1 = 0;
    // detect_2 = 0;
    // LOGW(TAG, "Fix PIN[34]=1, PIN[35]=0, PIN[36]=0");
    for (i = 0; i < sizeof(hw_features_map) / sizeof(hw_features_map_t); i++) {
        if (detect_0 == hw_features_map[i].pin0 && detect_1 == hw_features_map[i].pin1 && detect_2 == hw_features_map[i].pin2) {
            sys_cfg.features_map = (hw_features_map_t *)&hw_features_map[i];
            sys_cfg.indicator_io = &hw_status_io;
            sys_cfg.model_group = hw_features_map[i].model_group;
#if defined(CONFIG_DEVICE_TYPE_TOUCH) || defined(CONFIG_DEVICE_TYPE_TOUCH_CURTAIN)
            int io_offset = hw_features_map[i].device_attributes * (hw_features_map[i].device_attributes - 1) / 2;
            LOGD(TAG, "io offset = %d", io_offset);
            sys_cfg.io = &hw_io_map[io_offset];
            sys_cfg.indicator_io = &hw_io_map[io_offset];
            _cfg_print_touch();
#elif defined(CONFIG_DEVICE_TYPE_PIR)
            sys_cfg.io = &hw_status_io;
            sys_cfg.indicator_io = &hw_status_io;
#elif defined(CONFIG_DEVICE_TYPE_THERMOSTAT)
            sys_cfg.io = &hw_io_map[0];
            sys_cfg.indicator_io = &hw_status_io;
            _cfg_print_touch();
#endif
            return (DEVICE_TYPE | hw_features_map[i].device_features | hw_features_map[i].device_attributes);
        }
    }

    return (DEVICE_TYPE | DEVICE_FEATURE | 1);
#endif
}

static esp_err_t _cfg_reset_default() {
    /* Paste configurations want to reset defautl */
    LOGI(TAG, "Reset default some configuration");
    int old_magic = sys_cfg.reset_config_magic;
    sys_cfg.features = _cfg_detect_hardware();
    if (sys_cfg.features == 0) {
        return ESP_FAIL;
    }
    strcpy(sys_cfg.ws_url, DEVICE_WEBSOCKET_ENDPOINT);
    sys_cfg.ws_data_type = WS_DATA_BINARY;
    sys_cfg.reset_config_magic = RESET_CONFIG_MAGIC;
    if (old_magic == 0x1237 || old_magic == 0x7321) {  // Reset config MAGIC of ver3.0.0
        LOGI(TAG, "Reset config for version 3.0.0");
        return ESP_OK;
    }
    sys_cfg.brightness = ((uint16_t)DEFAULT_DAY_BRIGHTNESS << 8) | DEFAULT_NIGHT_BRIGHTNESS;
    sys_cfg.sceneActiveMap = 0x10000000;
#if defined(CONFIG_DEVICE_TYPE_TOUCH) && defined(DEVICE_HARDWARE_REVERSION1)
    int num_touch = sys_cfg.features_map->device_attributes & 0x0F;
    if (num_touch >= 2) {
        sys_cfg.reactivity = DEFAULT_REACTIVITY;  // set default reactivity (90%) for old touch version (ver1 MTCH)
    }
#endif
#ifdef CONFIG_DEVICE_TYPE_PIR
    sys_cfg.time_delay = DEFAULT_TIME_HOLD_ON;
    sys_cfg.time_end = 0;
    sys_cfg.time_start = 0;
    sys_cfg.day_map = 0x0000;
    sys_cfg.en_full_time = true;
#endif
#ifdef CONFIG_DEVICE_TYPE_THERMOSTAT
    sys_cfg.aircond.address = 0;
    sys_cfg.aircond.fanspeed = AIRCOND_FANSPEED_AUTO;
    sys_cfg.aircond.mode = AIRCOND_MODE_COOL;
    sys_cfg.aircond.setpoint = 18;
    sys_cfg.aircond.vanes = AIRCOND_VANE_SWING;
#endif
    return ESP_OK;
}

static esp_err_t _cfg_load_default() {
    uint64_t hw_id = 0;
    esp_efuse_mac_get_default((uint8_t *)&hw_id);
    hw_id >>= 24;

    sys_cfg.features = _cfg_detect_hardware();
    if (sys_cfg.features_map == NULL) {
        return ESP_FAIL;
    }

    sprintf(sys_cfg.hw_id, "%s-%06llX", MODEL_NAME, hw_id);
#if defined(CONFIG_DEVICE_TYPE_TOUCH) || defined(CONFIG_DEVICE_TYPE_TOUCH_CURTAIN)
    sprintf(sys_cfg.model, sys_cfg.features_map->model_format, sys_cfg.features_map->device_attributes);
    sprintf(sys_cfg.hw_version, sys_cfg.features_map->hw_version, sys_cfg.features_map->device_attributes);
#elif defined(CONFIG_DEVICE_TYPE_REMOTE_GATEWAY)
    int feature_format = (sys_cfg.features_map->device_features >> 8) & 0x0F;
    int attr_format = sys_cfg.features_map->device_attributes;
    LOGE(TAG, "device_features=%d, device_attributes=%d, feature_format=%d, attr_format=%d", sys_cfg.features_map->device_features, sys_cfg.features_map->device_attributes, feature_format,
         attr_format);
    char *attr_name = "-";
    if (attr_format & DEVICE_ATTR_GW_UART) {
        attr_name = "U";
    } else if (attr_format & DEVICE_ATTR_GW_SPI) {
        attr_name = "S";
    } else if (attr_format & DEVICE_ATTR_GW_HOMEBUS) {
        attr_name = "H";
    } else if (attr_format & DEVICE_ATTR_GW_RS485) {
        attr_name = "R";
    }
    sprintf(sys_cfg.model, sys_cfg.features_map->model_format, feature_format, attr_name);
    sprintf(sys_cfg.hw_version, sys_cfg.features_map->hw_version, feature_format, attr_name);
#elif defined CONFIG_DEVICE_TYPE_PIR
    sprintf(sys_cfg.model, sys_cfg.features_map->model_format);
    sprintf(sys_cfg.hw_version, sys_cfg.features_map->hw_version);
#elif defined CONFIG_DEVICE_TYPE_THERMOSTAT
    int feature_format = (sys_cfg.features_map->device_features >> 8) & 0x0F;
    int attr_format = sys_cfg.features_map->device_features;
    LOGE(TAG, "device_features=%d, device_attributes=%d, feature_format=%d, attr_format=%d", sys_cfg.features_map->device_features, sys_cfg.features_map->device_attributes, feature_format,
         attr_format);
    char *attr_name = "";
    if (attr_format & DEVICE_FEATURE_THERMOSTAT_UART) {
        attr_name = "U";
    } else if (attr_format & DEVICE_FEATURE_THERMOSTAT_SPI) {
        attr_name = "S";
    } else if (attr_format & DEVICE_FEATURE_THERMOSTAT_HOMEBUS) {
        attr_name = "H";
    } else if (attr_format & DEVICE_FEATURE_THERMOSTAT_RS485) {
        attr_name = "R";
        // attr_name = "U";
    }
    sprintf(sys_cfg.model, sys_cfg.features_map->model_format, attr_name);
    sprintf(sys_cfg.hw_version, sys_cfg.features_map->hw_version, attr_name);
    sys_cfg.aircond.address = AIRCOND_BROADCAST_ADDR;
    sys_cfg.aircond.fanspeed = AIRCOND_FANSPEED_AUTO;
    sys_cfg.aircond.mode = AIRCOND_MODE_OFF;
    sys_cfg.aircond.setpoint = DEFAULT_AIRCOND_SETPOINT;
    sys_cfg.aircond.vanes = AIRCOND_VANE_SWING;
#else
#error "Invalid device type"
#endif
    sprintf(sys_cfg.blufi_name, "%s|%s", sys_cfg.hw_id, sys_cfg.model);
    sprintf(sys_cfg.wifi_sta_ssid, "%s", CONFIG_WIFI_SSID);
    sprintf(sys_cfg.wifi_sta_pass, "%s", CONFIG_WIFI_PASSWORD);
    sprintf(sys_cfg.device_access_key, "%s", CONFIG_WEBSOCKET_ACCESS_KEY);
    sprintf(sys_cfg.device_access_id, "%s", CONFIG_WEBSOCKET_ACCESS_ID);
    strcpy(sys_cfg.device_token, "");
    sys_cfg.magic = FIRMWARE_MAGIC;
    sys_cfg.reset_config_magic = RESET_CONFIG_MAGIC;
    sys_cfg.reactivity = DEFAULT_REACTIVITY;
    sys_cfg.brightness = ((uint16_t)DEFAULT_DAY_BRIGHTNESS << 8) | DEFAULT_NIGHT_BRIGHTNESS;
    if (cfg_check_if_has_attribute(DEVICE_ATTR_TOUCH6)) {
        sys_cfg.sceneActiveMap = TOUCH_6_SCENE_ACTIVE_MAP;
    } else {
        sys_cfg.sceneActiveMap = SCENE_ACTIVE_MAP;
    }
    strcpy(sys_cfg.ws_url, DEVICE_WEBSOCKET_ENDPOINT);
    sys_cfg.ws_data_type = WS_DATA_BINARY;
#ifdef CONFIG_TOUCH_BOOTUP_STATE_KEEP_OLD
    sys_cfg.boot_state = BOOTUP_STATE_KEEP_OLD;
#elif CONFIG_TOUCH_BOOTUP_STATE_ON
    sys_cfg.boot_state = BOOTUP_STATE_ON;
#else
    sys_cfg.boot_state = BOOTUP_STATE_OFF;
#endif
#ifdef CONFIG_DEVICE_TYPE_PIR
    sys_cfg.time_delay = DEFAULT_TIME_HOLD_ON;
    sys_cfg.time_end = 0;
    sys_cfg.time_start = 0;
    sys_cfg.day_map = 0x0000;
    sys_cfg.en_full_time = true;
#endif
    return ESP_OK;
}

uint64_t cfg_get_esp_touch_mask() {
    if (sys_cfg.io == NULL || sys_cfg.features_map == NULL) {
        return 0;
    }
    int      i, num_touch = sys_cfg.features_map->device_attributes & 0x0F;
    uint64_t ret = 0;
    for (i = 0; i < num_touch; i++) {
        if (sys_cfg.io[i].mtch_dac == 0) {
            ret |= ((uint64_t)0x01 << (uint64_t)sys_cfg.io[i].touch_pad);
            LOGW(TAG, "get touch mask success %d", sys_cfg.io[i].touch_pad);
        }
    }
    return ret;
}

uint64_t cfg_get_sx8636_touch_mask() {
    if (sys_cfg.io == NULL || sys_cfg.features_map == NULL) {
        return 0;
    }
    int      i, num_touch = sys_cfg.features_map->device_attributes & 0x0F;
    uint64_t ret = 0;
    for (i = 0; i < num_touch; i++) {
        if (sys_cfg.io[i].mtch_dac == 1) {
            ret |= ((uint64_t)0x01 << (uint64_t)sys_cfg.io[i].touch_pad);
        }
    }
    return ret;
}

uint64_t cfg_get_button_mask() {
    uint64_t ret = 0;
#if defined CONFIG_DEVICE_TYPE_REMOTE_GATEWAY || defined CONFIG_DEVICE_TYPE_PIR
    if (sys_cfg.indicator_io) {
        ret |= ((uint64_t)0x01 << sys_cfg.indicator_io->touch_gpio);
    }
#elif defined(CONFIG_DEVICE_TYPE_TOUCH) || defined(CONFIG_DEVICE_TYPE_TOUCH_CURTAIN)
    if (sys_cfg.io == NULL || sys_cfg.features_map == NULL) {
        return ret;
    }
    int i, num_touch = sys_cfg.features_map->device_attributes & 0x0F;

    for (i = 0; i < num_touch; i++) {
        if (sys_cfg.io[i].mtch_dac > 1) {
            ret |= ((uint64_t)0x01 << (uint64_t)sys_cfg.io[i].touch_gpio);
        }
    }
#endif
    return ret;
}

#ifndef CONFIG_DEVICE_TYPE_TOUCH
static TimerHandle_t g_sys_timer = NULL;
static void          save_short_boot_callback(TimerHandle_t timer) {
    if (g_sys_timer) {
        xTimerStop(g_sys_timer, portMAX_DELAY);
        xTimerDelete(g_sys_timer, portMAX_DELAY);
        g_sys_timer = NULL;
    }
    sys_cfg.short_boot_counter = 0;
    esp_storage_save(g_storage_handle, GLOBAL_APP_STORAGE_KEY);
    LOGE(TAG, "saved...");
}

esp_err_t save_short_boot_timer(int timeout) {
    if (g_sys_timer == NULL) {
        g_sys_timer = xTimerCreate("sys_timer", timeout / portTICK_RATE_MS, pdFALSE, NULL, save_short_boot_callback);
        if (g_sys_timer == NULL) {
            LOGE(TAG, "Error creating timer");
            return ESP_FAIL;
        }
        if (xTimerStart(g_sys_timer, 0) != pdTRUE) {
            LOGE(TAG, "Error to start saving timer");
            return ESP_FAIL;
        }

    } else {
        xTimerReset(g_sys_timer, portMAX_DELAY);
    }
    return ESP_OK;
}
#endif

esp_err_t cfg_load() {
    esp_err_t err = nvs_flash_init();
    if (err == ESP_ERR_NVS_NO_FREE_PAGES) {
        ESP_ERROR_CHECK(nvs_flash_erase());
        err = nvs_flash_init();
    }
    ESP_ERROR_CHECK(err);

    esp_storage_config_t storage_config = {
        .namespace = "app_cfg",
        .buffer_size = 1024,
    };
    memset(&sys_cfg, 0, sizeof(app_config_t));

    if (g_storage_handle == NULL) {
        g_storage_handle = esp_storage_init(&storage_config);
        if (g_storage_handle == NULL) {
            return ESP_FAIL;
        }
        if ((err = esp_storage_add(g_storage_handle, GLOBAL_APP_STORAGE_KEY, _storage_unpack, _storage_pack, NULL)) != ESP_OK) {
            esp_storage_destroy(g_storage_handle);
            g_storage_handle = NULL;
            return ESP_FAIL;
        }
        if ((err = esp_storage_add(g_storage_handle, GLOBAL_TOUCH_STORAGE_KEY, _touch_save_unpack, _touch_save_pack, NULL)) != ESP_OK) {
            esp_storage_destroy(g_storage_handle);
            g_storage_handle = NULL;
            return ESP_FAIL;
        }
        if ((err = esp_storage_add(g_storage_handle, GLOBAL_BRIDGE_STORAGE_KEY, _bridge_unpack, _bridge_pack, NULL)) != ESP_OK) {
            esp_storage_destroy(g_storage_handle);
            g_storage_handle = NULL;
            return ESP_FAIL;
        }
        if ((err = esp_storage_add(g_storage_handle, GLOBAL_GW_SEARCHING_STORAGE_KEY, _gw_searching_unpack, _gw_searching_pack, NULL)) != ESP_OK) {
            esp_storage_destroy(g_storage_handle);
            g_storage_handle = NULL;
            return ESP_FAIL;
        }
    }

    err = esp_storage_load(g_storage_handle, GLOBAL_APP_STORAGE_KEY);

    if (err == ESP_OK && sys_cfg.magic == FIRMWARE_MAGIC && sys_cfg.reset_config_magic == RESET_CONFIG_MAGIC) {
        sys_cfg.features = _cfg_detect_hardware();
        if (sys_cfg.features == 0) {
            return ESP_FAIL;
        }
    } else if (err == ESP_OK && sys_cfg.magic == FIRMWARE_MAGIC && sys_cfg.reset_config_magic != RESET_CONFIG_MAGIC) {
        _cfg_reset_default();
    } else {
        _cfg_load_default();
    }

    if (esp_storage_load(g_storage_handle, GLOBAL_BRIDGE_STORAGE_KEY) != ESP_OK || g_bridge_info.magic != BRIDGE_MAGIC) {
        LOGI(TAG, "save default bridge_info");
        memset(&g_bridge_info, 0, sizeof(bridge_info_t));
        g_bridge_info.magic = BRIDGE_MAGIC;
        esp_storage_save(g_storage_handle, GLOBAL_BRIDGE_STORAGE_KEY);
    }
    for (int i = 0; i < MAX_RELAY_TOUCH_PAD_NUM; i++) {
        LOGI(TAG, "Bridge, my hwid=%s[%d], target hwid=%s[%d], bridge type=%d, target type=%d", sys_cfg.hw_id, i, g_bridge_info.bridge[i].target_hwid, g_bridge_info.bridge[i].target_switcher,
             g_bridge_info.bridge[i].bridge_type, g_bridge_info.bridge[i].target_type);
    }

    if (esp_storage_load(g_storage_handle, GLOBAL_GW_SEARCHING_STORAGE_KEY) != ESP_OK || g_gw_joined_info.magic != GW_SEARCHING_MAGIC) {
        LOGI(TAG, "save default gw_searching");
        memset(&g_gw_joined_info, 0, sizeof(gw_joined_info_t));
        g_gw_joined_info.magic = GW_SEARCHING_MAGIC;
        g_gw_joined_info.flag = false;
        esp_storage_save(g_storage_handle, GLOBAL_GW_SEARCHING_STORAGE_KEY);
    }
    LOGI(TAG, "Gw searching infor: flag=%d", g_gw_joined_info.flag);
    return cfg_save();
}

esp_err_t cfg_save() { return esp_storage_save(g_storage_handle, GLOBAL_APP_STORAGE_KEY); }

esp_err_t cfg_reset_default() { return nvs_flash_erase(); }

esp_err_t cfg_reset_user_setting() {
    LOGW(TAG, "Reset user setting to default");
    memset(g_statistics_storage, 0, sizeof(touch_statistics_state_t) * MAX_TOUCH_PAD_NUM);
    memset(&g_bridge_info, 0, sizeof(bridge_info_t));
    memset(&g_gw_joined_info, 0, sizeof(gw_joined_info_t));

    esp_storage_save(g_storage_handle, GLOBAL_BRIDGE_STORAGE_KEY);
    esp_storage_save(g_storage_handle, GLOBAL_TOUCH_STORAGE_KEY);
    esp_storage_save(g_storage_handle, GLOBAL_GW_SEARCHING_STORAGE_KEY);
    return ESP_OK;
}

void cfg_print() {
    printf("\r\n\r\n");
    LOGI(TAG, "+=============================================+");
    LOGI(TAG, "=\tBRANCH:\t\t" BRANDNAME "");
    LOGI(TAG, "=\tURL:\t\t" MODEL_URL "");
    LOGI(TAG, "=\tMODEL:\t\t%s", sys_cfg.model);
    LOGI(TAG, "=\tHARDWARE_ID:\t%s", sys_cfg.hw_id);
    LOGI(TAG, "=\tBLUFI_NAME:\t%s", sys_cfg.blufi_name);
    LOGE(TAG, "=\tFW_VERSION:\t%s", FIRMWARE_VERSION);
    LOGE(TAG, "=\tMODEL_GROUP:\t%d", sys_cfg.model_group);
    LOGE(TAG, "=\tHW_VERSION:\t%s", sys_cfg.hw_version);
    LOGE(TAG, "=\tREV:\t\t%d", HW_REV);
    LOGI(TAG, "=\tIDF:\t\t%s", IDF_VER);
#ifdef CONFIG_DISABLE_AUTO_DETECT_HARDWARE
    LOGW(TAG, "=\tAUTO_DETECT_HARDWARE [DISABLED]");
#else
    LOGW(TAG, "=\tAUTO_DETECT_HARDWARE [ENABLED|%d|PAD]", sys_cfg.features & 0x0F);
#endif
    LOGI(TAG, "=\tBOOTUP STATE:\t%d", sys_cfg.boot_state);
#ifdef CONFIG_DEVELOPMENT_MODE
    LOGW(TAG, "=\tDEVELOPMENT MODE: [ENABLED]");
#else
    LOGW(TAG, "=\tDEVELOPMENT MODE: [DISABLED]");
#endif
    LOGI(TAG, "=\tKEY:\t%s", sys_cfg.device_access_key ? sys_cfg.device_access_key : "");
    LOGI(TAG, "=\tID:\t%s", sys_cfg.device_access_id ? sys_cfg.device_access_id : "");
    LOGI(TAG, "=\tTOKEN:\t%s", sys_cfg.device_token ? sys_cfg.device_token : "");
    LOGI(TAG, "=\tFLASH_ENCRYPT_IS_ENABLED: %d", esp_flash_encryption_enabled());
    LOGI(TAG, "=\tBRIGHTNESS:\tday: %d, night: %d", ((sys_cfg.brightness >> 8) & 0xFF), sys_cfg.brightness & 0xFF);
    LOGI(TAG, "=\tREACTIVITY:\t%d", sys_cfg.reactivity);
#ifdef CONFIG_DEVICE_TYPE_TOUCH
    LOGI(TAG, "=\tSCENE_TOUCH:\t%08lX", sys_cfg.sceneActiveMap);
#endif
#ifdef CONFIG_DEVICE_TYPE_PIR
    LOGI(TAG, "=\tTIME_DELAY:\t%d", sys_cfg.time_delay);
    LOGI(TAG, "=\tBRIDGE TIME:\tstart: %d, end: %d, daymap: %d", sys_cfg.time_start, sys_cfg.time_end, sys_cfg.day_map);
#endif
#ifdef CONFIG_DEVICE_TYPE_THERMOSTAT
    LOGI(TAG, "=\tTHERMOSTAT ADDRESS:\t%d", sys_cfg.aircond.address);
    LOGI(TAG, "=\tTHERMOSTAT MODE:\t%d", sys_cfg.aircond.mode);
    LOGI(TAG, "=\tTHERMOSTAT TEMPSET:\t%d", sys_cfg.aircond.setpoint);
    LOGI(TAG, "=\tTHERMOSTAT FANSPEED:\t%d", sys_cfg.aircond.fanspeed);
    LOGI(TAG, "=\tTHERMOSTAT VANE:\t%d", sys_cfg.aircond.vanes);
#endif
    LOGI(TAG, "=\tHOMEKIT MODE:\t%d", g_gw_joined_info.flag);
    LOGI(TAG, "=\tWS URI:\t\t%s", sys_cfg.ws_url);
    LOGI(TAG, "=\tWS DATATYPE:\t%s", sys_cfg.ws_data_type == 0 ? "Binary" : "Base64");
    LOGI(TAG, "+=============================================+");
    printf("\r\n\r\n");
}

esp_err_t cfg_load_touch_statistics(hw_io_map_t *io) {
    int       i;
    esp_err_t err;
    int       io_num = sys_cfg.features & 0x0F;
    io_num = io_num > MAX_TOUCH_PAD_NUM ? MAX_TOUCH_PAD_NUM : io_num;
    if (g_storage_handle == NULL) {
        return ESP_ERR_NVS_NOT_FOUND;
    }
    if (io == NULL || io_num <= 0) {
        return ESP_FAIL;
    }

    for (i = 0; i < io_num; i++) {
        io[i].state = 0;
    }

    if ((err = esp_storage_load(g_storage_handle, GLOBAL_TOUCH_STORAGE_KEY)) == ESP_OK) {
        for (i = 0; i < io_num; i++) {
            if (g_statistics_storage[i].reboot_state == BOOTUP_STATE_OFF) {
                io[i].state = 0;
            } else if (g_statistics_storage[i].reboot_state == BOOTUP_STATE_ON) {
                io[i].state = 1;
            } else {
                io[i].state = g_statistics_storage[i].state;
            }

            g_statistics_storage[i].last_action_sec = esp_timer_get_time() / 1000000;
            LOGI(TAG, "TOUCH[%d]=%d, reboot state=%d, auto off=%d", i, io[i].state, g_statistics_storage[i].reboot_state, g_statistics_storage[i].auto_off);
        }
        return ESP_OK;
    }
    bool load_default = false;
    for (i = 0; i < io_num; i++) {
        if (g_statistics_storage[i].magic != GLOBAL_TOUCH_MAGIC) {
            load_default = true;
            break;
        }
    }
    if (err != ESP_OK) {
        load_default = true;
    }
    if (load_default) {
        LOGD(TAG, "Load default Touch STATISTICS storage");
        memset(g_statistics_storage, 0, sizeof(touch_statistics_state_t) * MAX_TOUCH_PAD_NUM);
        for (i = 0; i < MAX_TOUCH_PAD_NUM; i++) {
            g_statistics_storage[i].magic = GLOBAL_TOUCH_MAGIC;
        }
        return esp_storage_save(g_storage_handle, GLOBAL_TOUCH_STORAGE_KEY);
    }

    return ESP_OK;
}

static TimerHandle_t g_save_timer = NULL;
static void          save_statistics_callback(TimerHandle_t timer) {
    if (g_save_timer) {
        xTimerStop(g_save_timer, portMAX_DELAY);
        xTimerDelete(g_save_timer, portMAX_DELAY);
        g_save_timer = NULL;
    }
    esp_storage_save(g_storage_handle, GLOBAL_TOUCH_STORAGE_KEY);
    LOGD(TAG, "saved...");
}

static esp_err_t cfg_start_save_timer(TickType_t timeout) {
    if (g_save_timer == NULL) {
        g_save_timer = xTimerCreate("save_timer", timeout / portTICK_RATE_MS, pdFALSE, NULL, save_statistics_callback);
        if (g_save_timer == NULL) {
            LOGE(TAG, "Error creating timer");
            return ESP_FAIL;
        }
        if (xTimerStart(g_save_timer, 0) != pdTRUE) {
            LOGE(TAG, "Error to start saving timer");
            return ESP_FAIL;
        }

    } else {
        xTimerReset(g_save_timer, portMAX_DELAY);
    }
    return ESP_OK;
}

esp_err_t cfg_save_switcher_update(int io_index, bootup_state_t state, uint8_t auto_off) {
    if (g_storage_handle == NULL) {
        return ESP_ERR_NVS_NOT_FOUND;
    }
    int io_num = sys_cfg.features & 0x0F;
    if (io_index >= io_num) {
        LOGE(TAG, "Invalid touch number [%d/%d]", io_index, io_num);
        return ESP_FAIL;
    }
    g_statistics_storage[io_index].reboot_state = state;
    g_statistics_storage[io_index].auto_off = auto_off;
    return esp_storage_save(g_storage_handle, GLOBAL_TOUCH_STORAGE_KEY);
}

esp_err_t cfg_save_touch_statistics(hw_io_map_t *io, int io_index, bool is_month, bool is_year) {
    if (g_storage_handle == NULL) {
        return ESP_ERR_NVS_NOT_FOUND;
    }
    int io_num = sys_cfg.features & 0x0F;
    if (io_index > 3 || io_index >= io_num) {
        LOGE(TAG, "Invalid touch number [%d/%d]", io_index, io_num);
        return ESP_FAIL;
    }
    LOGD(TAG, "touch[%d]=%d", io_index, io->state);
    int diff = esp_timer_get_time() / 1000000 - g_statistics_storage[io_index].last_action_sec;
    if ((g_statistics_storage[io_index].state == io->state && io->state) || !io->state) {
        g_statistics_storage[io_index].total_time_on_sec += diff;
        g_statistics_storage[io_index].month_time_on_sec += diff;
        g_statistics_storage[io_index].year_time_on_sec += diff;
    }
    g_statistics_storage[io_index].state = io->state;

    if (is_month) {
        g_statistics_storage[io_index].month_time_on_sec = 0;
    }

    if (is_year) {
        g_statistics_storage[io_index].year_time_on_sec = 0;
    }
    g_statistics_storage[io_index].last_action_sec = esp_timer_get_time() / 1000000;  // milisec
    LOGD(TAG, "total_time_on_sec[%d] = %ld", io_index, g_statistics_storage[io_index].total_time_on_sec);
    LOGD(TAG, "month_time_on_sec[%d] = %ld", io_index, g_statistics_storage[io_index].year_time_on_sec);
    LOGD(TAG, "year_time_on_sec[%d] = %ld", io_index, g_statistics_storage[io_index].year_time_on_sec);
    return cfg_start_save_timer(SAVE_TIMEOUT_MS);
}

esp_err_t cfg_save_bridge() { return esp_storage_save(g_storage_handle, GLOBAL_BRIDGE_STORAGE_KEY); }

esp_err_t cfg_save_joining_gw_flag() { return esp_storage_save(g_storage_handle, GLOBAL_GW_SEARCHING_STORAGE_KEY); }

bool cfg_check_if_has_attribute(int attribute) { return (sys_cfg.features_map->device_attributes & attribute) == attribute; }

bool cfg_check_if_has_feature(int feature) { return (sys_cfg.features_map->device_features & feature) == feature; }

// esp_err_t cfg_decrypt_ep(const char *data, char *endpoint)
// {
//     if (data == NULL) {
//         return ESP_FAIL;
//     }
//     char *key = "0000000000000000";
//     // char data[] = {0xa8, 0xb5, 0x1e, 0x7e, 0x38, 0x4b, 0x3a, 0x37, 0x45, 0x92, 0xb1, 0xb1, 0xbd, 0x1b, 0xd2, 0x0d};
//     esp_aes_context ctx;
//     esp_aes_init(&ctx);
//     esp_aes_setkey(&ctx, (uint8_t *)key, 128);
//     esp_aes_crypt_ecb(&ctx, ESP_AES_DECRYPT, (uint8_t *)data, (uint8_t *)endpoint);

//     LOGD(TAG, "EP: %s, length: %d", (char *)endpoint, strlen(endpoint));
//     esp_aes_free(&ctx);
//     return ESP_OK;
// }
