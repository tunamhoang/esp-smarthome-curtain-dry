#ifndef _VL6180_H
#define _VL6180_H

#include "freertos/FreeRTOS.h"
#include "esp_err.h"
#include "driver/i2c.h"

#define VL6180X_ALS_GAIN_1      0x06 ///< 1x gain
#define VL6180X_ALS_GAIN_1_25   0x05 ///< 1.25x gain
#define VL6180X_ALS_GAIN_1_67   0x04 ///< 1.67x gain
#define VL6180X_ALS_GAIN_2_5    0x03 ///< 2.5x gain
#define VL6180X_ALS_GAIN_5      0x02 ///< 5x gain
#define VL6180X_ALS_GAIN_10     0x01 ///< 10x gain
#define VL6180X_ALS_GAIN_20     0x00 ///< 20x gain
#define VL6180X_ALS_GAIN_40     0x07 ///< 40x gain

#define VL6180X_ERROR_NONE          0 ///< Success!
#define VL6180X_ERROR_SYSERR_1      1 ///< System error
#define VL6180X_ERROR_SYSERR_5      5 ///< Sysem error
#define VL6180X_ERROR_ECEFAIL       6 ///< Early convergence estimate fail
#define VL6180X_ERROR_NOCONVERGE    7 ///< No target detected
#define VL6180X_ERROR_RANGEIGNORE   8 ///< Ignore threshold check failed
#define VL6180X_ERROR_SNR           11 ///< Ambient conditions too high
#define VL6180X_ERROR_RAWUFLOW      12 ///< Raw range algo underflow
#define VL6180X_ERROR_RAWOFLOW      13 ///< Raw range algo overflow
#define VL6180X_ERROR_RANGEUFLOW    14 ///< Raw range algo underflow
#define VL6180X_ERROR_RANGEOFLOW    15 ///< Raw range algo overflow


typedef struct vl6180_* vl6180_handle_t;

typedef struct {
    gpio_num_t sda_pin;
    gpio_num_t scl_pin;
    i2c_port_t i2c_port;
    uint8_t device_addr;
} vl6180_cfg_t;

vl6180_handle_t vl6180_init(vl6180_cfg_t* vl6180_cfg);
esp_err_t vl6180_start(vl6180_handle_t handle);
esp_err_t vl6180_deinit(vl6180_handle_t vl6180_handle);

uint8_t vl6180_get_addr(vl6180_handle_t handle);
esp_err_t vl6180_set_addr(vl6180_handle_t handle, uint8_t new_addr);
esp_err_t vl6180_get_range(vl6180_handle_t handle, uint8_t* range);
bool vl6180_start_range(vl6180_handle_t handle);
bool vl6180_is_range_complete(vl6180_handle_t handle);
bool vl6180_waiting_range_complete(vl6180_handle_t handle);
esp_err_t vl6180_start_range_continuous(vl6180_handle_t handle, uint16_t period_ms);
esp_err_t vl6180_stop_range_continuous(vl6180_handle_t handle);
uint8_t vl6180_read_range_status(vl6180_handle_t handle);
esp_err_t vl6180_get_lux(vl6180_handle_t handle, uint8_t gain, float* lux);
esp_err_t vl6180_offset_calib(vl6180_handle_t handle, int8_t offset);
esp_err_t vl6180_cross_talk_set(vl6180_handle_t handle, uint16_t crosstalk);
esp_err_t vl6180_cross_talk_calib(vl6180_handle_t handle);
esp_err_t vl6180_range_ignore(vl6180_handle_t handle, uint8_t ignore);

#endif
