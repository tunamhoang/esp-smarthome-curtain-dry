/*
 * This file is subject to the terms of the SunshineTech License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *
 *              ./LICENSE
 */
#include "periph_monitor.h"

#include "app_config.h"
#include "app_utility.h"
#include "periph_motor.h"
#include "sdkconfig.h"

static const char *TAG = "PERIPH_MONITOR";
#define CONFIG_MODE_TIMEOUT_MS      (5 * 60 * 1000)
#define DEFAULT_MONITOR_BUFFER      (512)
#define STATE_TO_RELAY(x)           (x)
#define MAX_DELAY_FAST_TAP_MS       (2000)
#define DOUBLE_TAP_DETECT_MS        (600)
#define DOUBLE_TAP_EVENT_TIMEOUT_MS (2000)
#define SCENE_TAP_EVENT_TIMEOUT_MS  (2000)
#define VALIDATE_MONITOR(periph, ret)                              \
    if (!esp_periph_validate(periph, PERIPH_ID_MONITOR)) {         \
        LOGE(TAG, "Invalid MONITOR periph, at line %d", __LINE__); \
        return ret;                                                \
    }

typedef enum {
    MONITOR_UNINIT = 0,
    MONITOR_WAITING_MESH,
    MONITOR_WAITING_WEBSOCKET,
    // MONITOR_WIFI_DISCONNECTED,
    // MONITOR_SERVER_DISCONNECTED,
    MONITOR_OTA_UPDATING,
    MONITOR_CONFIG_MODE,
    MONITOR_SERVER_LOGGED,
    MONITOR_STATE_MAX,
} monitor_state_t;

typedef struct {
    bool            enable;
    monitor_state_t state;
    int             time_unchange_ms;
    int             time_blink_ms;
    int             time_blink_repeat;
    int             time_fade;
} monitor_blink_pattern_t;

typedef struct {
    hw_io_map_t            *io_map;
    hw_io_map_t            *monitor_io;
    int                     io_num;
    esp_periph_handle_t     led_periph;
    esp_periph_handle_t     led_low_periph;
    esp_periph_handle_t     motor_periph;
    esp_periph_handle_t     remote_periph;
    esp_periph_handle_t     touch_periph;
    esp_periph_handle_t     btn_periph;
    esp_periph_handle_t     pir_periph;
    esp_periph_handle_t     thermostat_periph;
    esp_periph_handle_t     aircond_periph;
    monitor_state_t         state;
    monitor_state_t         next_state;
    long long               blink_tick;
    long long               config_tick;
    bool                    blink_enabled;
    int                     blink_time;
    bool                    blink_gpio_reset;
    bool                    monitor_run;
    char                   *buffer;
    bool                    is_config_mode;
    monitor_blink_pattern_t manual_blink;
    motor_control_t         motor_ctrl_cmd[MAX_RELAY_TOUCH_PAD_NUM];
    bool                    motor_btn_state[MAX_RELAY_TOUCH_PAD_NUM];
    long long               last_tapped;
    long long               last_double_tapped;
    long long               last_scene_tapped;
    int                     fast_taps_counter;
    aircond_info_t          aircond_info;
} periph_monitor_t;

esp_periph_handle_t g_periph_monitor = NULL;

static const monitor_blink_pattern_t blink_pattern[MONITOR_STATE_MAX] = {
    {false, MONITOR_UNINIT, 0, 0, 0, 200},
    {true, MONITOR_WAITING_MESH, 6000, 200, 2, 200},
    {true, MONITOR_WAITING_WEBSOCKET, 3000, 200, 6, 200},
    {false, MONITOR_SERVER_LOGGED, 5000, 500, 8, 800},
    {true, MONITOR_OTA_UPDATING, 2000, 600, 2, 200},
    {true, MONITOR_CONFIG_MODE, 600, 600, 2, 600},
};

static esp_err_t                      periph_monitor_set_touch_brightness(esp_periph_handle_t periph, int brightness);
static const monitor_blink_pattern_t *_get_blink_pattern(monitor_state_t state) {
    int i;
    for (i = 0; i < MONITOR_STATE_MAX; i++) {
        if (blink_pattern[i].state == state) {
            return &blink_pattern[i];
        }
    }
    return NULL;
}

static void _reset_gpio(hw_io_map_t *_touch_io_map) {
    if (_touch_io_map == NULL) {
        return;
    }
    if (_touch_io_map->led_off_gpio >= 0) {
        gpio_reset_pin(_touch_io_map->led_off_gpio);
        gpio_set_direction(_touch_io_map->led_off_gpio, GPIO_MODE_OUTPUT);
        gpio_set_level(_touch_io_map->led_off_gpio, 1 - _touch_io_map->state);
    }
    if (_touch_io_map->led_on_gpio >= 0) {
        gpio_reset_pin(_touch_io_map->led_on_gpio);
        gpio_set_direction(_touch_io_map->led_on_gpio, GPIO_MODE_OUTPUT);
        gpio_set_level(_touch_io_map->led_on_gpio, _touch_io_map->state);
    }
}

static motor_control_t _get_stop_command(motor_control_t ctrl) {
    switch (ctrl) {
        case MOTOR_SINGLE_CTRL_OPEN:
        case MOTOR_SINGLE_CTRL_CLOSE:
            return MOTOR_SINGLE_CTRL_STOP;
        case MOTOR_IN_CTRL_OPEN:
        case MOTOR_IN_CTRL_CLOSE:
            return MOTOR_IN_CTRL_STOP;
        case MOTOR_OUT_CTRL_OPEN:
        case MOTOR_OUT_CTRL_CLOSE:
            return MOTOR_OUT_CTRL_STOP;
        default:
            return MOTOR_CTRL_NONE;
    }
}

static int _get_opposite_index(int idx) {
    switch (idx) {
        case 0:
            return 3;
        case 3:
            return 0;
        case 1:
            return 2;
        case 2:
            return 1;
        default:
            return -1;
    }
}

#if defined(CONFIG_DEVICE_TYPE_THERMOSTAT)
static esp_err_t _periph_monitor_set_backlight(esp_periph_handle_t periph, int state) {
    VALIDATE_MONITOR(periph, ESP_FAIL);
    periph_monitor_t *periph_monitor = esp_periph_get_data(periph);
    if (state) {
        return periph_led_low_rising(periph_monitor->led_low_periph, THERMOSTAT_BACKLIGHT_PIN, 200);
    } else {
        return periph_led_low_falling(periph_monitor->led_low_periph, THERMOSTAT_BACKLIGHT_PIN, 200);
    }
}

static esp_err_t periph_monitor_disable_led(esp_periph_handle_t periph, int led_index, int time_ms) {
    VALIDATE_MONITOR(periph, ESP_FAIL);
    periph_monitor_t *periph_monitor = esp_periph_get_data(periph);
    if (led_index < 0 || led_index >= periph_monitor->io_num) {
        return ESP_FAIL;
    }
    LOGD(TAG, "Disable led_index=%d", led_index);
    hw_io_map_t *_touch_io = &periph_monitor->io_map[led_index];
#ifndef TOUCH_USING_FADE_EFFECT
    if (_touch_io->led_on_gpio >= 0) {
        gpio_set_level(_touch_io->led_on_gpio, 0);
    }
    if (io->led_off_gpio >= 0) {
        gpio_set_level(_touch_io->led_off_gpio, 0);
    }
#else
    if (led_index < 4) {
        if (_touch_io->led_on_gpio >= 0) {
            periph_led_falling(periph_monitor->led_periph, _touch_io->led_on_gpio, time_ms);
        }
        if (_touch_io->led_off_gpio >= 0) {
            periph_led_falling(periph_monitor->led_periph, _touch_io->led_off_gpio, time_ms);
        }
    } else {
        if (_touch_io->led_off_gpio >= 0) {
            periph_led_low_falling(periph_monitor->led_low_periph, _touch_io->led_off_gpio, time_ms);
        }
        if (_touch_io->led_on_gpio >= 0) {
            periph_led_low_falling(periph_monitor->led_low_periph, _touch_io->led_on_gpio, time_ms);
        }
    }
#endif
    return ESP_OK;
}

static esp_err_t periph_monitor_set_backlight_brightness(esp_periph_handle_t periph, int brightness) {
    VALIDATE_MONITOR(periph, ESP_FAIL);
    periph_monitor_t *periph_monitor = esp_periph_get_data(periph);
    LOGD(TAG, "Set brightness: %d", brightness);
    if (brightness > MAX_BRIGHTNESS) {
        brightness = MAX_BRIGHTNESS;
    }
#ifdef CONFIG_DEVICE_TYPE_THERMOSTAT
    if (brightness < 5) {
        brightness = 5;
    }
#else
    if (brightness < MIN_BRIGHTNESS) {
        brightness = MIN_BRIGHTNESS;
    }
#endif
    esp_err_t ret = ESP_OK;
    ret |= periph_led_low_set_max_duty(periph_monitor->led_low_periph, brightness);
    return ret;
}

static void _monitor_set_buzzer(periph_monitor_t *periph_monitor, int delay, int repeat) {
    for (int cnt = 0; cnt < repeat; cnt++) {
        periph_led_low_set_state(periph_monitor->led_low_periph, THERMOSTAT_BUZZER_PIN, 1);
        vTaskDelay(delay / portTICK_PERIOD_MS);
        periph_led_low_set_state(periph_monitor->led_low_periph, THERMOSTAT_BUZZER_PIN, 0);
        if (repeat > 1) vTaskDelay(delay / portTICK_PERIOD_MS);
    }
}

static esp_err_t periph_monitor_tms_process_btn(esp_periph_handle_t periph, thermostat_btn_t btn) {
    VALIDATE_MONITOR(periph, ESP_FAIL);
    periph_monitor_t  *periph_monitor = esp_periph_get_data(periph);
    thermostat_state_t thermostat_state = periph_thermostat_get_state(periph_monitor->thermostat_periph);
    if ((thermostat_btn_t)btn == THERMOSTAT_BTN_POWER) {
        switch (thermostat_state) {
            case THERMOSTAT_STATE_CONFLICT:
                LOGI(TAG, "Thermostat is conflict");
                thermostat_state = THERMOSTAT_STATE_CONFLICT;
                break;
            case THERMOSTAT_STATE_OFF:
                thermostat_state = THERMOSTAT_STATE_ON;
                LOGI(TAG, "Thermostat is ON");
                periph_monitor_set_touch_brightness(periph, 90);
                periph_monitor_set_backlight_brightness(periph, 90);
                _periph_monitor_set_backlight(periph, 1);
                for (int led_idx = THERMOSTAT_BTN_POWER; led_idx <= THERMOSTAT_BTN_MODE; led_idx++) periph_monitor_set_led_state(periph, led_idx, 1, 200);
                _monitor_set_buzzer(periph_monitor, 80, 3);
                break;
            case THERMOSTAT_STATE_ON:
                thermostat_state = THERMOSTAT_STATE_OFF;
                LOGI(TAG, "Thermostat is OFF");
                periph_monitor_set_touch_brightness(periph, 90);
                periph_monitor_set_backlight_brightness(periph, 90);
                _periph_monitor_set_backlight(periph, 0);
                // periph_monitor_set_led_state(periph, (int)THERMOSTAT_BTN_POWER, 0, 200);
                periph_monitor_disable_led(periph, (int)THERMOSTAT_BTN_POWER, 200);
                periph_monitor_disable_led(periph, (int)THERMOSTAT_BTN_UP, 200);
                periph_monitor_disable_led(periph, (int)THERMOSTAT_BTN_DOWN, 200);
                periph_monitor_disable_led(periph, (int)THERMOSTAT_BTN_MODE, 200);
                _monitor_set_buzzer(periph_monitor, 1000, 1);
                break;
            case THERMOSTAT_STATE_ADDR_CONFIG:
                LOGI(TAG, "Thermostat is CONFIG");
                thermostat_state = THERMOSTAT_STATE_ADDR_CONFIG;
                periph_monitor_set_touch_brightness(periph, 90);
                periph_monitor_set_backlight_brightness(periph, 90);
                _periph_monitor_set_backlight(periph, 1);
                for (int led_idx = THERMOSTAT_BTN_POWER; led_idx <= THERMOSTAT_BTN_MODE; led_idx++) periph_monitor_set_led_state(periph, led_idx, 1, 200);
                _monitor_set_buzzer(periph_monitor, 80, 3);
                break;
            default:
                LOGW(TAG, "thermostat_state not support");
        }
    } else {
        if (thermostat_state == THERMOSTAT_STATE_ON || thermostat_state == THERMOSTAT_STATE_ADDR_CONFIG) {
            periph_monitor_set_touch_brightness(periph, 90);
            periph_monitor_set_backlight_brightness(periph, 90);
            periph_monitor_set_led_state(periph, btn, 0, 200);
            _monitor_set_buzzer(periph_monitor, 100, 1);
            periph_monitor_set_led_state(periph, btn, 1, 200);
        }
    }
    periph_thermostat_set_state(periph_monitor->thermostat_periph, thermostat_state);
    return ESP_OK;
}
#endif

#if defined(CONFIG_DEVICE_TYPE_TOUCH) || defined(CONFIG_DEVICE_TYPE_TOUCH_CURTAIN)
static esp_err_t _set_touch_sensitive(esp_periph_handle_t periph, int sensitive_percent) {
    periph_monitor_t *periph_monitor = esp_periph_get_data(periph);
    hw_io_map_t      *status_io = periph_monitor->monitor_io;
    if (status_io == NULL) {
        return ESP_FAIL;
    }
    sensitive_percent = sensitive_percent < 0 ? 0 : sensitive_percent;
    sensitive_percent = sensitive_percent > 100 ? 100 : sensitive_percent;
    if (status_io->mtch_dac == 0) {
        float   sensitive_map = MAP_TOUCH_SENSITIVE(sensitive_percent);
        uint8_t n_accept_touch = MAP_ACCEPT_TOUCH(sensitive_percent);
        LOGI(TAG, "Reactivity: percent = %d, map to: %f, n_accept_touch: %d", sensitive_percent, sensitive_map, n_accept_touch);
        periph_touch_set_sensitive(periph_monitor->touch_periph, sensitive_map, n_accept_touch);
    } else if (status_io->mtch_dac == 1) {
        float sensitive_map = MAP_SX8636_SENSITIVE(sensitive_percent);
        LOGD(TAG, "Reactivity: percent = %d, map to: %f", sensitive_percent, sensitive_map);
        periph_touch_set_sensitive(periph_monitor->touch_periph, sensitive_map, 0);
    } else if (status_io->mtch_dac > 1) {
        int dac_value = REACTIVITY_TO_DAC(sensitive_percent);  // convert reactivity persent to DAC value: min (0%)=200 , max (100%)=105
        int time_accept_press = (int)MAP_ACCEPT_BUTTON_MS(sensitive_percent);
        LOGI(TAG, "Reactivity: percent = %d, DAC value = %d, time accept press=%d", sensitive_percent, dac_value, time_accept_press);
        dac_output_voltage(DAC_CHANNEL_1, dac_value);
        periph_button_set_time_accept_pressed(periph_monitor->btn_periph, time_accept_press);
    }
    return ESP_OK;
}
#endif

void periph_monitor_enter_config_mode(esp_periph_handle_t periph) {
    periph_monitor_t *periph_monitor = esp_periph_get_data(periph);
    if (!periph_monitor->is_config_mode) {
        periph_monitor->config_tick = esp_periph_tick_get();
        periph_monitor->is_config_mode = true;
        esp_periph_send_event(periph, MONITOR_ENTER_CONFIG_MODE, NULL, 0);
        hw_io_map_t *status_io = periph_monitor->monitor_io;
        _reset_gpio(status_io);
        LOGD(TAG, "Enter config mode");
    }
}

esp_err_t periph_monitor_set_led(esp_periph_handle_t periph, hw_io_map_t *io, int led_index, int led_state, int value) {
    periph_monitor_t *periph_monitor = esp_periph_get_data(periph);
#ifndef TOUCH_USING_FADE_EFFECT
    if (io->led_on_gpio >= 0) {
        gpio_set_level(io->led_on_gpio, 1 - led_state);
    }
    if (io->led_off_gpio >= 0) {
        gpio_set_level(io->led_off_gpio, led_state);
    }
#else
    if (value == 0) {
        if (io->led_on_gpio >= 0) {
            gpio_set_level(io->led_on_gpio, 1 - led_state);
        }
        if (io->led_off_gpio >= 0) {
            gpio_set_level(io->led_off_gpio, led_state);
        }
    }
    value = value < 200 ? 200 : value;
    if (led_index < 4) {
        if (led_state) {
            if (io->led_off_gpio >= 0) {
                periph_led_falling(periph_monitor->led_periph, io->led_off_gpio, value);
            }
            if (io->led_on_gpio >= 0) {
                periph_led_rising(periph_monitor->led_periph, io->led_on_gpio, value);
            }
        } else {
            if (io->led_on_gpio >= 0) {
                periph_led_falling(periph_monitor->led_periph, io->led_on_gpio, value);
            }
            if (io->led_off_gpio >= 0) {
                periph_led_rising(periph_monitor->led_periph, io->led_off_gpio, value);
            }
        }
    } else {
        if (led_state) {
            if (io->led_off_gpio >= 0) {
                periph_led_low_falling(periph_monitor->led_low_periph, io->led_off_gpio, value);
            }
            if (io->led_on_gpio >= 0) {
                periph_led_low_rising(periph_monitor->led_low_periph, io->led_on_gpio, value);
            }
        } else {
            if (io->led_on_gpio >= 0) {
                periph_led_low_falling(periph_monitor->led_low_periph, io->led_on_gpio, value);
            }
            if (io->led_off_gpio >= 0) {
                periph_led_low_rising(periph_monitor->led_low_periph, io->led_off_gpio, value);
            }
        }
    }
#endif
    return ESP_OK;
}

esp_err_t periph_monitor_exit_config_mode(esp_periph_handle_t periph) {
    VALIDATE_MONITOR(periph, ESP_FAIL);
    periph_monitor_t *periph_monitor = esp_periph_get_data(periph);
    if (periph_monitor->is_config_mode) {
        periph_monitor->is_config_mode = false;
        esp_periph_send_event(periph, MONITOR_EXIT_CONFIG_MODE, NULL, 0);
        hw_io_map_t *_touch_io_map = periph_monitor->io_map;
        hw_io_map_t *status_io = periph_monitor->monitor_io;
        for (int i = 0; i < periph_monitor->io_num; i++) {
            _reset_gpio(&_touch_io_map[i]);
        }
        _reset_gpio(status_io);
        LOGI(TAG, "Exit config mode");
    }
    return ESP_OK;
}

static TimerHandle_t auto_off_timers[MAX_RELAY_TOUCH_PAD_NUM] = {NULL};
static void          auto_off_callback(TimerHandle_t timer) {
    int32_t timer_id;
    timer_id = (int32_t)pvTimerGetTimerID(timer);
    if (auto_off_timers[timer_id]) {
        xTimerStop(auto_off_timers[timer_id], portMAX_DELAY);
        xTimerDelete(auto_off_timers[timer_id], portMAX_DELAY);
        auto_off_timers[timer_id] = NULL;
    }
    periph_monitor_t *periph_monitor = esp_periph_get_data(g_periph_monitor);
    LOGD(TAG, "Auto off callback: TimerID [%ld], relay = %d, state = %d", timer_id, periph_monitor->io_map[timer_id].relay_gpio, periph_monitor->io_map[timer_id].state);
    int state = 0;
    periph_monitor->io_map[timer_id].state = state;
    periph_monitor_set_led_state(g_periph_monitor, timer_id, state, 400);
    gpio_set_level(periph_monitor->io_map[timer_id].relay_gpio, STATE_TO_RELAY(state));
    esp_periph_send_event(g_periph_monitor, MONITOR_TOUCH_EVENT, &periph_monitor->io_map[timer_id], sizeof(hw_io_map_t));
}

static esp_err_t periph_monitor_check_auto_off(int touch_idx, int state) {
    int      i = touch_idx;
    uint32_t auto_off_ms = 60 * 1000 * g_statistics_storage[i].auto_off;
    LOGD(TAG, "Monitor check event auto off");
    if ((touch_idx >= MAX_RELAY_TOUCH_PAD_NUM) || touch_idx < 0) {
        LOGD(TAG, "Check auto off failed. Reason: Invalid touch index");
        return ESP_FAIL;
    }
    if (auto_off_ms <= 0) {
        LOGD(TAG, "Touch[%d] auto off err: %d", i, g_statistics_storage[i].auto_off);
        return ESP_FAIL;
    }
    if (auto_off_timers[i]) {
        xTimerStop(auto_off_timers[i], portMAX_DELAY);
        xTimerDelete(auto_off_timers[i], portMAX_DELAY);
        auto_off_timers[i] = NULL;
    }
    if (state == 1) {
        if (auto_off_timers[i] == NULL) {
            auto_off_timers[i] = xTimerCreate("auto_off", auto_off_ms / portTICK_RATE_MS, pdFALSE, (void *)i, auto_off_callback);
            if (auto_off_timers[i] == NULL) {
                LOGE(TAG, "Error creating timer");
                return ESP_FAIL;
            }
            if (xTimerStart(auto_off_timers[i], 0) != pdTRUE) {
                LOGE(TAG, "Error to start saving timer");
                return ESP_FAIL;
            }
        }
    }
    return ESP_OK;
}

esp_err_t periph_monitor_restart(esp_periph_handle_t periph) {
    VALIDATE_MONITOR(periph, ESP_FAIL);
    // periph_monitor_t *periph_monitor = esp_periph_get_data(periph);
    return esp_periph_send_event(periph, MONITOR_EVENT_RESTART, NULL, 0);
}

static esp_err_t periph_monitor_set_led_fix(esp_periph_handle_t periph, hw_io_map_t *io, int led_state) {
    periph_monitor_t *periph_monitor = esp_periph_get_data(periph);
    LOGI(TAG, "Set led: %d", io->touch_idx);
    if (io->touch_idx < 4) {
        if (led_state) {
            if (io->led_off_gpio >= 0) {
                periph_led_set_state(periph_monitor->led_periph, io->led_off_gpio, 0);
            }
            if (io->led_on_gpio >= 0) {
                periph_led_set_state(periph_monitor->led_periph, io->led_on_gpio, 1);
            }
        } else {
            if (io->led_on_gpio >= 0) {
                periph_led_set_state(periph_monitor->led_periph, io->led_on_gpio, 0);
            }
            if (io->led_off_gpio >= 0) {
                periph_led_set_state(periph_monitor->led_periph, io->led_off_gpio, 1);
            }
        }
    } else {
        if (led_state) {
            if (io->led_off_gpio >= 0) {
                periph_led_low_set_state(periph_monitor->led_low_periph, io->led_off_gpio, 0);
            }
            if (io->led_on_gpio >= 0) {
                periph_led_low_set_state(periph_monitor->led_low_periph, io->led_on_gpio, 1);
            }
        } else {
            if (io->led_on_gpio >= 0) {
                periph_led_low_set_state(periph_monitor->led_low_periph, io->led_on_gpio, 0);
            }
            if (io->led_off_gpio >= 0) {
                periph_led_low_set_state(periph_monitor->led_low_periph, io->led_off_gpio, 1);
            }
        }
    }
    return ESP_OK;
}

static void _monitor_timer_handler(xTimerHandle tmr) {
    esp_periph_handle_t periph = (esp_periph_handle_t)pvTimerGetTimerID(tmr);
    periph_monitor_t   *periph_monitor = esp_periph_get_data(periph);
    hw_io_map_t        *status_io = periph_monitor->monitor_io;
    long long           tick = esp_periph_tick_get();
    if (periph_monitor->is_config_mode && tick - periph_monitor->config_tick > CONFIG_MODE_TIMEOUT_MS) {
        periph_monitor_exit_config_mode(periph);
    }
    if (!periph_monitor->blink_enabled) {
        return;
    }
    const monitor_blink_pattern_t *blink = NULL;
    if (periph_monitor->is_config_mode) {
        //_monitor_set_buzzer(periph_monitor, 80, 3);
        blink = _get_blink_pattern(MONITOR_CONFIG_MODE);
        periph_monitor->state = MONITOR_CONFIG_MODE;
        periph_monitor->next_state = MONITOR_CONFIG_MODE;
    } else {
        blink = _get_blink_pattern(periph_monitor->state);
    }
    if (periph_monitor->manual_blink.time_blink_repeat) {
        blink = &periph_monitor->manual_blink;
        periph_monitor->state = MONITOR_UNINIT;
    } else {
        if (periph_monitor->state != periph_monitor->next_state) {
            periph_monitor_set_led_fix(periph, status_io, status_io->state);
            periph_monitor->state = periph_monitor->next_state;
            return;
        }
    }
    if (blink == NULL) {
        return;
    }
    if (!blink->enable) {
#ifdef CONFIG_DEVELOPMENT_MODE
        if (esp_mesh_get_type() != MESH_ROOT) {
            return;
        }
#else
        return;
#endif
    }
    if (periph_monitor->blink_time == 0 && tick - periph_monitor->blink_tick > blink->time_unchange_ms) {
        periph_monitor->blink_time = blink->time_blink_repeat;
        periph_monitor->blink_tick = tick;
        if (!periph_monitor->blink_gpio_reset) {
            periph_monitor->blink_gpio_reset = true;
            // _reset_gpio(status_io);
        }
        if (periph_monitor->manual_blink.time_blink_repeat) {
            periph_monitor->manual_blink.time_blink_repeat = 0;
            periph_monitor->manual_blink.enable = false;
        }
        return;
    }
    if (periph_monitor->blink_time && tick - periph_monitor->blink_tick > blink->time_blink_ms) {
        periph_monitor->blink_time--;
        periph_monitor->blink_tick = tick;
        LOGD(TAG, "blink, state == %d, blink_time=%d", status_io->state, periph_monitor->blink_time);
        if (periph_monitor->blink_time == 0) {
            periph_monitor_set_led_fix(periph, status_io, status_io->state);
#if defined(CONFIG_DEVICE_TYPE_THERMOSTAT)
            thermostat_state_t thermostat_state = periph_thermostat_get_state(periph_monitor->thermostat_periph);
            if (thermostat_state == THERMOSTAT_STATE_OFF || thermostat_state == THERMOSTAT_STATE_CONFLICT) {
                periph_monitor_set_led_fix(periph, status_io, 0);
                status_io->state = 0;
            } else {
                periph_monitor_set_led_fix(periph, status_io, 1);
                status_io->state = 1;
            }
#endif
        } else {
            periph_monitor_set_led(periph, status_io, 0, status_io->state - (periph_monitor->blink_time % 2), blink->time_fade);
        }
    }
}
#ifdef CONFIG_DEVELOPMENT_MODE
void _monitor_task(void *pv) {
    periph_monitor_t *periph_monitor = esp_periph_get_data(pv);
    while (periph_monitor->monitor_run) {
        LOGD(TAG, "Free memory: %ld, total connection=%d, tick=%lld, state=%d, blink_enabled=%d", esp_get_free_heap_size(), esp_periph_get_total_connections(), esp_periph_tick_get(),
             periph_monitor->state, periph_monitor->blink_enabled);
        vTaskDelay(1000 / portTICK_RATE_MS);
    }
    vTaskDelete(NULL);
}
#endif

#ifdef CONFIG_MONITOR_STATS
#define STATS_TICKS       pdMS_TO_TICKS(1000)
#define ARRAY_SIZE_OFFSET 5
static esp_err_t print_real_time_stats(TickType_t xTicksToWait) {
    TaskStatus_t *start_array = NULL, *end_array = NULL;
    UBaseType_t   start_array_size, end_array_size;
    uint32_t      start_run_time, end_run_time;
    esp_err_t     ret;
    // Allocate array to store current task states
    start_array_size = uxTaskGetNumberOfTasks() + ARRAY_SIZE_OFFSET;
    start_array = malloc(sizeof(TaskStatus_t) * start_array_size);
    if (start_array == NULL) {
        ret = ESP_ERR_NO_MEM;
        goto exit;
    }
    // Get current task states
    start_array_size = uxTaskGetSystemState(start_array, start_array_size, &start_run_time);
    if (start_array_size == 0) {
        ret = ESP_ERR_INVALID_SIZE;
        goto exit;
    }
    vTaskDelay(xTicksToWait);
    // Allocate array to store tasks states post delay
    end_array_size = uxTaskGetNumberOfTasks() + ARRAY_SIZE_OFFSET;
    end_array = malloc(sizeof(TaskStatus_t) * end_array_size);
    if (end_array == NULL) {
        ret = ESP_ERR_NO_MEM;
        goto exit;
    }
    // Get post delay task states
    end_array_size = uxTaskGetSystemState(end_array, end_array_size, &end_run_time);
    if (end_array_size == 0) {
        ret = ESP_ERR_INVALID_SIZE;
        goto exit;
    }
    // Calculate total_elapsed_time in units of run time stats clock period.
    uint32_t total_elapsed_time = (end_run_time - start_run_time);
    if (total_elapsed_time == 0) {
        ret = ESP_ERR_INVALID_STATE;
        goto exit;
    }
    printf("| Task \t\t| Percentage\n");
    // Match each task in start_array to those in the end_array
    for (int i = 0; i < start_array_size; i++) {
        int k = -1;
        for (int j = 0; j < end_array_size; j++) {
            if (start_array[i].xHandle == end_array[j].xHandle) {
                k = j;
                // Mark that task have been matched by overwriting their handles
                start_array[i].xHandle = NULL;
                end_array[j].xHandle = NULL;
                break;
            }
        }
        // Check if matching task found
        if (k >= 0) {
            uint32_t task_elapsed_time = end_array[k].ulRunTimeCounter - start_array[i].ulRunTimeCounter;
            uint32_t percentage_time = (task_elapsed_time * 100UL) / (total_elapsed_time * portNUM_PROCESSORS);
            if (strlen(start_array[i].pcTaskName) > 4) {
                printf("| %s \t| %d%%\n", start_array[i].pcTaskName, percentage_time);
            } else {
                printf("| %s \t\t| %d%%\n", start_array[i].pcTaskName, percentage_time);
            }
        }
    }
    // Print unmatched tasks
    for (int i = 0; i < start_array_size; i++) {
        if (start_array[i].xHandle != NULL) {
            printf("| %s | Deleted\n", start_array[i].pcTaskName);
        }
    }
    for (int i = 0; i < end_array_size; i++) {
        if (end_array[i].xHandle != NULL) {
            printf("| %s | Created\n", end_array[i].pcTaskName);
        }
    }
    ret = ESP_OK;
exit:  // Common return path
    free(start_array);
    free(end_array);
    return ret;
}

extern uint8_t temprature_sens_read();

static void stats_task(void *arg) {
    // Print real time stats periodically
    while (1) {
        printf("\n\nGetting real time stats over %d ticks\n", STATS_TICKS);
        if (print_real_time_stats(STATS_TICKS) == ESP_OK) {
            printf("Real time stats obtained, temp=%2.2f\n", (temprature_sens_read() - 32) / 1.8);
        } else {
            printf("Error getting real time stats\n");
        }
        vTaskDelay(pdMS_TO_TICKS(1000));
    }
}
#endif

static esp_err_t _monitor_init(esp_periph_handle_t self) {
    int               i;
    periph_monitor_t *periph_monitor = esp_periph_get_data(self);
    hw_io_map_t      *_touch_io_map = periph_monitor->io_map;
    hw_io_map_t      *_status_io = periph_monitor->monitor_io;
    if (_status_io) {
        gpio_config_t io_conf;
        io_conf.intr_type = GPIO_INTR_DISABLE;
        io_conf.mode = GPIO_MODE_OUTPUT;
        io_conf.pull_down_en = 0;
        io_conf.pull_up_en = 0;
        io_conf.pin_bit_mask = 0;
        if (_status_io->led_on_gpio >= 0) {
            io_conf.pin_bit_mask |= (1ULL << _status_io->led_on_gpio);
        }
        if (_status_io->led_off_gpio >= 0) {
            io_conf.pin_bit_mask |= (1ULL << _status_io->led_off_gpio);
        }
#ifdef CONFIG_DEVICE_TYPE_REMOTE_GATEWAY
        if (REMOTE_GW_BUZZER_PIN >= 0) {
            io_conf.pin_bit_mask |= (1ULL << REMOTE_GW_BUZZER_PIN);
        }
#elif CONFIG_DEVICE_TYPE_THERMOSTAT
        if (THERMOSTAT_BUZZER_PIN >= 0) {
            io_conf.pin_bit_mask |= (1ULL << THERMOSTAT_BUZZER_PIN);
        }
        if (THERMOSTAT_BACKLIGHT_PIN >= 0) {
            io_conf.pin_bit_mask |= (1ULL << THERMOSTAT_BACKLIGHT_PIN);
        }
#endif
        gpio_config(&io_conf);
        // periph_monitor_set_led_state(self, 0, 0);
    }
    if (_touch_io_map) {
        gpio_config_t io_conf;
        io_conf.intr_type = GPIO_INTR_DISABLE;
        io_conf.mode = GPIO_MODE_OUTPUT;
        io_conf.pull_down_en = 0;
        io_conf.pull_up_en = 0;
        LOGD(TAG, "periph_monitor->io_num=%d", periph_monitor->io_num);
        // configure GPIO with the given settings
        for (i = 0; i < periph_monitor->io_num; i++) {
            io_conf.pin_bit_mask = (uint16_t)0;
            if (_touch_io_map[i].led_on_gpio >= 0) {
                io_conf.pin_bit_mask |= 1ULL << _touch_io_map[i].led_on_gpio;
            }
            if (_touch_io_map[i].led_off_gpio >= 0) {
                io_conf.pin_bit_mask |= 1ULL << _touch_io_map[i].led_off_gpio;
            }
            if (_touch_io_map[i].relay_gpio >= 0) {
                io_conf.pin_bit_mask |= 1ULL << _touch_io_map[i].relay_gpio;
            }
            gpio_config(&io_conf);
            _touch_io_map[i].touch_idx = i;
#ifdef CONFIG_DEVICE_TYPE_THERMOSTAT
            if (i == (int)THERMOSTAT_BTN_POWER) {
                periph_monitor_set_led_state(self, i, _touch_io_map[i].state, 200);
            } else {
                periph_monitor_disable_led(self, i, 200);
            }
#else
            periph_monitor_set_led_state(self, i, _touch_io_map[i].state, 200);
#endif
            if (_touch_io_map[i].relay_gpio >= 0) {
                gpio_set_level(_touch_io_map[i].relay_gpio, STATE_TO_RELAY(_touch_io_map[i].state));
            }
            LOGI(TAG, "TOUCH[%d]=%d, led_on=%d, led_off=%d, relay=%d", i, _touch_io_map[i].state, _touch_io_map[i].led_on_gpio, _touch_io_map[i].led_off_gpio, _touch_io_map[i].relay_gpio);
        }
    }
    esp_periph_start_timer(self, 200 / portTICK_RATE_MS, _monitor_timer_handler);
#ifdef CONFIG_DEVICE_TYPE_THERMOSTAT
    periph_thermostat_set_address(periph_monitor->thermostat_periph, sys_cfg.aircond.address);
    periph_aircond_set_address(periph_monitor->aircond_periph, sys_cfg.aircond.address);
    aircond_info_t ac_info;
    ac_info.address = sys_cfg.aircond.address;
    ac_info.mode = sys_cfg.aircond.mode;
    ac_info.fanspeed = sys_cfg.aircond.fanspeed;
    ac_info.setpoint = sys_cfg.aircond.setpoint;
    ac_info.vanes = sys_cfg.aircond.vanes;
    ac_info.temperature = sys_cfg.aircond.setpoint;
    ac_info.humidity = 0;
    ac_info.is_online = true;
    periph_monitor_set_led_state(g_periph_monitor, (int)THERMOSTAT_BTN_POWER, 1, 200);
    periph_monitor_set_led_state(g_periph_monitor, (int)THERMOSTAT_BTN_UP, 1, 200);
    periph_monitor_set_led_state(g_periph_monitor, (int)THERMOSTAT_BTN_DOWN, 1, 200);
    periph_monitor_set_led_state(g_periph_monitor, (int)THERMOSTAT_BTN_MODE, 1, 200);
    _periph_monitor_set_backlight(g_periph_monitor, 1);
    periph_aircond_set_info_default(periph_monitor->aircond_periph, &ac_info);
    periph_thermostat_update(periph_monitor->thermostat_periph, &ac_info);
#endif
    periph_monitor->blink_tick = esp_periph_tick_get();
#ifdef CONFIG_DEVELOPMENT_MODE
    if (!periph_monitor->monitor_run) {
        periph_monitor->monitor_run = true;
        xTaskCreatePinnedToCore(_monitor_task, "monitor", 2 * 1024, self, 5, NULL, 1);
    }
#endif

#ifdef CONFIG_MONITOR_STATS
    xTaskCreatePinnedToCore(stats_task, "stats", 4096, NULL, 5, NULL, 1);
#endif
    periph_monitor->state = MONITOR_WAITING_MESH;
    periph_monitor->next_state = MONITOR_WAITING_MESH;
    periph_monitor->fast_taps_counter = 0;
    periph_monitor->last_tapped = 0;
    periph_monitor->last_double_tapped = 0;
    periph_monitor->last_scene_tapped = 0;
    return ESP_OK;
}

static esp_err_t _monitor_run(esp_periph_handle_t self, audio_event_iface_msg_t *msg) { return ESP_OK; }

static esp_err_t _monitor_destroy(esp_periph_handle_t self) {
    periph_monitor_t *periph_monitor = esp_periph_get_data(self);
    periph_monitor->monitor_run = false;
    do {
        vTaskDelay(10 / portTICK_RATE_MS);
    } while (periph_monitor->monitor_run);
    // free(periph_monitor->buffer);
    free(periph_monitor);
    return ESP_OK;
}

esp_periph_handle_t periph_monitor_init(periph_monitor_cfg_t *monitor_cfg) {
    esp_periph_handle_t periph = esp_periph_create(PERIPH_ID_MONITOR, monitor_cfg->tag ? monitor_cfg->tag : "periph_monitor");
    PERIPH_MEM_CHECK(TAG, periph, { return NULL; });
    periph_monitor_t *periph_monitor = calloc(1, sizeof(periph_monitor_t));
    PERIPH_MEM_CHECK(TAG, periph_monitor, {
        free(periph);
        return NULL;
    });
    periph_monitor->led_periph = monitor_cfg->led_periph;
    PERIPH_MEM_CHECK(TAG, periph_monitor->led_periph, {
        free(periph);
        free(periph_monitor);
        return NULL;
    });
    periph_monitor->led_low_periph = monitor_cfg->led_low_periph;
    periph_monitor->motor_periph = monitor_cfg->motor_periph;
    periph_monitor->remote_periph = monitor_cfg->remote_periph;
    periph_monitor->touch_periph = monitor_cfg->touch_periph;
    periph_monitor->btn_periph = monitor_cfg->btn_periph;
    periph_monitor->pir_periph = monitor_cfg->pir_periph;
    periph_monitor->thermostat_periph = monitor_cfg->thermostat_periph;
    periph_monitor->aircond_periph = monitor_cfg->aircond_periph;
    // periph_monitor->thermostat_state = THERMOSTAT_STATE_OFF;
    // periph_monitor->buffer = malloc(DEFAULT_MONITOR_BUFFER);
    // PERIPH_MEM_CHECK(TAG, periph_monitor->buffer, {
    //     free(periph);
    //     free(periph_monitor);
    //     return NULL;
    // });
    if (monitor_cfg->io_num) {
        periph_monitor->io_num = monitor_cfg->io_num;
        periph_monitor->io_map = monitor_cfg->io_map;
    }
    periph_monitor->monitor_io = monitor_cfg->monitor_io;
    periph_monitor->blink_enabled = true;
    periph_monitor->is_config_mode = false;
    memcpy(periph_monitor->motor_ctrl_cmd, monitor_cfg->motor_ctrl_cmd, MAX_RELAY_TOUCH_PAD_NUM * sizeof(motor_control_t));
    memset(periph_monitor->motor_btn_state, 0, sizeof(periph_monitor->motor_btn_state));
    esp_periph_set_data(periph, periph_monitor);
    esp_periph_set_function(periph, _monitor_init, _monitor_run, _monitor_destroy);
    g_periph_monitor = periph;
    return periph;
}

esp_err_t periph_monitor_process_events(audio_event_iface_msg_t *event, void *context) {
    if (g_periph_monitor == NULL) {
        return ESP_FAIL;
    }
    periph_monitor_t *periph_monitor = esp_periph_get_data(g_periph_monitor);
    switch ((int)event->source_type) {
        case PERIPH_ID_MESH:
            if (event->cmd == PERIPH_MESH_SWICHER_REQUEST) {
                LOGD(TAG, "PERIPH_MESH_SWICHER_REQUEST");
#if defined(CONFIG_DEVICE_TYPE_TOUCH) || defined(CONFIG_DEVICE_TYPE_TOUCH_CURTAIN)
                uint32_t *touch_num = (uint32_t *)event->data;
                int       touch_idx = (int)(*touch_num) - 1;
                periph_monitor_set_touch_state(g_periph_monitor, touch_idx, (int)event->data_len, true);
                cfg_save_touch_statistics(&periph_monitor->io_map[touch_idx], touch_idx, false, false);
#endif
            } else if (event->cmd == PERIPH_MESH_MOTION_REQUEST) {
                int *state = event->data;
                LOGD(TAG, "PERIPH_MESH_MOTION_REQUEST. state = %d", *state);
#ifdef CONFIG_DEVICE_TYPE_PIR
                periph_pir_set_touch_handle_state(periph_monitor->pir_periph, *state, 3000);
#endif
            } else if (event->cmd == PERIPH_MESH_CURTAIN_REQUEST) {
                LOGI(TAG, "PERIPH_MESH_CURTAIN_REQUEST");
                CurtainSwitcherClientRequest *curtainReq = (CurtainSwitcherClientRequest *)event->data;
                int                           in_val  = -1;
                int                           out_val = -1;
                if (curtainReq->percentin) {
                    in_val = curtainReq->percentin->value;
                }
                if (curtainReq->percentout) {
                    out_val = curtainReq->percentout->value;
                }
                motor_pos_t resp_pos = periph_motor_set_pos(periph_monitor->motor_periph, in_val, out_val);
                esp_periph_send_event(g_periph_monitor, MONITOR_CURTAIN_EVENT, (void *)&resp_pos.in_pos, (int)resp_pos.out_pos);
            } else if (event->cmd == PERIPH_MESH_PARENT_CONNECTED || event->cmd == PERIPH_MESH_WS_DISCONNECTED) {
                periph_monitor->next_state = MONITOR_WAITING_WEBSOCKET;
#if defined(CONFIG_DEVICE_TYPE_TOUCH) || defined(CONFIG_DEVICE_TYPE_TOUCH_CURTAIN)
                _set_touch_sensitive(g_periph_monitor, sys_cfg.reactivity);
#elif defined(CONFIG_DEVICE_TYPE_THERMOSTAT)
                periph_thermostat_set_wifi(periph_monitor->thermostat_periph, true);
                periph_aircond_set_ws_status(periph_monitor->aircond_periph, true);
#endif
            } else if (event->cmd == PERIPH_MESH_PARENT_DISCONNECTED) {
                periph_monitor->next_state = MONITOR_WAITING_MESH;
#if defined(CONFIG_DEVICE_TYPE_TOUCH) || defined(CONFIG_DEVICE_TYPE_TOUCH_CURTAIN)
                _set_touch_sensitive(g_periph_monitor, sys_cfg.reactivity - 30);
#elif defined(CONFIG_DEVICE_TYPE_THERMOSTAT)
                periph_thermostat_set_wifi(periph_monitor->thermostat_periph, false);
                periph_aircond_set_ws_status(periph_monitor->aircond_periph, false);
#endif
            } else if (event->cmd == PERIPH_MESH_LOGGED) {
                periph_monitor->next_state = MONITOR_SERVER_LOGGED;
                if (event->data != NULL) {
                    time_t        *logged_time = (time_t *)event->data;
                    struct timeval now = {.tv_sec = *logged_time};
                    settimeofday(&now, NULL);
                    periph_monitor_set_touch_brightness_mode(g_periph_monitor);
                }
#if defined(CONFIG_DEVICE_TYPE_TOUCH_CURTAIN)
                int in_pos = 0;
                int out_pos = 0;
                periph_motor_get_pos(periph_monitor->motor_periph, &in_pos, &out_pos);
                LOGI(TAG, "in: %d, out: %d", in_pos, out_pos);
                esp_periph_send_event(g_periph_monitor, MONITOR_CURTAIN_EVENT, (void *)&in_pos, (int)out_pos);
#elif defined(CONFIG_DEVICE_TYPE_TOUCH)
                if ((sys_cfg.features & (uint64_t)DEVICE_FEATURE_TOUCH_NORMAL) == DEVICE_FEATURE_TOUCH_NORMAL ||
                    (sys_cfg.features & (uint64_t)DEVICE_FEATURE_TOUCH_HEATER) == DEVICE_FEATURE_TOUCH_HEATER) {
                    for (int i = 0; i < periph_monitor->io_num; i++) {
                        bool en_touch_scene = ((int)(sys_cfg.sceneActiveMap >> i * 4) & (int)TOUCH_ENABLE_SCENE) == (int)TOUCH_ENABLE_SCENE;
                        if (!en_touch_scene) {
                            // periph_monitor_check_auto_off(i, periph_monitor->io_map[i].state);
                            // esp_periph_send_event(g_periph_monitor, MONITOR_TOUCH_EVENT, &periph_monitor->io_map[i], sizeof(hw_io_map_t));
                            esp_periph_send_event(g_periph_monitor, MONITOR_TOUCH_UPDATE_CONFIG, (void *)&i, periph_monitor->io_map[i].state);
                        } else {
                            esp_periph_send_event(g_periph_monitor, MONITOR_TOUCH_UPDATE_CONFIG, (void *)&i, (int)TOUCH_STATE_SCENE);
                        }
                    }
                }
#elif defined(CONFIG_DEVICE_TYPE_PIR)
                if ((sys_cfg.features & (uint64_t)DEVICE_TYPE_PIR) == DEVICE_TYPE_PIR) {
                    int pir_state = periph_pir_get_sensor_state(periph_monitor->pir_periph);
                    esp_periph_send_event(g_periph_monitor, MONITOR_PIR_EVENT, (void *)&pir_state, sizeof(int));
                }
#elif defined(CONFIG_DEVICE_TYPE_THERMOSTAT)
                periph_thermostat_set_wifi(periph_monitor->thermostat_periph, true);
                periph_aircond_set_ws_status(periph_monitor->aircond_periph, true);
#endif
            } else if (event->cmd == PERIPH_MESH_UPDATE_CLIENT) {
                UpdateDeviceClientRequest *updateDeviceClientRequest = (UpdateDeviceClientRequest *)event->data;
                uint8_t                    brightness_night = updateDeviceClientRequest->brightness & 0xFF;
                uint8_t                    brightness_day = (updateDeviceClientRequest->brightness >> 8) & 0xFF;
                if (brightness_day > MAX_BRIGHTNESS) {
                    brightness_day = MAX_BRIGHTNESS;
                }
                if (brightness_day < MIN_BRIGHTNESS) {
                    brightness_day = MIN_BRIGHTNESS;
                }
                if (brightness_night > MAX_BRIGHTNESS) {
                    brightness_night = MAX_BRIGHTNESS;
                }
                if (brightness_night < MIN_BRIGHTNESS) {
                    brightness_night = MIN_BRIGHTNESS;
                }
                LOGI(TAG, "Set up brightness in day = %d, brightness in night = %d", brightness_day, brightness_night);
                sys_cfg.brightness = (uint16_t)(brightness_day << 8) | brightness_night;
                periph_monitor_set_touch_brightness_mode(g_periph_monitor);
#if defined(CONFIG_DEVICE_TYPE_TOUCH) || defined(CONFIG_DEVICE_TYPE_TOUCH_CURTAIN)
                int reactivity = updateDeviceClientRequest->reactivity;
                sys_cfg.reactivity = reactivity;
                if (reactivity > MAX_REACTIVITY) {
                    reactivity = MAX_REACTIVITY;
                }
                if (reactivity < MIN_REACTIVITY) {
                    reactivity = MIN_REACTIVITY;
                }
                _set_touch_sensitive(g_periph_monitor, reactivity);
                for (int i = 0; i < periph_monitor->io_num; i++) {
                    if (((updateDeviceClientRequest->sceneactivemap >> i * 4) & TOUCH_ENABLE_SCENE) == TOUCH_ENABLE_SCENE) {
                        periph_monitor_set_touch_state(g_periph_monitor, i, 0, true);
                    }
                }
                if (cfg_check_if_has_attribute(DEVICE_ATTR_TOUCH6)) {
                    sys_cfg.sceneActiveMap = (uint32_t)updateDeviceClientRequest->sceneactivemap | (uint32_t)TOUCH_6_SCENE_ACTIVE_MAP;
                } else {
                    sys_cfg.sceneActiveMap = (uint32_t)updateDeviceClientRequest->sceneactivemap | (uint32_t)SCENE_ACTIVE_MAP;
                }
                LOGI(TAG, "Set scene active map: %06lX", sys_cfg.sceneActiveMap);
                cfg_save();
#endif
#ifdef CONFIG_DEVICE_TYPE_PIR
                int time_delay = updateDeviceClientRequest->timedelay;
                if (time_delay < 5) {
                    time_delay = 5;
                }
                LOGI(TAG, "time delay: %d", time_delay);
                periph_pir_set_time_delay(periph_monitor->pir_periph, time_delay * 1000);
                sys_cfg.time_delay = time_delay;
#endif
            } else if (event->cmd == MESH_EVENT_SWICHER_UPDATE) {
                UpdateSwitcherClientRequest *updateSwitcherClientRequest = (UpdateSwitcherClientRequest *)event->data;
                unsigned int                 keep_state = updateSwitcherClientRequest->keepstate;
                uint8_t                      auto_off = updateSwitcherClientRequest->autooff;
                LOGI(TAG, "UpdateSwitcherClientRequest: Switcher [%ld], keepstate=%d, autoOff=%d(min)", updateSwitcherClientRequest->switcher, keep_state, auto_off);
                cfg_save_switcher_update(updateSwitcherClientRequest->switcher - 1, keep_state, auto_off);
            }
#ifdef CONFIG_DEVICE_TYPE_REMOTE_GATEWAY
            else if (event->cmd == PERIPH_MESH_REMOTE_LEARNING_IR_REQUEST && (sys_cfg.features & DEVICE_FEATURE_GW_IR) == DEVICE_FEATURE_GW_IR) {
#ifdef CONFIG_COMPRESS_ONLY_ON_LEARNING_IR
                periph_remote_require_compress(periph_monitor->remote_periph, true);
#endif
                periph_led_blink(periph_monitor->led_periph, REMOTE_GW_BUZZER_PIN, 200, 200, false, 2);
                periph_remote_receive(periph_monitor->remote_periph);
            } else if (event->cmd == PERIPH_MESH_REMOTE_LEARNING_RF_REQUEST && (sys_cfg.features & DEVICE_FEATURE_GW_RF) == DEVICE_FEATURE_GW_RF) {
#ifdef CONFIG_COMPRESS_ONLY_ON_LEARNING_IR
                periph_remote_require_compress(periph_monitor->remote_periph, true);
#endif
                periph_led_blink(periph_monitor->led_periph, REMOTE_GW_BUZZER_PIN, 200, 200, false, 2);
                periph_remote_receive_rf(periph_monitor->remote_periph);
            } else if (event->cmd == PERIPH_MESH_REMOTE_FINISH_LEARNING) {
                periph_led_blink(periph_monitor->led_periph, REMOTE_GW_BUZZER_PIN, 100, 100, false, 6);
            } else if (event->cmd == PERIPH_MESH_REMOTE_SEND_IR_CMD) {
                if (event->data_len < 2) {
                    LOGE(TAG, "Invalid event command");
                    break;
                }
                uint32_t compress_code = ((uint32_t *)event->data)[event->data_len - 1];
                bool     is_compressed = false;
                if (compress_code == COMPRESSED_CODE) {
                    is_compressed = true;
                } else if (compress_code == NONE_COMPRESSED_CODE) {
                    is_compressed = false;
                } else {
                    LOGE(TAG, "Invalid compress code");
                    break;
                }
                uint32_t buffer_len = ((uint32_t *)event->data)[event->data_len - 2];
                LOGD(TAG, "send command with ir %d", buffer_len);
                periph_remote_send(periph_monitor->remote_periph, (char *)event->data, buffer_len, is_compressed);
                esp_periph_send_event(g_periph_monitor, MONITOR_REMOTE_SEND_CMD_COMPLETE, NULL, 0);
            } else if (event->cmd == PERIPH_MESH_REMOTE_SEND_RF_CMD && (sys_cfg.features & DEVICE_FEATURE_GW_RF) == DEVICE_FEATURE_GW_RF) {
                if (event->data_len < 2) {
                    LOGE(TAG, "Invalid event command");
                    break;
                }
                uint32_t compress_code = ((uint32_t *)event->data)[event->data_len - 1];
                bool     is_compressed = false;
                if (compress_code == COMPRESSED_CODE) {
                    is_compressed = true;
                } else if (compress_code == NONE_COMPRESSED_CODE) {
                    is_compressed = false;
                } else {
                    LOGE(TAG, "Invalid compress code");
                    break;
                }
                uint32_t buffer_len = ((uint32_t *)event->data)[event->data_len - 2];
                LOGD(TAG, "send command with rf %d", buffer_len);
                periph_remote_send_rf(periph_monitor->remote_periph, (char *)event->data, buffer_len, is_compressed);
                esp_periph_send_event(g_periph_monitor, MONITOR_REMOTE_SEND_CMD_COMPLETE, NULL, 0);
            } else if (event->cmd == PERIPH_MESH_REMOTE_CONTROL_IR_CMD) {
                if (event->data_len < 2) {
                    ESP_LOGE(TAG, "Invalid event command");
                }
                ControlRemoteACCommandClientRequest *controlRemoteACCommandClientRequest = (ControlRemoteACCommandClientRequest *)event->data;
                ESP_LOGW(TAG, "modelid %s, device %s", controlRemoteACCommandClientRequest->model, controlRemoteACCommandClientRequest->deviceid);
                periph_remote_ac_send(periph_monitor->remote_periph, controlRemoteACCommandClientRequest->model, controlRemoteACCommandClientRequest->remoteacstate->power,
                                      controlRemoteACCommandClientRequest->remoteacstate->temperature, controlRemoteACCommandClientRequest->remoteacstate->mode,
                                      controlRemoteACCommandClientRequest->remoteacstate->fan, controlRemoteACCommandClientRequest->remoteacstate->swinghorizontal,
                                      controlRemoteACCommandClientRequest->remoteacstate->swingvertical);
            }
#endif
            break;
        case PERIPH_ID_TOUCH:
        case PERIPH_ID_BUTTON:
            // LOGW(TAG, "TOUCH[%d], event->event_id=%d, data=%d", (int)event->data, event->cmd, (int)event->data);
            if ((event->source_type == PERIPH_ID_TOUCH && event->cmd == PERIPH_TOUCH_TAP) || (event->source_type == PERIPH_ID_BUTTON && event->cmd == PERIPH_BUTTON_PRESSED)) {
                LOGI(TAG, "Tap, freemem = %ld, %d", esp_get_free_heap_size(), (int)event->data);
                periph_monitor_toggle(g_periph_monitor, (int)event->data);
                if (!periph_monitor->is_config_mode) {
                    break;
                }
                if (esp_periph_tick_get() - periph_monitor->last_tapped <= MAX_DELAY_FAST_TAP_MS) {
                    periph_monitor->last_tapped = esp_periph_tick_get();
                    ++periph_monitor->fast_taps_counter;
                    if (periph_monitor->fast_taps_counter >= N_FAST_TAPS_FLAG) {
#if defined CONFIG_DEVICE_TYPE_THERMOSTAT
                        break;
#endif
#if defined CONFIG_TRIPLE_FAST_TAP_JOIN_GW
                        LOGI(TAG, "Fast triple tap, toggle joining gateway flag");
                        g_gw_joined_info.flag = !g_gw_joined_info.flag;
                        cfg_save_joining_gw_flag();
                        // esp_periph_send_event(g_periph_monitor, MONITOR_TOGGLE_JOINING_GW, NULL, 0);
                        vTaskDelay(1000 / portTICK_PERIOD_MS);
                        esp_restart();
#elif defined CONFIG_TRIPLE_FAST_TAP_RESTART
                        LOGI(TAG, "Fast triple tap, restart device");
                        vTaskDelay(1000 / portTICK_PERIOD_MS);
                        esp_restart();
#elif defined CONFIG_TRIPLE_FAST_RESET_USER_CONFIG
                        LOGI(TAG, "Fast triple tap, reset user config");
                        cfg_reset_user_setting();
                        esp_restart();
#else
                        LOGE(TAG, "Not support");
#endif
                        // If device restarted, never reach here.
                        periph_monitor->fast_taps_counter = 0;
                        periph_monitor->last_tapped = 0;
                    }
                    break;
                }
                periph_monitor->last_tapped = esp_periph_tick_get();
                periph_monitor->fast_taps_counter = 1;
                break;
            }
            if ((event->source_type == PERIPH_ID_TOUCH && event->cmd == PERIPH_TOUCH_LONG_TAP) || (event->source_type == PERIPH_ID_BUTTON && event->cmd == PERIPH_BUTTON_LONG_PRESSED)) {
#ifdef CONFIG_DEVICE_TYPE_THERMOSTAT
                int     touch_gpio = (int)event->data;
                uint8_t touch_idx = 0;
                LOGD(TAG, "Touch idx = %d", touch_gpio);
                hw_io_map_t *_touch_io_map = periph_monitor->io_map;
                for (int i = 0; i < periph_monitor->io_num; i++) {
                    if ((_touch_io_map[i].touch_pad == touch_gpio && (_touch_io_map[i].mtch_dac == 0 || _touch_io_map[i].mtch_dac == 1)) ||
                        (_touch_io_map[i].touch_gpio == touch_gpio && _touch_io_map[i].mtch_dac > 1)) {
                        touch_idx = i;
                    }
                }
                LOGD(TAG, "long tap idx = %d", touch_idx);
                switch (touch_idx) {
                    case 0:
                    case 1:
                    case 2:
                        if (periph_monitor->is_config_mode) {
                            LOGI(TAG, "long tap, exit config mode, check ota with default AP");
                            _monitor_set_buzzer(periph_monitor, 80, 3);
                            periph_monitor_exit_config_mode(g_periph_monitor);
                            // check ota with default AP.
                            // periph_mesh_force_default_ota(sys_cfg.wifi_sta_ssid, sys_cfg.wifi_sta_pass, SERVICE_WIFI_TIMEOUT_MS);
                        } else {
                            LOGI(TAG, "long tap, enter config mode");
                            _monitor_set_buzzer(periph_monitor, 80, 5);
                            periph_aircond_request_stop(periph_monitor->aircond_periph);
                            periph_monitor_enter_config_mode(g_periph_monitor);
                        }
                        break;
                    case 3: {
                        thermostat_state_t thermostat_state = periph_thermostat_get_state(periph_monitor->thermostat_periph);
                        if (thermostat_state != THERMOSTAT_STATE_ADDR_CONFIG) {
                            LOGI(TAG, "long tap, enter address mode");
                            thermostat_state = THERMOSTAT_STATE_ADDR_CONFIG;
                            uint8_t addr_list[MAX_INDOOR_UNIT];
                            int     addr_num = periph_aircond_get_address(periph_monitor->aircond_periph, addr_list);
                            periph_thermostat_enter_address_config(periph_monitor->thermostat_periph, addr_list, addr_num);
                        } else {
                            LOGI(TAG, "long tap, exit address mode");
                            thermostat_state = THERMOSTAT_STATE_OFF;
                            periph_thermostat_exit_address_config(periph_monitor->thermostat_periph);
                        }
                        periph_thermostat_set_state(periph_monitor->thermostat_periph, thermostat_state);
                        periph_monitor_tms_process_btn(g_periph_monitor, touch_idx);
                        break;
                    }
                }
#else
                if (periph_monitor->is_config_mode) {
                    LOGI(TAG, "long tap, exit config mode, check ota with default AP");
                    periph_monitor_exit_config_mode(g_periph_monitor);
                    // check ota with default AP.
                    periph_mesh_force_default_ota(sys_cfg.wifi_sta_ssid, sys_cfg.wifi_sta_pass, SERVICE_WIFI_TIMEOUT_MS);
                } else {
                    LOGI(TAG, "long tap, enter config mode");
                    periph_monitor_enter_config_mode(g_periph_monitor);
                }
#endif
                break;
            }
            if ((event->source_type == PERIPH_ID_TOUCH && event->cmd == PERIPH_TOUCH_RELEASE) || (event->source_type == PERIPH_ID_BUTTON && event->cmd == PERIPH_BUTTON_RELEASE)) {
                LOGI(TAG, "Touch release, freemem = %ld", esp_get_free_heap_size());
                // periph_monitor->blink_enabled = true;
                break;
            }
            break;
        case PERIPH_ID_PIR:
            if (event->cmd == PIR_EVENT_UPDATE_STATUS) {
                int *level = (int *)event->data;
                LOGD(TAG, "event PIR_EVENT_UPDATE_STATUS %d", (int)(*level));
                esp_periph_send_event(g_periph_monitor, MONITOR_PIR_EVENT, level, sizeof(int));
                // periph_monitor_set_led_state(g_periph_monitor, 0, *level);
            }
            break;
#if defined(CONFIG_DEVICE_TYPE_THERMOSTAT)
        case PERIPH_ID_AIRCOND:
            if (event->cmd == AIRCOND_EVENT_UPDATE) {
                // LOGI(TAG, "AIRCOND_EVENT_UPDATE");
                thermostat_state_t thermostat_state = periph_thermostat_get_state(periph_monitor->thermostat_periph);
                if (thermostat_state == THERMOSTAT_STATE_ADDR_CONFIG) {
                    LOGE(TAG, "Thermostat is being config mode");
                    return ESP_OK;
                    ;
                }
                aircond_info_t *ac_info = (aircond_info_t *)event->data;
                if (thermostat_state == THERMOSTAT_STATE_ADDR_CONFIG) {
                    break;
                }
                thermostat_state = ac_info->is_online ? THERMOSTAT_STATE_ON : THERMOSTAT_STATE_CONFLICT;
                if (thermostat_state == THERMOSTAT_STATE_ON) {
                    periph_monitor_set_led_state(g_periph_monitor, (int)THERMOSTAT_BTN_POWER, 1, 200);
                    periph_monitor_set_led_state(g_periph_monitor, (int)THERMOSTAT_BTN_UP, 1, 200);
                    periph_monitor_set_led_state(g_periph_monitor, (int)THERMOSTAT_BTN_DOWN, 1, 200);
                    periph_monitor_set_led_state(g_periph_monitor, (int)THERMOSTAT_BTN_MODE, 1, 200);
                    _periph_monitor_set_backlight(g_periph_monitor, 1);
                } else {
                    // periph_monitor_set_led_state(g_periph_monitor, (int)THERMOSTAT_BTN_POWER, 0, 200);
                    periph_monitor_disable_led(g_periph_monitor, (int)THERMOSTAT_BTN_POWER, 200);
                    periph_monitor_disable_led(g_periph_monitor, (int)THERMOSTAT_BTN_UP, 200);
                    periph_monitor_disable_led(g_periph_monitor, (int)THERMOSTAT_BTN_DOWN, 200);
                    periph_monitor_disable_led(g_periph_monitor, (int)THERMOSTAT_BTN_MODE, 200);

                    _periph_monitor_set_backlight(g_periph_monitor, 0);
                }
                periph_thermostat_update(periph_monitor->thermostat_periph, ac_info);
            }
            break;
#endif
#if defined(CONFIG_DEVICE_TYPE_THERMOSTAT)
        case PERIPH_ID_THERMOSTAT:
            if (event->cmd == THERMOSTAT_EVENT_UPDATE_INFOR) {
                LOGI(TAG, "THERMOSTAT_EVENT_UPDATE_INFOR");
                aircond_info_t *aircond = (aircond_info_t *)event->data;
                memcpy(&periph_monitor->aircond_info, aircond, sizeof(aircond_info_t));
                periph_aircond_update_state(periph_monitor->aircond_periph, &periph_monitor->aircond_info);
                if ((sys_cfg.aircond.mode != periph_monitor->aircond_info.mode) || (sys_cfg.aircond.setpoint != periph_monitor->aircond_info.setpoint) ||
                    (sys_cfg.aircond.fanspeed != periph_monitor->aircond_info.fanspeed) || (sys_cfg.aircond.vanes != periph_monitor->aircond_info.vanes)) {
                    sys_cfg.aircond.mode = periph_monitor->aircond_info.mode;
                    sys_cfg.aircond.setpoint = periph_monitor->aircond_info.setpoint;
                    sys_cfg.aircond.fanspeed = periph_monitor->aircond_info.fanspeed;
                    sys_cfg.aircond.vanes = periph_monitor->aircond_info.vanes;
                    cfg_save();
                }
            }
            if (event->cmd == THERMOSTAT_EVENT_UPDATE_PROXIMITY) {
                bool is_active = *(bool *)event->data;
                LOGI(TAG, "THERMOSTAT_EVENT_UPDATE_PROXIMITY: %s", is_active ? "active" : "not active");
                if (is_active) {
                    // periph_monitor_set_touch_brightness(g_periph_monitor, sys_cfg.brightness & 0xFF);
                    periph_monitor_set_touch_brightness(g_periph_monitor, 90 & 0xFF);
                    periph_monitor_set_backlight_brightness(g_periph_monitor, 100 & 0xFF);
                } else {
                    periph_monitor_set_touch_brightness(g_periph_monitor, 10);
                    periph_monitor_set_backlight_brightness(g_periph_monitor, 10);
                }
            }
            if (event->cmd == THERMOSTAT_EVENT_UPDATE_LUX) {
                uint8_t lux_level = *(uint8_t *)event->data;
                bool    is_active = event->data_len == 1 ? true : false;
                sys_cfg.brightness = (100 - lux_level) & 0xFF;
                LOGI(TAG, "THERMOSTAT_EVENT_UPDATE_LUX: %d", lux_level);
                if (is_active) {
                    periph_monitor_set_touch_brightness(g_periph_monitor, sys_cfg.brightness & 0xFF);
                } else {
                    periph_monitor_set_touch_brightness(g_periph_monitor, 0);
                }
            }
            if (event->cmd == THERMOSTAT_EVENT_UPDATE_ADDRESS) {
                LOGI(TAG, "THERMOSTAT_EVENT_UPDATE_ADDRESS");
                uint8_t addr = *((uint8_t *)event->data);
                periph_aircond_set_address(periph_monitor->aircond_periph, addr);
                sys_cfg.aircond.address = addr;
                aircond_info_t info = {
                    .address = addr,
                    .fanspeed = sys_cfg.aircond.fanspeed,
                    .humidity = 0,
                    .is_online = 1,
                    .mode = sys_cfg.aircond.mode,
                    .setpoint = sys_cfg.aircond.setpoint,
                    .temperature = sys_cfg.aircond.setpoint,
                    .vanes = sys_cfg.aircond.vanes,
                };
                periph_aircond_update_state(periph_monitor->aircond_periph, &info);
                cfg_save();
            }
            break;
#endif
    }
    return ESP_OK;
}

esp_err_t periph_monitor_toggle(esp_periph_handle_t periph, int touch_gpio) {
    VALIDATE_MONITOR(periph, ESP_FAIL);
    periph_monitor_t *periph_monitor = esp_periph_get_data(periph);
    int               i;
    hw_io_map_t      *_touch_io_map = periph_monitor->io_map;
    if (_touch_io_map == NULL) {
        return ESP_FAIL;
    }
    periph_monitor->blink_gpio_reset = false;
    for (i = 0; i < periph_monitor->io_num; i++) {
        if ((_touch_io_map[i].touch_pad == touch_gpio && (_touch_io_map[i].mtch_dac == 0 || _touch_io_map[i].mtch_dac == 1)) ||
            (_touch_io_map[i].touch_gpio == touch_gpio && _touch_io_map[i].mtch_dac > 1)) {
            // _touch_io_map[i].touch_idx = i;
#if defined(CONFIG_DEVICE_TYPE_TOUCH_CURTAIN)
            LOGI(TAG, "touch: %d set led: %d", touch_gpio, i);
            periph_monitor_set_led_state(periph, i, _touch_io_map[i].state ^ 1, 200);
            vTaskDelay(300 / portTICK_RATE_MS);
            periph_monitor_set_led_state(periph, i, _touch_io_map[i].state ^ 1, 200);
            motor_control_t cmd = periph_monitor->motor_ctrl_cmd[i];
            if (periph_monitor->motor_btn_state[i]) {
                motor_control_t stop_cmd = _get_stop_command(cmd);
                if (stop_cmd != MOTOR_CTRL_NONE) {
                    periph_motor_control(periph_monitor->motor_periph, stop_cmd);
                }
                periph_monitor->motor_btn_state[i] = false;
            } else {
                periph_motor_control(periph_monitor->motor_periph, cmd);
                periph_monitor->motor_btn_state[i] = true;
                int opp = _get_opposite_index(i);
                if (opp >= 0) {
                    periph_monitor->motor_btn_state[opp] = false;
                }
            }
            int in_pos = 0;
            int out_pos = 0;
            periph_motor_get_pos(periph_monitor->motor_periph, &in_pos, &out_pos);
            LOGI(TAG, "in: %d, out: %d", in_pos, out_pos);
            esp_periph_send_event(g_periph_monitor, MONITOR_CURTAIN_EVENT, (void *)&in_pos, (int)out_pos);
#elif defined(CONFIG_DEVICE_TYPE_TOUCH)
            periph_monitor_set_touch_state(periph, i, _touch_io_map[i].state ^ 1, false);
            cfg_save_touch_statistics(&periph_monitor->io_map[i], i, false, false);
#elif defined(CONFIG_DEVICE_TYPE_THERMOSTAT)
            // LOGW(TAG, "btn %d touch idx: %d, pad: %d, led: %d", touch_gpio, i, _touch_io_map[i].touch_pad, _touch_io_map[i].led_on_gpio);
            //  periph_led_blink(periph_monitor->led_periph, THERMOSTAT_BUZZER_PIN, 100, 100, false, 2);
            // thermostat_state_t thermostat_state = periph_thermostat_get_state(periph_monitor->thermostat_periph);
            periph_monitor_tms_process_btn(periph, i);
            periph_thermostat_proccess_btn(periph_monitor->thermostat_periph, (thermostat_btn_t)i);
#endif
            break;
        }
    }
    return ESP_OK;
}

esp_err_t periph_monitor_set_led_state(esp_periph_handle_t periph, int led_index, int led_state, int time_ms) {
    VALIDATE_MONITOR(periph, ESP_FAIL);
    periph_monitor_t *periph_monitor = esp_periph_get_data(periph);
    if (led_index < 0 || led_index >= periph_monitor->io_num) {
        return ESP_FAIL;
    }
    LOGI(TAG, "led_index=%d, led_state=%d", led_index, led_state);
    hw_io_map_t *_touch_io = &periph_monitor->io_map[led_index];
    _touch_io->state = led_state ? 1 : 0;
    return periph_monitor_set_led(periph, _touch_io, led_index, _touch_io->state, time_ms < 200 ? 200 : time_ms);
}

static TimerHandle_t touch_timers[MAX_TOUCH_PAD_NUM] = {NULL};
static void          touch_tap_callback(TimerHandle_t timer) {
    int32_t timer_id;
    timer_id = (int32_t)pvTimerGetTimerID(timer);
    if (touch_timers[timer_id]) {
        xTimerStop(touch_timers[timer_id], portMAX_DELAY);
        xTimerDelete(touch_timers[timer_id], portMAX_DELAY);
        touch_timers[timer_id] = NULL;
    }
    bool en_touch_scene = ((int)(sys_cfg.sceneActiveMap >> timer_id * 4) & (int)TOUCH_ENABLE_SCENE) == (int)TOUCH_ENABLE_SCENE;
    if (en_touch_scene) {
        periph_monitor_t *periph_monitor = esp_periph_get_data(g_periph_monitor);
        // LOGD(TAG, "Scene timer callback: TimerID [%d]", timer_id);
        esp_periph_send_event(g_periph_monitor, MONITOR_TOUCH_SCENE_EVENT, &periph_monitor->io_map[timer_id], sizeof(hw_io_map_t));
    } else {
        periph_monitor_t *periph_monitor = esp_periph_get_data(g_periph_monitor);
        int               state = periph_monitor->io_map[timer_id].state;
        // LOGD(TAG, "Touch timer callback: TimerID [%d], relay = %d, state = %d", timer_id, periph_monitor->io_map[timer_id].relay_gpio, state);
        gpio_set_level(periph_monitor->io_map[timer_id].relay_gpio, STATE_TO_RELAY(state));
        periph_monitor_check_auto_off(timer_id, state);
        esp_periph_send_event(g_periph_monitor, MONITOR_TOUCH_EVENT, &periph_monitor->io_map[timer_id], sizeof(hw_io_map_t));
    }
}

esp_err_t periph_monitor_set_touch_state(esp_periph_handle_t periph, int touch_index, int touch_state, bool event_from_server) {
    VALIDATE_MONITOR(periph, ESP_FAIL);
    periph_monitor_t *periph_monitor = esp_periph_get_data(periph);
    int               i = touch_index;
    if (i < 0 || i >= periph_monitor->io_num) {
        return ESP_FAIL;
    }
    hw_io_map_t *_touch_io_map = periph_monitor->io_map;
    if (_touch_io_map == NULL) {
        return ESP_FAIL;
    }
    bool en_touch_double_tap = ((int)(sys_cfg.sceneActiveMap >> i * 4) & (int)TOUCH_ENABLE_DOUBLETAP) == (int)TOUCH_ENABLE_DOUBLETAP;
    bool en_touch_scene = ((int)(sys_cfg.sceneActiveMap >> i * 4) & (int)TOUCH_ENABLE_SCENE) == (int)TOUCH_ENABLE_SCENE;
    if (event_from_server) {
        if (!en_touch_scene) {
            periph_monitor_set_led_state(periph, i, touch_state, 400);
            gpio_set_level(_touch_io_map[i].relay_gpio, STATE_TO_RELAY(_touch_io_map[i].state));
            periph_monitor_check_auto_off(i, _touch_io_map[i].state);
            return esp_periph_send_event(periph, MONITOR_TOUCH_EVENT, &_touch_io_map[i], sizeof(hw_io_map_t));
        } else {
            return esp_periph_send_event(periph, MONITOR_TOUCH_SCENE_EVENT, &_touch_io_map[i], sizeof(hw_io_map_t));
        }
    } else {
        if (en_touch_double_tap) {
            if (en_touch_scene) {
                periph_monitor_set_led_state(periph, i, 1, 150);
                vTaskDelay(150 / portTICK_RATE_MS);
                periph_monitor_set_led_state(periph, i, 0, 150);
                _touch_io_map[i].state = 0;
                LOGI(TAG, "Scene [%d] is tapped, double tap feature: %s", i, en_touch_double_tap ? "enable" : "disable");
            } else {
                periph_monitor_set_led_state(periph, i, touch_state, 400);
                LOGI(TAG, "Touch [%d] is tap, double tap feature: %s", i, en_touch_double_tap ? "enable" : "disable");
            }
            if (touch_timers[i] == NULL) {
                touch_timers[i] = xTimerCreate("touch-tab", DOUBLE_TAP_DETECT_MS / portTICK_RATE_MS, pdFALSE, (void *)i, touch_tap_callback);
                if (touch_timers[i] == NULL) {
                    LOGE(TAG, "Error creating timer");
                    return ESP_FAIL;
                }
                if (xTimerStart(touch_timers[i], 0) != pdTRUE) {
                    LOGE(TAG, "Error to start saving timer");
                    return ESP_FAIL;
                }
            } else {
                if (touch_timers[i]) {
                    xTimerStop(touch_timers[i], portMAX_DELAY);
                    xTimerDelete(touch_timers[i], portMAX_DELAY);
                    touch_timers[i] = NULL;
                    LOGI(TAG, "Touch [%d] is double tap", i);
                    if (esp_periph_tick_get() - periph_monitor->last_double_tapped > DOUBLE_TAP_EVENT_TIMEOUT_MS) {
                        periph_monitor->last_double_tapped = esp_periph_tick_get();
                        return esp_periph_send_event(periph, MONITOR_TOUCH_DOUBLE_TAP_EVENT, &_touch_io_map[i], sizeof(hw_io_map_t));
                    }
                    return ESP_OK;
                }
            }
        } else if (!en_touch_double_tap && en_touch_scene) {
            periph_monitor_set_led_state(periph, i, 1, 200);
            vTaskDelay(300 / portTICK_RATE_MS);
            periph_monitor_set_led_state(periph, i, 0, 200);
            _touch_io_map[i].state = 0;
            LOGI(TAG, "Scene [%d] is tapped", i);
            if (esp_periph_tick_get() - periph_monitor->last_double_tapped > SCENE_TAP_EVENT_TIMEOUT_MS) {
                periph_monitor->last_scene_tapped = esp_periph_tick_get();
                return esp_periph_send_event(g_periph_monitor, MONITOR_TOUCH_SCENE_EVENT, &_touch_io_map[i], sizeof(hw_io_map_t));
            }
        } else {
            periph_monitor_set_led_state(periph, i, touch_state, 400);
            gpio_set_level(_touch_io_map[i].relay_gpio, STATE_TO_RELAY(_touch_io_map[i].state));
            periph_monitor_check_auto_off(i, _touch_io_map[i].state);
            return esp_periph_send_event(periph, MONITOR_TOUCH_EVENT, &_touch_io_map[i], sizeof(hw_io_map_t));
        }
    }
    return ESP_OK;
}

esp_err_t periph_monitor_toggle_led_state(esp_periph_handle_t periph, int led_index) {
    VALIDATE_MONITOR(periph, ESP_FAIL);
    periph_monitor_t *periph_monitor = esp_periph_get_data(periph);
    hw_io_map_t      *status_io = periph_monitor->monitor_io;
    if (status_io == NULL) {
        return ESP_FAIL;
    }
    periph_monitor->blink_gpio_reset = false;
    return periph_monitor_set_led_state(periph, led_index, status_io->state ^ 1, 400);
}

esp_err_t periph_monitor_blink_status(esp_periph_handle_t periph, int time_ms, int repeat) {
    VALIDATE_MONITOR(periph, ESP_FAIL);
    periph_monitor_t *periph_monitor = esp_periph_get_data(periph);
    periph_monitor->manual_blink.time_unchange_ms = time_ms;
    periph_monitor->manual_blink.time_blink_ms = time_ms;
    periph_monitor->manual_blink.time_blink_repeat = repeat;
    periph_monitor->manual_blink.enable = true;
    return ESP_OK;
}

static esp_err_t periph_monitor_set_touch_brightness(esp_periph_handle_t periph, int brightness) {
    VALIDATE_MONITOR(periph, ESP_FAIL);
    periph_monitor_t *periph_monitor = esp_periph_get_data(periph);
    LOGD(TAG, "Set brightness: %d", brightness);
    if (brightness > MAX_BRIGHTNESS) {
        brightness = MAX_BRIGHTNESS;
    }
#ifdef CONFIG_DEVICE_TYPE_THERMOSTAT
    if (brightness < 5) {
        brightness = 5;
    }
#else
    if (brightness < MIN_BRIGHTNESS) {
        brightness = MIN_BRIGHTNESS;
    }
#endif
    esp_err_t ret = ESP_OK;
    ret |= periph_led_set_max_duty(periph_monitor->led_periph, brightness);
    if (periph_monitor->io_num > 4) {
        ret |= periph_led_low_set_max_duty(periph_monitor->led_low_periph, brightness);
    }
    return ret;
}

esp_err_t periph_monitor_set_touch_brightness_mode(esp_periph_handle_t periph) {
    VALIDATE_MONITOR(periph, ESP_FAIL);
    time_t cur_time;
    tm_t   timeinfo = {0};
    time(&cur_time);
    localtime_r(&cur_time, &timeinfo);
    char strftime_buf[64];
    strftime(strftime_buf, sizeof(strftime_buf), "%c", &timeinfo);
    LOGI(TAG, "The current UTC date/time is: %s", strftime_buf);
    tm_t   tm_time_start = TIME_DAY_START;
    tm_t   tm_time_end = TIME_DAY_END;
    tm_t   tm_current = {.tm_hour = timeinfo.tm_hour, .tm_min = timeinfo.tm_min, .tm_sec = timeinfo.tm_sec};
    time_t st_start = mktime(&tm_time_start);
    time_t st_end = mktime(&tm_time_end);
    time_t st_current = mktime(&tm_current);
    if (st_current >= st_start && st_current < st_end) {
        LOGI(TAG, "Setting day brightness mode");
        return periph_monitor_set_touch_brightness(periph, (sys_cfg.brightness >> 8) & 0xFF);  // Day mode
    }
    LOGI(TAG, "Setting night brightness mode");
    return periph_monitor_set_touch_brightness(periph, sys_cfg.brightness & 0xFF);  // Night mode
}
