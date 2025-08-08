#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "esp_log.h"
#include "esp_system.h"

#include "esp_peripherals.h"
#include "periph_pir.h"
#include "driver/uart.h"
#include "driver/gpio.h"
#include "sdkconfig.h"
#include "driver/adc.h"

// #define ADC_SENSOR

#define ADC1_CHANNEL    5
#define DEFAULT_HIGH    2525
#define DEFAULT_LOW     0

static const char *TAG = "PERIPH_PIR";

typedef struct {
    uint8_t sensor_pin;
    uint8_t led_pin;
    int time_delay;
    bool enable_led;
    bool run;
    bool active_high;
    int sensor_state;
    int touch_handle_state;
    int disable_time_ms;
} periph_pir_t;

void _pir_task(void *pv)
{
    esp_periph_handle_t self = pv;
    periph_pir_t *pir_handle = esp_periph_get_data(self);
    int pre_state = -1;
    int state = 0;
    int sensor_level = 0;
    uint64_t tick_counter = xTaskGetTickCount();
    pir_handle->touch_handle_state = 0;
    pir_handle->disable_time_ms = 0;
    bool force_turn_on = false;
#ifdef ADC_SENSOR
    int high_thres = DEFAULT_HIGH;
    int low_thres = DEFAULT_LOW;
#endif
    while (pir_handle->run) {
        if (pir_handle->disable_time_ms > 0) {
            vTaskDelay(pir_handle->disable_time_ms / portTICK_PERIOD_MS);
            pir_handle->disable_time_ms = 0;
        }
        if (!force_turn_on) {
#ifndef ADC_SENSOR
            sensor_level = gpio_get_level(pir_handle->sensor_pin);
#else
            int value = adc1_get_voltage(ADC1_CHANNEL);
            if (value > high_thres && high_thres < 3300) {
                high_thres = value;
            }
            if (value < (high_thres - low_thres)*0.3 || value > (high_thres - low_thres)*0.7) {
                sensor_level = 1;
            } else {
                sensor_level = 0;
            }
#endif
        } else {
            sensor_level = 1;
            force_turn_on = false;
        }
        if (sensor_level == 1) {
            state = 1;
            tick_counter = xTaskGetTickCount();
        } else if ((xTaskGetTickCount() - tick_counter) * portTICK_PERIOD_MS > pir_handle->time_delay) {
            state = 0;
        }
        if (state != pre_state) {
            ESP_LOGD(TAG, "Detect: %s", state == 1 ? "true" : "false");
            pre_state = state;
            esp_periph_send_event(self, PIR_EVENT_UPDATE_STATUS, &state, sizeof(int));
            pir_handle->touch_handle_state = state;
            pir_handle->sensor_state = state;
            if (pir_handle->enable_led) {
                gpio_set_level(pir_handle->led_pin, state);
            }
        } else {
            if (sensor_level == 1 && pir_handle->touch_handle_state == 0) { // In case turned off light and sensor still detected
                esp_periph_send_event(self, PIR_EVENT_UPDATE_STATUS, &sensor_level, sizeof(int));
                pir_handle->touch_handle_state = sensor_level;
            }
            if (state == 0 && pir_handle->touch_handle_state == 1) {
                force_turn_on = true;
            }
        }
        vTaskDelay(100 / portTICK_PERIOD_MS);
    }
    vTaskDelete(NULL);
}

esp_err_t _pir_init(esp_periph_handle_t self)
{
    periph_pir_t* pir_handle = (periph_pir_t*)esp_periph_get_data(self);
#ifndef ADC_SENSOR
    // gpio_pad_select_gpio(pir_handle->sensor_pin);
    gpio_set_direction(pir_handle->sensor_pin, GPIO_MODE_INPUT);
    if (pir_handle->active_high) {
        gpio_set_pull_mode(pir_handle->sensor_pin, GPIO_PULLDOWN_ONLY);
    } else {
        gpio_set_pull_mode(pir_handle->sensor_pin, GPIO_PULLUP_ONLY);
    }
    if (pir_handle->enable_led) {
        // gpio_pad_select_gpio(pir_handle->led_pin);
        gpio_set_direction(pir_handle->led_pin, GPIO_MODE_OUTPUT);
    }
#else
    adc1_config_width(ADC_WIDTH_12Bit);
    adc1_config_channel_atten(ADC1_CHANNEL, ADC_ATTEN_11db);
#endif
    pir_handle->run = true;
    xTaskCreate(_pir_task, "_pir_task", 5 * 1024, self, 5, NULL);
    return ESP_OK;
}

esp_err_t _pir_run(esp_periph_handle_t self, audio_event_iface_msg_t *msg)
{
    return ESP_OK;
}

esp_err_t _pir_destroy(esp_periph_handle_t self)
{
    periph_pir_t *periph_pir = esp_periph_get_data(self);
    free(periph_pir);
    return ESP_OK;
}

esp_periph_handle_t periph_pir_init(periph_pir_cfg_t* pir_cfg)
{
    esp_periph_handle_t periph = esp_periph_create(PERIPH_ID_PIR, "periph_pir");
    PERIPH_MEM_CHECK(TAG, periph, return NULL);

    periph_pir_t *periph_pir = calloc(1, sizeof(periph_pir_t));
    PERIPH_MEM_CHECK(TAG, periph_pir, goto _pir_config_fail);

    periph_pir->led_pin = pir_cfg->led_pin;
    periph_pir->sensor_pin = pir_cfg->sensor_pin;
    periph_pir->time_delay = pir_cfg->time_delay;
    periph_pir->enable_led = pir_cfg->enable_led;
    periph_pir->active_high = pir_cfg->active_high;

    esp_periph_set_data(periph, periph_pir);
    esp_periph_set_function(periph, _pir_init, _pir_run, _pir_destroy);
    return periph;
_pir_config_fail:
    ESP_LOGE(TAG, "Failed to initial PIR");
    free(periph);
    return NULL;
}

esp_err_t periph_pir_destroy(esp_periph_handle_t handle)
{
    // TODO: stop pir task and release memory.
    return ESP_OK;
}

int periph_pir_get_sensor_state(esp_periph_handle_t handle)
{
    periph_pir_t* pir_handle = (periph_pir_t*)esp_periph_get_data(handle);
    return pir_handle->sensor_state;
}

esp_err_t periph_pir_set_touch_handle_state(esp_periph_handle_t handle, int state, int disable_time_ms)
{
    periph_pir_t* pir_handle = (periph_pir_t*)esp_periph_get_data(handle);
    if (pir_handle == NULL) {
        return ESP_FAIL;
    }
    if (pir_handle->touch_handle_state != state) {
        pir_handle->touch_handle_state = state;
        pir_handle->disable_time_ms = disable_time_ms;
    }
    return ESP_OK;
}

esp_err_t periph_pir_set_time_delay(esp_periph_handle_t handle, int time_ms)
{
    periph_pir_t* pir_handle = (periph_pir_t*)esp_periph_get_data(handle);
    if (pir_handle == NULL) {
        return ESP_FAIL;
    }
    pir_handle->time_delay = time_ms;
    return ESP_OK;
}
