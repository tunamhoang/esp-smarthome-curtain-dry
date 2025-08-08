#ifndef _ESP_SX8636_H
#define _ESP_SX8636_H

#include "freertos/FreeRTOS.h"
#include "esp_err.h"
#include "driver/i2c.h"

#define SX8636_MIN_SENSITIVITY  (0)
#define SX8636_MAX_SENSITIVITY  (100)

typedef struct esp_sx8636_* esp_sx8636_handle_t;

typedef enum {
    ESP_SX8636_EVENT_NONE = 0,
    ESP_SX8636_EVENT_TOUCH,
    ESP_SX8636_EVENT_RELEASE,
    ESP_SX8636_EVENT_LONG_PRESS,
    ESP_SX8636_EVENT_RELEASE_LONG_PRESS,
} esp_sx8636_event_type_t;

typedef struct {
    int tap_mask;
    int release_mask;
    int long_tap_mask;
    int long_release_mask;
} esp_sx8636_touch_result_t;

typedef esp_err_t (*callback_func_t)(void* arg, esp_sx8636_touch_result_t* data);

typedef struct {
    gpio_num_t          sda_pin;
    gpio_num_t          scl_pin;
    gpio_num_t          int_pin;
    i2c_port_t          port_num;
    uint8_t             touch_enable_mask;
    callback_func_t     on_event;
    void*               on_event_arg;
    int                 long_tap_time_ms;
    int                 sensitive;
} esp_sx8636_config_t;

esp_sx8636_handle_t esp_sx8636_init(esp_sx8636_config_t* sx8636_config);

esp_err_t esp_sx8636_start(esp_sx8636_handle_t sx8636_handle);

esp_err_t esp_sx8636_set_full_threshold(esp_sx8636_handle_t sx8636_handle, int sensitive_percent); // 0 - 100

esp_err_t esp_sx8636_set_full_sensitivity(esp_sx8636_handle_t sx8636_handle, int sensitive_percent);

esp_err_t esp_sx8636_deinit(esp_sx8636_handle_t sx8636);

esp_err_t esp_sx8636_reset(esp_sx8636_handle_t sx_handle);

#endif
