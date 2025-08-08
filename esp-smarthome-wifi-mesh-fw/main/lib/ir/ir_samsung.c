/*
 * This file is subject to the terms of the SunshineTech License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *                             ./LICENSE
 */
#include "app_config.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "esp_log.h"
#include "esp_system.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "periph_remote.h"
#include "tct_template.h"

#include "driver/rmt.h"
#include "driver/periph_ctrl.h"
#include "soc/rmt_reg.h"
#include "ir.h"

static const char* TAG = "IR_SAMSUNG";

#define GET_BIT(data, bit) ((((data) >> bit) & 1) ? 1 : 0)

#define GETBITS8(data, offset, size) \
    (((data) & (((uint8_t)UINT8_MAX >> (8 - (size))) << (offset))) >> (offset))


// SamsungAC
static uint8_t samsung_data[14] = { 0x02, 0x92, 0x0F, 0x00, 0x00, 0x00, 0xF0,
                                    0x01, 0x02, 0xAE, 0x71, 0x00, 0x15, 0xF0};

static uint8_t map_mode_samsungac[5] = {0, 1, 4, 2, 3};
static uint8_t map_fan_samsungac[4] = {0, 2, 4, 5};
static uint8_t map_swing_samsungac[4] = {0x70, 0x20, 0x30, 0x40};

uint16_t _count_bit(uint8_t value)
{
    unsigned int count = 0;
    while (value) {
        count += value & 1;
        value >>= 1;
    }
    return count;
}

uint16_t _count_bits(uint8_t *value, uint8_t num)
{
    unsigned int count = 0;
    for (int i = 0; i < num; i++) {
        count += _count_bit(*(value + i));
    }
    return count;
}

static uint8_t _calc_checksum_samsungac(uint8_t *section) {
    uint8_t sum = 0;
    if (section == NULL) {
        ESP_LOGE(TAG, "-----------------------");
    }
    sum += _count_bit(*section);
    sum += _count_bit(GETBITS8(*(section + 1), 0, 4));
    sum += _count_bit(GETBITS8(*(section + 2), 4, 4));
    sum += _count_bits(section + 3, 4);
    return sum ^ UINT8_MAX;
}

int create_remote_send_samsung(rmt_item32_t *items, bool power, int temp, int mode, int fan, bool swingH, bool swingV)
{
    ESP_LOGI(TAG, "send_samsung power %d, temp %d, mode %d, fan %d, swingH %d, swingV %d", power, temp, mode, fan, swingH, swingV);
    uint8_t swing = 0x00 | (swingH << 1) | swingV;
    samsung_data[9] = _set_bit(samsung_data[9], 4, 6, map_swing_samsungac[swing]);
    if (power) {
        samsung_data[6] = _set_bit(samsung_data[6], 4, 5, 0x30);
        samsung_data[13] = _set_bit(samsung_data[13], 4, 5, 0x30);
    } else {
        samsung_data[6] = _set_bit(samsung_data[6], 4, 5, 0x00);
        samsung_data[13] = _set_bit(samsung_data[13], 4, 5, 0x00);
    }

    samsung_data[12] = _set_bit(samsung_data[12], 4, 6, map_mode_samsungac[mode] << 4);
    samsung_data[12] = _set_bit(samsung_data[12], 1, 3, map_fan_samsungac[fan] << 1);

    uint8_t newtemp = (16 > temp) ? 16 : temp;
    newtemp = (30 < temp) ? 30 : temp;
    newtemp = newtemp - 16;
    samsung_data[11] = _set_bit(samsung_data[11], 4, 7, newtemp << 4);

    samsung_data[13] |= BIT2;

    uint8_t sectionsum = _calc_checksum_samsungac(samsung_data);
    samsung_data[1] = _set_bit(samsung_data[1], 4, 7, GETBITS8(sectionsum, 0, 4) << 4);
    samsung_data[2] = _set_bit(samsung_data[2], 0, 3, GETBITS8(sectionsum, 4, 4));
    sectionsum = _calc_checksum_samsungac(samsung_data + 7);
    samsung_data[8] = _set_bit(samsung_data[8], 4, 7, GETBITS8(sectionsum, 0, 4) << 4);
    samsung_data[9] = _set_bit(samsung_data[9], 0, 3, GETBITS8(sectionsum, 4, 4));

    int offset = 0;
    _make_rmt_item(items + offset++, 690, 17844);
    _make_rmt_item(items + offset++, 3086, 8864);
    for (int x = 0; x < 7; x++) {
        for (int y = 0; y < 8; y++) {
            if (GET_BIT(samsung_data[x], y)) {
                _make_rmt_item(items + offset++, 586, 1432);
            } else {
                _make_rmt_item(items + offset++, 586, 436);
            }
        }
    }
    _make_rmt_item(items + offset++, 586, 2886);
    _make_rmt_item(items + offset++, 3086, 8864);
    for (int x = 7; x < 14; x++) {
        for (int y = 0; y < 8; y++) {
            if (GET_BIT(samsung_data[x], y)) {
                _make_rmt_item(items + offset++, 586, 1432);
            } else {
                _make_rmt_item(items + offset++, 586, 436);
            }
        }
    }
    _make_rmt_item(items + offset++, 586, 2886);
    return offset;
}
