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

#include "driver/spi_master.h"
#include "soc/gpio_struct.h"
#include "driver/gpio.h"
#include "esp_cc1101.h"

static const char *TAG = "ESP_CC1101";

#define CFG_MDCF1           0x00
#define CFG_MDCF0           0xF8
#define CFG_CHAN            1
#define CFG_RBW             0x57
static int F2 = 16;
static int F1 = 176;
static int F0 = 113;

static char PA_TABLE10[8]  = {0x00,0xC0,0x00,0x00,0x00,0x00,0x00,0x00};
static char PA_TABLE8[8]   = {0x60,0x60,0x60,0x60,0x60,0x60,0x60,0x60};
static char PA_TABLE7[8]   = {0x00,0xC8,0x00,0x00,0x00,0x00,0x00,0x00};
static char PA_TABLE5[8]   = {0x00,0x84,0x00,0x00,0x00,0x00,0x00,0x00};
static char PA_TABLE0[8]   = {0x00,0x60,0x00,0x00,0x00,0x00,0x00,0x00};
static char PA_TABLE_10[8] = {0x00,0x34,0x00,0x00,0x00,0x00,0x00,0x00};
static char PA_TABLE_15[8] = {0x00,0x1D,0x00,0x00,0x00,0x00,0x00,0x00};
static char PA_TABLE_20[8] = {0x00,0x0E,0x00,0x00,0x00,0x00,0x00,0x00};
static char PA_TABLE_30[8] = {0x00,0x12,0x00,0x00,0x00,0x00,0x00,0x00};

#define WRITE_BURST         0x40
#define READ_SINGLE         0x80
#define READ_BURST          0xC0
#define BYTES_IN_RXFIFO     0x7F

#define CC1101_CHECK_FAIL(x)    if (x != ESP_OK) return ESP_FAIL;

typedef struct esp_cc1101 {
    spi_device_handle_t     spi;
    int                     mosi_pin;
    int                     miso_pin;
    int                     cs_pin;
    int                     sck_pin;
    int                     conf;
    char                    *tx_buffer;
    char                    *rx_buffer;
    float                   mhz;
} esp_cc1101_t;

esp_err_t _cc1101_set_mhz(esp_cc1101_handle_t esp_cc1101)
{
    float MHZ = esp_cc1101->mhz + 0.01;

    float freq2 = 26;
    float freq1 = 0.1015625;
    float freq0 = 0.00039675;

    float s1 = MHZ / freq2;
    int s2 = s1;
    float s3 = s1 - s2;
    float s4 = s3 * 100000000;
    float s5 = 255.0 / 100000000 * s4;
    int s6 = s5;
    float s7 = (s5 - s6);
    float s8 = s7 * 10;
    int s9;
    if (s8 >= 5) {
        s9 = s6 + 1;
    } else {
        s9 = s6;
    }
    float s10 = MHZ - (freq2 * s2 + freq1 * s9);
    float s11 = s10 / freq0;
    int s12 = s11;
    float s13 = (s11 - s12) * 10;
    int s14;
    if (s13 >= 5) {
        s14 = s12 + 1;
    } else {
        s14=s12;
    }

    F2 = s2;
    F1 = s9;
    F0 = s14;

    return ESP_OK;
}

esp_err_t _cc1101_transfer(esp_cc1101_handle_t esp_cc1101, int trx_len)
{
    esp_err_t ret;
    spi_transaction_t trans = {0};
    trans.length = trx_len * 8;
    trans.tx_buffer = esp_cc1101->tx_buffer;
    trans.rx_buffer = esp_cc1101->rx_buffer;
    ESP_LOGD(TAG, "Tx=%d", trx_len);
    ESP_LOG_BUFFER_HEX_LEVEL(TAG, esp_cc1101->tx_buffer, trx_len, ESP_LOG_DEBUG);
    ret = spi_device_transmit(esp_cc1101->spi, &trans);
    ESP_LOG_BUFFER_HEX_LEVEL(TAG, esp_cc1101->rx_buffer, trx_len, ESP_LOG_DEBUG);
    return ret;
}

esp_err_t _cc1101_wait_miso_ready(esp_cc1101_handle_t esp_cc1101, uint16_t timeout_ms)
{
    uint16_t counter = 0;
    while (counter < timeout_ms) {
        if (!gpio_get_level(esp_cc1101->miso_pin)) {
            return ESP_OK;
        }
        vTaskDelay(1 / portTICK_PERIOD_MS);
        counter++;
    }
    return ESP_FAIL;
}

esp_err_t _cc1101_write_reg(esp_cc1101_handle_t esp_cc1101, char addr, char value)
{
    gpio_set_level(esp_cc1101->cs_pin, 0);
    CC1101_CHECK_FAIL(_cc1101_wait_miso_ready(esp_cc1101, 10000));
    esp_cc1101->tx_buffer[0] = addr;
    esp_cc1101->tx_buffer[1] = value;
    CC1101_CHECK_FAIL(_cc1101_transfer(esp_cc1101, 2));
    gpio_set_level(esp_cc1101->cs_pin, 1);
    return ESP_OK;
}

esp_err_t _cc1101_write_burst_reg(esp_cc1101_handle_t esp_cc1101, char addr, char *value, int trx_len)
{
    char temp;
    temp = addr | WRITE_BURST;
    gpio_set_level(esp_cc1101->cs_pin, 0);
    CC1101_CHECK_FAIL(_cc1101_wait_miso_ready(esp_cc1101, 10000));
    esp_cc1101->tx_buffer[0] = temp;
    memcpy(esp_cc1101->tx_buffer + 1, value, trx_len);
    CC1101_CHECK_FAIL(_cc1101_transfer(esp_cc1101, trx_len + 1));
    gpio_set_level(esp_cc1101->cs_pin, 1);
    return ESP_OK;
}

esp_err_t _cc1101_strobe(esp_cc1101_handle_t esp_cc1101, char strobe)
{

    gpio_set_level(esp_cc1101->cs_pin, 0);
    CC1101_CHECK_FAIL(_cc1101_wait_miso_ready(esp_cc1101, 10000));
    esp_cc1101->tx_buffer[0] = strobe;
    CC1101_CHECK_FAIL(_cc1101_transfer(esp_cc1101, 1));
    gpio_set_level(esp_cc1101->cs_pin, 1);
    return ESP_OK;
}

esp_err_t _cc1101_read_reg(esp_cc1101_handle_t esp_cc1101, char addr, char *value)
{
    char temp;
    temp = addr| READ_SINGLE;
    gpio_set_level(esp_cc1101->cs_pin, 0);
    CC1101_CHECK_FAIL(_cc1101_wait_miso_ready(esp_cc1101, 10000));
    esp_cc1101->tx_buffer[0] = temp;
    esp_cc1101->tx_buffer[1] = 0x00;
    CC1101_CHECK_FAIL(_cc1101_transfer(esp_cc1101, 2));
    gpio_set_level(esp_cc1101->cs_pin, 1);
    *value = esp_cc1101->rx_buffer[1];
    return ESP_OK;
}

esp_err_t _cc1101_read_burst_reg(esp_cc1101_handle_t esp_cc1101, char addr, char *value, int trx_len)
{
    char temp;
    temp = addr | READ_BURST;
    gpio_set_level(esp_cc1101->cs_pin, 0);
    CC1101_CHECK_FAIL(_cc1101_wait_miso_ready(esp_cc1101, 10000));
    esp_cc1101->tx_buffer[0] = temp;
    char buffer[trx_len];
    for (int i = 0; i < trx_len; i++) {
        buffer[i] = 0x00;
    }
    memcpy(esp_cc1101->tx_buffer + 1, buffer, trx_len);
    CC1101_CHECK_FAIL(_cc1101_transfer(esp_cc1101, trx_len + 1));
    gpio_set_level(esp_cc1101->cs_pin, 1);
    memcpy(value, esp_cc1101->rx_buffer + 1, trx_len);
    return ESP_OK;
}

esp_err_t _cc1101_reset(esp_cc1101_handle_t esp_cc1101)
{
    gpio_set_level(esp_cc1101->cs_pin, 0);
    vTaskDelay(10 / portTICK_RATE_MS);
    gpio_set_level(esp_cc1101->cs_pin, 1);
    vTaskDelay(40 / portTICK_RATE_MS);
    gpio_set_level(esp_cc1101->cs_pin, 0);
    CC1101_CHECK_FAIL(_cc1101_wait_miso_ready(esp_cc1101, 10000));
    esp_cc1101->tx_buffer[0] = CC1101_SRES;
    CC1101_CHECK_FAIL(_cc1101_transfer(esp_cc1101, 1));
    CC1101_CHECK_FAIL(_cc1101_wait_miso_ready(esp_cc1101, 10000));
    gpio_set_level(esp_cc1101->cs_pin, 1);
    return ESP_OK;
}

esp_err_t _cc1101_reg_config_setting(esp_cc1101_handle_t esp_cc1101, char f)
{
    _cc1101_write_reg(esp_cc1101, CC1101_IOCFG2,    0x0D);
    _cc1101_write_reg(esp_cc1101, CC1101_IOCFG0,    0x0D);
    _cc1101_write_reg(esp_cc1101, CC1101_PKTLEN,    0xFF);
    _cc1101_write_reg(esp_cc1101, CC1101_PKTCTRL1,  0x04);
    _cc1101_write_reg(esp_cc1101, CC1101_PKTCTRL0,  0x32);
    _cc1101_write_reg(esp_cc1101, CC1101_ADDR,      0x00);
    _cc1101_write_reg(esp_cc1101, CC1101_CHANNR,    CFG_CHAN);
    _cc1101_write_reg(esp_cc1101, CC1101_FSCTRL1,   0x06);
    _cc1101_write_reg(esp_cc1101, CC1101_FSCTRL0,   0x00);
    _cc1101_write_reg(esp_cc1101, CC1101_FREQ2,     F2);
    _cc1101_write_reg(esp_cc1101, CC1101_FREQ1,     F1);
    _cc1101_write_reg(esp_cc1101, CC1101_FREQ0,     F0);
    _cc1101_write_reg(esp_cc1101, CC1101_MDMCFG4,   CFG_RBW);
    _cc1101_write_reg(esp_cc1101, CC1101_MDMCFG3,   0x93);
    _cc1101_write_reg(esp_cc1101, CC1101_MDMCFG2,   0x30);
    _cc1101_write_reg(esp_cc1101, CC1101_MDMCFG1,   CFG_MDCF1);
    _cc1101_write_reg(esp_cc1101, CC1101_MDMCFG0,   CFG_MDCF0);
    _cc1101_write_reg(esp_cc1101, CC1101_DEVIATN,   0x15);
    _cc1101_write_reg(esp_cc1101, CC1101_MCSM0,     0x18);
    _cc1101_write_reg(esp_cc1101, CC1101_FOCCFG,    0x16);
    _cc1101_write_reg(esp_cc1101, CC1101_BSCFG,     0x1C);
    _cc1101_write_reg(esp_cc1101, CC1101_AGCCTRL2,  0xC7);
    _cc1101_write_reg(esp_cc1101, CC1101_AGCCTRL1,  0x00);
    _cc1101_write_reg(esp_cc1101, CC1101_AGCCTRL0,  0xB2);
    _cc1101_write_reg(esp_cc1101, CC1101_FREND1,    0x56);
    _cc1101_write_reg(esp_cc1101, CC1101_FREND0,    0x11);
    _cc1101_write_reg(esp_cc1101, CC1101_FSCAL3,    0xE9);
    _cc1101_write_reg(esp_cc1101, CC1101_FSCAL2,    0x2A);
    _cc1101_write_reg(esp_cc1101, CC1101_FSCAL1,    0x00);
    _cc1101_write_reg(esp_cc1101, CC1101_FSCAL0,    0x1F);
    _cc1101_write_reg(esp_cc1101, CC1101_FSTEST,    0x59);
    _cc1101_write_reg(esp_cc1101, CC1101_TEST2,     0x81);
    _cc1101_write_reg(esp_cc1101, CC1101_TEST1,     0x35);
    _cc1101_write_reg(esp_cc1101, CC1101_TEST0,     0x09);

    switch (f) {
        case PA10:
            _cc1101_write_burst_reg(esp_cc1101, CC1101_PATABLE, PA_TABLE10, 8);
            break;
        case PA8:
            _cc1101_write_burst_reg(esp_cc1101, CC1101_PATABLE, PA_TABLE8, 8);
            break;
        case PA7:
            _cc1101_write_burst_reg(esp_cc1101, CC1101_PATABLE, PA_TABLE7, 8);
            break;
        case PA5:
            _cc1101_write_burst_reg(esp_cc1101, CC1101_PATABLE, PA_TABLE5, 8);
            break;
        case PA0:
            _cc1101_write_burst_reg(esp_cc1101, CC1101_PATABLE, PA_TABLE0, 8);
            break;
        case PA_10:
            _cc1101_write_burst_reg(esp_cc1101, CC1101_PATABLE, PA_TABLE_10, 8);
            break;
        case PA_15:
            _cc1101_write_burst_reg(esp_cc1101, CC1101_PATABLE, PA_TABLE_15, 8);
            break;
        case PA_20:
            _cc1101_write_burst_reg(esp_cc1101, CC1101_PATABLE, PA_TABLE_20, 8);
            break;
        case PA_30:
            _cc1101_write_burst_reg(esp_cc1101, CC1101_PATABLE, PA_TABLE_30, 8);
            break;
    }

    return ESP_OK;
}

esp_err_t esp_cc1101_set_mode_tx(esp_cc1101_handle_t esp_cc1101)
{
    _cc1101_strobe(esp_cc1101, CC1101_STX);
    return ESP_OK;
}

esp_err_t esp_cc1101_set_mode_rx(esp_cc1101_handle_t esp_cc1101)
{
    _cc1101_strobe(esp_cc1101, CC1101_SRX);
    return ESP_OK;
}

esp_err_t _cc1101_set_sres(esp_cc1101_handle_t esp_cc1101)
{
    _cc1101_strobe(esp_cc1101, CC1101_SRES);
    return ESP_OK;
}

esp_cc1101_handle_t esp_cc1101_init(esp_cc1101_cfg_t *config)
{
    esp_cc1101_handle_t esp_cc1101 = calloc(1, sizeof(esp_cc1101_t));
    if (esp_cc1101 == NULL) {
        return NULL;
    }

    esp_cc1101->mosi_pin = config->mosi_pin;
    esp_cc1101->miso_pin = config->miso_pin;
    esp_cc1101->cs_pin = config->cs_pin;
    esp_cc1101->sck_pin = config->sck_pin;
    esp_cc1101->conf = config->conf;
    esp_cc1101->mhz = config->mhz;

    esp_cc1101->tx_buffer = malloc(DEFAULT_CC1101_BUFFER);
    if (esp_cc1101->tx_buffer == NULL) {
        goto _cc1101_init_fail;
    }

    esp_cc1101->rx_buffer = malloc(DEFAULT_CC1101_BUFFER);
    if (esp_cc1101->rx_buffer == NULL) {
        goto _cc1101_init_fail;
    }

    _cc1101_set_mhz(esp_cc1101);

    gpio_config_t io_conf;
    io_conf.intr_type = GPIO_INTR_DISABLE;
    io_conf.mode = GPIO_MODE_OUTPUT;
    io_conf.pin_bit_mask = ((1ULL << esp_cc1101->mosi_pin) | (1ULL << esp_cc1101->sck_pin) | (1ULL << esp_cc1101->cs_pin));
    io_conf.pull_down_en = 0;
    io_conf.pull_up_en = 0;
    gpio_config(&io_conf);

    io_conf.mode = GPIO_MODE_INPUT;
    io_conf.pin_bit_mask = ((1ULL << esp_cc1101->miso_pin));
    gpio_config(&io_conf);

    spi_bus_config_t buscfg={
        .miso_io_num = esp_cc1101->miso_pin,
        .mosi_io_num = esp_cc1101->mosi_pin,
        .sclk_io_num = esp_cc1101->sck_pin,
        .quadwp_io_num = -1,
        .quadhd_io_num = -1,
    };
    spi_device_interface_config_t devcfg={
        .clock_speed_hz = 5000000,
        .mode = 0,
        .spics_io_num = esp_cc1101->cs_pin,
        .queue_size = 1,
    };

    if (spi_bus_initialize(VSPI_HOST, &buscfg, 2) != ESP_OK) {
        ESP_LOGE(TAG, "Error initialize spi bus");
        goto _cc1101_init_fail;
    }

    if (spi_bus_add_device(VSPI_HOST, &devcfg, &esp_cc1101->spi) != ESP_OK) {
        ESP_LOGE(TAG, "Error initialize spi bus");
        goto _cc1101_init_fail;
    }

    gpio_set_level(esp_cc1101->miso_pin, 1);
    gpio_set_level(esp_cc1101->sck_pin, 1);
    gpio_set_level(esp_cc1101->mosi_pin, 0);

    if (_cc1101_reset(esp_cc1101) != ESP_OK) {
        ESP_LOGE(TAG, "Error reset CC1101");
        goto _cc1101_init_fail;
    }

    _cc1101_reg_config_setting(esp_cc1101, PA10);

    return esp_cc1101;
_cc1101_init_fail:
    ESP_LOGE(TAG, "Failed to initial CC1101");
    free(esp_cc1101->tx_buffer);
    free(esp_cc1101->rx_buffer);
    spi_bus_remove_device(esp_cc1101->spi);
    free(esp_cc1101);
    return NULL;
}
