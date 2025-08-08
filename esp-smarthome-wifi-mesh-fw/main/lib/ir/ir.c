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

uint8_t _set_bit(uint8_t data, uint8_t pos_start, uint8_t pos_stop, uint8_t mask)
{
    for (int i = pos_start; i <= pos_stop; i++) {
        data &= ~(1 << i);
    }
    return data | mask;
}

esp_err_t _make_rmt_item(rmt_item32_t *item32, uint32_t duration0, uint32_t duration1)
{
    item32->duration0 = duration0;
    item32->level0 = 1;
    item32->duration1 = duration1;
    item32->level1 = 0;
    return ESP_OK;
}

esp_err_t _make_space(rmt_item32_t *item32, uint32_t duration0, uint32_t duration1)
{
    item32->duration0 = duration0;
    item32->level0 = 0;
    item32->duration1 = duration1;
    item32->level1 = 0;
    return ESP_OK;
}
