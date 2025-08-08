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

static const char* TAG = "IR_DAIKIN";

#define GET_BIT(data, bit) ((((data) >> bit) & 1) ? 1 : 0)
// Daikin
static uint8_t daikin_data[35] = {  0x11, 0xDA, 0x27, 0x00, 0xC5, 0x00, 0x00, 0xD7,
                                    0x11, 0xDA, 0x27, 0x00, 0x42, 0x00, 0x00, 0x20,
                                    0x11, 0xDA, 0x27, 0x00, 0x00, 0x41, 0x1E, 0x00,
                                    0xB0, 0x00, 0x00, 0x06, 0x60, 0x00, 0x00, 0xC0,
                                    0x00, 0x00, 0xE3};
static uint8_t map_mode_daikin[5] = {0, 3, 4, 2, 6};
static uint8_t map_fan_daikin[4] = {10, 3, 5, 7};

// Daikin2
static uint8_t daikin2_data[39] = { 0x11, 0xDA, 0x27, 0x00, 0x01, 0x00, 0xC0, 0x70,
                                    0x08, 0x0C, 0x80, 0x04, 0xB0, 0x16, 0x24, 0x00,
                                    0x00, 0xBE, 0xD0, 0x00, 0x11, 0xDA, 0x27, 0x00,
                                    0x00, 0x08, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x06,
                                    0x60, 0x00, 0x00, 0xC1, 0x80, 0x60, 0x00};

// Daikin216
static uint8_t daikin216_data[27] = {   0x11, 0xDA, 0x27, 0xF0, 0x00, 0x00, 0x00, 0x00,
                                        0x11, 0xDA, 0x27, 0x00, 0x00, 0x00, 0x00, 0x00,
                                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0,
                                        0x00, 0x00, 0x00};

// Daikin160
static uint8_t daikin160_data[20] = {   0x11, 0xDA, 0x27, 0xF0, 0x0D, 0x00, 0x00, 0x11,
                                        0xDA, 0x27, 0x00, 0xD3, 0x30, 0x11, 0x00, 0x00,
                                        0x1E, 0x0A, 0x08, 0x00};
static uint8_t daikin176_data[22] = {   0x11, 0xDA, 0x17, 0x18, 0x04, 0x00, 0x00, 0x11,
                                        0xDA, 0x17, 0x18, 0x00, 0x73, 0x00, 0x20, 0x00,
                                        0x00, 0x00, 0x16, 0x00, 0x20, 0x00};
static uint8_t map_mode_daikin176[5] = {3, 2, 1, 7, 0};
static uint8_t map_fan_daikin176[4] = {3, 1, 3, 3};

// Daikin128
static uint8_t daikin128_data[16] = {   0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04,
                                        0xA1, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
static uint8_t map_mode_daikin128[5] = {10, 2, 8, 1, 4};
static uint8_t map_fan_daikin128[4] = {1, 8, 4, 2};

// Daikin152
static uint8_t daikin152_data[19] = {   0x11, 0xDA, 0x27, 0x00, 0x00, 0x00, 0x00, 0x00,
                                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC5,
                                        0x00, 0x00, 0x00};
static uint8_t map_fan_daikin152[4] = {10, 3, 3, 7};

// Daikin64
static uint8_t daikin64_data[8] = { 0x16, 0x42, 0x20, 0x07, 0x16, 0x16, 0x16, 0x7C};
static uint8_t map_mode_daikin64[5] = {2, 2, 8, 1, 4};
static uint8_t map_fan_daikin64[4] = {1, 8, 4, 2};

static uint8_t _sum_bytes(uint8_t *value, uint16_t length) {
    uint8_t checksum = 0;
    for (int i = 0; i < length; i++) {
        checksum += *(value + i);
    }
    return checksum;
}

static uint8_t uint8_to_bcd(uint8_t integer) {
    if (integer > 99) return 255;
    return ((integer / 10) << 4) + (integer % 10);
}

static uint8_t sum_nibbles(uint8_t * const value, const uint16_t length, uint8_t one) {
    uint8_t sum = one;
    for (int i = 0; i < length; i++)
      sum += (*(value + i) >> 4) + (*(value + i) & 0xF);
    return sum;
}

int create_remote_send_daikin(rmt_item32_t *items, bool power, int temp, int mode, int fan, bool swingH, bool swingV)
{
    ESP_LOGI(TAG, "send_daikin power %d, temp %d, mode %d, fan %d, swingH %d, swingV %d", power, temp, mode, fan, swingH, swingV);
    daikin_data[24] = _set_bit(daikin_data[24], 0, 3, swingV ? 0xf0 : 0x00);
    daikin_data[25] = _set_bit(daikin_data[25], 0, 3, swingH ? 0xf0 : 0x00);

    daikin_data[21] = _set_bit(daikin_data[21], 0, 0, power ? 0x01 : 0x00);

    daikin_data[21] |= BIT3;
    daikin_data[21] = _set_bit(daikin_data[21], 4, 6, map_mode_daikin[mode] << 4);

    daikin_data[24] = _set_bit(daikin_data[24], 4, 7, map_fan_daikin[fan] << 4);

    uint8_t newtemp = (temp < 10) ? 10 : temp;
    newtemp = (temp > 32) ? 32 : temp;
    daikin_data[22] = _set_bit(daikin_data[22], 1, 7, newtemp << 1);

    daikin_data[7] = _sum_bytes(daikin_data, 7);
    daikin_data[15] = _sum_bytes(daikin_data + 8, 7);
    daikin_data[34] = _sum_bytes(daikin_data + 16, 18);

    int offset = 0;
    for (int i = 0; i < 5; i++) {
        _make_rmt_item(items + offset++, 428, 428);
    }
    _make_rmt_item(items + offset++, 428, 29428);
    _make_rmt_item(items + offset++, 3650, 1623);
    for (int x = 0; x < 8; x++) {
        for (int y = 0; y < 8; y++) {
            if (GET_BIT(daikin_data[x], y)) {
                _make_rmt_item(items + offset++, 428, 1280);
            } else {
                _make_rmt_item(items + offset++, 428, 428);
            }
        }
    }
    _make_rmt_item(items + offset++, 428, 29428);
    _make_rmt_item(items + offset++, 3650, 1623);
    for (int x = 8; x < 16; x++) {
        for (int y = 0; y < 8; y++) {
            if (GET_BIT(daikin_data[x], y)) {
                _make_rmt_item(items + offset++, 428, 1280);
            } else {
                _make_rmt_item(items + offset++, 428, 428);
            }
        }
    }
    _make_rmt_item(items + offset++, 428, 29428);
    _make_rmt_item(items + offset++, 3650, 1623);
    for (int x = 16; x < 35; x++) {
        for (int y = 0; y < 8; y++) {
            if (GET_BIT(daikin_data[x], y)) {
                _make_rmt_item(items + offset++, 428, 1280);
            } else {
                _make_rmt_item(items + offset++, 428, 428);
            }
        }
    }
    _make_rmt_item(items + offset++, 428, 29428);
    return offset;
}

int create_remote_send_daikin2(rmt_item32_t *items, bool power, int temp, int mode, int fan, bool swingH, bool swingV)
{
    ESP_LOGI(TAG, "send_daikin2 power %d, temp %d, mode %d, fan %d, swingH %d, swingV %d", power, temp, mode, fan, swingH, swingV);
    daikin2_data[17] = _set_bit(daikin2_data[17], 0, 7, swingV ? 0xbe : 0xbf);
    daikin2_data[18] = _set_bit(daikin2_data[18], 0, 3, swingH ? 0x0f : 0x0e);
    daikin2_data[6] = _set_bit(daikin2_data[6], 7, 7, (power ? 0x00 : 0x80));
    daikin2_data[25] = _set_bit(daikin2_data[25], 0, 0, power ? 0x01 : 0x00);

    daikin2_data[25] = _set_bit(daikin2_data[25], 4, 6, map_mode_daikin[mode] << 4);
    daikin2_data[28] = _set_bit(daikin2_data[28], 4, 7, map_fan_daikin[fan] << 4);

    uint8_t mintemp = (mode == 1) ? 18 : 10;
    uint8_t newtemp = (temp < mintemp) ? mintemp : temp;
    newtemp = (temp > 32) ? 32 : temp;
    daikin2_data[26] = _set_bit(daikin2_data[26], 1, 6, newtemp << 1);

    daikin2_data[19] = _sum_bytes(daikin2_data, 19);
    daikin2_data[38] = _sum_bytes(daikin2_data + 20, 18);

    int offset = 0;
    _make_rmt_item(items + offset++, 10024, 25180);
    _make_rmt_item(items + offset++, 3500, 1728);
    for (int x = 0; x < 20; x++) {
        for (int y = 0; y < 8; y++) {
            if (GET_BIT(daikin2_data[x], y)) {
                _make_rmt_item(items + offset++, 460, 1270);
            } else {
                _make_rmt_item(items + offset++, 460, 420);
            }
        }
    }
    _make_rmt_item(items + offset++, 460, 25204);
    _make_space(items + offset++, 5000, 5000);
    _make_rmt_item(items + offset++, 3500, 1728);
    for (int x = 20; x < 39; x++) {
        for (int y = 0; y < 8; y++) {
            if (GET_BIT(daikin2_data[x], y)) {
                _make_rmt_item(items + offset++, 460, 1270);
            } else {
                _make_rmt_item(items + offset++, 460, 420);
            }
        }
    }
    _make_rmt_item(items + offset++, 460, 25204);
    _make_space(items + offset++, 5000, 5000);
    return offset;
}

int create_remote_send_daikin216(rmt_item32_t *items, bool power, int temp, int mode, int fan, bool swingH, bool swingV)
{
    ESP_LOGI(TAG, "send_daikin216 power %d, temp %d, mode %d, fan %d, swingH %d, swingV %d", power, temp, mode, fan, swingH, swingV);
    daikin216_data[16] = _set_bit(daikin216_data[16], 0, 3, swingV ? 0x0f : 0x00);
    daikin216_data[17] = _set_bit(daikin216_data[17], 0, 3, swingH ? 0x0f : 0x00);
    daikin216_data[13] = _set_bit(daikin216_data[13], 0, 0, power ? 0x01 : 0x00);

    daikin216_data[13] = _set_bit(daikin216_data[13], 4, 6, map_mode_daikin[mode] << 4);
    daikin216_data[16] = _set_bit(daikin216_data[16], 4, 7, map_fan_daikin[fan] << 4);

    uint8_t newtemp = (temp < 10) ? 10 : temp;
    newtemp = (temp > 32) ? 32 : temp;
    daikin216_data[14] = _set_bit(daikin216_data[14], 1, 6, newtemp << 1);

    daikin216_data[7] = _sum_bytes(daikin216_data, 7);
    daikin216_data[26] = _sum_bytes(daikin216_data + 8, 18);

    int offset = 0;
    _make_rmt_item(items + offset++, 3440, 1750);
    for (int x = 0; x < 8; x++) {
        for (int y = 0; y < 8; y++) {
            if (GET_BIT(daikin216_data[x], y)) {
                _make_rmt_item(items + offset++, 420, 1300);
            } else {
                _make_rmt_item(items + offset++, 420, 450);
            }
        }
    }
    _make_rmt_item(items + offset++, 420, 29650);
    _make_rmt_item(items + offset++, 3440, 1750);
    for (int x = 8; x < 27; x++) {
        for (int y = 0; y < 8; y++) {
            if (GET_BIT(daikin216_data[x], y)) {
                _make_rmt_item(items + offset++, 420, 1300);
            } else {
                _make_rmt_item(items + offset++, 420, 450);
            }
        }
    }
    _make_rmt_item(items + offset++, 420, 29650);

    return offset;
}

int create_remote_send_daikin160(rmt_item32_t *items, bool power, int temp, int mode, int fan, bool swingH, bool swingV)
{
    ESP_LOGI(TAG, "send_daikin160 power %d, temp %d, mode %d, fan %d, swingH %d, swingV %d", power, temp, mode, fan, swingH, swingV);
    daikin160_data[13] = _set_bit(daikin160_data[13], 4, 7, swingV ? 0xf0 : 0x10);

    daikin160_data[12] = _set_bit(daikin160_data[12], 0, 0, power ? 0x01 : 0x00);

    daikin160_data[12] = _set_bit(daikin160_data[12], 4, 6, map_mode_daikin[mode] << 4);
    daikin160_data[17] = _set_bit(daikin160_data[17], 0, 3, map_fan_daikin[fan]);

    uint8_t newtemp = (temp < 10) ? 10 : temp;
    newtemp = ((temp > 32) ? 32 : temp) - 10;
    daikin160_data[16] = _set_bit(daikin160_data[16], 1, 6, newtemp << 1);

    daikin160_data[6] = _sum_bytes(daikin160_data, 6);
    daikin160_data[19] = _sum_bytes(daikin160_data + 7, 12);

    for (int i = 0; i < 20; i++) {
        ESP_LOGI(TAG, "%d - %2x", i, daikin160_data[i]);
    }

    int offset = 0;
    _make_rmt_item(items + offset++, 5000, 2145);
    for (int x = 0; x < 7; x++) {
        for (int y = 0; y < 8; y++) {
            if (GET_BIT(daikin160_data[x], y)) {
                _make_rmt_item(items + offset++, 342, 1786);
            } else {
                _make_rmt_item(items + offset++, 342, 700);
            }
        }
    }
    _make_rmt_item(items + offset++, 342, 29650);
    _make_rmt_item(items + offset++, 5000, 2145);
    for (int x = 7; x < 20; x++) {
        for (int y = 0; y < 8; y++) {
            if (GET_BIT(daikin160_data[x], y)) {
                _make_rmt_item(items + offset++, 342, 1786);
            } else {
                _make_rmt_item(items + offset++, 342, 700);
            }
        }
    }
    _make_rmt_item(items + offset++, 342, 29650);
    return offset;
}

int create_remote_send_daikin176(rmt_item32_t *items, bool power, int temp, int mode, int fan, bool swingH, bool swingV)
{
    ESP_LOGI(TAG, "send_daikin176 power %d, temp %d, mode %d, fan %d, swingH %d, swingV %d", power, temp, mode, fan, swingH, swingV);
    daikin176_data[18] = _set_bit(daikin176_data[18], 0, 3, swingH ? 0x05 : 0x06);
    daikin176_data[14] = _set_bit(daikin176_data[14], 0, 0, power ? 0x01 : 0x00);

    daikin176_data[14] = _set_bit(daikin176_data[14], 4, 6, map_mode_daikin176[mode] << 4);
    daikin176_data[18] = _set_bit(daikin176_data[18], 4, 7, map_fan_daikin176[fan] << 4);

    uint8_t newtemp = (temp < 10) ? 10 : temp;
    newtemp = ((temp > 32) ? 32 : temp) - 9;
    daikin176_data[17] = _set_bit(daikin176_data[17], 1, 6, newtemp << 1);

    daikin176_data[6] = _sum_bytes(daikin176_data, 6);
    daikin176_data[21] = _sum_bytes(daikin176_data + 7, 14);

    int offset = 0;
    _make_rmt_item(items + offset++, 5070, 2140);
    for (int x = 0; x < 7; x++) {
        for (int y = 0; y < 8; y++) {
            if (GET_BIT(daikin176_data[x], y)) {
                _make_rmt_item(items + offset++, 370, 1780);
            } else {
                _make_rmt_item(items + offset++, 370, 710);
            }
        }
    }
    _make_rmt_item(items + offset++, 370, 29410);
    _make_rmt_item(items + offset++, 5070, 2140);
    for (int x = 7; x < 22; x++) {
        for (int y = 0; y < 8; y++) {
            if (GET_BIT(daikin176_data[x], y)) {
                _make_rmt_item(items + offset++, 370, 1780);
            } else {
                _make_rmt_item(items + offset++, 370, 710);
            }
        }
    }
    _make_rmt_item(items + offset++, 370, 29410);
    return offset;
}

int create_remote_send_daikin128(rmt_item32_t *items, bool power, int temp, int mode, int fan, bool swingH, bool swingV)
{
    ESP_LOGI(TAG, "send_daikin128 power %d, temp %d, mode %d, fan %d, swingH %d, swingV %d", power, temp, mode, fan, swingH, swingV);
    daikin128_data[7] = _set_bit(daikin128_data[7], 0, 0, swingV ? 0x01 : 0x00);

    daikin128_data[7] = _set_bit(daikin128_data[7], 3, 3, (power ? 0x01 : 0x00) << 3);

    daikin128_data[1] = _set_bit(daikin128_data[1], 0, 3, map_mode_daikin128[mode]);
    daikin128_data[1] = _set_bit(daikin128_data[1], 4, 7, map_fan_daikin128[fan] << 4);

    uint8_t newtemp = (temp < 16) ? 16 : temp;
    newtemp = ((temp > 30) ? 30 : temp);
    daikin128_data[6] = uint8_to_bcd(newtemp);

    daikin128_data[7] = _set_bit(daikin128_data[7], 4, 7, (sum_nibbles(daikin128_data, 7, daikin128_data[7] & 0x0f) & 0x0f) << 4);
    daikin128_data[15] = sum_nibbles(daikin128_data + 8, 7, 0);

    int offset = 0;
    _make_rmt_item(items + offset++, 9800, 9800);
    _make_rmt_item(items + offset++, 9800, 9800);

    _make_rmt_item(items + offset++, 4600, 2500);
    for (int x = 0; x < 8; x++) {
        for (int y = 0; y < 8; y++) {
            if (GET_BIT(daikin128_data[x], y)) {
                _make_rmt_item(items + offset++, 350, 954);
            } else {
                _make_rmt_item(items + offset++, 350, 382);
            }
        }
    }
    _make_rmt_item(items + offset++, 350, 20300);
    // _make_rmt_item(items + offset++, 4600, 2500);
    for (int x = 8; x < 16; x++) {
        for (int y = 0; y < 8; y++) {
            if (GET_BIT(daikin128_data[x], y)) {
                _make_rmt_item(items + offset++, 350, 954);
            } else {
                _make_rmt_item(items + offset++, 350, 382);
            }
        }
    }
    _make_rmt_item(items + offset++, 4600, 20300);
    return ESP_OK;
}

int create_remote_send_daikin152(rmt_item32_t *items, bool power, int temp, int mode, int fan, bool swingH, bool swingV)
{
    ESP_LOGI(TAG, "send_daikin152 power %d, temp %d, mode %d, fan %d, swingH %d, swingV %d", power, temp, mode, fan, swingH, swingV);
    daikin152_data[8] = _set_bit(daikin152_data[8], 0, 3, swingV ? 0x0f : 0x00);

    daikin152_data[5] = _set_bit(daikin152_data[5], 0, 0, power ? 0x01 : 0x00);

    daikin152_data[5] = _set_bit(daikin152_data[5], 4, 6, map_mode_daikin[mode] << 4);
    daikin152_data[8] = _set_bit(daikin152_data[8], 4, 7, map_fan_daikin152[fan] << 4);

    uint8_t newtemp = (temp < ((mode == 2) ? 10 : 18)) ? ((mode == 2) ? 10 : 18) : temp;
    newtemp = (temp > 32) ? 32 : temp;
    daikin152_data[6] = _set_bit(daikin152_data[6], 1, 6, newtemp << 1);

    daikin152_data[18] = _sum_bytes(daikin152_data, 18);

    int offset = 0;
    for (int x = 0; x < 5; x++) {
        _make_rmt_item(items + offset++, 433, 433);
    }
    _make_rmt_item(items + offset++, 433, 25182);
    _make_rmt_item(items + offset++, 3492, 1718);
    for (int x = 0; x < 19; x++) {
        for (int y = 0; y < 8; y++) {
            if (GET_BIT(daikin152_data[x], y)) {
                _make_rmt_item(items + offset++, 433, 1529);
            } else {
                _make_rmt_item(items + offset++, 433, 433);
            }
        }
    }
    _make_rmt_item(items + offset++, 433, 25182);

    return offset;
}

int create_remote_send_daikin64(rmt_item32_t *items, bool power, int temp, int mode, int fan, bool swingH, bool swingV)
{
    ESP_LOGI(TAG, "send_daikin64 power %d, temp %d, mode %d, fan %d, swingH %d, swingV %d", power, temp, mode, fan, swingH, swingV);
    daikin64_data[7] = _set_bit(daikin64_data[7], 0, 0, swingV ? 0x01 : 0x00);

    daikin64_data[7] = _set_bit(daikin64_data[7], 3, 3, power ? 0x01 : 0x00);

    daikin64_data[1] = _set_bit(daikin64_data[1], 0, 3, map_mode_daikin64[mode]);
    daikin64_data[1] = _set_bit(daikin64_data[1], 4, 7, map_fan_daikin64[fan] << 4);

    uint8_t newtemp = temp < 16 ? 16 : temp;
    newtemp = (temp > 30) ? 30 : temp;
    daikin64_data[6] = uint8_to_bcd(newtemp);

    uint8_t result = 0;
    for (int i = 0; i < 7; i++) {
        result += daikin64_data[i] & 0x0f;
        result += (daikin64_data[i] >> 4) & 0x0f;
    }
    result += daikin64_data[7] & 0x0f;
    daikin64_data[7] = _set_bit(daikin64_data[7], 4, 7, (result & 0x0F) << 4);

    int offset = 0;
    for (int x = 0; x < 2; x++) {
        _make_rmt_item(items + offset++, 9800, 9800);
    }
    _make_rmt_item(items + offset++, 4600, 2500);
    for (int x = 0; x < 8; x++) {
        for (int y = 0; y < 8; y++) {
            if (GET_BIT(daikin64_data[x], y)) {
                _make_rmt_item(items + offset++, 350, 954);
            } else {
                _make_rmt_item(items + offset++, 350, 382);
            }
        }
    }
    _make_rmt_item(items + offset++, 350, 20300);
    _make_rmt_item(items + offset++, 4600, 10000);
    return offset;
}
