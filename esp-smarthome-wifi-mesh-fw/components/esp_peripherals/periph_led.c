/*
 * ESPRESSIF MIT License
 *
 * Copyright (c) 2018 <ESPRESSIF SYSTEMS (SHANGHAI) PTE LTD>
 *
 * Permission is hereby granted for use on all ESPRESSIF SYSTEMS products, in which case,
 * it is free of charge, to any person obtaining a copy of this software and associated
 * documentation files (the "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the Software is furnished
 * to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all copies or
 * substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 */

#include "periph_led.h"

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>

#include "esp_log.h"
#include "esp_peripherals.h"
#include "esp_system.h"
#include "freertos/FreeRTOS.h"
#include "freertos/queue.h"
#include "freertos/task.h"
#include "soc/rtc_cntl_reg.h"
#include "soc/sens_reg.h"
#include "soc/soc.h"

#define MAX_LED_CHANNEL (8)

static const char *TAG = "PERIPH_LED";

#define VALIDATE_LED(periph, ret)                                  \
    if (!esp_periph_validate(periph, PERIPH_ID_LED)) {             \
        ESP_LOGE(TAG, "Invalid LED periph, at line %d", __LINE__); \
        return ret;                                                \
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
} periph_led_channel_t;

typedef struct periph_led {
    ledc_mode_t          led_speed_mode;
    ledc_timer_bit_t     led_duty_resolution;
    ledc_timer_t         led_timer_num;
    uint32_t             led_freq_hz;
    periph_led_channel_t channels[MAX_LED_CHANNEL];
    int                  max_duty_percent;
} periph_led_t;

static esp_err_t _led_run(esp_periph_handle_t self, audio_event_iface_msg_t *msg) { return ESP_OK; }

static esp_err_t _led_init(esp_periph_handle_t self) {
    VALIDATE_LED(self, ESP_FAIL);
    periph_led_t *periph_led = esp_periph_get_data(self);

    ledc_timer_config_t ledc_timer = {
        .duty_resolution = periph_led->led_duty_resolution,  // resolution of PWM duty
        .freq_hz = periph_led->led_freq_hz,                  // frequency of PWM signal
        .speed_mode = periph_led->led_speed_mode,            // timer mode
        .timer_num = periph_led->led_timer_num               // timer index
    };

    // Set configuration of timer0 for high speed channels
    ledc_timer_config(&ledc_timer);

    ledc_fade_func_install(0);
    return ESP_OK;
}

static esp_err_t _led_destroy(esp_periph_handle_t self) {
    periph_led_t *periph_led = esp_periph_get_data(self);
    for (int i = 0; i < MAX_LED_CHANNEL; i++) {
        periph_led_channel_t *ch = &periph_led->channels[i];
        if (ch->index > 0 && ch->pin > 0) {
            ledc_stop(periph_led->led_speed_mode, ch->index, 0);
        }
    }
    esp_periph_stop_timer(self);
    ledc_fade_func_uninstall();
    free(periph_led);
    return ESP_OK;
}

esp_periph_handle_t periph_led_init(periph_led_cfg_t *config) {
    esp_periph_handle_t periph = esp_periph_create(PERIPH_ID_LED, config->tag ? config->tag : "periph_led");
    // check periph
    periph_led_t *periph_led = calloc(1, sizeof(periph_led_t));
    // check periph_led
    periph_led->led_speed_mode = config->led_speed_mode;
    periph_led->led_duty_resolution = config->led_duty_resolution;
    periph_led->led_timer_num = config->led_timer_num;
    periph_led->led_freq_hz = config->led_freq_hz;
    if (periph_led->led_freq_hz == 0) {
        periph_led->led_freq_hz = 5000;
    }
    periph_led->max_duty_percent = config->max_duty_percent;
    if (periph_led->max_duty_percent == 0) {
        periph_led->max_duty_percent = 100;
    }
    for (int i = 0; i < MAX_LED_CHANNEL; i++) {
        periph_led->channels->current_state = LED_STATE_UNKNOW;
    }
    memset(&periph_led->channels, -1, sizeof(periph_led->channels));
    esp_periph_set_data(periph, periph_led);
    esp_periph_set_function(periph, _led_init, _led_run, _led_destroy);
    return periph;
}

static periph_led_channel_t *_find_led_channel(periph_led_t *periph_led, int gpio_num) {
    periph_led_channel_t *ch = NULL;
    for (int i = 0; i < MAX_LED_CHANNEL; i++) {
        if (periph_led->channels[i].pin == gpio_num) {
            ch = &periph_led->channels[i];
            ch->index = i;
            break;
        } else if (periph_led->channels[i].pin == -1) {
            ch = &periph_led->channels[i];
            ch->index = i;
        }
    }
    return ch;
}

static void led_timer_handler(xTimerHandle tmr) {
    esp_periph_handle_t periph = (esp_periph_handle_t)pvTimerGetTimerID(tmr);

    periph_led_t *periph_led = esp_periph_get_data(periph);
    bool          done = true;
    for (int i = 0; i < MAX_LED_CHANNEL; i++) {
        periph_led_channel_t *ch = &periph_led->channels[i];
        if (ch->pin < 0) {
            continue;
        }

        if (!ch->blink) {
            continue;
        }

        if (ch->loop == 0) {
            periph_led_set_state(periph, ch->pin, 0);
            esp_periph_send_event(periph, PERIPH_LED_BLINK_FINISH, (void *)ch->pin, 0);
            // ch->pin = -1; //disable this channel
            ch->blink = false;
            continue;
        }

        done = false;

        if (ch->is_off && esp_periph_tick_get() - ch->tick > ch->time_off_ms) {
            if (ch->loop > 0) {
                ch->loop--;
            }
            // now, switch on
            periph_led_set_state(periph, ch->pin, 1);
            ch->is_off = false;
            ch->tick = esp_periph_tick_get();
        } else if (!ch->is_off && esp_periph_tick_get() - ch->tick > ch->time_on_ms) {
            if (ch->loop > 0) {
                ch->loop--;
            }
            // switch off
            periph_led_set_state(periph, ch->pin, 0);
            ch->is_off = true;
            ch->tick = esp_periph_tick_get();
        }
    }

    if (done) {
        esp_periph_stop_timer(periph);
    }
}

esp_err_t periph_led_blink(esp_periph_handle_t periph, int gpio_num, int time_on_ms, int time_off_ms, bool fade, int loop) {
    periph_led_t         *periph_led = esp_periph_get_data(periph);
    periph_led_channel_t *ch = _find_led_channel(periph_led, gpio_num);
    if (ch == NULL) {
        return ESP_FAIL;
    }
    ledc_channel_config_t ledc_channel_cfg = {
        .channel = ch->index,
        .duty = 0,
        .gpio_num = gpio_num,
        .speed_mode = periph_led->led_speed_mode,
        .timer_sel = periph_led->led_timer_num,
    };
    ledc_channel_config(&ledc_channel_cfg);
    ch->pin = gpio_num;
    ch->tick = esp_periph_tick_get();
    ch->time_on_ms = time_on_ms;
    ch->time_off_ms = time_off_ms;
    ch->loop = loop;
    ch->fade = fade;
    ch->blink = true;
    esp_periph_start_timer(periph, 10, led_timer_handler);
    return ESP_OK;
}

esp_err_t periph_led_falling(esp_periph_handle_t periph, int gpio_num, int time_ms) {
    periph_led_t         *periph_led = esp_periph_get_data(periph);
    periph_led_channel_t *ch = _find_led_channel(periph_led, gpio_num);
    if (ch == NULL) {
        return ESP_FAIL;
    }
    if (ch->current_state == LED_STATE_OFF) {
        ESP_LOGD(TAG, "LED %d now off", ch->index);
        return ESP_OK;
    }
    int                   target_duty = (pow(2, periph_led->led_duty_resolution) - 1) * periph_led->max_duty_percent / 100;
    ledc_channel_config_t ledc_channel_cfg = {
        .channel = ch->index,
        .duty = target_duty,
        .gpio_num = gpio_num,
        .speed_mode = periph_led->led_speed_mode,
        .timer_sel = periph_led->led_timer_num,
    };
    ledc_channel_config(&ledc_channel_cfg);
    ch->pin = gpio_num;
    ch->tick = esp_periph_tick_get();
    ch->time_on_ms = 0;
    ch->time_off_ms = 0;
    ch->loop = 0;
    ch->fade = 0;
    ch->blink = false;
    ledc_set_fade_with_time(periph_led->led_speed_mode, ch->index, 0, time_ms);
    ledc_fade_start(periph_led->led_speed_mode, ch->index, LEDC_FADE_NO_WAIT);
    ch->current_state = LED_STATE_OFF;
    return ESP_OK;
}

esp_err_t periph_led_rising(esp_periph_handle_t periph, int gpio_num, int time_ms) {
    periph_led_t         *periph_led = esp_periph_get_data(periph);
    periph_led_channel_t *ch = _find_led_channel(periph_led, gpio_num);
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
        .speed_mode = periph_led->led_speed_mode,
        .timer_sel = periph_led->led_timer_num,
    };
    ledc_channel_config(&ledc_channel_cfg);
    ch->pin = gpio_num;
    ch->tick = esp_periph_tick_get();
    ch->time_on_ms = 0;
    ch->time_off_ms = 0;
    ch->loop = 0;
    ch->fade = 0;
    ch->blink = false;
    int target_duty = (pow(2, periph_led->led_duty_resolution) - 1) * periph_led->max_duty_percent / 100;
    ledc_set_fade_with_time(periph_led->led_speed_mode, ch->index, target_duty, time_ms);
    ledc_fade_start(periph_led->led_speed_mode, ch->index, LEDC_FADE_NO_WAIT);
    ch->current_state = LED_STATE_ON;
    return ESP_OK;
}

esp_err_t periph_led_stop(esp_periph_handle_t periph, int gpio_num) {
    periph_led_t         *periph_led = esp_periph_get_data(periph);
    periph_led_channel_t *ch = _find_led_channel(periph_led, gpio_num);
    if (ch && (ch->pin < 0 || ch->index < 0)) {
        return ESP_OK;
    }
    ledc_stop(periph_led->led_speed_mode, ch->index, 0);
    ch->pin = -1;
    ch->index = -1;
    return ESP_OK;
}

esp_err_t periph_led_set_max_duty(esp_periph_handle_t periph, int max_duty_percent) {
    periph_led_t *periph_led = esp_periph_get_data(periph);
    periph_led->max_duty_percent = max_duty_percent;

    periph_led_channel_t *ch = NULL;
    for (int i = 0; i < MAX_LED_CHANNEL; i++) {
        if (periph_led->channels[i].pin >= 0) {
            ch = &periph_led->channels[i];
            if (ledc_get_duty(periph_led->led_speed_mode, ch->index) == 0) {
                continue;
            }
            // ESP_LOGD(TAG, "led idx=%d, ch->is_off=%d, ch->pin=%d, duty=%d", ch->index, ch->is_off, ch->pin, ledc_get_duty(periph_led->led_speed_mode, ch->index));
            int target_duty = (pow(2, periph_led->led_duty_resolution) - 1) * periph_led->max_duty_percent / 100;
            if (periph_led->channels[i].current_state == LED_STATE_ON) {
                ledc_set_duty(periph_led->led_speed_mode, ch->index, target_duty);
                ledc_set_fade_with_time(periph_led->led_speed_mode, ch->index, target_duty, 500);
                ledc_fade_start(periph_led->led_speed_mode, ch->index, LEDC_FADE_NO_WAIT);
            } else {
                ledc_set_duty(periph_led->led_speed_mode, ch->index, 0);
                ledc_update_duty(periph_led->led_speed_mode, ch->index);
            }
        }
    }
    return ESP_OK;
}

esp_err_t periph_led_set_state(esp_periph_handle_t periph, int gpio_num, int state) {
    periph_led_t         *periph_led = esp_periph_get_data(periph);
    periph_led_channel_t *ch = _find_led_channel(periph_led, gpio_num);
    if (ch && (ch->pin < 0 || ch->index < 0)) {
        return ESP_OK;
    }
    if (state) {
        int target_duty = (pow(2, periph_led->led_duty_resolution) - 1) * periph_led->max_duty_percent / 100;
        ledc_set_duty(periph_led->led_speed_mode, ch->index, target_duty);
        ledc_update_duty(periph_led->led_speed_mode, ch->index);
    } else {
        ledc_set_duty(periph_led->led_speed_mode, ch->index, 0);
        ledc_update_duty(periph_led->led_speed_mode, ch->index);
    }
    ch->current_state = state ? LED_STATE_ON : LED_STATE_OFF;
    return ESP_OK;
}

esp_err_t periph_led_set_color(esp_periph_handle_t periph, int gpio_num, int color) {
    periph_led_t         *periph_led = esp_periph_get_data(periph);
    periph_led_channel_t *ch = _find_led_channel(periph_led, gpio_num);
    if (ch && (ch->pin < 0 || ch->index < 0)) {
        return ESP_OK;
    }
    int max_duty = (pow(2, periph_led->led_duty_resolution) - 1) * periph_led->max_duty_percent / 100;
    int duty = color * max_duty / 255;
    ledc_set_duty(periph_led->led_speed_mode, ch->index, duty);
    ledc_update_duty(periph_led->led_speed_mode, ch->index);
    return ESP_OK;
}
