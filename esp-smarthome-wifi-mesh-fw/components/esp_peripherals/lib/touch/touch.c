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

#include <stdio.h>
#include <string.h>
#include <sys/time.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"

#include "esp_log.h"
#include "driver/gpio.h"
#include "driver/touch_pad.h"
#include "sys/queue.h"
#include "touch.h"
#include "tct_template.h"
#include "kalman_filter.h"
#include "soc/rtc.h"

#define TOUCHPAD_TRIGGER_THRESHOLD      100
#define TOUCHPAD_FILTER_PERIOD          (10)
#define TOUCHPAD_READ_INTERVAL_MS       (TOUCHPAD_FILTER_PERIOD+1)
#define TOUCHPAD_INTIALIZE_TIME_MS      1000
#define UPDATE_THRESHOLD_PERIOD_MS      1000
#define MAX_SIZE_SLIDE_WINDOWN          100
#define MAX_TOUCH_VALUE                 (1000*1000)
#define DEFAULT_SLIDE_WINDOW            10
#define DEFAULT_N_SAMPLE_ACCEPT         5
#define DEFAULT_TAP_THRESHOLD_PERCENT   90
#define DEFAULT_TAP_THRESHOLD_STEP      20
#define DEFAULT_TAP_THRESHOLD_MIN_DIFF  200
#define MAX_DELTA_UNTOUCH_VALUE         1000

// #define PRINT_TOUCH_MONITOR_DEBUG

static const char *TAG = "TOUCH";

typedef struct esp_touch_item {
    int                             touch_num;
    long long                       last_tap_tick;
    int                             saved_value[MAX_SIZE_SLIDE_WINDOWN];
    int                             slide_windown;
    bool                            is_calib;
    int                             counter;
    int                             average;
    uint32_t                        sum;
    int                             lower;
    bool                            flag_touched;
    bool                            long_tapped;
    bool                            touched;
    bool                            request_calib;
    int                             touched_counter;
    kalman_filter_handle_t          kf_handle;
    STAILQ_ENTRY(esp_touch_item)    entry;
} esp_touch_item_t;

struct esp_touch {
    int long_tap_time_ms;
    int touch_mask;
    float tap_threshold_percent;
    uint16_t tap_threshold_step;
    uint16_t tap_threshold_min_diff;
    int slide_window;
    int n_sample_accept;
    STAILQ_HEAD(esp_touch_list, esp_touch_item) touch_list;
};

#ifdef periph_tick_get
#define tick_get periph_tick_get
#else
static long long tick_get()
{
    struct timeval te;
    gettimeofday(&te, NULL); // get current time
    long long milliseconds = te.tv_sec * 1000LL + te.tv_usec / 1000; // calculate milliseconds
    return milliseconds;
}
#endif

esp_touch_handle_t esp_touch_init(touch_config_t *config)
{
    esp_touch_handle_t touch = calloc(1, sizeof(struct esp_touch));
    PERIPH_MEM_CHECK(TAG, touch, return NULL);

    if (config->touch_mask <= 0) {
        ESP_LOGE(TAG, "required at least 1 touch");
        return NULL;
    }

    touch->touch_mask = config->touch_mask;
    touch->long_tap_time_ms = config->long_tap_time_ms;
    touch->tap_threshold_percent = config->tap_threshold_percent ? config->tap_threshold_percent : DEFAULT_TOUCH_THRESHOLD_PERCENT;
    touch->tap_threshold_step = config->tap_threshold_step ? config->tap_threshold_step : DEFAULT_TAP_THRESHOLD_STEP;
    touch->tap_threshold_min_diff = config->tap_threshold_min_diff ? config->tap_threshold_min_diff : DEFAULT_TAP_THRESHOLD_MIN_DIFF;
    ESP_LOGE(TAG, "Tap percent: %f, step: %d, min_diff: %d", touch->tap_threshold_percent, \
                                                            touch->tap_threshold_step, \
                                                            touch->tap_threshold_min_diff);
    touch->slide_window = config->slide_window;
    touch->n_sample_accept = config->n_sample_accept;

    if (touch->slide_window == 0) {
        touch->slide_window = DEFAULT_SLIDE_WINDOW;
    }

    if (touch->long_tap_time_ms == 0) {
        touch->long_tap_time_ms = DEFAULT_LONG_TAP_TIME_MS;
    }

    if (touch->tap_threshold_percent < 0) {
        touch->tap_threshold_percent = DEFAULT_TOUCH_THRESHOLD_PERCENT;
    }

    if (touch->n_sample_accept == 0) {
        touch->n_sample_accept = DEFAULT_N_SAMPLE_ACCEPT;
    }

    bool _success = (touch_pad_init() == ESP_OK);

    PERIPH_MEM_CHECK(TAG, _success, {
        free(touch);
        return NULL;
    });

    int interval_sample_ms = config->interval_samples_ms;
    if (interval_sample_ms == 0) {
        interval_sample_ms = 10;
    }

    int sleep_cycle = rtc_clk_slow_freq_get_hz() * interval_sample_ms / 1000;

    touch_pad_set_fsm_mode(TOUCH_FSM_MODE_TIMER);
    touch_pad_set_voltage(TOUCH_HVOLT_2V4, TOUCH_LVOLT_0V8, TOUCH_HVOLT_ATTEN_1V5);
    touch_pad_set_meas_time(sleep_cycle/*271*10*/, 0xFFFF);//0x7fff //100 millisec total

    int touch_mask = touch->touch_mask;
    int touch_num = 0;
    int touch_index = 0;
    STAILQ_INIT(&touch->touch_list);
    while (touch_mask) {
        if (touch_mask & 0x01) {
            ESP_LOGD(TAG, "Mask = %x, current_mask = %x, idx=%d", touch->touch_mask, touch_mask, touch_num);
            esp_touch_item_t *new_touch = calloc(1, sizeof(esp_touch_item_t));
            PERIPH_MEM_CHECK(TAG, new_touch, {
                esp_touch_destroy(touch);
                free(touch);
                return NULL;
            });
            new_touch->touch_num = touch_num;
            new_touch->average = 0;
            new_touch->sum = 0;
            new_touch->flag_touched = false;
            new_touch->is_calib = false;
            new_touch->lower = MAX_TOUCH_VALUE;
            new_touch->kf_handle = kalman_filter_init(10, 10, 0.1);
            new_touch->touched_counter = 0;
            new_touch->request_calib = false;
            touch_pad_config(touch_num, 0);
            touch_pad_set_cnt_mode(touch_num, TOUCH_PAD_SLOPE_7, TOUCH_PAD_TIE_OPT_HIGH);
            STAILQ_INSERT_TAIL(&touch->touch_list, new_touch, entry);
            touch_index ++;
        }
        touch_mask >>= 1;
        touch_num ++;
    }
    return touch;
}

#ifdef PRINT_TOUCH_MONITOR_DEBUG
int log_touch1 = 0;
int log_touch2 = 0;
int log_touch3 = 0;
int log_touch4 = 0;

int log_thres1 = 0;
int log_thres2 = 0;
int log_thres3 = 0;
int log_thres4 = 0;

int log_raw1 = 0;
int log_raw2 = 0;
int log_raw3 = 0;
int log_raw4 = 0;
#endif

static touch_status_t touch_get_state(esp_touch_handle_t touch, esp_touch_item_t *touch_item, long long tick)
{
    static uint16_t touch_val;
    esp_err_t err = touch_pad_read(touch_item->touch_num, &touch_val);
    if (err != ESP_OK) {
        return TOUCH_UNCHANGE;
    }
#ifdef PRINT_TOUCH_MONITOR_DEBUG
    int log_raw = touch_val;
#endif
    touch_val = (uint16_t)update_estimate(touch_item->kf_handle, touch_val);
    // Calib
    if (!touch_item->is_calib) {
        if (touch_item->request_calib) {
                touch_item->sum = 0;
                touch_item->counter = 0;
                touch_item->average = 0;
                touch_item->lower = MAX_TOUCH_VALUE;
                ESP_LOGE(TAG, "Request calib touch %d", touch_item->touch_num);
                touch_item->request_calib = false;
            }
        if (touch_item->counter < touch->slide_window) {
            if (touch_item->counter > 0 && touch_item->sum / touch_item->counter - touch_item->lower > MAX_DELTA_UNTOUCH_VALUE) {
                touch_item->sum = 0;
                touch_item->counter = 0;
                touch_item->average = 0;
                touch_item->lower = MAX_TOUCH_VALUE;
                ESP_LOGE(TAG, "Calib touch %d was noise", touch_item->touch_num);
                return TOUCH_UNCHANGE;
            }
            if (touch_item->lower > touch_val) {
                touch_item->lower = touch_val;
            }
            touch_item->saved_value[touch_item->counter] = touch_val;
            touch_item->counter++;
            touch_item->sum += touch_val;
            return TOUCH_UNCHANGE;
        } else {
            touch_item->is_calib = true;
            return TOUCH_UNCHANGE;
        }
    }
    // Get avg
    touch_item->sum = 0;
    for (int i = 0; i < touch_item->counter; i++) {
        touch_item->sum += touch_item->saved_value[i];
    }
    touch_item->average = touch_item->sum / touch_item->counter;
    // Get threshold
    int thres = touch_item->average - (100 - touch->tap_threshold_percent) * touch->tap_threshold_step - touch->tap_threshold_min_diff;
#ifdef PRINT_TOUCH_MONITOR_DEBUG
    int log_thres = thres;
#endif
    if (touch_val > thres) { // untouch
        uint16_t value;
        if (touch_val > touch_item->average + 50 * touch->tap_threshold_step) {
            value = touch_item->average + 50 * touch->tap_threshold_step;
        } else {
            value = touch_val;
        }
        if (touch_item->counter >= touch->slide_window) {
            for (int i = 0; i < touch_item->counter - 1; i++) {
                touch_item->saved_value[i] = touch_item->saved_value[i+1];
            }
            touch_item->saved_value[touch_item->counter - 1] = value;
        } else {
            touch_item->saved_value[touch_item->counter] = value;
            touch_item->counter++;
        }
        touch_item->touched = false;
        touch_item->touched_counter = 0;
        touch_item->lower = value;
    } else {
        int temp = touch_item->counter;
        for (int i = touch_item->counter - 1; i >= 1; i--) {
            touch_item->sum = touch_item->sum - touch_item->saved_value[i];
            touch_item->average = touch_item->sum / i;
            if (touch_item->saved_value[i] < touch_item->average) {
                temp = i;
            } else {
                break;
            }
        }
        touch_item->counter = temp;
        touch_item->touched_counter++;
        touch_item->touched = (touch_item->touched_counter >= touch->n_sample_accept);
        touch_item->lower = touch_val < touch_item->lower ? touch_val : touch_item->lower;
    }
#ifdef PRINT_TOUCH_MONITOR_DEBUG
    if (touch_item->touch_num == 6) {
        log_touch1 = touch_val - 15000;
        log_thres1 = log_thres - 15000;
        log_raw1 = log_raw - 15000;
    }
    if (touch_item->touch_num == 3) {
        log_touch1 = touch_val;
        log_thres1 = log_thres;
        log_raw1 = log_raw;
    }
    if (touch_item->touch_num == 7) {
        log_touch2 = touch_val - 10000;
        log_thres2 = log_thres - 10000;
        log_raw2 = log_raw - 10000;
    }
    if (touch_item->touch_num == 8) {
        log_touch3 = touch_val - 5000;
        log_thres3 = log_thres - 5000;
        log_raw3 = log_raw - 5000;
    }
    if (touch_item->touch_num == 9) {
        log_touch4 = touch_val;
        log_thres4 = log_thres;
        log_raw4 = log_raw;
        // printf("touch: %d, thres: %d, raw: %d\n", log_touch4, log_thres4, log_raw4);
    }
#endif
    if (touch_item->last_tap_tick == 0 && touch_item->touched) {
        touch_item->last_tap_tick = tick_get();
        touch_item->long_tapped = false;
        ESP_LOGD(TAG, "TOUCH_TAPPED");
        return TOUCH_TAP;
    }

    if (!touch_item->touched && touch_item->last_tap_tick && tick_get() - touch_item->last_tap_tick > touch->long_tap_time_ms) {
        touch_item->last_tap_tick = 0;
        touch_item->long_tapped = false;
        ESP_LOGD(TAG, "TOUCH_LONG_RELEASE");
        return TOUCH_LONG_RELEASE;
    }

    if (!touch_item->touched && touch_item->last_tap_tick) {
        touch_item->last_tap_tick = 0;
        touch_item->long_tapped = false;
        ESP_LOGD(TAG, "TOUCH_RELEASE");
        return TOUCH_RELEASE;
    }

    if (touch_item->long_tapped == false && touch_item->touched && tick_get() - touch_item->last_tap_tick > touch->long_tap_time_ms) {
        touch_item->long_tapped = true;
        touch_item->request_calib = true;
        touch_item->is_calib = false;
        ESP_LOGD(TAG, "TOUCH_LONG_TAP");
        return TOUCH_LONG_TAP;
    }
    return TOUCH_UNCHANGE;
}

bool esp_touch_read(esp_touch_handle_t touch, touch_result_t *result)
{
    esp_touch_item_t *touch_item;
    touch_status_t touch_status;
    bool changed = false;
    memset(result, 0, sizeof(touch_result_t));
    int tmp;
    long long tick = tick_get();
    STAILQ_FOREACH(touch_item, &touch->touch_list, entry) {
        touch_status = touch_get_state(touch, touch_item, tick);
        switch (touch_status) {
            case TOUCH_UNCHANGE:
                break;
            case TOUCH_TAP:
                changed = true;
                tmp = 0x01;
                tmp <<= touch_item->touch_num;
                result->tap_mask |= tmp;
                break;
            case TOUCH_RELEASE:
                changed = true;
                tmp = 0x01;
                tmp <<= touch_item->touch_num;
                result->release_mask |=  tmp;
                break;
            case TOUCH_LONG_RELEASE:
                changed = true;
                tmp = 0x01;
                tmp <<= touch_item->touch_num;
                result->long_release_mask |=  tmp;
                break;
            case TOUCH_LONG_TAP:
                changed = true;
                tmp = 0x01;
                tmp <<= touch_item->touch_num;
                result->long_tap_mask |=  tmp;
                break;
        }
    }
#ifdef PRINT_TOUCH_MONITOR_DEBUG
    ESP_LOGI(TAG, "log_touch1: %d, log_touch2: %d, log_touch3: %d, log_touch4: %d, log_thres1: %d, log_thres2: %d, log_thres3: %d, log_thres4: %d, raw1: %d, raw2: %d, raw3: %d, raw4: %d\n",
    log_touch1, log_touch2, log_touch3, log_touch4, log_thres1, log_thres2, log_thres3, log_thres4, log_raw1, log_raw2, log_raw3, log_raw4);
#endif
    return changed;
}

esp_err_t esp_touch_destroy(esp_touch_handle_t touch)
{
    esp_touch_item_t *touch_item, *tmp;
    STAILQ_FOREACH_SAFE(touch_item, &touch->touch_list, entry, tmp) {
        STAILQ_REMOVE(&touch->touch_list, touch_item, esp_touch_item, entry);
        free(touch_item);
    }
    touch_pad_deinit();
    free(touch);
    return ESP_OK;
}

esp_err_t esp_touch_set_sensitive(esp_touch_handle_t touch, int sensitive, uint8_t n_accept_touch)
{
    if (touch == NULL) {
        return ESP_FAIL;
    }
    if (sensitive > 100) {
        sensitive = 100;
    } else if (sensitive < 0) {
        sensitive = 0;
    }
    if (n_accept_touch < 3) {
        n_accept_touch = 3;
    } else if (n_accept_touch > 7) {
        n_accept_touch = 7;
    }
    ESP_LOGD(TAG, "Set touch sensitive %d", sensitive);
    touch->tap_threshold_percent = sensitive;
    touch->n_sample_accept = n_accept_touch;
    return ESP_OK;
}
