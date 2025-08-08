/*
 * This file is subject to the terms of the SunshineTech License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *                             ./LICENSE
 */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "esp_log.h"
#include "esp_system.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "periph_aircond.h"

#include "driver/uart.h"
#include "driver/gpio.h"
#include "homebus.h"
#include "app_config.h"
#include "driver/spi_slave.h"

static const char *TAG = "AIRCOND_SPI";

#define SPI_AIRCOND_BUFFER (40)
#define lowByte(v)   ((unsigned char) (v))
#define highByte(v)  ((unsigned char) (((unsigned int) (v)) >> 8))
#define bitRead(value, bit) (((value) >> (bit)) & 0x01)
#define bitSet(value, bit) ((value) |= (1UL << (bit)))
#define bitClear(value, bit) ((value) &= ~(1UL << (bit)))
#define bitWrite(value, bit, bitvalue) (bitvalue ? bitSet(value, bit) : bitClear(value, bit))

#define AWAIT(x) if (x != ESP_OK) continue

typedef struct ac_spi_ {
    char *tx_buffer;
    char *rx_buffer;
    aircond_info_t info;
    aircond_info_t new_info;
    aircond_hardware_t hw;
    int online_count;
    int frm_cnt;
    int variant_cnt;
    char rx_bitfield4_10[7];
    bool can_update;
    bool control_flag;
    uint16_t info_checksum;
} ac_spi_t;

const char frm_signature[3] =  { 0x6C, 0x80, 0x04 };
const char frm_variant[3][9]  = {
    { 0x40, 0x00, 0x00, 0x80, 0xFF, 0xFF, 0xFF, 0x0F, 0x04 },  //variant number 0
    { 0x80, 0x00, 0x00, 0x32, 0xD6, 0x01, 0x00, 0x0F, 0x04 },  //variant number 1
    { 0x80, 0x00, 0x00, 0xF1, 0xF7, 0xFF, 0xFF, 0x0F, 0x04 }   //variant number 2
};
const char frm_tx[20]   =  { 0xA9, 0x00, 0x07, 0x4C, 0x00, 0x2A, 0xFF, 0x00, 0x00, 0x40, 0x00, 0x00, 0x80, 0xFF, 0xFF, 0xFF, 0x0F, 0x04, 0x05, 0xF5 };
const char frm_null[20] = { 0x00 };

//MODE bitmasks                            Bitfield #4
const char mode_mask[8][2] = {
    //     CLEAR   |    SET
    { 0b00100010, 0b00000000 },  //0 = Unchanged (only clear 'write' bits)
    { 0b00100011, 0b00000010 },  //1 = OFF
    { 0b00111111, 0b00110011 },  //2 = HEAT
    { 0b00111111, 0b00101011 },  //3 = COOL
    { 0b00111111, 0b00100011 },  //4 = AUTO
    { 0b00111111, 0b00100111 },  //5 = DRY
    { 0b00111111, 0b00101111 },  //6 = FAN
    { 0b00100011, 0b00000011 }   //7 = ON (using last mode)
};

//VANES bitmasks                          Bitfield #4             Bitfield #5
const char vanes_mask[6][4] = {
    //     CLEAR   |    SET        CLEAR   |    SET
    { 0b10000000, 0b00000000, 0b10000000, 0b00000000 },  //0 = Unchanged (only clear 'write' bits)
    { 0b11000000, 0b10000000, 0b10110000, 0b10000000 },  //1 = 1 (up)
    { 0b11000000, 0b10000000, 0b10110000, 0b10010000 },  //2 = 2
    { 0b11000000, 0b10000000, 0b10110000, 0b10100000 },  //3 = 3
    { 0b11000000, 0b10000000, 0b10110000, 0b10110000 },  //4 = 4 (down)
    { 0b11000000, 0b11000000, 0b10000000, 0b00000000 }   //5 = swing
};

//FANSPEED bitmasks                        Bitfield #5             Bitfield #10
const char fanspeed_mask[5][4] = {
    //     CLEAR   |    SET        CLEAR   |    SET
    { 0b00001000, 0b00000000, 0b11011000, 0b00000000 },  //0 = Unchanged (only clear 'write' bits)
    { 0b00001111, 0b00001000, 0b11011000, 0b00000000 },  //1 = Speed 1
    { 0b00001111, 0b00001001, 0b11011000, 0b00000000 },  //2 = Speed 2
    { 0b00001111, 0b00001010, 0b11011000, 0b00000000 },  //3 = Speed 3
    { 0b00001111, 0b00001010, 0b11011000, 0b00010001 }   //4 = Speed 4
};

static uint16_t _checksum(char *data, int len)
{
    uint16_t ck = 0;
    for (int i = 0; i < len; i++) {
        ck += *data;
        data ++;
    }
    return ck;
}

static void _spi_update_checksum(char *data)
{
    uint16_t ck = 0;
    for (int i = 0; i < 18; i++) {
        ck += data[i];
    }
    data[18] = (ck >> 8) & 0xFF;
    data[19] = (ck >> 0) & 0xFF;
}

static bool _spi_is_valid_checksum(char *data)
{
    uint16_t sum = _checksum(data, 18);
    char hb = (sum >> 8) & 0xFF;
    char lb = sum & 0xFF;
    bool valid = (data[18] == hb && data[19] == lb);
    return valid;
}

static esp_err_t _spi_validate_signature(spi_handle_t handle)
{
    if (handle->frm_cnt > 0) {
        return ESP_OK;
    }
    memset(handle->tx_buffer, 0, 20);
    spi_slave_transaction_t trans = {
        .length = 3 * 8,
        .tx_buffer = handle->tx_buffer,
        .rx_buffer = handle->rx_buffer,
    };

    if (spi_slave_transmit(handle->hw.spi.spi_no, &trans, 1000 / portTICK_RATE_MS) != ESP_OK) {
        ESP_LOGD(TAG, "timeout 3");
        goto _validate_signature_fail;
    }


    if (memcmp(handle->rx_buffer, frm_signature, 3) != 0) {
        ESP_LOGD(TAG, "Invalid sync header");
        spi_slave_transaction_t *ret_trans;
        spi_slave_get_trans_result(handle->hw.spi.spi_no, &ret_trans, 1000 / portTICK_RATE_MS);
        goto _validate_signature_fail;
    }

    trans.length = 17*8;
    if (spi_slave_transmit(handle->hw.spi.spi_no, &trans, 1000 / portTICK_RATE_MS) != ESP_OK) {
        ESP_LOGD(TAG, "timeout 17");
    }

    handle->frm_cnt = 1;
    ESP_LOGD(TAG, "Valid sync frame");

    if (handle->online_count == 0) {
        handle->info.is_online = true;
        ESP_LOGD(TAG, "AIRCOND_EVENT_ONLINE");
    }
    handle->online_count = 10;

    return ESP_OK;

_validate_signature_fail:
    if (handle->online_count == -1) {
        //first time;
        handle->online_count = 1;
    }
    if (handle->online_count > 0) {
        handle->online_count --;
        if (handle->online_count == 0) {
            handle->info.is_online = false;
            ESP_LOGD(TAG, "AIRCOND_EVENT_OFFLINE");
        }
    }
    return ESP_FAIL;
}

void _print_hex(char* data, int len)
{
    for (int i = 0; i < len; i++) {
        printf("%02X ", (uint8_t)data[i]);
    }
    printf("\n");
}

static aircond_info_t* _spi_transmit_variant(spi_handle_t handle)
{
    if (handle->frm_cnt != 1) {
        return NULL;
    }

    if (handle->variant_cnt > 2) {
        handle->variant_cnt = 0;
    }

    memcpy(handle->tx_buffer, frm_tx, 20);
    memcpy(&handle->tx_buffer[9], &frm_variant[handle->variant_cnt][0], 9);
    char *tx_frm = handle->tx_buffer;
    char *rx_bitfield4_10 = handle->rx_bitfield4_10;

    if (handle->can_update && handle->control_flag) {
        handle->control_flag = false;
        aircond_info_t *new_info = &handle->new_info;
        tx_frm[3]  =  rx_bitfield4_10[0] & ~mode_mask[new_info->mode][0];
        tx_frm[3]  =  rx_bitfield4_10[0] & ~mode_mask[new_info->mode][0];
        tx_frm[3] |=  mode_mask[new_info->mode][1];
        tx_frm[3] &= ~vanes_mask[new_info->vanes][0];
        tx_frm[3] |=  vanes_mask[new_info->vanes][1];

        tx_frm[4]  =  rx_bitfield4_10[1] & ~vanes_mask[new_info->vanes][2];
        tx_frm[4] |=  vanes_mask[new_info->vanes][3];

        tx_frm[4] &= ~fanspeed_mask[new_info->fanspeed][0];
        tx_frm[4] |=  fanspeed_mask[new_info->fanspeed][1];

        bitWrite(rx_bitfield4_10[6], 0, bitRead(rx_bitfield4_10[6], 6));
        tx_frm[9] &=  ~0b00111111;

        tx_frm[9] |= (rx_bitfield4_10[6] & ~fanspeed_mask[new_info->fanspeed][2]);
        tx_frm[9] |=  fanspeed_mask[new_info->fanspeed][3];


        if (new_info->setpoint == 0) {
            //Copy last received MHI setpoint and clear the write bit
            tx_frm[5] = rx_bitfield4_10[2] & ~0b10000000;
        } else {
            tx_frm[5] = (new_info->setpoint << 1) | 0b10000000;
        }
        // memset(new_info, 0, sizeof(aircond_info_t));
        handle->can_update = false;
    }

    _spi_update_checksum(handle->tx_buffer);

    spi_slave_transaction_t trans = {
        .length = 20 * 8,
        .tx_buffer = handle->tx_buffer,
        .rx_buffer = handle->rx_buffer,
    };
    // ESP_LOGW(TAG, "spi_slave_transmit");
    if (spi_slave_transmit(handle->hw.spi.spi_no, &trans, 1000 / portTICK_RATE_MS) != ESP_OK) {
        handle->frm_cnt = 0;
        handle->variant_cnt = 0;
        ESP_LOG_BUFFER_HEX(TAG, handle->rx_buffer, 20);
        handle->info.is_online = false;
        return NULL;
    }
    if (!_spi_is_valid_checksum(handle->rx_buffer)) {
        ESP_LOGD(TAG, "invalid checksum 1, frm=%d", handle->frm_cnt);
        handle->frm_cnt = 0;
        handle->variant_cnt = 0;
        handle->info.is_online = false;
        return NULL;
    }
    handle->frm_cnt = 2;
    if (handle->variant_cnt == 1) {
        handle->info.is_online = true;
        handle->info.setpoint = handle->rx_buffer[5];
        handle->info.setpoint &= ~(1 << 7);
        handle->info.setpoint >>= 1;
        int temp = (int)handle->rx_buffer[6] - 61;
        //Truncated temperature (rounded down)
        temp /= 4;
        handle->info.temperature = temp;
        handle->info.humidity = 65.0f;
        if (bitRead(handle->rx_buffer[9], 6)) {
            handle->info.fanspeed = 3;
        } else {
            handle->info.fanspeed = handle->rx_buffer[4] & 0b00000111;
            if (handle->info.fanspeed == 0) {
                handle->info.fanspeed = 1;
            }
        }

        handle->info.vanes = handle->rx_buffer[4] & 0b00110000;
        handle->info.vanes >>= 4;
        handle->info.vanes += 1;

        int mode_idx = handle->rx_buffer[3] & 0b00011101;
        const uint8_t mode_val[5] = { 0b00010001, 0b00001001, 0b00000001, 0b00000101, 0b00001101 };
        handle->info.mode = 0; // OFF
        for (int idx = 0; idx < sizeof(mode_val); idx ++) {
            if (mode_val[idx] == mode_idx) {
                handle->info.mode = idx + 1;
                break;
            }
        }
        handle->info.vanes += 1;
        handle->info.mode += 1;

        ESP_LOGE(TAG, "3setpoint=%d, fanspeed = %d, vanes=%d, temperature=%f, mode=%d",
                handle->info.setpoint,
                handle->info.fanspeed,
                handle->info.vanes,
                handle->info.temperature,
                handle->info.mode);

        return &handle->info;
    }

    return NULL;
}

static esp_err_t _spi_exchange_data(spi_handle_t spi_handle)
{
    if (spi_handle->frm_cnt < 2) {
        return ESP_FAIL;
    }

    spi_slave_transaction_t trans = {
        .length = 20 * 8,
        .tx_buffer = spi_handle->tx_buffer,
        .rx_buffer = spi_handle->rx_buffer,
    };

    if (spi_slave_transmit(spi_handle->hw.spi.spi_no, &trans, 1000 / portTICK_RATE_MS) != ESP_OK) {
        spi_handle->frm_cnt = 0;
        spi_handle->variant_cnt = 0;
        ESP_LOGE(TAG, "_spi_exchange_data fail");
        return ESP_FAIL;
    }

    spi_handle->frm_cnt ++;
    if (spi_handle->frm_cnt == 24) {
        // ESP_LOGD(TAG, "spi_handle->frm_cnt == 24, clear bit 2");
        spi_handle->tx_buffer[17] &= 0xFB; //clear bit 2
        _spi_update_checksum(spi_handle->tx_buffer);
    }

    if (spi_handle->frm_cnt == 48) {
        if (!_spi_is_valid_checksum(spi_handle->rx_buffer)) {
            ESP_LOGE(TAG, "invalid checksum 1, frm=%d", spi_handle->frm_cnt);
            spi_handle->frm_cnt = 0;
            spi_handle->variant_cnt = 0;
            ESP_LOG_BUFFER_HEX(TAG, spi_handle->rx_buffer, 20);
            return ESP_FAIL;
        }
        ESP_LOGD(TAG, "spi_handle->frm_cnt == 48, valid frame");
        memcpy(spi_handle->rx_bitfield4_10, &spi_handle->rx_buffer[3], 7);
        spi_handle->can_update = true;
        spi_handle->frm_cnt = 1;
        spi_handle->variant_cnt ++;
    }
    return ESP_OK;
}

spi_handle_t periph_ac_spi_init(aircond_hardware_t *spi_config)
{
    spi_handle_t spi_handle = calloc(1, sizeof(ac_spi_t));
    PERIPH_MEM_CHECK(TAG, spi_handle, goto _spi_init_fail);
    memcpy(&spi_handle->hw, spi_config, sizeof(aircond_hardware_t));
    spi_handle->online_count = -1;
    spi_handle->tx_buffer = malloc(SPI_AIRCOND_BUFFER);
    PERIPH_MEM_CHECK(TAG, spi_handle->tx_buffer, goto _spi_init_fail);
    spi_handle->rx_buffer = malloc(SPI_AIRCOND_BUFFER);
    PERIPH_MEM_CHECK(TAG, spi_handle->rx_buffer, goto _spi_init_fail);
    memcpy(spi_handle->tx_buffer, frm_tx, 20);
    spi_handle->frm_cnt = 0;
    spi_handle->control_flag = false;
    memset(&spi_handle->new_info, 0, sizeof(aircond_info_t));
    memset(&spi_handle->info, 0, sizeof(aircond_info_t));
    return spi_handle;
_spi_init_fail:
    ESP_LOGE(TAG, "Failed to initial AIRCOND SPI");
    free(spi_handle->tx_buffer);
    free(spi_handle->rx_buffer);
    free(spi_handle);
    return NULL;
}

esp_err_t _spi_init(void *ctx)
{
    spi_handle_t handle = (spi_handle_t)ctx;
    //Configuration for the SPI bus
    spi_bus_config_t buscfg = {
        .mosi_io_num = handle->hw.spi.mosi,
        .miso_io_num = handle->hw.spi.miso,
        .sclk_io_num = handle->hw.spi.sck,
        .flags = SPICOMMON_BUSFLAG_SLAVE,
    };

    //Configuration for the SPI slave interface
    spi_slave_interface_config_t slvcfg = {
        .mode = 1,
        .spics_io_num = handle->hw.spi.cs,
        .queue_size = 20,
        .flags = SPI_SLAVE_BIT_LSBFIRST,
    };

    ESP_LOGD(TAG, "HOST=%d", handle->hw.spi.spi_no);
    spi_slave_initialize(handle->hw.spi.spi_no, &buscfg, &slvcfg, 1);

    gpio_config_t io_conf = {
        .intr_type = GPIO_INTR_DISABLE,
        .mode = GPIO_MODE_OUTPUT,
        .pin_bit_mask = (uint64_t)((uint64_t)1 << handle->hw.spi.fake_cs)
    };

    //Configure handshake line as output
    gpio_config(&io_conf);
    gpio_set_level(handle->hw.spi.fake_cs, 0);

    ESP_LOGD(TAG, "mosi=%d, miso=%d, sck=%d, cs=%d, fake_cs=%d",
                handle->hw.spi.mosi,
                handle->hw.spi.miso,
                handle->hw.spi.sck,
                handle->hw.spi.cs,
                handle->hw.spi.fake_cs);

    return ESP_OK;
}

aircond_info_t* periph_ac_spi_process(void *ctx, aircond_info_t* control_info)
{
    spi_handle_t handle = (spi_handle_t)ctx;
    if (handle == NULL) {
        return NULL;
    }
    if (control_info != NULL) {
        memcpy(&handle->new_info, control_info, sizeof(aircond_info_t));
        if (handle->new_info.fanspeed >= AIRCOND_FANSPEED_2 && handle->new_info.fanspeed < AIRCOND_FANSPEED_4) {
            handle->new_info.fanspeed += 1;
        }
        handle->control_flag = true;
    }
    _spi_validate_signature(handle);
    aircond_info_t *info = _spi_transmit_variant(handle);
    _spi_exchange_data(handle);
    return info;
}
