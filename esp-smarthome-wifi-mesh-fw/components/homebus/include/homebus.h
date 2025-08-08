/*
 * This file is subject to the terms of the SunshineTech License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *                             ./LICENSE
 */
#ifndef _HOME_BUS_
#define _HOME_BUS_

#include "freertos/FreeRTOS.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef enum {
	PARITY_NONE = 0,
	PARITY_ODD = 1,
	PARITY_EVEN = 2
} homebus_parity_t;

typedef struct {
    int tx_pin;
    int tx_channel;
    int rx_pin;
    int rx_channel;

    int baudrate;
    float stop_bit; //
    int parity; //0, 1, 2
} homebus_config_t;

esp_err_t homebus_init(homebus_config_t *hb_config);

esp_err_t homebus_write(uint8_t *data, int len, TickType_t timeout);

#ifdef __cplusplus
}
#endif

#endif