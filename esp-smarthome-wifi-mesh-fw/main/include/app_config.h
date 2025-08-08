/*
 * This file is subject to the terms of the SunshineTech License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *
 *              ./LICENSE
 */

#ifndef _APP_CONFIG_H_
#define _APP_CONFIG_H_

#include "sdkconfig.h"
#include "hw_def.h"


#define FIRMWARE_VERSION            "3.0.1"
#define HARDWARE_CPU                "ESP32 dual-core"
#define BRANDNAME                   "SunshineTech"
#define MODEL_URL                   "https://sunshinetech.vn"

#define SERVICE_WIFI_SSID            "UniCloud"
#define SERVICE_WIFI_PASSWORD        "unicloud1122@!@"
#define SERVICE_WIFI_TIMEOUT_MS      (20*1000)

#define TOUCH_USING_FADE_EFFECT

#define ENTER_CONFIG_MODE_TIME_MS   (5*1000)
#define AUTO_SAVE_INTERVAL_SEC      (30*60)
#define OTA_UPDATE_INTERVAL_SEC     (24*60*60)
#define ENTER_CONFIG_MODE_TIME_MS   (5*1000)
#define MAX_TIME_WAITING_OTA_MS     (30*1000)
#define GET_TEMP_HUMI_SENSOR_SEC    (30)

#define MESH_ATTEMPT_SCANNING_TIME  (5)
#define MESH_ATTEMPT_VOTING_TIME    (15)
#define MESH_ATTEMPT_FAIL_TIME      (60)
#define MESH_ATTEMPT_FAIL_TIME_GW   (120)
#define MESH_ATTEMPT_MONITOR_IE     (3)

#define DEFAULT_WEBSOCKET_ACCESS_KEY CONFIG_WEBSOCKET_ACCESS_KEY
#define DEFAULT_WEBSOCKET_ACCESS_ID  CONFIG_WEBSOCKET_ACCESS_ID
#define DEFAULT_REACTIVITY          (90)
#define MAX_REACTIVITY              (100)
#define MIN_REACTIVITY              (0)
#define DEFAULT_DAY_BRIGHTNESS      (50)
#define DEFAULT_NIGHT_BRIGHTNESS    (25)
#define MAX_BRIGHTNESS              (90)
#define MIN_BRIGHTNESS              (10)
#define REACTIVITY_TO_DAC(x)        (200 - x*0.95)
#define MAX_PERCENT_SEN             90
#define MIN_PERCENT_SEN             10
#define MAP_TOUCH_SENSITIVE(x)      (float)x / 100 * (MAX_PERCENT_SEN - MIN_PERCENT_SEN) + MIN_PERCENT_SEN
#define DEFAULT_TOUCH_SLIDE_WINDOW  (50)
#define MAP_ACCEPT_TOUCH(x)         7 - (int)x / 25
#define MAP_ACCEPT_BUTTON_MS(x)     20 * (10 - (int)x / 10)
#define MAP_SX8636_SENSITIVE(x)     (250 - x)

#define TOUCH_ENABLE_DOUBLETAP      0x01
#define TOUCH_ENABLE_SCENE          0x02
#define SCENE_ACTIVE_MAP            0x10000000
#define TOUCH_6_SCENE_ACTIVE_MAP    0x10220000
#if CONFIG_TOUCH_BOOTUP_STATE_ON
#define DEFAULT_REBOOT_STATE        (1) //0 = OFF, 1 = ON, 2 = KEEP OLD
#elif CONFIG_TOUCH_BOOTUP_STATE_OFF
#define DEFAULT_REBOOT_STATE        (0) //0 = OFF, 1 = ON, 2 = KEEP OLD
#elif CONFIG_TOUCH_BOOTUP_STATE_KEEP_OLD
#define DEFAULT_REBOOT_STATE        (2) //0 = OFF, 1 = ON, 2 = KEEP OLD
#else
#define DEFAULT_REBOOT_STATE        (0) //0 = OFF, 1 = ON, 2 = KEEP OLD
#endif


#if defined(CONFIG_DEVICE_TYPE_TOUCH) || defined(CONFIG_DEVICE_TYPE_TOUCH_CURTAIN)
#define TOUCH_ESP_THRESHOLD                 99
#define MODEL_NAME                         "SWITCH"
#define DEVICE_TYPE                         DEVICE_TYPE_TOUCH
#if CONFIG_DISABLE_AUTO_DETECT_HARDWARE
#define DEVICE_ATTRIBUTE                    CONFIG_TOUCH_PAD_NUM
#if CONFIG_TOUCH_PAD_NUM == 1
#define TOUCH_PAD_IO_MAP               TOUCH_1PAD_IO_MAP_4V1
#define TOUCH_PAD_MTCH_INPUT_SEL       TOUCH_1PAD_INPUT_SEL
#define TOUCH_ESP_SELECT               TOUCH_1PAD_ESP_SELECT
#elif CONFIG_TOUCH_PAD_NUM == 2
#define TOUCH_PAD_IO_MAP               TOUCH_2PAD_IO_MAP_4V1
#define TOUCH_PAD_MTCH_INPUT_SEL       TOUCH_2PAD_INPUT_SEL
#define TOUCH_ESP_SELECT               TOUCH_2PAD_ESP_SELECT
#elif CONFIG_TOUCH_PAD_NUM == 3
#define TOUCH_PAD_IO_MAP               TOUCH_3PAD_IO_MAP_4V1
#define TOUCH_PAD_MTCH_INPUT_SEL       TOUCH_3PAD_INPUT_SEL
#define TOUCH_ESP_SELECT               TOUCH_3PAD_ESP_SELECT
#elif CONFIG_TOUCH_PAD_NUM == 4
#define TOUCH_PAD_IO_MAP               TOUCH_4PAD_IO_MAP_4V1
#define TOUCH_PAD_MTCH_INPUT_SEL       TOUCH_4PAD_INPUT_SEL
#define TOUCH_ESP_SELECT               TOUCH_4PAD_ESP_SELECT
#else
#error "Please define number of touch pads"
#endif
#endif

#ifdef CONFIG_TOUCH_CURTAIN
#define MODEL_GROUP                 MODEL_GROUP_CTOUCH
#define DEVICE_FEATURE              DEVICE_FEATURE_TOUCH_CURTAIN
#define MODEL_PREFIX                MODEL_PREFIX_CTOUCH
#define HARDWARE_VERSION            HARDWARE_VERSION_CTOUCH
#elif defined(CONFIG_TOUCH_HEATER)
#define MODEL_GROUP                 MODEL_GROUP_TOUCH
#define DEVICE_FEATURE              DEVICE_FEATURE_TOUCH_HEATER
#define MODEL_PREFIX                MODEL_PREFIX_HTOUCH
#define HARDWARE_VERSION            HARDWARE_VERSION_HTOUCH
#else
#define MODEL_GROUP                 MODEL_GROUP_TOUCH
#define DEVICE_FEATURE              DEVICE_FEATURE_TOUCH_NORMAL
#define MODEL_PREFIX                MODEL_PREFIX_TOUCH
#define HARDWARE_VERSION            HARDWARE_VERSION_TOUCH
#endif

#define MOTOR_1_TX_PIN                  23
#define MOTOR_1_RX_PIN                  5
#define MOTOR_1_UART_NUM                1
#define MOTOR_HOME_PIN                  14

#define MOTOR_2_TX_PIN                  9
#define MOTOR_2_RX_PIN                  10
#define MOTOR_2_UART_NUM                2

#define SX8636_I2C_SDA_PIN              9
#define SX8636_I2C_SCL_PIN              10
#define SX8636_I2C_PORT_NUM             1
#define SX8636_INT_PIN                  18
#define SX8636_DEFAULT_SENSITIVITY      5

#elif CONFIG_DEVICE_TYPE_REMOTE_GATEWAY
#define MODEL_PREFIX                MODEL_PREFIX_REMOTE
#define MODEL_NAME                  "GW"
#define MODEL_GROUP                 MODEL_GROUP_REMOTE_GW
#define DEVICE_TYPE                 DEVICE_TYPE_REMOTE_GW
#define DEVICE_ATTRIBUTE            1
#define REMOTE_GW_BUZZER_PIN        (25)
#define REMOTE_GW_IRTX_PIN          (26)
#define REMOTE_GW_IRRX_PIN          (33)
#define REMOTE_GW_RFMOSI_PIN        (23)
#define REMOTE_GW_RFMISO_PIN        (19)
#define REMOTE_GW_RFSCK_PIN         (18)
#define REMOTE_GW_RFCS_PIN          (5)
#define REMOTE_GW_RFTX_PIN          (2)
#define REMOTE_GW_RFRX_PIN          (4)
#define AIRCOND_MOSI_PIN            (13)
#define AIRCOND_MISO_PIN            (27)
#define AIRCOND_SCK_PIN             (14)
#define AIRCOND_FAKECS_PIN          (32)
#define AIRCOND_CS_PIN              (39)
#define AIRCOND_RX_PIN              (9)
#define AIRCOND_TX_PIN              (10)
#define REMOTE_GW_SENSOR_SDA_PIN    (21)
#define REMOTE_GW_SENSOR_SCL_PIN    (22)
#define REMOTE_GW_SENSOR_I2C_PORT   (0)
#define DEVICE_FEATURE              (0)
#define HARDWARE_VERSION            "Invalid"
#elif CONFIG_DEVICE_TYPE_PIR
#define MODEL_NAME                      "MD1"
#define DEVICE_TYPE                     DEVICE_TYPE_PIR
#define MODEL_GROUP                     MODEL_GROUP_PIR
#define DEVICE_FEATURE                  DEVICE_FEATURE_PIR_NORMAL
#define MODEL_PREFIX                    MODEL_PREFIX_PIR
#define HARDWARE_VERSION                HARDWARE_VERSION_PIR
#define DEFAULT_TIME_HOLD_ON            5
#define PIR_SENSOR_PIN                  2
#define PIR_LED_PIN                     4
#elif CONFIG_DEVICE_TYPE_THERMOSTAT
#define MODEL_PREFIX                MODEL_PREFIX_TMS
#define MODEL_NAME                  "GW"
#define MODEL_GROUP                 MODEL_GROUP_THERMOSTAT
#define DEVICE_TYPE                 DEVICE_TYPE_THERMOSTAT
#define DEVICE_ATTRIBUTE            1
#define AIRCOND_MOSI_PIN            (26)
#define AIRCOND_MISO_PIN            (27)
#define AIRCOND_SCK_PIN             (14)
#define AIRCOND_CS_PIN              (-1)
#define AIRCOND_FAKECS_PIN          (-1)
#define AIRCOND_TX_PIN              (26)
#define AIRCOND_RX_PIN              (27)
#define AIRCOND_UART_NO             (1)
#define THERMOSTAT_I2C_PORT         (0)
#define THERMOSTAT_I2C_SCL          (25)
#define THERMOSTAT_I2C_SDA          (33)
#define THERMOSTAT_BUZZER_PIN       (32)
#define THERMOSTAT_BACKLIGHT_PIN    (8)
#define SX8636_I2C_SDA_PIN          THERMOSTAT_I2C_SDA
#define SX8636_I2C_SCL_PIN          THERMOSTAT_I2C_SCL
#define SX8636_I2C_PORT_NUM         THERMOSTAT_I2C_PORT
#define SX8636_INT_PIN              (13)
#define SX8636_DEFAULT_SENSITIVITY  (5)
#define DEVICE_FEATURE              (0)
#define HARDWARE_VERSION            "Invalid"
#else
#error "Invalid device type"
#endif


#ifdef CONFIG_DEVELOPMENT_MODE
#define MANUFACTURER_TOKEN          "11E8C7BC66B905A4969200155D6C8503"
#define DEVICE_REGISTER_ENDPOINT    "https://dev.iot.sunshinetech.vn/api/v1/devices/register"
#define DEVICE_WEBSOCKET_ENDPOINT   "wss://dev.iot.sunshinetech.vn/websocket"
#define DEVICE_OTA_ENDPOINT         "https://dev.iot.sunshinetech.vn/api/v1/ota"
#define ENABLE_LOGGING()            esp_log_level_set("*", ESP_LOG_INFO);\
                                        esp_log_level_set("TOUCH_APP", ESP_LOG_INFO);\
                                        esp_log_level_set("PERIPH_MONITOR", ESP_LOG_INFO);\
                                        esp_log_level_set("PERIPH_API", ESP_LOG_DEBUG);\
                                        esp_log_level_set("PERIPH_WIFI", ESP_LOG_DEBUG);\
                                        esp_log_level_set("PERIPH_OTA", ESP_LOG_DEBUG);\
                                        esp_log_level_set("TRANSPORT_WS", ESP_LOG_DEBUG);\
                                        esp_log_level_set("APP_CONFIG", ESP_LOG_DEBUG);\
                                        esp_log_level_set("PERIPH_MESH", ESP_LOG_DEBUG);\
                                        esp_log_level_set("PERIPH_BLUFI", ESP_LOG_DEBUG);\
                                        esp_log_level_set("WEBSOCKET_CLIENT", ESP_LOG_DEBUG);\
                                        esp_log_level_set("OTA", ESP_LOG_DEBUG);\
                                        esp_log_level_set("mesh", ESP_LOG_NONE);\
                                        esp_log_level_set("wifi", ESP_LOG_NONE);\
                                        esp_log_level_set("gpio", ESP_LOG_NONE);\
                                        esp_log_level_set("PERIPH_AIRCOND", ESP_LOG_DEBUG)
#else
#define MANUFACTURER_TOKEN          "11E8DB68E705CB5BA03C0050560121C8"
#define DEVICE_REGISTER_ENDPOINT    "https://sm-api.sunshinetech.vn/api/v1/devices/register"
#define DEVICE_WEBSOCKET_ENDPOINT   "wss://sm-api.sunshinetech.vn/websocket"
#define DEVICE_OTA_ENDPOINT         "https://sm-api.sunshinetech.vn/api/v1/ota"
#define ENABLE_LOGGING()            esp_log_level_set("*", ESP_LOG_INFO);\
                                        esp_log_level_set("TOUCH_APP", ESP_LOG_DEBUG);\
                                        esp_log_level_set("PERIPH_MONITOR", ESP_LOG_INFO);\
                                        esp_log_level_set("PERIPH_API", ESP_LOG_DEBUG);\
                                        esp_log_level_set("PERIPH_WIFI", ESP_LOG_DEBUG);\
                                        esp_log_level_set("PERIPH_OTA", ESP_LOG_DEBUG);\
                                        esp_log_level_set("TRANSPORT_WS", ESP_LOG_NONE);\
                                        esp_log_level_set("APP_CONFIG", ESP_LOG_DEBUG);\
                                        esp_log_level_set("PERIPH_MESH", ESP_LOG_INFO);\
                                        esp_log_level_set("MESH_TOUCH", ESP_LOG_DEBUG);\
                                        esp_log_level_set("MESH_AIRCOND", ESP_LOG_DEBUG);\
                                        esp_log_level_set("PERIPH_BLUFI", ESP_LOG_INFO);\
                                        esp_log_level_set("WEBSOCKET_CLIENT", ESP_LOG_NONE);\
                                        esp_log_level_set("OTA", ESP_LOG_DEBUG);\
                                        esp_log_level_set("pm_esp32", ESP_LOG_DEBUG);\
                                        esp_log_level_set("mesh", ESP_LOG_NONE);\
                                        esp_log_level_set("wifi", ESP_LOG_NONE);\
                                        esp_log_level_set("wpa", ESP_LOG_NONE);\
                                        esp_log_level_set("gpio", ESP_LOG_NONE);\
                                        esp_log_level_set("SEGMENT_DISPLAY", ESP_LOG_INFO);\
                                        esp_log_level_set("PERIPH_AIRCOND", ESP_LOG_DEBUG)

#endif



#define PRINT_DEVICE_INFO()


// App include
#include <string.h>
#include <stdlib.h>
#include "nvs.h"
#include "nvs_flash.h"
#include "esp_netif.h"
#include "esp_log.h"
#include "esp_system.h"
#include "esp_flash_encrypt.h"
#include "esp_event_loop.h"
#include "freertos/ringbuf.h"
#include "esp_mac.h"
#include "esp_mesh.h"
#include "esp_mesh_internal.h"

#include "esp_peripherals.h"
#include "periph_blufi.h"
#include "periph_button.h"
#include "periph_led.h"
#include "periph_led_low.h"
#include "periph_monitor.h"
#include "periph_mesh.h"
#include "periph_ota.h"
#include "periph_touch.h"
#include "periph_remote.h"
#include "periph_aircond.h"
#include "esp_cc1101.h"
#include "periph_motor.h"
#include "periph_pir.h"
#include "periph_thermostat.h"
#include "esp_timer.h"
#include "websocket_client.h"
#include "esp_http_client.h"
#include "tct_template.h"
#include "json_utils.h"
#include "protobuf-c/protobuf-c.h"
#include "client-main-message.pb-c.h"
#include "client-message.pb-c.h"
#include <driver/dac.h>
#include "app_event.h"
#include "periph_alarm.h"

#define MAX_TOKEN_SIZE          (64)
#define MAX_ENDPOINT_SIZE       (40)
#define MAX_ENV_SIZE            (32)
#define MAX_BOOTUP_STATE        3

#ifdef CONFIG_DEVELOPMENT_MODE
#define FIRMWARE_MAGIC          0x6321
#define RESET_CONFIG_MAGIC      0x7322
#else
#define FIRMWARE_MAGIC          0x1236
#define RESET_CONFIG_MAGIC      0x2237
#endif

#define TIME_DAY_START      {.tm_hour = 6, .tm_min = 0, .tm_sec = 0}
#define TIME_DAY_END        {.tm_hour = 22, .tm_min = 0, .tm_sec = 0}

typedef enum {
    WS_DATA_BINARY = 0,
    WS_DATA_BASE64,
    WS_DATA_MAX,
} ws_datatype_t;

typedef enum {
    BOOTUP_STATE_OFF = 0,
    BOOTUP_STATE_ON = 1,
    BOOTUP_STATE_KEEP_OLD = 2,
} bootup_state_t;

typedef struct tm tm_t;
typedef struct {
    int magic;
    int state;
    bootup_state_t reboot_state;
    uint8_t auto_off;
    uint32_t last_action_sec;
    uint32_t total_time_on_sec;
    uint32_t year_time_on_sec;
    uint32_t month_time_on_sec;
    uint8_t reserved[64];
} touch_statistics_state_t;

typedef struct {
    int pin0;
    int pin1;
    int pin2;
    int rev;
    int device_features;
    int device_attributes;
    const char *hw_version;
    const char *model_format;
    int model_group;
} hw_features_map_t;

typedef struct {
    int mode;
    int vanes;
    int fanspeed;
    int setpoint;
    uint8_t address;
} aircond_cfg_t;

typedef struct {
    int magic;
    char device_token[MAX_TOKEN_SIZE];
    char device_access_id[MAX_TOKEN_SIZE];
    char device_access_key[MAX_TOKEN_SIZE];
    char wifi_sta_ssid[MAX_TOKEN_SIZE];
    char wifi_sta_pass[MAX_TOKEN_SIZE];
    char wifi_ap_ssid[MAX_TOKEN_SIZE];
    char wifi_ap_pass[MAX_TOKEN_SIZE];
    char hw_version[MAX_ENV_SIZE];
    char model[MAX_ENV_SIZE];
    char hw_id[MAX_ENV_SIZE];
    char blufi_name[MAX_TOKEN_SIZE];
    hw_features_map_t *features_map;    //device_type | features | attirbute
    int features;    //device_type | features | attirbute
    int curtain_baud;
    bootup_state_t boot_state;
    hw_io_map_t *io;
    hw_io_map_t *indicator_io;
    int model_group;
    int reactivity;
    int brightness;
#ifndef CONFIG_DEVICE_TYPE_TOUCH
    int short_boot_counter;
#endif
    int reset_config_magic;
    uint32_t sceneActiveMap;
#ifdef CONFIG_DEVICE_TYPE_PIR
    int time_delay;
    bool en_full_time;
    uint16_t time_start;
    uint16_t time_end;
    uint8_t day_map;
#endif
#ifdef CONFIG_DEVICE_TYPE_THERMOSTAT
    aircond_cfg_t aircond;
#endif
    char ws_url[MAX_ENDPOINT_SIZE];
    ws_datatype_t ws_data_type;
    uint8_t reserved[20];
} app_config_t;

typedef enum {
    DEVICE_UNKNOWN = 0,
    TOUCH_SWITCH,
    CURTAIN_SWICH,
    MOTION_SENSOR,
} device_type_t;

typedef struct {
    device_type_t target_type;
    int target_switcher;
    char target_hwid[MAX_ENV_SIZE];
    int bridge_type; // 1: Cùng On/Off, 2: Đảo ngược
} touch_bridge_t;

typedef struct {
    int magic;
    touch_bridge_t bridge[MAX_RELAY_TOUCH_PAD_NUM];
} bridge_info_t;

typedef struct {
    int magic;
    bool flag;
} gw_joined_info_t;

extern app_config_t sys_cfg;
extern touch_statistics_state_t g_statistics_storage[MAX_TOUCH_PAD_NUM];
extern bridge_info_t g_bridge_info;
extern gw_joined_info_t g_gw_joined_info;

esp_err_t cfg_load();
esp_err_t cfg_save();
void cfg_print();
uint64_t cfg_get_esp_touch_mask();
uint64_t cfg_get_sx8636_touch_mask();
uint64_t cfg_get_button_mask();
esp_err_t cfg_load_touch_statistics(hw_io_map_t *io);
esp_err_t cfg_save_touch_statistics(hw_io_map_t *io, int io_index, bool is_month, bool is_year);

esp_err_t cfg_save_switcher_update(int io_index, bootup_state_t state, uint8_t auto_off);
esp_err_t cfg_reset_default();
esp_err_t cfg_reset_user_setting();
esp_err_t save_short_boot_timer(int timeout);
esp_err_t cfg_save_bridge();
esp_err_t cfg_save_joining_gw_flag();
bool cfg_check_if_has_attribute(int attribute);
bool cfg_check_if_has_feature(int feature);
#endif
