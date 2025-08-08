#ifndef _PCF8551A_H
#define _PCF8551A_H

#include "freertos/FreeRTOS.h"
#include "esp_err.h"
#include "driver/i2c.h"

typedef enum {
    PCF8551A_PORT_COM0 = 0,
    PCF8551A_PORT_COM1,
    PCF8551A_PORT_COM2,
    PCF8551A_PORT_COM3
} pcf8551a_com_port_t;

typedef struct pcf8551a_* pcf8551a_handle_t;

typedef struct {
    gpio_num_t sda_pin;
    gpio_num_t scl_pin;
    i2c_port_t i2c_port;
    uint8_t device_addr;
} pcf8551a_cfg_t;

pcf8551a_handle_t pcf8551a_init(pcf8551a_cfg_t* pcf_cfg);
esp_err_t pcf8551a_start(pcf8551a_handle_t pcf_handle);
esp_err_t pcf8551a_display(pcf8551a_handle_t pcf_handle, uint8_t* data, uint8_t data_sz);
// esp_err_t pcf8551a_backlight_on(pcf8551a_handle_t pcf_handle);
// esp_err_t pcf8551a_backlight_off(pcf8551a_handle_t pcf_handle);
esp_err_t pcf8551a_display_on(pcf8551a_handle_t pcf_handle);
esp_err_t pcf8551a_display_off(pcf8551a_handle_t pcf_handle);
esp_err_t pcf8551a_software_rst(pcf8551a_handle_t pcf_handle);

esp_err_t pcf8551a_deinit(pcf8551a_handle_t sx8636);

#endif
