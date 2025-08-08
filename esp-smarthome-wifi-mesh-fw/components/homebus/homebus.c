#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "esp_log.h"
#include "esp_system.h"
#include "esp_wifi.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "driver/rmt.h"

#include "homebus.h"

static const char *TAG = "HOMEBUS";


/* default 9600 baud */
#define DEFAULT_BAUDRATE    (9600)
#define DEFAULT_BIT_TIMMING (1000000/DEFAULT_BAUDRATE/2)
#define RMT_CLK_DIV      80    /*!< RMT counter clock divider */
#define RMT_TICK_10_US    (80000000/RMT_CLK_DIV/100000)   /*!< RMT counter value for 10 us.(Source clock is APB clock) */

static rmt_item32_t bit0 = {{{ DEFAULT_BIT_TIMMING-1, 1, DEFAULT_BIT_TIMMING+1, 0 }}}; //Logical 0
static rmt_item32_t bit1 = {{{ DEFAULT_BIT_TIMMING, 1, DEFAULT_BIT_TIMMING, 1 }}}; //Logical 1

static int bit_margin = DEFAULT_BIT_TIMMING/10;
static homebus_config_t g_cfg;

static void IRAM_ATTR homebus_to_rmt(const void* src, rmt_item32_t* dest, size_t src_size,
                         size_t wanted_num, size_t* translated_size, size_t* item_num)
{
    if(src == NULL || dest == NULL) {
        *translated_size = 0;
        *item_num = 0;
        return;
    }

    size_t size = 0;
    size_t num = 0;
    uint8_t *psrc = (uint8_t *)src;
    rmt_item32_t* pdest = dest;
    while (size < src_size && num < wanted_num) {
        // start bit
        pdest->val =  bit0.val;
        pdest++;
        num++;
        int parity = g_cfg.parity == 1 ? 1 : 0;
        for(int i = 0; i < 8; i++) {
            if(*psrc & (0x01 << i)) {
                pdest->val =  bit1.val;
                parity ^= 1;
            } else {
                pdest->val =  bit0.val;
            }
            num++;
            pdest++;
        }
        if (g_cfg.parity) {
            if (parity) {
                pdest->val =  bit1.val;
            } else {
                pdest->val =  bit0.val;
            }
            pdest++;
            num++;
        }
       
        // stop bit (1 bit1)
        pdest->val =  bit1.val * 1;
        pdest++;
        num++;

        size++;
        psrc++;
    }
    *translated_size = size;
    *item_num = num;
}

esp_err_t homebus_init(homebus_config_t *hb_config)
{
    rmt_config_t config;

    memcpy(&g_cfg, hb_config, sizeof(homebus_config_t));

    config.rmt_mode = RMT_MODE_TX;
    config.channel = hb_config->tx_channel; //RMT_CHANNEL_0;
    config.gpio_num = hb_config->tx_pin;
    
    config.mem_block_num = 5;
    config.tx_config.loop_en = 0;
    config.tx_config.carrier_en = 0;

    config.tx_config.idle_output_en = 1;
    config.tx_config.idle_level = 1;
    config.clk_div = RMT_CLK_DIV;

    if (g_cfg.baudrate) {
        int timing = 1000000/g_cfg.baudrate/2;
        bit0.duration0 = timing;
        bit0.duration1 = timing;
        bit1.duration0 = timing;
        bit1.duration1 = timing;
        bit_margin = timing/10;
    }
    if (g_cfg.stop_bit == 0) {
        g_cfg.stop_bit = 1;
    }
    rmt_config(&config);
    rmt_driver_install(config.channel, 0, 0);
    rmt_translator_init(config.channel, homebus_to_rmt);
    return ESP_OK;
}

esp_err_t homebus_write(uint8_t *data, int len, TickType_t timeout)
{
    esp_err_t err = rmt_write_sample(g_cfg.tx_channel, (uint8_t*)data, len, true);
    if (err != ESP_OK) {
        ESP_LOGE(TAG, "err=%d", err);
        return err;
    }
    err = rmt_wait_tx_done(g_cfg.tx_channel, timeout);
    return err;
}
