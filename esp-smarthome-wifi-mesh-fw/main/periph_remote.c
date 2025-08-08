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
#include "lz4.h"
#include "ir.h"

#define DEFAULT_REMOTE_TASK_STACK   (4*1024)
#define LOOP_TRANSMIT_PACKET        5

static const char* TAG = "PERIPH_REMOTE";

static mapping_model_t mapping_model_id_list[] = MAPPING_MODEL_ID_LIST;

#define VALIDATE_REMOTE(periph, ret) if (!esp_periph_validate(periph, PERIPH_ID_REMOTE)) { \
    ESP_LOGE(TAG, "Invalid REMOTE periph, at line %d", __LINE__);\
    return ret;\
}

typedef struct {
    int                     tx_pin;
    int                     rmt_tx_ch;
    int                     rx_pin;
    int                     rmt_rx_ch;
    char                    *buffer;
    esp_cc1101_cfg_t        rf_conf;
    esp_cc1101_handle_t     rf_handle;
    int                     rf_tx_pin;
    int                     rf_tx_ch;
    int                     rf_rx_pin;
    int                     rf_rx_ch;
    bool                    enable_compress;
    bool                    required_compress_once_time;
} periph_remote_t;

typedef struct rmt_zip {
    uint32_t center;
    uint64_t mark;
} rmt_zip_t;

static void _print_items(rmt_item32_t* item, int item_num)
{
    rmt_item32_t* it;
    for (int i = 0; i < item_num; i++) {
        it = &item[i];
        ESP_LOGI(TAG, "level0[%d], level1[%d]=%d, level[%d]=%d", i, it->level0, it->duration0, it->level1, it->duration1);
    }
}

static void _remote_task(void *pv)
{
    esp_periph_handle_t self = pv;
    periph_remote_t *periph_remote = esp_periph_get_data(self);

    periph_remote_data_t* remote_data = malloc(sizeof(periph_remote_data_t));
    if (remote_data == NULL) {
        ESP_LOGE(TAG, "Can't alloc remote_data");
    }
    // rmt_memory_rw_rst(periph_remote->rmt_rx_ch);
    RingbufHandle_t rb = NULL;
    size_t rx_size = 0;
    rmt_get_ringbuf_handle(periph_remote->rmt_rx_ch, &rb);
    rmt_rx_stop(periph_remote->rmt_rx_ch);
    rmt_item32_t* item = NULL;
    do {
        item = (rmt_item32_t*) xRingbufferReceive(rb, &rx_size, 100 / portTICK_RATE_MS);
        if (item != NULL) {
            vRingbufferReturnItem(rb, (void*) item);
        }
    } while (item != NULL);
    rmt_rx_start(periph_remote->rmt_rx_ch, 1);
    long long tick = esp_periph_tick_get();

    while (1) {
        if (esp_periph_tick_get() - tick >= 10000) {
            rmt_rx_stop(periph_remote->rmt_rx_ch);
            ESP_LOGE(TAG, "Timeout learning IR");
            break;
        }
        item = (rmt_item32_t*) xRingbufferReceive(rb, &rx_size, 1000 / portTICK_RATE_MS);
        ESP_LOGD(TAG, "receive %d byte", rx_size);
        if (item == NULL) {
            continue;
        }
        if (rx_size >= DEFAULT_REMOTE_BUFFER) {
            ESP_LOGE(TAG, "More than DEFAULT_REMOTE_BUFFER");
            vRingbufferReturnItem(rb, (void*) item);
            item = NULL;
            continue;
        }
        rmt_rx_stop(periph_remote->rmt_rx_ch);
        for (int i = 0; i < rx_size / 4; i++) {
            item[i].level1 = 0;
            item[i].level0 = 1;
        }
        // _print_items(item, rx_size / 4);
        if (periph_remote->enable_compress || periph_remote->required_compress_once_time) {
            remote_data->data_len = LZ4_compress_default((const char*)item, (char*)remote_data->data, rx_size, DEFAULT_REMOTE_BUFFER);
            ESP_LOGD(TAG, "size=%d, comppress=%d", rx_size, remote_data->data_len);
            if (periph_remote->required_compress_once_time) {
                periph_remote->required_compress_once_time = false;
            }
            remote_data->is_compressed = true;
        } else {
            memcpy(remote_data->data, item, rx_size);
            remote_data->data_len = rx_size;
            remote_data->is_compressed = false;
        }
        remote_data->type = REMOTE_TYPE_IR;
        esp_periph_send_event(self, REMOTE_EVENT_RECEIVED, (void*)remote_data, sizeof(periph_remote_data_t));

        vRingbufferReturnItem(rb, (void*) item);
        item = NULL;
        break;
    }
    if (remote_data != NULL) {
        free(remote_data);
    }
    vTaskDelete(NULL);
}

static void _rf_task(void *pv)
{
    esp_periph_handle_t self = pv;
    periph_remote_t *periph_remote = esp_periph_get_data(self);

    periph_remote_data_t* remote_data = malloc(sizeof(periph_remote_data_t));
    if (remote_data == NULL) {
        ESP_LOGE(TAG, "Can't alloc remote_data");
    }
    rmt_rx_start(periph_remote->rf_rx_ch, true);
    // rmt_memory_rw_rst(periph_remote->rf_rx_ch);
    RingbufHandle_t rb = NULL;
    size_t rx_size = 0;
    rmt_get_ringbuf_handle(periph_remote->rf_rx_ch, &rb);
    esp_cc1101_set_mode_tx(periph_remote->rf_handle);
    rmt_item32_t* item = NULL;
    do {
        item = (rmt_item32_t*) xRingbufferReceive(rb, &rx_size, 100 / portTICK_RATE_MS);
        if (item != NULL) {
            vRingbufferReturnItem(rb, (void*) item);
        }
    } while (item != NULL);
    esp_cc1101_set_mode_rx(periph_remote->rf_handle);
    long long tick = esp_periph_tick_get();

    while (1) {
        if (esp_periph_tick_get() - tick >= 10000) {
            ESP_LOGE(TAG, "Timeout learning RF");
            esp_cc1101_set_mode_tx(periph_remote->rf_handle);
            rmt_rx_stop(periph_remote->rmt_rx_ch);
            break;
        }
        item = (rmt_item32_t*) xRingbufferReceive(rb, &rx_size, 1000 / portTICK_RATE_MS);
        ESP_LOGD(TAG, "receive %d byte", rx_size);

        if (item == NULL) {
            continue;
        }

        if (rx_size >= DEFAULT_REMOTE_BUFFER) {
            ESP_LOGE(TAG, "More than DEFAULT_REMOTE_BUFFER");
            vRingbufferReturnItem(rb, (void*) item);
            item = NULL;
            continue;
        } else if (rx_size <= 20) {
            ESP_LOGD(TAG, "Not enough data");
            vRingbufferReturnItem(rb, (void*) item);
            item = NULL;
            continue;
        } else {
            esp_cc1101_set_mode_tx(periph_remote->rf_handle);
            rmt_rx_stop(periph_remote->rmt_rx_ch);
            for (int i = 0; i < rx_size / 4; i++) {
                item[i].level1 = 0;
                item[i].level0 = 1;
            }
            _print_items(item, rx_size / 4);
            if (periph_remote->enable_compress || periph_remote->required_compress_once_time) {
                remote_data->data_len = LZ4_compress_default((const char*)item, (char*)remote_data->data, rx_size, DEFAULT_REMOTE_BUFFER);
                ESP_LOGD(TAG, "size=%d, comppress=%d", rx_size, remote_data->data_len);
                if (periph_remote->required_compress_once_time) {
                    periph_remote->required_compress_once_time = false;
                }
                remote_data->is_compressed = true;
            } else {
                memcpy(remote_data->data, item, rx_size);
                remote_data->data_len = rx_size;
                remote_data->is_compressed = false;
            }
            remote_data->type = REMOTE_TYPE_RF;
            esp_periph_send_event(self, REMOTE_EVENT_RECEIVED, (void*)remote_data, sizeof(periph_remote_data_t));
        }
        vRingbufferReturnItem(rb, (void*) item);
        item = NULL;
        break;
    }
    if (remote_data != NULL) {
        free(remote_data);
    }
    vTaskDelete(NULL);
}

static esp_err_t _create_remote_rmt(esp_periph_handle_t self)
{
    VALIDATE_REMOTE(self, ESP_FAIL);
    periph_remote_t *periph_remote = esp_periph_get_data(self);

    rmt_config_t rmt_rx;
    rmt_rx.channel = periph_remote->rmt_rx_ch;
    rmt_rx.gpio_num = periph_remote->rx_pin;
    rmt_rx.clk_div = 80;
    rmt_rx.mem_block_num = 4;
    rmt_rx.rmt_mode = RMT_MODE_RX;
    rmt_rx.rx_config.filter_en = true;
    rmt_rx.rx_config.filter_ticks_thresh = 100;
    rmt_rx.rx_config.idle_threshold = 40000ul;
    rmt_config(&rmt_rx);
    rmt_driver_install(periph_remote->rmt_rx_ch, 2048, 0);

    rmt_config_t rmt_tx;
    rmt_tx.channel = periph_remote->rmt_tx_ch;
    rmt_tx.gpio_num = periph_remote->tx_pin;
    rmt_tx.mem_block_num = 4;
    rmt_tx.clk_div = 1;
    rmt_tx.tx_config.loop_en = false;
    rmt_tx.tx_config.carrier_duty_percent = 50;
    rmt_tx.tx_config.carrier_freq_hz = 38000;
    rmt_tx.tx_config.carrier_level = 1;
    rmt_tx.tx_config.carrier_en = true;
    rmt_tx.tx_config.idle_level = 0;
    rmt_tx.tx_config.idle_output_en = true;
    rmt_tx.rmt_mode = RMT_MODE_TX;
    rmt_tx.flags = RMT_CHANNEL_FLAGS_AWARE_DFS;
    rmt_config(&rmt_tx);
    rmt_driver_install(periph_remote->rmt_tx_ch, 0, 0);
    uint32_t counter_clk_hz = 0;
    rmt_get_counter_clock(periph_remote->rmt_tx_ch, &counter_clk_hz);
    ESP_LOGE(TAG, "clock %ld", counter_clk_hz);

    return ESP_OK;
}

static esp_err_t _create_rf_rmt(esp_periph_handle_t self)
{
    VALIDATE_REMOTE(self, ESP_FAIL);
    periph_remote_t *periph_remote = esp_periph_get_data(self);

    rmt_config_t rmt_rx;
    rmt_rx.channel = periph_remote->rf_rx_ch;
    rmt_rx.gpio_num = periph_remote->rf_rx_pin;
    rmt_rx.clk_div = 80;
    rmt_rx.mem_block_num = 4;
    rmt_rx.rmt_mode = RMT_MODE_RX;
    rmt_rx.rx_config.filter_en = true;
    rmt_rx.rx_config.filter_ticks_thresh = 12;
    rmt_rx.rx_config.idle_threshold = 40000ul;
    rmt_config(&rmt_rx);
    rmt_driver_install(periph_remote->rf_rx_ch, 1024 * 4, 0);

    rmt_config_t rmt_tx;
    rmt_tx.channel = periph_remote->rf_tx_ch;
    rmt_tx.gpio_num = periph_remote->rf_tx_pin;
    rmt_tx.mem_block_num = 4;
    rmt_tx.clk_div = 80;
    rmt_tx.tx_config.loop_en = false;
    rmt_tx.tx_config.carrier_en = false;
    rmt_tx.tx_config.idle_level = 0;
    rmt_tx.tx_config.idle_output_en = true;
    rmt_tx.rmt_mode = RMT_MODE_TX;
    rmt_config(&rmt_tx);
    rmt_driver_install(periph_remote->rf_tx_ch, 0, 0);
    esp_cc1101_set_mode_tx(periph_remote->rf_handle);

    return ESP_OK;
}

static esp_err_t _remote_init(esp_periph_handle_t self)
{
    VALIDATE_REMOTE(self, ESP_FAIL);
    periph_remote_t *periph_remote = esp_periph_get_data(self);

    _create_remote_rmt(self);
    if ((sys_cfg.features & DEVICE_FEATURE_GW_RF) == DEVICE_FEATURE_GW_RF) {
        periph_remote->rf_handle = esp_cc1101_init(&periph_remote->rf_conf);
        _create_rf_rmt(self);
    }

    return ESP_OK;
}

static esp_err_t _remote_run(esp_periph_handle_t self, audio_event_iface_msg_t *msg)
{
    return ESP_OK;
}

static esp_err_t _remote_destroy(esp_periph_handle_t self)
{
    periph_remote_t *periph_remote = esp_periph_get_data(self);
    // free(periph_remote->buffer);
    free(periph_remote);
    return ESP_OK;
}

esp_periph_handle_t periph_remote_init(periph_remote_cfg_t *config)
{
    esp_periph_handle_t periph = esp_periph_create(PERIPH_ID_REMOTE, config->tag ? config->tag : "periph_remote");
    PERIPH_MEM_CHECK(TAG, periph, return NULL);

    periph_remote_t *periph_remote = calloc(1, sizeof(periph_remote_t));
    PERIPH_MEM_CHECK(TAG, periph_remote, goto _remote_init_fail);

    periph_remote->tx_pin = config->tx_pin;
    periph_remote->rmt_tx_ch = config->rmt_tx_ch;
    periph_remote->rx_pin = config->rx_pin;
    periph_remote->rmt_rx_ch = config->rmt_rx_ch;
    periph_remote->enable_compress = config->enable_compress;
    periph_remote->required_compress_once_time = false;

    // periph_remote->buffer = malloc(DEFAULT_REMOTE_BUFFER);
    // PERIPH_MEM_CHECK(TAG, periph_remote->buffer, goto _remote_init_fail);

    periph_remote->rf_tx_pin = config->rf_tx_pin;
    periph_remote->rf_tx_ch = config->rf_tx_ch;
    periph_remote->rf_rx_pin = config->rf_rx_pin;
    periph_remote->rf_rx_ch = config->rf_rx_ch;

    periph_remote->rf_conf = config->rf_conf;

    esp_periph_set_data(periph, periph_remote);
    esp_periph_set_function(periph, _remote_init, _remote_run, _remote_destroy);

    return periph;
_remote_init_fail:
    ESP_LOGE(TAG, "Failed to initial REMOTE");
    // free(periph_remote->buffer);
    free(periph);
    return NULL;
}


esp_err_t periph_remote_send(esp_periph_handle_t periph, const char *data, int len, bool is_compressed)
{
    VALIDATE_REMOTE(periph, ESP_FAIL);
    periph_remote_t *periph_remote = esp_periph_get_data(periph);
    int send_item_len = 0;
    rmt_item32_t* item = NULL;
    char* regen_buffer = NULL;
    if (is_compressed) {
        const int source_size = DEFAULT_REMOTE_BUFFER;
        regen_buffer = malloc(source_size);
        const int decompressed_size = LZ4_decompress_safe(data, regen_buffer, len, source_size);
        if (decompressed_size < 0) {
            ESP_LOGE(TAG, "Can't decompressed %d", decompressed_size);
            free(regen_buffer);
            return ESP_FAIL;
        }
        item = (rmt_item32_t*)regen_buffer;
        send_item_len = decompressed_size / 4;
    } else {
        item = (rmt_item32_t*)data;
        send_item_len = len / 4;
    }
    // _print_items(item, send_item_len);
    vTaskDelay(50 / portTICK_PERIOD_MS);
    rmt_write_items(periph_remote->rmt_tx_ch, item, send_item_len, true);
    vTaskDelay(50 / portTICK_PERIOD_MS);
    if (regen_buffer != NULL) {
        free(regen_buffer);
    }
    return ESP_OK;
}

static remote_type_t mapping_type_remote(char* modelid)
{
    if (modelid == NULL) return REMOTE_UNKNOWN;

    for (int i = 0; i < sizeof(mapping_model_id_list) / sizeof(mapping_model_id_list[0]); i++) {
        if (strcmp(modelid, mapping_model_id_list[i].modelid) == 0) {
            return mapping_model_id_list[i].remote_type;
        }
    }
    return REMOTE_UNKNOWN;
}

esp_err_t periph_remote_ac_send(esp_periph_handle_t periph, char* modelid, bool power, int temp, int mode, int fan, bool swingH, bool swingV)
{
    if (modelid == NULL) return ESP_ERR_INVALID_ARG;
    VALIDATE_REMOTE(periph, ESP_FAIL);
    periph_remote_t *periph_remote = esp_periph_get_data(periph);
    remote_type_t remote_type = mapping_type_remote(modelid);
    rmt_item32_t *items = malloc(sizeof(rmt_item32_t) * 500);
    memset(items, 0, sizeof(rmt_item32_t) * 500);
    int offset = 0;
    switch (remote_type) {
        case SAMSUNGAC:
            offset = create_remote_send_samsung(items, power, temp, mode, fan, swingH, swingV);
            break;

        case DAIKIN:
            offset = create_remote_send_daikin(items, power, temp, mode, fan, swingH, swingV);
            break;

        case DAIKIN2:
            offset = create_remote_send_daikin2(items, power, temp, mode, fan, swingH, swingV);
            break;

        case DAIKIN216:
            offset = create_remote_send_daikin216(items, power, temp, mode, fan, swingH, swingV);
            break;

        case DAIKIN160:
            offset = create_remote_send_daikin160(items, power, temp, mode, fan, swingH, swingV);
            break;

        case DAIKIN176:
            offset = create_remote_send_daikin176(items, power, temp, mode, fan, swingH, swingV);
            break;

        case DAIKIN128:
            offset = create_remote_send_daikin128(items, power, temp, mode, fan, swingH, swingV);
            break;

        case DAIKIN64:
            offset = create_remote_send_daikin64(items, power, temp, mode, fan, swingH, swingV);
            break;

        default:
            break;
    }
    ESP_LOGI(TAG, "begin send %d", offset);
    rmt_write_items(periph_remote->rmt_tx_ch, items, offset, true);
    rmt_wait_tx_done(periph_remote->rmt_tx_ch, portMAX_DELAY);
    ESP_LOGI(TAG, "send done");
    free(items);
    return ESP_OK;
}

esp_err_t periph_remote_receive(esp_periph_handle_t periph)
{
    VALIDATE_REMOTE(periph, ESP_FAIL);

    xTaskCreate(_remote_task, "remote_task", DEFAULT_REMOTE_TASK_STACK, periph, 5, NULL);
    return ESP_OK;
}

esp_err_t periph_remote_require_compress(esp_periph_handle_t periph, bool is_once_time)
{
    VALIDATE_REMOTE(periph, ESP_FAIL);
    periph_remote_t *periph_remote = esp_periph_get_data(periph);
    periph_remote->required_compress_once_time = is_once_time;
    if (!is_once_time) {
        periph_remote->enable_compress = true;
    }
    return ESP_OK;
}

esp_err_t periph_remote_disable_compress(esp_periph_handle_t periph)
{
    VALIDATE_REMOTE(periph, ESP_FAIL);
    periph_remote_t *periph_remote = esp_periph_get_data(periph);
    periph_remote->enable_compress = false;
    return ESP_OK;
}

esp_err_t periph_remote_send_rf(esp_periph_handle_t periph, const char *data, int len, bool is_compressed)
{
    VALIDATE_REMOTE(periph, ESP_FAIL);
    periph_remote_t *periph_remote = esp_periph_get_data(periph);

    int send_item_len = 0;
    rmt_item32_t* item = NULL;
    char* regen_buffer = NULL;
    if (is_compressed) {
        const int source_size = DEFAULT_REMOTE_BUFFER;
        regen_buffer = malloc(source_size);
        const int decompressed_size = LZ4_decompress_safe(data, regen_buffer, len, source_size);
        if (decompressed_size < 0) {
            ESP_LOGE(TAG, "Can't decompressed %d", decompressed_size);
            free(regen_buffer);
            return ESP_FAIL;
        }
        item = (rmt_item32_t*)regen_buffer;
        send_item_len = decompressed_size / 4;
    } else {
        item = (rmt_item32_t*)data;
        send_item_len = len / 4;
    }
    esp_cc1101_set_mode_tx(periph_remote->rf_handle);
    for (int i = 0; i < LOOP_TRANSMIT_PACKET; i++) {
        rmt_write_items(periph_remote->rf_tx_ch, item, send_item_len, true);
    }
    vTaskDelay(100/portTICK_RATE_MS);
    if (regen_buffer != NULL) {
        free(regen_buffer);
    }
    return ESP_OK;
}

esp_err_t periph_remote_receive_rf(esp_periph_handle_t periph)
{
    VALIDATE_REMOTE(periph, ESP_FAIL);
    xTaskCreatePinnedToCore(_rf_task, "rf_task", DEFAULT_REMOTE_TASK_STACK, periph, 5, NULL, 1);
    return ESP_OK;
}
