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

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/time.h>

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "soc/soc.h"
#include "soc/rtc_cntl_reg.h"
#include "soc/sens_reg.h"
#include "esp_log.h"
#include "esp_system.h"
#include "esp_timer.h"

#include "periph_touch.h"
#include "touch.h"
#include "esp_peripherals.h"
#include "esp_sx8636.h"

static const char *TAG = "PERIPH_TOUCH";
#define INTERVAL_SAMPLES_MS (20)
#define DISABLE_BAN_TAP_THRESHOLD (INT32_MAX)

#define VALIDATE_TOUCH(periph, ret) if (!esp_periph_validate(periph, PERIPH_ID_TOUCH)) { \
        ESP_LOGE(TAG, "Invalid TOUCH periph, at line %d", __LINE__);\
        return ret;\
    }

typedef struct periph_touch {
    esp_touch_handle_t touch;
    int touch_mask;
    int long_tap_time_ms;
    float tap_threshold_percent;
    uint16_t tap_threshold_step;
    uint16_t tap_threshold_min_diff;
    int slide_window;
    touch_result_t result;
    QueueHandle_t queue;
    int64_t last_enter_interrupt;
    int delta_timer_ban_tap;
    int n_sample_accept;
    esp_touch_driver_t touch_driver;
    gpio_num_t sx_sda_pin;
    gpio_num_t sx_scl_pin;
    gpio_num_t sx_int_pin;
    i2c_port_t sx_port_num;
    int sx_sensitivity;
    esp_sx8636_handle_t sx_handle;
} periph_touch_t;

typedef struct {
    int event_id;
    int touch_num;
} touch_event_t;

static void touch_send_event(esp_periph_handle_t self, int event_id, int mask)
{
    periph_touch_t *periph_touch = esp_periph_get_data(self);
    int touch_num = 0;
    while (mask) {
        if (mask & 0x01) {
            touch_event_t new_event = {
                .event_id = event_id,
                .touch_num = touch_num,
            };
            if (periph_touch->queue != NULL) {
                xQueueSend(periph_touch->queue, &new_event, 10 / portTICK_RATE_MS);
            }
        }
        mask >>= 1;
        touch_num ++;
    }
}

static esp_err_t _touch_run(esp_periph_handle_t self, audio_event_iface_msg_t *msg)
{
    return ESP_OK;
    periph_touch_t *periph_touch = esp_periph_get_data(self);

    if (esp_touch_read(periph_touch->touch, &periph_touch->result)) {
        ESP_LOGD(TAG, "Touch event, tap %x, release_mask: %x, long_tap_mask: %x, long_tap_mask: %x",
                 periph_touch->result.tap_mask, periph_touch->result.release_mask,
                 periph_touch->result.long_tap_mask, periph_touch->result.long_release_mask);

        touch_send_event(self, PERIPH_TOUCH_TAP, periph_touch->result.tap_mask);
        touch_send_event(self, PERIPH_TOUCH_RELEASE, periph_touch->result.release_mask);
        touch_send_event(self, PERIPH_TOUCH_LONG_TAP, periph_touch->result.long_tap_mask);
        touch_send_event(self, PERIPH_TOUCH_LONG_RELEASE, periph_touch->result.long_release_mask);
    }
    return ESP_OK;
}

esp_err_t _sx8636_touch_callback(void* self, esp_sx8636_touch_result_t* data)
{
    if (data == NULL || self == NULL) {
        return ESP_FAIL;
    }
    touch_send_event(self, PERIPH_TOUCH_TAP, data->tap_mask);
    touch_send_event(self, PERIPH_TOUCH_RELEASE, data->release_mask);
    touch_send_event(self, PERIPH_TOUCH_LONG_TAP, data->long_tap_mask);
    touch_send_event(self, PERIPH_TOUCH_LONG_RELEASE, data->long_release_mask);
    return ESP_OK;
}

static void _touch_task(void *pv)
{
    esp_periph_handle_t self = (esp_periph_handle_t)pv;
    periph_touch_t *periph_touch = esp_periph_get_data(self);
    // vTaskDelay(1000 / portTICK_RATE_MS);
    touch_event_t event;
    while (1) {
        if (xQueueReceive(periph_touch->queue, &event, portMAX_DELAY) == pdTRUE) {
            esp_periph_send_event(self, event.event_id, (void *)event.touch_num, 0);
        }
    }

    vTaskDelete(NULL);
    // return ESP_OK;
}

static void periodic_timer_callback(void* arg)
{
    int64_t time_since_boot = esp_timer_get_time();
    esp_periph_handle_t self = (esp_periph_handle_t)arg;
    periph_touch_t *periph_touch = esp_periph_get_data(self);
    int delta = INTERVAL_SAMPLES_MS * 1000 - (time_since_boot - periph_touch->last_enter_interrupt);
    periph_touch->last_enter_interrupt = time_since_boot;
    if (esp_touch_read(periph_touch->touch, &periph_touch->result)) {
        touch_send_event(self, PERIPH_TOUCH_RELEASE, periph_touch->result.release_mask);
        touch_send_event(self, PERIPH_TOUCH_LONG_RELEASE, periph_touch->result.long_release_mask);
        if (abs(delta) > periph_touch->delta_timer_ban_tap) {
            ESP_LOGE(TAG, "Noise %d", abs(delta));
            return;
        }
        touch_send_event(self, PERIPH_TOUCH_TAP, periph_touch->result.tap_mask);
        // touch_send_event(self, PERIPH_TOUCH_RELEASE, periph_touch->result.release_mask);
        touch_send_event(self, PERIPH_TOUCH_LONG_TAP, periph_touch->result.long_tap_mask);
        // touch_send_event(self, PERIPH_TOUCH_LONG_RELEASE, periph_touch->result.long_release_mask);
    }
}

static esp_err_t _touch_init(esp_periph_handle_t self)
{
    VALIDATE_TOUCH(self, ESP_FAIL);
    periph_touch_t *periph_touch = esp_periph_get_data(self);

    if (periph_touch->touch_driver == ESP_TOUCH_DRIVER_ESP) {
        touch_config_t touch_config = {
            .touch_mask = periph_touch->touch_mask,
            .long_tap_time_ms = periph_touch->long_tap_time_ms,
            .tap_threshold_percent = periph_touch->tap_threshold_percent,
            .tap_threshold_step = periph_touch->tap_threshold_step,
            .tap_threshold_min_diff = periph_touch->tap_threshold_min_diff,
            .interval_samples_ms = INTERVAL_SAMPLES_MS,
            .slide_window = periph_touch->slide_window,
            .n_sample_accept = periph_touch->n_sample_accept,
        };
        periph_touch->touch = esp_touch_init(&touch_config);
        const esp_timer_create_args_t periodic_timer_args = {
                .callback = &periodic_timer_callback,
                /* name is optional, but may help identify the timer when debugging */
                .arg = (void*)self,
                .name = "periodic"
        };
        esp_timer_handle_t periodic_timer;
        ESP_ERROR_CHECK(esp_timer_create(&periodic_timer_args, &periodic_timer));
        /* Start the timers */
        ESP_ERROR_CHECK(esp_timer_start_periodic(periodic_timer, INTERVAL_SAMPLES_MS*1000));
    } else if (periph_touch->touch_driver == ESP_TOUCH_DRIVER_SX8636) {
        esp_sx8636_config_t sx_config = {
            .int_pin = periph_touch->sx_int_pin,
            .port_num = periph_touch->sx_port_num,
            .scl_pin = periph_touch->sx_scl_pin,
            .sda_pin = periph_touch->sx_sda_pin,
            .touch_enable_mask = periph_touch->touch_mask,
            .long_tap_time_ms = periph_touch->long_tap_time_ms,
            .on_event = _sx8636_touch_callback,
            .on_event_arg = self,
            .sensitive = periph_touch->sx_sensitivity,
        };
        periph_touch->sx_handle = esp_sx8636_init(&sx_config);
        esp_err_t err = esp_sx8636_start(periph_touch->sx_handle);
        if (err != ESP_OK) {
            ESP_LOGE(TAG, "Start ES8636 fail: %d", err);
        }
    } else {
        return ESP_FAIL;
    }
    periph_touch->queue = xQueueCreate(10, sizeof(touch_event_t));
    xTaskCreatePinnedToCore(_touch_task, "touch_task", 3 * 1024, self, 5, NULL, 0);
    return ESP_OK;
}

static esp_err_t _touch_destroy(esp_periph_handle_t self)
{
    periph_touch_t *periph_touch = esp_periph_get_data(self);
    esp_touch_destroy(periph_touch->touch);
    free(periph_touch);
    return ESP_OK;
}

esp_periph_handle_t periph_touch_init(periph_touch_cfg_t *config)
{
    esp_periph_handle_t periph = esp_periph_create(PERIPH_ID_TOUCH, config->tag ? config->tag : "periph_touch");
    PERIPH_MEM_CHECK(TAG, periph, return NULL);
    periph_touch_t *periph_touch = calloc(1, sizeof(periph_touch_t));

    PERIPH_MEM_CHECK(TAG, periph_touch, return NULL);
    periph_touch->touch_driver = config->touch_driver == ESP_TOUCH_DRVIER_NONE ? ESP_TOUCH_DRIVER_ESP : config->touch_driver;
    periph_touch->touch_mask = config->touch_mask;
    periph_touch->long_tap_time_ms = config->long_tap_time_ms;
    periph_touch->tap_threshold_percent = config->tap_threshold_percent;
    periph_touch->tap_threshold_step = config->tap_threshold_step,
    periph_touch->tap_threshold_min_diff = config->tap_threshold_min_diff,
    periph_touch->slide_window = config->slide_window;
    periph_touch->delta_timer_ban_tap = config->delta_timer_ban_tap <= 0 ? DISABLE_BAN_TAP_THRESHOLD : config->delta_timer_ban_tap;
    periph_touch->n_sample_accept = config->n_sample_accept;

    periph_touch->sx_int_pin = config->sx_int_pin;
    periph_touch->sx_port_num = config->sx_port_num;
    periph_touch->sx_scl_pin = config->sx_scl_pin;
    periph_touch->sx_sda_pin = config->sx_sda_pin;
    periph_touch->sx_sensitivity = config->sx_sensitivity < SX8636_MIN_SENSITIVITY ? SX8636_MIN_SENSITIVITY : config->sx_sensitivity;
    periph_touch->sx_sensitivity = config->sx_sensitivity > SX8636_MAX_SENSITIVITY ? SX8636_MAX_SENSITIVITY : config->sx_sensitivity;

    esp_periph_set_data(periph, periph_touch);
    esp_periph_set_function(periph, _touch_init, _touch_run, _touch_destroy);

    return periph;
}

esp_err_t periph_touch_set_sensitive(esp_periph_handle_t periph, int sensitive, uint8_t n_accept_touch)
{
    VALIDATE_TOUCH(periph, ESP_FAIL);
    periph_touch_t *periph_touch = esp_periph_get_data(periph);
    periph_touch->tap_threshold_percent = sensitive;
    if (periph_touch->touch_driver == ESP_TOUCH_DRIVER_ESP) {
        periph_touch->n_sample_accept = n_accept_touch;
        return esp_touch_set_sensitive(periph_touch->touch, sensitive, n_accept_touch);
    } else if (periph_touch->touch_driver == ESP_TOUCH_DRIVER_SX8636) {
        esp_sx8636_set_full_threshold(periph_touch->sx_handle, sensitive);
        esp_sx8636_set_full_sensitivity(periph_touch->sx_handle, sensitive);
        return ESP_OK;
    }
    return ESP_OK;

}
