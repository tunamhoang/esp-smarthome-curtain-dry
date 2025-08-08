/*
 * This file is subject to the terms of the SunshineTech License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *
 *              ./LICENSE
 */

#include "periph_led_low.h"

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "esp_log.h"
#include "esp_peripherals.h"
#include "esp_system.h"
#include "freertos/FreeRTOS.h"
#include "freertos/queue.h"
#include "freertos/task.h"
#include "soc/rtc_cntl_reg.h"
#include "soc/sens_reg.h"
#include "soc/soc.h"

#define MAX_LED_LOW_CHANNEL (8)

static const char *TAG = "PERIPH_LED_LOW";

#define VALIDATE_LED_LOW(periph, ret)                                  \
    if (!esp_periph_validate(periph, PERIPH_ID_LED_LOW)) {             \
        ESP_LOGE(TAG, "Invalid LED LOW periph, at line %d", __LINE__); \
        return ret;                                                    \
    }

typedef enum {
    LED_STATE_UNKNOW = 0,
    LED_STATE_OFF,
    LED_STATE_ON,
} led_state_t;

typedef struct {
    int         index;
    int         pin;
    int         time_on_ms;
    int         time_off_ms;
    long long   tick;
    int         loop;
    bool        is_off;
    bool        fade;
    bool        blink;
    led_state_t current_state;
} periph_led_low_channel_t;

typedef struct {
    ledc_mode_t              led_speed_mode;
    ledc_timer_bit_t         led_duty_resolution;
    ledc_timer_t             led_timer_num;
    uint32_t                 led_freq_hz;
    periph_led_low_channel_t channels[MAX_LED_LOW_CHANNEL];
    int                      max_duty_percent;
} periph_led_low_t;

static esp_err_t _led_low_init(esp_periph_handle_t self) {
    periph_led_low_t *led_low = esp_periph_get_data(self);

    ledc_timer_config_t ledc_timer = {.duty_resolution = led_low->led_duty_resolution, .freq_hz = led_low->led_freq_hz, .speed_mode = led_low->led_speed_mode, .timer_num = led_low->led_timer_num};
    ledc_timer_config(&ledc_timer);
    // ledc_fade_func_install(0);
    return ESP_OK;
}

static esp_err_t _led_low_run(esp_periph_handle_t self, audio_event_iface_msg_t *msg) { return ESP_OK; }

static esp_err_t _led_low_destroy(esp_periph_handle_t self) {
    periph_led_low_t *led_low = esp_periph_get_data(self);
    for (int i = 0; i < MAX_LED_LOW_CHANNEL; i++) {
        periph_led_low_channel_t *ch = &led_low->channels[i];
        if (ch->index > 0 && ch->pin > 0) {
            ledc_stop(led_low->led_speed_mode, ch->index, 0);
        }
    }
    ledc_fade_func_uninstall();
    free(led_low);
    return ESP_OK;
}

esp_periph_handle_t periph_led_low_init(periph_led_low_cfg_t *config) {
    esp_periph_handle_t periph = esp_periph_create(PERIPH_ID_LED_LOW, config->tag ? config->tag : "periph_led_low");
    PERIPH_MEM_CHECK(TAG, periph, { return NULL; });
    periph_led_low_t *led_low = calloc(1, sizeof(periph_led_low_t));

    led_low->led_speed_mode = config->led_speed_mode;
    led_low->led_duty_resolution = config->led_duty_resolution;
    led_low->led_timer_num = config->led_timer_num;
    led_low->led_freq_hz = config->led_freq_hz;
    if (led_low->led_freq_hz == 0) {
        led_low->led_freq_hz = 5000;
    }
    led_low->max_duty_percent = config->max_duty_percent;
    if (led_low->max_duty_percent == 0) {
        led_low->max_duty_percent = 100;
    }
    for (int i = 0; i < MAX_LED_LOW_CHANNEL; i++) {
        led_low->channels->current_state = LED_STATE_UNKNOW;
    }
    memset(&led_low->channels, -1, sizeof(led_low->channels));
    esp_periph_set_data(periph, led_low);
    esp_periph_set_function(periph, _led_low_init, _led_low_run, _led_low_destroy);
    return periph;
}

static periph_led_low_channel_t *_find_led_low_channel(periph_led_low_t *led_low, int gpio_num) {
    periph_led_low_channel_t *ch = NULL;
    for (int i = 0; i < MAX_LED_LOW_CHANNEL; i++) {
        if (led_low->channels[i].pin == gpio_num) {
            ch = &led_low->channels[i];
            ch->index = i;
            break;
        } else if (led_low->channels[i].pin == -1) {
            ch = &led_low->channels[i];
            ch->index = i;
        }
    }
    return ch;
}

static void led_low_timer_handler(xTimerHandle tmr) {
    esp_periph_handle_t periph = (esp_periph_handle_t)pvTimerGetTimerID(tmr);

    periph_led_low_t *periph_led_low = esp_periph_get_data(periph);
    bool              done = true;
    for (int i = 0; i < MAX_LED_LOW_CHANNEL; i++) {
        periph_led_low_channel_t *ch = &periph_led_low->channels[i];
        if (ch->pin < 0) {
            continue;
        }

        if (!ch->blink) {
            continue;
        }

        if (ch->loop == 0) {
            periph_led_low_set_state(periph, ch->pin, 0);
            ch->blink = false;
            continue;
        }

        done = false;

        if (ch->is_off && esp_periph_tick_get() - ch->tick > ch->time_off_ms) {
            if (ch->loop > 0) {
                ch->loop--;
            }
            // now, switch on
            periph_led_low_set_state(periph, ch->pin, 1);
            ch->is_off = false;
            ch->tick = esp_periph_tick_get();
        } else if (!ch->is_off && esp_periph_tick_get() - ch->tick > ch->time_on_ms) {
            if (ch->loop > 0) {
                ch->loop--;
            }
            // switch off
            periph_led_low_set_state(periph, ch->pin, 0);
            ch->is_off = true;
            ch->tick = esp_periph_tick_get();
        }
    }

    if (done) {
        esp_periph_stop_timer(periph);
    }
}

esp_err_t periph_led_low_blink(esp_periph_handle_t periph, int gpio_num, int time_on_ms, int time_off_ms, bool fade, int loop) {
    periph_led_low_t         *periph_led_low = esp_periph_get_data(periph);
    periph_led_low_channel_t *ch = _find_led_low_channel(periph_led_low, gpio_num);
    if (ch == NULL) {
        return ESP_FAIL;
    }
    ledc_channel_config_t ledc_channel_cfg = {
        .channel = ch->index,
        .duty = 0,
        .gpio_num = gpio_num,
        .speed_mode = periph_led_low->led_speed_mode,
        .timer_sel = periph_led_low->led_timer_num,
    };
    ledc_channel_config(&ledc_channel_cfg);
    ch->pin = gpio_num;
    ch->tick = esp_periph_tick_get();
    ch->time_on_ms = time_on_ms;
    ch->time_off_ms = time_off_ms;
    ch->loop = loop;
    ch->fade = fade;
    ch->blink = true;
    esp_periph_start_timer(periph, 10, led_low_timer_handler);
    return ESP_OK;
}

esp_err_t periph_led_low_falling(esp_periph_handle_t periph, int gpio_num, int time_ms) {
    periph_led_low_t         *led_low = esp_periph_get_data(periph);
    periph_led_low_channel_t *ch = _find_led_low_channel(led_low, gpio_num);
    if (ch == NULL) {
        return ESP_FAIL;
    }
    if (ch->current_state == LED_STATE_OFF) {
        ESP_LOGD(TAG, "LED %d now off", ch->index);
        return ESP_OK;
    }
    int                   target_duty = (pow(2, led_low->led_duty_resolution) - 1) * led_low->max_duty_percent / 100;
    ledc_channel_config_t ledc_channel_cfg = {
        .channel = ch->index,
        .duty = target_duty,
        .gpio_num = gpio_num,
        .speed_mode = led_low->led_speed_mode,
        .timer_sel = led_low->led_timer_num,
    };
    ledc_channel_config(&ledc_channel_cfg);
    ch->pin = gpio_num;
    ch->tick = esp_periph_tick_get();
    ch->time_on_ms = 0;
    ch->time_off_ms = 0;
    ch->loop = 0;
    ch->fade = 0;
    ledc_set_fade_with_time(led_low->led_speed_mode, ch->index, 0, time_ms);
    ledc_fade_start(led_low->led_speed_mode, ch->index, LEDC_FADE_NO_WAIT);
    ch->current_state = LED_STATE_OFF;
    return ESP_OK;
}

esp_err_t periph_led_low_rising(esp_periph_handle_t periph, int gpio_num, int time_ms) {
    periph_led_low_t         *led_low = esp_periph_get_data(periph);
    periph_led_low_channel_t *ch = _find_led_low_channel(led_low, gpio_num);
    if (ch == NULL) {
        return ESP_FAIL;
    }
    if (ch->current_state == LED_STATE_ON) {
        ESP_LOGD(TAG, "LED %d now on", ch->index);
        return ESP_OK;
    }
    ledc_channel_config_t ledc_channel_cfg = {
        .channel = ch->index,
        .duty = 0,
        .gpio_num = gpio_num,
        .speed_mode = led_low->led_speed_mode,
        .timer_sel = led_low->led_timer_num,
    };
    ledc_channel_config(&ledc_channel_cfg);
    ch->pin = gpio_num;
    ch->tick = esp_periph_tick_get();
    ch->time_on_ms = 0;
    ch->time_off_ms = 0;
    ch->loop = 0;
    ch->fade = 0;
    int target_duty = (pow(2, led_low->led_duty_resolution) - 1) * led_low->max_duty_percent / 100;
    ledc_set_fade_with_time(led_low->led_speed_mode, ch->index, target_duty, time_ms);
    ledc_fade_start(led_low->led_speed_mode, ch->index, LEDC_FADE_NO_WAIT);
    ch->current_state = LED_STATE_ON;
    return ESP_OK;
}

esp_err_t periph_led_low_set_max_duty(esp_periph_handle_t periph, int max_duty_percent) {
    periph_led_low_t *led_low = esp_periph_get_data(periph);
    led_low->max_duty_percent = max_duty_percent;

    periph_led_low_channel_t *ch = NULL;
    for (int i = 0; i < MAX_LED_LOW_CHANNEL; i++) {
        if (led_low->channels[i].pin >= 0) {
            ch = &led_low->channels[i];
            if (ledc_get_duty(led_low->led_speed_mode, ch->index) == 0) {
                continue;
            }
            // ESP_LOGD(TAG, "led idx=%d, ch->is_off=%d, ch->pin=%d, duty=%d", ch->index, ch->is_off, ch->pin, ledc_get_duty(led_low->led_speed_mode, ch->index));
            int target_duty = (pow(2, led_low->led_duty_resolution) - 1) * led_low->max_duty_percent / 100;
            if (led_low->channels[i].current_state == LED_STATE_ON) {
                ledc_set_duty(led_low->led_speed_mode, ch->index, target_duty);
                ledc_set_fade_with_time(led_low->led_speed_mode, ch->index, target_duty, 500);
                ledc_fade_start(led_low->led_speed_mode, ch->index, LEDC_FADE_NO_WAIT);
            } else {
                ledc_set_duty(led_low->led_speed_mode, ch->index, 0);
                ledc_update_duty(led_low->led_speed_mode, ch->index);
            }
        }
    }
    return ESP_OK;
}

esp_err_t periph_led_low_set_state(esp_periph_handle_t periph, int gpio_num, int state) {
    periph_led_low_t         *led_low = esp_periph_get_data(periph);
    periph_led_low_channel_t *ch = _find_led_low_channel(led_low, gpio_num);
    if (ch == NULL) {
        return ESP_FAIL;
    }
    if ((state && ch->current_state == LED_STATE_ON) || (!state && ch->current_state == LED_STATE_OFF)) {
        ESP_LOGD(TAG, "LED %d now %s", ch->index, state ? "ON" : "OFF");
        return ESP_OK;
    }
    ledc_channel_config_t ledc_channel_cfg = {
        .channel = ch->index,
        .duty = 0,
        .gpio_num = gpio_num,
        .speed_mode = led_low->led_speed_mode,
        .timer_sel = led_low->led_timer_num,
    };
    ledc_channel_config(&ledc_channel_cfg);
    ch->pin = gpio_num;
    ch->tick = esp_periph_tick_get();
    ch->time_on_ms = 0;
    ch->time_off_ms = 0;
    ch->loop = 0;
    ch->fade = 0;

    if (state) {
        int target_duty = (pow(2, led_low->led_duty_resolution) - 1) * led_low->max_duty_percent / 100;
        ledc_set_duty(led_low->led_speed_mode, ch->index, target_duty);
        ledc_update_duty(led_low->led_speed_mode, ch->index);
    } else {
        ledc_set_duty(led_low->led_speed_mode, ch->index, 0);
        ledc_update_duty(led_low->led_speed_mode, ch->index);
    }
    ch->current_state = state ? LED_STATE_ON : LED_STATE_OFF;
    return ESP_OK;
}
