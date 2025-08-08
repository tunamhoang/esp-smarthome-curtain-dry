#ifndef _ESP_HTU21DF_H
#define _ESP_HTU21DF_H

#include "freertos/FreeRTOS.h"
#include "esp_err.h"
#include "driver/i2c.h"

typedef struct esp_htu21df_* esp_htu21df_handle_t;

typedef struct {
    gpio_num_t  sda_pin;
    gpio_num_t  scl_pin;
    i2c_port_t  port_num;
} esp_htu21df_config_t;

esp_htu21df_handle_t esp_htu21df_init(esp_htu21df_config_t* htu_config);
esp_err_t esp_htu21df_start(esp_htu21df_handle_t htu_handle);
esp_err_t esp_htu21df_read_temperature(esp_htu21df_handle_t htu_handle, float* value);
esp_err_t esp_htu21df_read_humidity(esp_htu21df_handle_t htu_handle, float* value);
esp_err_t esp_htu21df_reset(esp_htu21df_handle_t htu_handle);

#endif /* _ESP_HTU21DF_H */
