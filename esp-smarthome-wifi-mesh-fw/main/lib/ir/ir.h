#ifndef _IR_H
#define _IR_H

#include "esp_err.h"


uint8_t _set_bit(uint8_t data, uint8_t pos_start, uint8_t pos_stop, uint8_t mask);
esp_err_t _make_rmt_item(rmt_item32_t *item32, uint32_t duration0, uint32_t duration1);
esp_err_t _make_space(rmt_item32_t *item32, uint32_t duration0, uint32_t duration1);
int create_remote_send_samsung(rmt_item32_t *items, bool power, int temp, int mode, int fan, bool swingH, bool swingV);
int create_remote_send_daikin(rmt_item32_t *items, bool power, int temp, int mode, int fan, bool swingH, bool swingV);
int create_remote_send_daikin2(rmt_item32_t *items, bool power, int temp, int mode, int fan, bool swingH, bool swingV);
int create_remote_send_daikin216(rmt_item32_t *items, bool power, int temp, int mode, int fan, bool swingH, bool swingV);
int create_remote_send_daikin160(rmt_item32_t *items, bool power, int temp, int mode, int fan, bool swingH, bool swingV);
int create_remote_send_daikin176(rmt_item32_t *items, bool power, int temp, int mode, int fan, bool swingH, bool swingV);
int create_remote_send_daikin128(rmt_item32_t *items, bool power, int temp, int mode, int fan, bool swingH, bool swingV);
int create_remote_send_daikin64(rmt_item32_t *items, bool power, int temp, int mode, int fan, bool swingH, bool swingV);

#endif
