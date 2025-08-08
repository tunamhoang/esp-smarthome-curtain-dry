#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "esp_log.h"
#include "esp_system.h"

#include "esp_peripherals.h"
#include "pcf8551a.h"
#include "vl6180.h"
#include "segment_display.h"
#include "driver/i2c.h"
#include "periph_thermostat.h"
#include "periph_aircond.h"
#include "app_utility.h"
#include "sdkconfig.h"

#define SELECT_TIMEOUT          5000
#define BLINK_INTERVAL_MS       500
#define BLINK_TIME_MAX          (SELECT_TIMEOUT / BLINK_INTERVAL_MS)
#define UPDATE_TIMEOUT          1500        //ms
#define ACTIVE_TIMEOUT          10000
#define CONFIG_TIMEOUT          ACTIVE_TIMEOUT
#define RANGE_DETECT_MIN_SIZE   30          //mm
#define RANGE_DETECT_MAX_CNT    3

static const char *TAG = "PERIPH_THERMOS";

#define VALIDATE_THERMOSTAT(periph, ret) if (!esp_periph_validate(periph, PERIPH_ID_THERMOSTAT)) { \
        ESP_LOGE(TAG, "Invalid THERMOSTAT periph, at line %d", __LINE__);\
        return ret;\
    }

esp_periph_handle_t g_periph_thermostat = NULL;

#define THERMOSTAT_MAP_IDX          0
#define DISP_MAP_IDX                1
#define AIRCOND_MAP_IDX             1

const uint8_t thermostat_display_mode_map[2][6] = {
    {THERMOSTAT_MODE_HEAT,  THERMOSTAT_MODE_COOL,   THERMOSTAT_MODE_AUTO,   THERMOSTAT_MODE_DRY,    THERMOSTAT_MODE_FAN,    THERMOSTAT_MODE_VANES},
    {DISP_MODE_HEAT,        DISP_MODE_COOL,         DISP_MODE_AUTO,         DISP_MODE_DRY,          DISP_MODE_FAN,          DISP_MODE_VANES}
};
const uint8_t thermostat_display_fanspeed_map[2][5] = {
    {THERMOSTAT_FANSPEED_AUTO,  THERMOSTAT_FANSPEED_1,   THERMOSTAT_FANSPEED_2,   THERMOSTAT_FANSPEED_3,    THERMOSTAT_FANSPEED_4},
    {DISP_FANSPEED_AUTO,        DISP_FANSPEED_1,         DISP_FANSPEED_2,         DISP_FANSPEED_3,          DISP_FANSPEED_4}
};
const uint8_t thermostat_display_vanes_map[2][5] = {
    {THERMOSTAT_VANE_POS1_UP,  THERMOSTAT_VANE_POS2,   THERMOSTAT_VANE_POS3,   THERMOSTAT_VANE_POS4_DOWN,    THERMOSTAT_VANE_SWING},
    {DISP_VANE_POS1_UP,        DISP_VANE_POS2,         DISP_VANE_POS3,         DISP_VANE_POS4_DOWN,          DISP_VANE_SWING}
};

const uint8_t thermostat_aircond_mode_map[2][7] = {
    {THERMOSTAT_STATE_OFF,  THERMOSTAT_MODE_HEAT,  THERMOSTAT_MODE_COOL,   THERMOSTAT_MODE_AUTO,   THERMOSTAT_MODE_DRY,    THERMOSTAT_MODE_FAN,     THERMOSTAT_MODE_VANES},
    {AIRCOND_MODE_OFF,      AIRCOND_MODE_HEAT,     AIRCOND_MODE_COOL,      AIRCOND_MODE_AUTO,      AIRCOND_MODE_DRY,       AIRCOND_MODE_FAN,        AIRCOND_MODE_FAN}
};
const uint8_t thermostat_aircond_fanspeed_map[2][5] = {
    {THERMOSTAT_FANSPEED_AUTO,  THERMOSTAT_FANSPEED_1,   THERMOSTAT_FANSPEED_2,   THERMOSTAT_FANSPEED_3,    THERMOSTAT_FANSPEED_4},
    {AIRCOND_FANSPEED_AUTO,     AIRCOND_FANSPEED_1,      AIRCOND_FANSPEED_2,      AIRCOND_FANSPEED_3,       AIRCOND_FANSPEED_4}
};
const uint8_t thermostat_aircond_vanes_map[2][5] = {
    {THERMOSTAT_VANE_POS1_UP,  THERMOSTAT_VANE_POS2,   THERMOSTAT_VANE_POS3,   THERMOSTAT_VANE_POS4_DOWN,    THERMOSTAT_VANE_SWING},
    {AIRCOND_VANE_POS1_UP,     AIRCOND_VANE_POS2,      AIRCOND_VANE_POS3,      AIRCOND_VANE_POS4_DOWN,       AIRCOND_VANE_SWING}
};

typedef struct {
    bool                run;
    pcf8551a_cfg_t      pcf_cfg;
    vl6180_cfg_t        vl_cfg;
    pcf8551a_handle_t   pcf_handle;
    vl6180_handle_t     vl_handle;
    disp_handle_t       disp_handle;
    thermostat_info_t   *info;
    uint8_t             *segment_disp_data;
    uint8_t             segment_disp_data_sz;
    bool                is_active;
    int                 active_cnt;
    long long           active_tick;
    int64_t             press_tick;
    uint8_t             lux_level; //0 -> 100% (brigthness = 100 - lux_level)
    bool                is_blinking;
    int                 blink_cnt;
    long long           blinking_tick;
    disp_opt_t          disp_opt;
    SemaphoreHandle_t   update_lock;
    SemaphoreHandle_t   i2c_lock;
    EventGroupHandle_t  evt_group;
    bool                is_config_mode;
    bool                lock_config_one_tap;
} periph_thermostat_t;

static const int BTN_PRESSED_BIT = BIT0;

static esp_err_t _periph_thermostat_display(esp_periph_handle_t handle, disp_opt_t disp_opt, bool is_blink) {
    VALIDATE_THERMOSTAT(handle, ESP_FAIL);
    periph_thermostat_t *periph_thermostat = esp_periph_get_data(handle);
    disp_info_t *info = periph_thermostat->disp_handle->info;
    info->mode = DISP_MODE_AUTO;
    for(int mode_idx = 0; mode_idx < sizeof(thermostat_display_mode_map)/2; mode_idx++) {
        if(periph_thermostat->info->mode == thermostat_display_mode_map[THERMOSTAT_MAP_IDX][mode_idx])
            info->mode = thermostat_display_mode_map[DISP_MAP_IDX][mode_idx];
    }
    info->fanspeed = DISP_FANSPEED_1;
    for(int fanspeed_idx = 0; fanspeed_idx < sizeof(thermostat_display_fanspeed_map)/2; fanspeed_idx++) {
        if(periph_thermostat->info->fanspeed == thermostat_display_fanspeed_map[THERMOSTAT_MAP_IDX][fanspeed_idx])
            info->fanspeed = thermostat_display_fanspeed_map[DISP_MAP_IDX][fanspeed_idx];
    }
    info->vanes = DISP_VANE_POS1_UP;
    for(int vanes_idx = 0; vanes_idx < sizeof(thermostat_display_vanes_map)/2; vanes_idx++) {
        if(periph_thermostat->info->vanes == thermostat_display_vanes_map[THERMOSTAT_MAP_IDX][vanes_idx])
            info->vanes = thermostat_display_vanes_map[DISP_MAP_IDX][vanes_idx];
    }

    info->setpoint = periph_thermostat->info->setpoint;
    info->temperature = periph_thermostat->info->temperature;
    info->humidity = periph_thermostat->info->humidity;
    info->address = periph_thermostat->info->address;
    info->wifi_connected = periph_thermostat->info->wifi_connected;
    switch (periph_thermostat->info->state) {
    case THERMOSTAT_STATE_ON:
    case THERMOSTAT_STATE_ADDR_CONFIG:
        info->power = DISP_POWER_ON;
        break;
    case THERMOSTAT_STATE_OFF:
        info->power = DISP_POWER_OFF;
        break;
    case THERMOSTAT_STATE_CONFLICT:
        info->power = DISP_POWER_CONFLICT;
        break;
    default:
        LOGW(TAG, "_periph_thermostat_display state note support");
    }
    periph_thermostat->segment_disp_data_sz = segment_display_generate_data(periph_thermostat->disp_handle,
            periph_thermostat->segment_disp_data,
            disp_opt, is_blink);
    mutex_lock_ret(periph_thermostat->i2c_lock, 1000 / portTICK_PERIOD_MS, return ESP_FAIL);
    pcf8551a_display(periph_thermostat->pcf_handle, periph_thermostat->segment_disp_data, periph_thermostat->segment_disp_data_sz);
    pcf8551a_display_on(periph_thermostat->pcf_handle);
    mutex_unlock(periph_thermostat->i2c_lock);
    return ESP_OK;
}

static esp_err_t _thermostat_convert_to_aircond(thermostat_info_t *tms_info, aircond_info_t *ac_info) {
    if (tms_info->state == THERMOSTAT_STATE_OFF) {
        ac_info->mode = AIRCOND_MODE_OFF;
    } else {
        for(int mode_idx = 0; mode_idx < sizeof(thermostat_aircond_mode_map)/2; mode_idx++) {
            if(tms_info->mode == thermostat_aircond_mode_map[THERMOSTAT_MAP_IDX][mode_idx])
                ac_info->mode = thermostat_aircond_mode_map[AIRCOND_MAP_IDX][mode_idx];
        }
    }
    for(int fanspeed_idx = 0; fanspeed_idx < sizeof(thermostat_aircond_fanspeed_map)/2; fanspeed_idx++) {
        if(tms_info->fanspeed == thermostat_aircond_fanspeed_map[THERMOSTAT_MAP_IDX][fanspeed_idx])
            ac_info->fanspeed = thermostat_aircond_fanspeed_map[AIRCOND_MAP_IDX][fanspeed_idx];
    }
    for(int vanes_idx = 0; vanes_idx < sizeof(thermostat_aircond_vanes_map)/2; vanes_idx++) {
        if(tms_info->vanes == thermostat_aircond_vanes_map[THERMOSTAT_MAP_IDX][vanes_idx])
            ac_info->vanes = thermostat_aircond_vanes_map[AIRCOND_MAP_IDX][vanes_idx];
    }
    ac_info->setpoint = tms_info->setpoint;
    ac_info->temperature = tms_info->temperature;
    ac_info->humidity = tms_info->humidity;
    ac_info->is_online = tms_info->is_online;
    ac_info->address = tms_info->address;
    return ESP_OK;
}

static esp_err_t _thermostat_convert_from_aircond(thermostat_info_t *tms_info, aircond_info_t *ac_info) {
    tms_info->state = ac_info->mode == AIRCOND_MODE_OFF ? THERMOSTAT_STATE_OFF : THERMOSTAT_STATE_ON;
    for(int mode_idx = 0; mode_idx < sizeof(thermostat_aircond_mode_map)/2; mode_idx++) {
        if(ac_info->mode == thermostat_aircond_mode_map[AIRCOND_MAP_IDX][mode_idx])
            tms_info->mode = thermostat_aircond_mode_map[THERMOSTAT_MAP_IDX][mode_idx];
    }
    if(tms_info->mode == THERMOSTAT_MODE_VANES) tms_info->mode = THERMOSTAT_MODE_FAN;
    for(int fanspeed_idx = 0; fanspeed_idx < sizeof(thermostat_aircond_fanspeed_map)/2; fanspeed_idx++) {
        if(ac_info->fanspeed == thermostat_aircond_fanspeed_map[AIRCOND_MAP_IDX][fanspeed_idx])
            tms_info->fanspeed = thermostat_aircond_fanspeed_map[THERMOSTAT_MAP_IDX][fanspeed_idx];
    }
    for(int vanes_idx = 0; vanes_idx < sizeof(thermostat_aircond_vanes_map)/2; vanes_idx++) {
        if(ac_info->vanes == thermostat_aircond_vanes_map[AIRCOND_MAP_IDX][vanes_idx])
            tms_info->vanes = thermostat_aircond_vanes_map[THERMOSTAT_MAP_IDX][vanes_idx];
    }
    tms_info->address = ac_info->address;
    tms_info->temperature = ac_info->temperature;
    tms_info->humidity = ac_info->humidity;
    tms_info->setpoint = ac_info->setpoint;
    tms_info->is_online = ac_info->is_online;
    if (tms_info->is_online == false) {
        ///tms_info->state = THERMOSTAT_STATE_CONFLICT;
        LOGE(TAG, "THERMOSTAT_STATE_CONFLICT.....");
    }
    return ESP_OK;
}

static esp_err_t _thermostat_process_proximity(esp_periph_handle_t handle) {
    VALIDATE_THERMOSTAT(handle, ESP_FAIL);
    periph_thermostat_t *periph_thermostat = esp_periph_get_data(handle);
    ERROR_CHECKW(IS_NULL(periph_thermostat->vl_handle), "vl_handle doest not exist", return ESP_FAIL);
    mutex_lock_ret(periph_thermostat->i2c_lock, 200 / portTICK_PERIOD_MS, return ESP_FAIL);
    uint8_t range;
    vl6180_get_range(periph_thermostat->vl_handle, &range);
    uint8_t err_code = vl6180_read_range_status(periph_thermostat->vl_handle);
    mutex_unlock(periph_thermostat->i2c_lock);
    LOGD(TAG, "Read vl6180 err %d range %d",err_code, range);
    if ((err_code == VL6180X_ERROR_NONE && range > RANGE_DETECT_MIN_SIZE) || \
            err_code == VL6180X_ERROR_RANGEOFLOW) {
        periph_thermostat->active_cnt = periph_thermostat->active_cnt >= RANGE_DETECT_MAX_CNT ? RANGE_DETECT_MAX_CNT : periph_thermostat->active_cnt + 1;
    } else {
        periph_thermostat->active_cnt = periph_thermostat->active_cnt == 0 ? 0 : periph_thermostat->active_cnt - 1;
    }

    if (periph_thermostat->active_cnt == RANGE_DETECT_MAX_CNT) {
        if (!periph_thermostat->is_active) {
            periph_thermostat->is_active = true;
            LOGW(TAG, "Target detected (%d)", range);
            esp_periph_send_event(handle, THERMOSTAT_EVENT_UPDATE_PROXIMITY, (void *)&periph_thermostat->is_active, sizeof(bool));
        } else {
            periph_thermostat->active_tick = esp_periph_tick_get();
        }

    } else if (periph_thermostat->active_cnt == 0) {
        if (periph_thermostat->is_active) {
            if (esp_periph_tick_get() - periph_thermostat->active_tick > ACTIVE_TIMEOUT) {
                periph_thermostat->is_active = false;
                esp_periph_send_event(handle, THERMOSTAT_EVENT_UPDATE_PROXIMITY, (void *)&periph_thermostat->is_active, sizeof(bool));
                LOGW(TAG, "Target not detect after %d ms", (int)ACTIVE_TIMEOUT);
                periph_thermostat->active_tick = esp_periph_tick_get();
            }
        }
    }
    return ESP_OK;
}

esp_err_t _periph_thermostat_print_info(const char *st, int line, thermostat_info_t *info) {
    const char *thermostat_state_str[] = {"CONFLICT", "ON", "OFF", "ADDR_CONFIG", "MAX"};
    const char *thermostat_mode_str[] = {"MIN", "AUTO", "COOL", "HEAT", "DRY", "FAN-SPEED", "FAN-SWING", "MAX"};
    const char *thermostat_speed_str[] = {"MIN", "AUTO", "1", "2", "3", "4", "MAX"};
    const char *thermostat_vanes_str[] = {"MIN", "POS1", "POS2", "POS3", "POS4", "SWING", "MAX"};
    LOGI(TAG, "(%-10s,%-4d) Thermos Address: %x\tMode: %s\tSetpoint: %d\tTemp: %3.1f\tHump: %3.1f\tFanspeed: %s\tVanes: %s\tState: %s", st, line,
         info->address,
         thermostat_mode_str[info->mode], info->setpoint, info->temperature, info->humidity, thermostat_speed_str[info->fanspeed], thermostat_vanes_str[info->vanes], thermostat_state_str[info->state]);
    return ESP_OK;
}

esp_err_t _thermostat_process_evt(esp_periph_handle_t handle) {
    static bool is_update = false;
    VALIDATE_THERMOSTAT(handle, ESP_FAIL);
    periph_thermostat_t *periph_thermostat = esp_periph_get_data(handle);
    EventBits_t uBits = xEventGroupWaitBits(periph_thermostat->evt_group, BTN_PRESSED_BIT, false, false, 100 / portTICK_PERIOD_MS);
    if ((uBits & BTN_PRESSED_BIT) != 0) {
        xEventGroupClearBits(periph_thermostat->evt_group, BTN_PRESSED_BIT);
        if (!periph_thermostat->is_blinking) {
            _periph_thermostat_display(g_periph_thermostat, DISP_NORMAL, false);
        }
        _periph_thermostat_print_info("evt", __LINE__, periph_thermostat->info);
        is_update = true;
    }
    if (esp_periph_tick_get() - periph_thermostat->press_tick < UPDATE_TIMEOUT) {
        return ESP_FAIL;
    }
    if(is_update) {
        is_update = false;
        LOGW(TAG, "Update info callback, addr: %x", periph_thermostat->info->address);
        aircond_info_t aircond;
        _thermostat_convert_to_aircond(periph_thermostat->info, &aircond);
        esp_periph_send_event(g_periph_thermostat, THERMOSTAT_EVENT_UPDATE_INFOR,
                              (void *)&aircond, sizeof(thermostat_info_t));
    }
    return ESP_OK;
}

esp_err_t _thermostat_process_lux(esp_periph_handle_t handle) {
    VALIDATE_THERMOSTAT(handle, ESP_FAIL);
    periph_thermostat_t *periph_thermostat = esp_periph_get_data(handle);
    mutex_lock_ret(periph_thermostat->i2c_lock, 100 / portTICK_PERIOD_MS, return ESP_FAIL);
    float lux;
    vl6180_get_lux(periph_thermostat->vl_handle, VL6180X_ALS_GAIN_5, &lux);
    mutex_unlock(periph_thermostat->i2c_lock);
    LOGI(TAG, "Get lux = %f", lux);
    uint8_t lux_level = (uint8_t)(lux / 10);
    if (lux_level == periph_thermostat->lux_level) {
        return ESP_OK;
    }
    esp_periph_send_event(handle, THERMOSTAT_EVENT_UPDATE_LUX,
                          (void *)&periph_thermostat->lux_level,
                          periph_thermostat->is_active ? 1 : 0);
    return ESP_OK;
}

static esp_err_t _thermostat_process_blinking(esp_periph_handle_t handle) {
    VALIDATE_THERMOSTAT(handle, ESP_FAIL);
    periph_thermostat_t *periph_thermostat = esp_periph_get_data(handle);
    if (periph_thermostat->is_config_mode) {
        if(esp_periph_tick_get() - periph_thermostat->press_tick > CONFIG_TIMEOUT) {
            periph_thermostat->is_config_mode = false;
            periph_thermostat->info->state = THERMOSTAT_STATE_ON;
            periph_thermostat->disp_opt = DISP_NORMAL;
            _periph_thermostat_display(handle, DISP_NORMAL, false);
        }
        return ESP_OK;
    }
    if (periph_thermostat->is_blinking == false) {
        /* if(periph_thermostat->disp_opt != DISP_NORMAL) {
            periph_thermostat->disp_opt = DISP_NORMAL;
            _periph_thermostat_display(handle, DISP_NORMAL, false);
            LOGW(TAG, "Set display to normal...");
        } */
        return ESP_OK;
    }
    if (periph_thermostat->blink_cnt == BLINK_TIME_MAX) {
        periph_thermostat->is_blinking = false;
        return ESP_FAIL;
    }
    if (esp_periph_tick_get() - periph_thermostat->blinking_tick > (periph_thermostat->blink_cnt + 1) * BLINK_INTERVAL_MS) {
        periph_thermostat->blink_cnt += 1;
        LOGD(TAG, "BLINKING times: %d", periph_thermostat->blink_cnt);
        mutex_lock_ret(periph_thermostat->update_lock, 100 / portTICK_PERIOD_MS, return ESP_FAIL);
        if (periph_thermostat->blink_cnt == BLINK_TIME_MAX) {
            LOGW(TAG, "Timeout");
            periph_thermostat->lock_config_one_tap = true;
            _periph_thermostat_display(handle, DISP_NORMAL, false);
        } else if (periph_thermostat->blink_cnt % 2) {
            _periph_thermostat_display(handle, periph_thermostat->disp_opt, true);
        } else {
            _periph_thermostat_display(handle, periph_thermostat->disp_opt, false);
        }
        mutex_unlock(periph_thermostat->update_lock);
    }
    return ESP_OK;
}

static void _thermostat_task(void *pv) {
    esp_periph_handle_t self = pv;
    periph_thermostat_t *periph_thermostat = esp_periph_get_data(self);

    while (periph_thermostat->run) {
        _thermostat_process_evt(self);
        _thermostat_process_proximity(self);
        //_thermostat_process_lux(self);
        _thermostat_process_blinking(self);
        vTaskDelay(100 / portTICK_PERIOD_MS);
    }
    vTaskDelete(NULL);
}

esp_err_t _thermostat_init(esp_periph_handle_t self) {
    VALIDATE_THERMOSTAT(self, ESP_FAIL);
    LOGI(TAG, "Memory free: %d", heap_caps_get_free_size(MALLOC_CAP_INTERNAL));
    periph_thermostat_t *thermostat_handle = (periph_thermostat_t *)esp_periph_get_data(self);
    thermostat_handle->vl_handle = vl6180_init(&thermostat_handle->vl_cfg);
    if (vl6180_start(thermostat_handle->vl_handle) != ESP_OK) {
        thermostat_handle->vl_handle = NULL;
        ESP_LOGE(TAG, "Error start VL6180");
    }
    vTaskDelay(500/portTICK_PERIOD_MS);
    /* vl6180_cross_talk_set(thermostat_handle->vl_handle, 2000);
    vl6180_offset_calib(thermostat_handle->vl_handle, 0); */
    vl6180_offset_calib(thermostat_handle->vl_handle, 0);
    vl6180_cross_talk_calib(thermostat_handle->vl_handle);

    thermostat_handle->pcf_handle = pcf8551a_init(&thermostat_handle->pcf_cfg);
    if (pcf8551a_start(thermostat_handle->pcf_handle) != ESP_OK) {
        ESP_LOGE(TAG, "Error start PCF8551A");
    }
    thermostat_handle->disp_handle = segment_display_init();

    pcf8551a_software_rst(thermostat_handle->pcf_handle);
    _periph_thermostat_display(self, DISP_BOOTING, false);
    if (!thermostat_handle->run) {
        thermostat_handle->run = true;
        BaseType_t xReturned = pdPASS;
        xReturned = xTaskCreate(_thermostat_task, "thermostat_task", 3 * 1024, self, 5, NULL);
        ERROR_CHECKW(xReturned != pdPASS, "Error create thermostat_task, memory exhausted?", return ESP_FAIL);
    }
    LOGI(TAG, "Memory free: %d", heap_caps_get_free_size(MALLOC_CAP_INTERNAL));
    return ESP_OK;
}

esp_err_t _thermostat_run(esp_periph_handle_t self, audio_event_iface_msg_t *msg) {
    return ESP_OK;
}

esp_err_t _thermostat_destroy(esp_periph_handle_t self) {
    VALIDATE_THERMOSTAT(self, ESP_FAIL);
    periph_thermostat_t *periph_thermostat = esp_periph_get_data(self);
    free(periph_thermostat);
    return ESP_OK;
}

esp_periph_handle_t periph_thermostat_init(periph_thermostat_cfg_t* thermostat_cfg) {
    esp_periph_handle_t periph = esp_periph_create(PERIPH_ID_THERMOSTAT, "periph_thermostat");
    PERIPH_MEM_CHECK(TAG, periph, return NULL);

    periph_thermostat_t *periph_thermostat = calloc(1, sizeof(periph_thermostat_t));
    PERIPH_MEM_CHECK(TAG, periph_thermostat, goto _thermostat_config_fail);

    periph_thermostat->pcf_cfg.scl_pin = thermostat_cfg->scl_pin;
    periph_thermostat->pcf_cfg.sda_pin = thermostat_cfg->sda_pin;
    periph_thermostat->pcf_cfg.i2c_port = thermostat_cfg->i2c_port;
    periph_thermostat->pcf_cfg.device_addr = 0x38;

    periph_thermostat->vl_cfg.scl_pin = thermostat_cfg->scl_pin;
    periph_thermostat->vl_cfg.sda_pin = thermostat_cfg->sda_pin;
    periph_thermostat->vl_cfg.i2c_port = thermostat_cfg->i2c_port;
    periph_thermostat->vl_cfg.device_addr = 0x29;

    periph_thermostat->run = false;
    periph_thermostat->is_active = true;
    periph_thermostat->active_cnt = 0;
    periph_thermostat->active_tick = esp_periph_tick_get();
    periph_thermostat->lux_level = 10;

    periph_thermostat->is_blinking = false;
    periph_thermostat->blink_cnt = 0;
    periph_thermostat->blinking_tick = esp_periph_tick_get();
    periph_thermostat->disp_opt = DISP_NORMAL;
    periph_thermostat->press_tick = esp_periph_tick_get();

    periph_thermostat->is_config_mode = false;
    periph_thermostat->lock_config_one_tap = true;

    periph_thermostat->update_lock = xSemaphoreCreateMutex();
    periph_thermostat->i2c_lock = xSemaphoreCreateMutex();
    periph_thermostat->evt_group = xEventGroupCreate();
    xEventGroupClearBits(periph_thermostat->evt_group, BTN_PRESSED_BIT);

    periph_thermostat->info = malloc(sizeof(thermostat_info_t));
    PERIPH_MEM_CHECK(TAG, periph_thermostat->info, goto _thermostat_config_fail);
    memset(periph_thermostat->info, 0, sizeof(thermostat_info_t));
    periph_thermostat->info->state = THERMOSTAT_STATE_CONFLICT;
    periph_thermostat->info->mode = THERMOSTAT_MODE_MIN + 1;
    periph_thermostat->info->fanspeed = THERMOSTAT_FANSPEED_MIN + 1;
    periph_thermostat->info->vanes = THERMOSTAT_VANE_MIN + 1;
    periph_thermostat->info->address = AIRCOND_BROADCAST_ADDR;
    periph_thermostat->info->address_num = 0;
    periph_thermostat->info->wifi_connected = false;

    periph_thermostat->segment_disp_data = malloc(5 * 4 * sizeof(uint8_t));
    PERIPH_MEM_CHECK(TAG, periph_thermostat->segment_disp_data, goto _thermostat_config_fail);
    memset(periph_thermostat->segment_disp_data, 0, 5 * 4 * sizeof(uint8_t));
    periph_thermostat->segment_disp_data_sz = 20;

    periph_thermostat->run = false;

    esp_periph_set_data(periph, periph_thermostat);
    esp_periph_set_function(periph, _thermostat_init, _thermostat_run, _thermostat_destroy);
    g_periph_thermostat = periph;
    return periph;

_thermostat_config_fail:
    LOGE(TAG, "Failed to initial Thermostat");
    free(periph);
    return NULL;
}

esp_err_t periph_thermostat_destroy(esp_periph_handle_t handle) {
    if (handle == NULL) {
        return ESP_FAIL;
    }
    free(handle);
    return ESP_OK;
}

esp_err_t periph_thermostat_proccess_btn(esp_periph_handle_t handle, thermostat_btn_t btn) {
    VALIDATE_THERMOSTAT(handle, ESP_FAIL);
    periph_thermostat_t *periph_thermostat = esp_periph_get_data(handle);
    thermostat_info_t *info = periph_thermostat->info;
    if (info->state == THERMOSTAT_STATE_CONFLICT) {
        LOGE(TAG, "THERMOSTAT_STATE_CONFLICT");
        return ESP_FAIL;
    }
    if (info->state == THERMOSTAT_STATE_OFF && btn != THERMOSTAT_BTN_POWER) {
        LOGE(TAG, "THERMOSTAT_STATE_OFF");
        return ESP_FAIL;
    }
    mutex_lock_ret(periph_thermostat->update_lock, 100 / portTICK_PERIOD_MS, return ESP_FAIL);
    periph_thermostat->disp_opt = DISP_NORMAL;
    switch (btn) {
    case THERMOSTAT_BTN_POWER:
        if (info->state == THERMOSTAT_STATE_ADDR_CONFIG) {
            periph_thermostat->disp_opt = DISP_CONFIG_MODE;
            periph_thermostat->is_blinking = false;
        }
        break;
    case THERMOSTAT_BTN_UP:
        LOGD(TAG, "Button Up pressed");
        if (info->state == THERMOSTAT_STATE_ADDR_CONFIG) {
            int idx = 0;
            for (int i=0 ; i<info->address_num ; i++) {
                if (info->address_list[i] == info->address) {
                    idx = i;
                }
            }
            if (idx < info->address_num - 1) {
                info->address = info->address_list[idx + 1];
            } else {
                info->address = info->address_list[0];
            }
            periph_thermostat->disp_opt = DISP_CONFIG_MODE;
            periph_thermostat->is_blinking = false;
            break;
        }
        switch (info->mode) {
        case THERMOSTAT_MODE_AUTO:
        case THERMOSTAT_MODE_COOL:
        case THERMOSTAT_MODE_HEAT:
        case THERMOSTAT_MODE_DRY:
            info->setpoint = info->setpoint >= 35 ? 35 : info->setpoint + 1;
            periph_thermostat->disp_opt = DISP_SETPOINT;
            break;
        case THERMOSTAT_MODE_FAN:
            info->fanspeed += 1;
            if (info->fanspeed == THERMOSTAT_FANSPEED_MAX) {
                info->fanspeed = THERMOSTAT_FANSPEED_MIN + 1;
            }
            periph_thermostat->disp_opt = DISP_FAN;
            break;
        case THERMOSTAT_MODE_VANES:
            info->vanes += 1;
            if (info->vanes == THERMOSTAT_VANE_MAX) {
                info->vanes = THERMOSTAT_VANE_MIN + 1;
            }
            periph_thermostat->disp_opt = DISP_VANES;
            break;
        default:
            LOGW(TAG, "Mode not support");
        }
        periph_thermostat->is_blinking = true;
        periph_thermostat->blinking_tick = esp_periph_tick_get();
        periph_thermostat->blink_cnt = 0;
        break;
    case THERMOSTAT_BTN_DOWN:
        LOGD(TAG, "Button Down pressed");
        if (info->state == THERMOSTAT_STATE_ADDR_CONFIG) {
            int idx = 0;
            for (int i = 0 ; i < info->address_num ; i++) {
                if (info->address_list[i] == info->address) {
                    idx = i;
                }
            }
            if (idx <= 0) {
                info->address = info->address_list[info->address_num - 1];
            } else {
                info->address = info->address_list[idx - 1];
            }
            periph_thermostat->disp_opt = DISP_CONFIG_MODE;
            periph_thermostat->is_blinking = false;
            break;
        }
        switch (info->mode) {
        case THERMOSTAT_MODE_AUTO:
        case THERMOSTAT_MODE_COOL:
        case THERMOSTAT_MODE_HEAT:
        case THERMOSTAT_MODE_DRY:
            info->setpoint = info->setpoint <= 16 ? 16 : info->setpoint - 1;
            periph_thermostat->disp_opt = DISP_SETPOINT;
            break;
        case THERMOSTAT_MODE_FAN:
            info->fanspeed -= 1;
            if (info->fanspeed == THERMOSTAT_FANSPEED_MIN) {
                info->fanspeed = THERMOSTAT_FANSPEED_MAX - 1;
            }
            periph_thermostat->disp_opt = DISP_FAN;
            break;
        case THERMOSTAT_MODE_VANES:
            info->vanes -= 1;
            if (info->vanes == THERMOSTAT_VANE_MIN) {
                info->vanes = THERMOSTAT_VANE_MAX - 1;
            }
            periph_thermostat->disp_opt = DISP_VANES;
            break;
        default:
            LOGW(TAG, "Mode option not support");
        }
        periph_thermostat->is_blinking = true;
        periph_thermostat->blinking_tick = esp_periph_tick_get();
        periph_thermostat->blink_cnt = 0;
        break;
    case THERMOSTAT_BTN_MODE:
        if (info->state == THERMOSTAT_STATE_ADDR_CONFIG) {
            periph_thermostat->disp_opt = DISP_CONFIG_MODE;
            periph_thermostat->is_blinking = false;
            break;
        }
        if(periph_thermostat->lock_config_one_tap) {
            periph_thermostat->lock_config_one_tap = false;
            break;
        }
        info->mode -= 1;
        if (info->mode == THERMOSTAT_MODE_MIN) {
            info->mode = THERMOSTAT_MODE_MAX - 1;
        }
        periph_thermostat->disp_opt = DISP_MODE;
        periph_thermostat->is_blinking = true;
        LOGD(TAG, "Button Mode pressed, Current Mode = %d", (int)info->mode);
        periph_thermostat->blinking_tick = esp_periph_tick_get();
        periph_thermostat->blink_cnt = 0;
        break;
    default:
        LOGW(TAG, "Btn not supported");
    }
    LOGI(TAG, "Button pressed");
    _periph_thermostat_display(handle, periph_thermostat->disp_opt, false);
    mutex_unlock(periph_thermostat->update_lock);
    periph_thermostat->active_tick = esp_periph_tick_get();
    if (!periph_thermostat->is_active) {
        periph_thermostat->is_active = true;
        esp_periph_send_event(handle, THERMOSTAT_EVENT_UPDATE_PROXIMITY,
                              (void *)&periph_thermostat->is_active, sizeof(bool));
    }
    // _periph_thermostat_print_info(info);
    periph_thermostat->press_tick = esp_periph_tick_get();
    if (!periph_thermostat->is_config_mode) {
        //_thermostat_start_timer(TMR_BTN_PRESSED, _update_info_timer_handle, UPDATE_TIMEOUT);
        xEventGroupSetBits(periph_thermostat->evt_group, BTN_PRESSED_BIT);
    }
    return ESP_OK;
}

esp_err_t periph_thermostat_update(esp_periph_handle_t handle, void *aircond_info) {
    VALIDATE_THERMOSTAT(handle, ESP_FAIL);
    if (aircond_info == NULL) {
        return ESP_FAIL;
    }
    aircond_info_t *aircond = (aircond_info_t *)aircond_info;
    periph_thermostat_t *periph_thermostat = esp_periph_get_data(handle);
    if(aircond->address != periph_thermostat->info->address) {
        LOGW(TAG, "Receive control address %x not mine...", aircond->address);
        return ESP_FAIL;
    }
    _thermostat_convert_from_aircond(periph_thermostat->info, aircond);
    LOGD(TAG, "periph_thermostat_update");
    if (periph_thermostat->is_config_mode) {
        return ESP_FAIL;
    }
    mutex_lock_ret(periph_thermostat->update_lock, 1000 / portTICK_PERIOD_MS, return ESP_FAIL);
    if (periph_thermostat->is_blinking) {
        periph_thermostat->info->setpoint = periph_thermostat->info->setpoint;
    } else {
        _periph_thermostat_display(handle, DISP_NORMAL, false);
    }
    mutex_unlock(periph_thermostat->update_lock);
    _periph_thermostat_print_info("Update", __LINE__, periph_thermostat->info);
    return ESP_OK;
}

esp_err_t periph_thermostat_enter_address_config(esp_periph_handle_t handle, uint8_t *addr_list, uint8_t addr_num) {
    VALIDATE_THERMOSTAT(handle, ESP_FAIL);
    LOGI(TAG, "periph_thermostat_enter_address_config");
    periph_thermostat_t *periph_thermostat = esp_periph_get_data(handle);
    periph_thermostat->is_config_mode = true;
    for (int i=0; i< addr_num; i++) {
        periph_thermostat->info->address_list[i] = addr_list[i];
        LOGD(TAG, "Tms addr[%d] = %x", i, periph_thermostat->info->address_list[i]);
    }
    periph_thermostat->info->address_num = addr_num;
    periph_thermostat->info->state = THERMOSTAT_STATE_ADDR_CONFIG;
    periph_thermostat->is_blinking = false;
    periph_thermostat->active_tick = esp_periph_tick_get();
    periph_thermostat->press_tick = esp_periph_tick_get();
    _periph_thermostat_display(handle, DISP_CONFIG_MODE, false);
    return ESP_OK;
}

esp_err_t periph_thermostat_exit_address_config(esp_periph_handle_t handle) {
    VALIDATE_THERMOSTAT(handle, ESP_FAIL);
    LOGI(TAG, "periph_thermostat_exit_address_config");
    periph_thermostat_t *periph_thermostat = esp_periph_get_data(handle);
    periph_thermostat->is_config_mode = false;
    periph_thermostat->info->state = THERMOSTAT_STATE_OFF;
    _periph_thermostat_display(g_periph_thermostat, DISP_NORMAL, false);
    esp_periph_send_event(handle, THERMOSTAT_EVENT_UPDATE_ADDRESS, (void *)(&periph_thermostat->info->address), sizeof(uint8_t));
    return ESP_OK;
}

uint8_t periph_thermostat_get_address(esp_periph_handle_t handle) {
    VALIDATE_THERMOSTAT(handle, ESP_FAIL);
    periph_thermostat_t *periph_thermostat = esp_periph_get_data(handle);
    LOGD(TAG, "periph_thermostat_get_address, addr: %d", periph_thermostat->info->address);
    return periph_thermostat->info->address;
}

esp_err_t periph_thermostat_set_address(esp_periph_handle_t handle, uint8_t addr) {
    VALIDATE_THERMOSTAT(handle, ESP_FAIL);
    periph_thermostat_t *periph_thermostat = esp_periph_get_data(handle);
    periph_thermostat->info->address = addr;
    LOGW(TAG, "periph_thermostat_set_address to: %x", periph_thermostat->info->address);
    return ESP_OK;
}

bool periph_thermostat_get_wifi(esp_periph_handle_t handle) {
    VALIDATE_THERMOSTAT(handle, ESP_FAIL);
    periph_thermostat_t *periph_thermostat = esp_periph_get_data(handle);
    return periph_thermostat->info->wifi_connected ? true : false;
}

esp_err_t periph_thermostat_set_wifi(esp_periph_handle_t handle, bool is_connected) {
    VALIDATE_THERMOSTAT(handle, ESP_FAIL);
    periph_thermostat_t *periph_thermostat = esp_periph_get_data(handle);
    periph_thermostat->info->wifi_connected = is_connected;
    LOGI(TAG, "periph_thermostat_set_wifi is %s", periph_thermostat->info->wifi_connected ? "connected" : "not connected");
    _periph_thermostat_display(handle, periph_thermostat->disp_opt, false);
    return ESP_OK;
}

esp_err_t periph_thermostat_set_state(esp_periph_handle_t handle, thermostat_state_t state) {
    VALIDATE_THERMOSTAT(handle, ESP_FAIL);
    periph_thermostat_t *periph_thermostat = esp_periph_get_data(handle);
    periph_thermostat->info->state = state;
    return ESP_OK;
}

thermostat_state_t periph_thermostat_get_state(esp_periph_handle_t handle) {
    VALIDATE_THERMOSTAT(handle, ESP_FAIL);
    periph_thermostat_t *periph_thermostat = esp_periph_get_data(handle);
    return periph_thermostat->info->state;
}

esp_err_t periph_thermostat_request_control(esp_periph_handle_t self, void *aircond_info) {
    if (g_periph_thermostat != NULL) {
        self = g_periph_thermostat;
    }
    VALIDATE_THERMOSTAT(self, ESP_FAIL);
    periph_thermostat_t *periph_thermostat = esp_periph_get_data(self);
    aircond_info_t *aircond = (aircond_info_t *)aircond_info;
    if(aircond->setpoint != periph_thermostat->info->setpoint) {
        periph_thermostat->disp_opt = DISP_SETPOINT;
        periph_thermostat->is_blinking = true;
        periph_thermostat->blinking_tick = esp_periph_tick_get();
        periph_thermostat->blink_cnt = 0;
        _periph_thermostat_display(self, periph_thermostat->disp_opt, false);
    }
    return ESP_OK;
}
