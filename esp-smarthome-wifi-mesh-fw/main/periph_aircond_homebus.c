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

#define HOMEBUS_BUFFER_SIZE         128
#define TIMEOUT_SEND_PAIRING        40 * 1000
#define TIMEOUT_EXCHANGE_DATA       5 * 1000
#define HOMEBUS_DEFAULT_BAUDRATE    9600

static const char *TAG = "AIRCOND_HOMEBUS";

typedef struct ac_homebus_ {
    uint8_t *tx_buffer;
    uint8_t *rx_buffer;
    aircond_info_t info;
    aircond_info_t control_info;
    aircond_hardware_t hw;
    bool connected;
    int32_t last_send_pairing;
    int32_t last_exchange_data;
    bool sent_sync;
    bool control_flag;
    uint8_t pre_checksum;
} ac_homebus_t;

uint8_t checksum_template[] = {
    0x00, 0xD0, 0x13, 0xC3, 0x26, 0xF6,
    0x35, 0xE5, 0x4C, 0x9C, 0x5F, 0x8F,
    0x6A, 0xBA, 0x79, 0xA9, 0x98, 0x48,
    0x8B, 0x5B, 0xBE, 0x6E, 0xAD, 0x7D,
    0xD4, 0x04, 0xC7, 0x17, 0xF2, 0x22,
    0xE1, 0x31, 0x83, 0x53, 0x90, 0x40,
    0xA5, 0x75, 0xB6, 0x66, 0xCF, 0x1F,
    0xDC, 0x0C, 0xE9, 0x39, 0xFA, 0x2A,
    0x1B, 0xCB, 0x08, 0xD8, 0x3D, 0xED,
    0x2E, 0xFE, 0x57, 0x87, 0x44, 0x94,
    0x71, 0xA1, 0x62, 0xB2, 0xB5, 0x65,
    0xA6, 0x76, 0x93, 0x43, 0x80, 0x50,
    0xF9, 0x29, 0xEA, 0x3A, 0xDF, 0x0F,
    0xCC, 0x1C, 0x2D, 0xFD, 0x3E, 0xEE,
    0x0B, 0xDB, 0x18, 0xC8, 0x61, 0xB1,
    0x72, 0xA2, 0x47, 0x97, 0x54, 0x84,
    0x36, 0xE6, 0x25, 0xF5, 0x10, 0xC0,
    0x03, 0xD3, 0x7A, 0xAA, 0x69, 0xB9,
    0x5C, 0x8C, 0x4F, 0x9F, 0xAE, 0x7E,
    0xBD, 0x6D, 0x88, 0x58, 0x9B, 0x4B,
    0xE2, 0x32, 0xF1, 0x21, 0xC4, 0x14,
    0xD7, 0x07, 0xD9, 0x09, 0xCA, 0x1A,
    0xFF, 0x2F, 0xEC, 0x3C, 0x95, 0x45,
    0x86, 0x56, 0xB3, 0x63, 0xA0, 0x70,
    0x41, 0x91, 0x52, 0x82, 0x67, 0xB7,
    0x74, 0xA4, 0x0D, 0xDD, 0x1E, 0xCE,
    0x2B, 0xFB, 0x38, 0xE8, 0x5A, 0x8A,
    0x49, 0x99, 0x7C, 0xAC, 0x6F, 0xBF,
    0x16, 0xC6, 0x05, 0xD5, 0x30, 0xE0,
    0x23, 0xF3, 0xC2, 0x12, 0xD1, 0x01,
    0xE4, 0x34, 0xF7, 0x27, 0x8E, 0x5E,
    0x9D, 0x4D, 0xA8, 0x78, 0xBB, 0x6B,
    0x6C, 0xBC, 0x7F, 0xAF, 0x4A, 0x9A,
    0x59, 0x89, 0x20, 0xF0, 0x33, 0xE3,
    0x06, 0xD6, 0x15, 0xC5, 0xF4, 0x24,
    0xE7, 0x37, 0xD2, 0x02, 0xC1, 0x11,
    0xB8, 0x68, 0xAB, 0x7B, 0x9E, 0x4E,
    0x8D, 0x5D, 0xEF, 0x3F, 0xFC, 0x2C,
    0xC9, 0x19, 0xDA, 0x0A, 0xA3, 0x73,
    0xB0, 0x60, 0x85, 0x55, 0x96, 0x46,
    0x77, 0xA7, 0x64, 0xB4, 0x51, 0x81,
    0x42, 0x92, 0x3B, 0xEB, 0x28, 0xF8,
    0x1D, 0xCD, 0x0E, 0xDE
};

#define HOMEBUS_REQUEST_CODE            0x00
#define HOMEBUS_RESPONSE_CODE           0x40
#define HOMEBUS_FRAME_RESPONSE_SIZE     19
#define HOMEBUS_FRAME_REQUEST_SIZE      20
#define HOMEBUS_SLAVE_ADDRESS           0xF0
#define HOMEBUS_CONTROL_PACKET_ID       0x38
#define HOMEBUS_UNKNOW_SERVICE_1        0x32
#define HOMEBUS_UNKNOW_SERVICE_2        0x3A
#define HOMEBUS_UNKNOW_SERVICE_3        0x35
#define HOMEBUS_UNKNOW_SERVICE_4        0x36
#define HOMEBUS_EXISTENCE_PACKET_ID     0x30
#define HOMEBUS_ACK_PACKET_ID           0x39

#define HOMEBUS_ON                      0x01
#define HOMEBUS_OFF                     0x00

#define HOMEBUS_REQUEST_MODE_COOL       0x0202
#define HOMEBUS_REQUEST_MODE_HEAT       0x0101
#define HOMEBUS_REQUEST_MODE_FAN        0x0000
#define HOMEBUS_REQUEST_MODE_DRY        0x0207
#define HOMEBUS_REQUEST_SPEED_HIGH      0x50
#define HOMEBUS_REQUEST_SPEED_MED       0x30
#define HOMEBUS_REQUEST_SPEED_LOW       0x10

#define HOMEBUS_RESPONSE_MODE_COOL      0x02
#define HOMEBUS_RESPONSE_MODE_HEAT      0x01
#define HOMEBUS_RESPONSE_MODE_FAN       0x00
#define HOMEBUS_RESPONSE_MODE_DRY       0x07
#define HOMEBUS_RESPONSE_SPEED_HIGH     0x50
#define HOMEBUS_RESPONSE_SPEED_MED      0x30
#define HOMEBUS_RESPONSE_SPEED_LOW      0x10

#define AIRCOND_MIN_TEMP                (16)

// check status:
//
// 40 F0 38 00     | 01   | 1A   |  00 |  30   | 00 | 1A   | 00 | 50         | 00 00 00 00 C0 00 7A
//          on/off | mode | temp |     |  speed|    | temp |    | speed heat |

uint8_t homebus_response_sample[HOMEBUS_FRAME_RESPONSE_SIZE] = {
    0x40, 0xF0, 0x38, 0x00, 0x02, 0x19, 0x00, 0x30, 0x00, 0x19, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x00, 0xC8,
};
uint8_t homebus_request_sampe[HOMEBUS_FRAME_REQUEST_SIZE] = {
    0x00, 0xF0, 0x38, 0x00, 0x00, 0x12, 0x02, 0x1A, 0x80, 0xB0, 0x00, 0x1A, 0x80, 0x50, 0x00, 0x00, 0x02, 0x00, 0xC0, 0x33,
};

uint8_t homebus_response_existence[] = {
    0x40, 0xF0, 0x30, 0x6D
};
uint8_t homebus_response_ack[] = {
    0x40, 0xF0, 0x39, 0x00, 0x00, 0x00, 0x00, 0xB9
};
uint8_t homebus_response_none_support[] = {
    0x40, 0xF0, 0xFF, 0xA8
};

typedef union __attribute__((__packed__)){
    uint8_t data[HOMEBUS_FRAME_RESPONSE_SIZE];
    struct __attribute__((__packed__)){
        uint8_t response_code;
        uint8_t index;
        uint8_t packet_id;
        uint8_t on_off;
        uint8_t mode;
        uint8_t temp_cool;
        uint8_t dum1;
        uint8_t fan_speed;
        uint8_t dum2;
        uint8_t temp_heat;
        uint8_t dump4;
        uint8_t fan_speed_heat;
        uint8_t dump3[6];
        uint8_t crc;
    } field;
} homebus_response_frame_t;

//          | on/off |    | mode  | temp |    | fan |    | temp |    | fan_heat |
typedef union __attribute__((__packed__)){
    uint8_t data[HOMEBUS_FRAME_REQUEST_SIZE];
    struct __attribute__((__packed__)){
        uint8_t request_code;
        uint8_t index;
        uint8_t packet_id;
        uint8_t on_off;
        uint8_t dum1; // Unknown its meaning, check if not equal zero, drop this message.
        uint16_t mode;
        uint8_t temp_cool;
        uint8_t dum2;
        uint8_t fan_speed;
        uint8_t dum3;
        uint8_t temp_heat;
        uint8_t dum4;
        uint8_t fan_speed_heat;
        uint8_t dum5[6];
    } field;
} homebus_request_frame_t;

uint8_t _homebus_get_control_on_off(aircond_info_t control_info)
{
    if (control_info.mode == AIRCOND_MODE_OFF) {
        return HOMEBUS_OFF;
    }
    return HOMEBUS_ON;
}

uint8_t _homebus_get_control_mode(aircond_info_t control_info)
{
    switch (control_info.mode)
    {
    case AIRCOND_MODE_COOL:
        return HOMEBUS_RESPONSE_MODE_COOL;
    case AIRCOND_MODE_DRY:
        return HOMEBUS_RESPONSE_MODE_DRY;
    case AIRCOND_MODE_FAN:
        return HOMEBUS_RESPONSE_MODE_FAN;
    case AIRCOND_MODE_HEAT:
        return HOMEBUS_RESPONSE_MODE_HEAT;
    case AIRCOND_MODE_AUTO:
        return HOMEBUS_RESPONSE_MODE_COOL;
    default:
        break;
    }
    return HOMEBUS_RESPONSE_MODE_COOL;
}

uint8_t _homebus_get_control_temperature(aircond_info_t control_info)
{
    return (uint8_t)control_info.setpoint;
}

uint8_t _homebus_get_control_fan(aircond_info_t control_info)
{
    uint8_t speed = HOMEBUS_RESPONSE_SPEED_MED;
    switch (control_info.fanspeed)
    {
    case AIRCOND_FANSPEED_1:
        speed = HOMEBUS_RESPONSE_SPEED_LOW;
        break;
    case AIRCOND_FANSPEED_2:
        speed = HOMEBUS_RESPONSE_SPEED_MED;
        break;
    case AIRCOND_FANSPEED_3:
        speed = HOMEBUS_RESPONSE_SPEED_HIGH;
        break;
    default:
        speed = HOMEBUS_RESPONSE_SPEED_MED;
        break;
    }
    return speed;
}

bool hb_checksum(uint8_t *data, int len)
{
    uint8_t crc = 0x0;
    for (int i = 0; i < len - 1; ++i) {
        crc = checksum_template[data[i] ^ crc];
    }

    crc = crc ^ 0x0;
    crc = crc & 0xFF;
    return (crc == data[len - 1]);
}

uint8_t hb_get_checksum(uint8_t *data, int len)
{
    uint8_t crc = 0x0;
    for (int i = 0; i < len; ++i) {
        crc = checksum_template[data[i] ^ crc];
    }

    crc = crc ^ 0x0;
    crc = crc & 0xFF;
    return crc;
}

void print_hex(uint8_t* data, int len)
{
    for (int i = 0; i < len; i++) {
        printf("%02X ", data[i]);
    }
    printf(" %s\n", hb_checksum(data, len) ? "true" : "false");
}

static esp_err_t homebus_write_frame(homebus_handle_t handle, uint8_t *data, int len, bool add_crc)
{
    if (handle == NULL) {
        return ESP_FAIL;
    }
    if (add_crc) {
        data[len - 1] = hb_get_checksum(data, len -  1);
    }
    homebus_write(data, len, portMAX_DELAY);
    return ESP_OK;
}

static int homebus_read_frame(homebus_handle_t handle, uint8_t* data)
{
    return uart_read_bytes(handle->hw.homebus.uart_no, data, HOMEBUS_BUFFER_SIZE, 20 / portTICK_RATE_MS);
}

aircond_mode_t _homebus_get_aircond_mode(homebus_request_frame_t frame)
{
    if (frame.field.on_off == HOMEBUS_OFF) {
        return AIRCOND_MODE_OFF;
    }
    // frame.field.mode &= 0xFF0F;
    uint16_t check = frame.field.mode & 0x0F0F;
    if (check == HOMEBUS_REQUEST_MODE_HEAT) {
        return AIRCOND_MODE_HEAT;
    }
    if (check == HOMEBUS_REQUEST_MODE_FAN) {
        return AIRCOND_MODE_FAN;
    }
    if (check == HOMEBUS_REQUEST_MODE_COOL) {
        return AIRCOND_MODE_COOL;
    }
    if (check == HOMEBUS_REQUEST_MODE_DRY) {
        return AIRCOND_MODE_DRY;
    }
    return AIRCOND_MODE_NO_CHANGE;
}

aircond_fanspeed_t _homebus_get_aircond_fan_speed(homebus_request_frame_t frame, aircond_mode_t mode)
{
    uint8_t check = (mode == AIRCOND_MODE_HEAT) ? frame.field.fan_speed_heat : frame.field.fan_speed;
    check &= 0x70;
    switch (check)
    {
    case HOMEBUS_REQUEST_SPEED_HIGH:
        return AIRCOND_FANSPEED_3;
    case HOMEBUS_REQUEST_SPEED_MED:
        return AIRCOND_FANSPEED_2;
    case HOMEBUS_REQUEST_SPEED_LOW:
        return AIRCOND_FANSPEED_1;
    default:
        break;
    }
    return AIRCOND_FANSPEED_2;
}

uint8_t _homebus_get_aircond_temp(homebus_request_frame_t frame, aircond_mode_t mode)
{
    if (mode == AIRCOND_MODE_HEAT) {
        return frame.field.temp_heat;
    }
    return frame.field.temp_cool;
}

static esp_err_t _get_aircond_info(aircond_info_t* info, homebus_request_frame_t frame)
{
    info->mode = _homebus_get_aircond_mode(frame);
    if (info->mode == AIRCOND_MODE_NO_CHANGE) {
        return ESP_FAIL;
    }
    info->fanspeed = _homebus_get_aircond_fan_speed(frame, info->mode);
    info->setpoint = _homebus_get_aircond_temp(frame, info->mode);
    if (info->setpoint < AIRCOND_MIN_TEMP) {
        return ESP_FAIL;
    }
    info->temperature = 28;
    info->vanes = AIRCOND_VANE_SWING;
    return ESP_OK;
}

esp_err_t _homebus_pairing_master(homebus_handle_t handle, uint8_t* data, int len)
{
    if (handle == NULL) {
        return ESP_FAIL;
    }
    if (handle->connected) {
        return ESP_OK;
    }
    if ((esp_periph_tick_get() - handle->last_send_pairing > TIMEOUT_SEND_PAIRING) && len == 0) {
        ESP_LOGE(TAG, "Send pairing signal");
        handle->last_send_pairing = esp_periph_tick_get();
        handle->tx_buffer[0] = 0xFF;
        homebus_write_frame(handle, handle->tx_buffer, 1, false);
        handle->sent_sync = false;
    }
    return ESP_OK;
}

homebus_response_frame_t _homebus_create_response_control(aircond_info_t info)
{
    homebus_response_frame_t ret;
    memcpy(ret.data, homebus_response_sample, HOMEBUS_FRAME_RESPONSE_SIZE);
    ret.field.on_off = _homebus_get_control_on_off(info);
    ret.field.mode = _homebus_get_control_mode(info);
    if (info.mode == AIRCOND_MODE_HEAT) {
        ret.field.temp_heat = _homebus_get_control_temperature(info);
    } else if (info.mode == AIRCOND_MODE_COOL) {
        ret.field.temp_cool = _homebus_get_control_temperature(info);
    }
    ret.field.fan_speed = _homebus_get_control_fan(info);
    ret.field.fan_speed_heat = ret.field.fan_speed;
    return ret;
}

bool _homebus_info_is_changed(aircond_info_t pre_info, aircond_info_t current_info)
{
    uint16_t check = 0;
    check += pre_info.mode ^ current_info.mode;
    check += pre_info.setpoint ^ current_info.setpoint;
    check += pre_info.fanspeed ^ current_info.fanspeed;
    return (bool)check;
}

bool _homebus_check_if_valid_control_frame(aircond_info_t control_info)
{
    if (control_info.setpoint < AIRCOND_MIN_TEMP) {
        return false;
    }
    if (control_info.mode < AIRCOND_MODE_OFF) {
        return false;
    }
    return true;
}

aircond_info_t* _homebus_exchange_data(homebus_handle_t handle, uint8_t* data, int len)
{
    if (handle == NULL) {
        return NULL;
    }
    if (len <= 0) {
        if (!handle->connected) {
            handle->info.is_online = false;
            return &handle->info;
        }
        return NULL;
    }
    if (!hb_checksum(data, len)) {
        return NULL;
    }
    if (len >= 3 && data[0] == HOMEBUS_REQUEST_CODE && data[1] == HOMEBUS_SLAVE_ADDRESS) {
        if (data[2] == HOMEBUS_EXISTENCE_PACKET_ID) {
            ESP_LOGD(TAG, "Send existence response");
            homebus_write_frame(handle, homebus_response_existence, sizeof(homebus_response_existence), true);
            handle->sent_sync = false;
            return NULL;
        } else if (data[2] == HOMEBUS_ACK_PACKET_ID) {
            ESP_LOGD(TAG, "Send response_ack");
            homebus_write_frame(handle, homebus_response_ack, sizeof(homebus_response_ack), true);
            return NULL;
        } else if ( data[2] == HOMEBUS_UNKNOW_SERVICE_1 ||\
                    data[2] == HOMEBUS_UNKNOW_SERVICE_2 ||\
                    data[2] == HOMEBUS_UNKNOW_SERVICE_3 ||\
                    data[2] == HOMEBUS_UNKNOW_SERVICE_4) {
            ESP_LOGD(TAG, "Send unknow service response");
            homebus_write_frame(handle, homebus_response_none_support, sizeof(homebus_response_none_support), true);
        } else if (data[2] != HOMEBUS_CONTROL_PACKET_ID) {
            ESP_LOGW(TAG, "Unknow request");
            print_hex(data, len);
            return NULL;
        }
    }

    if (len >= HOMEBUS_FRAME_REQUEST_SIZE &&
        data[0] == HOMEBUS_REQUEST_CODE &&
        data[1] == HOMEBUS_SLAVE_ADDRESS &&
        data[2] == HOMEBUS_CONTROL_PACKET_ID &&
        data[4] == 0x00) {

        // ESP_LOGE(TAG, "<=== request");
        // print_hex(data, len);
        handle->connected = true;
        handle->last_exchange_data = esp_periph_tick_get();
        homebus_request_frame_t request_frame;
        memcpy(request_frame.data, data, HOMEBUS_FRAME_REQUEST_SIZE);
        aircond_info_t current_info;
        if (_get_aircond_info(&current_info, request_frame) == ESP_FAIL) {
            ESP_LOGE(TAG, "Invalid request frame");
            return NULL;
        }
        ESP_LOGD(TAG, "setpoint=%d, fanspeed = %d, vanes=%d, temperature=%f, mode=%d",
                current_info.setpoint,
                current_info.fanspeed,
                current_info.vanes,
                current_info.temperature,
                current_info.mode);

        if (_homebus_info_is_changed(handle->info, current_info)) {
            handle->sent_sync = false;
            memcpy(&handle->info, &current_info, sizeof(aircond_info_t));
        }
        handle->info.is_online = true;

        // Check if has a valid control.
        if (handle->control_flag && !_homebus_check_if_valid_control_frame(handle->control_info)) {
            handle->control_flag = false;
        }

        homebus_response_frame_t response_frame;
        if (handle->sent_sync && handle->control_flag) {
            response_frame = _homebus_create_response_control(handle->control_info);
            if (handle->control_info.mode != AIRCOND_MODE_COOL) {
                response_frame.field.temp_cool = request_frame.field.temp_cool;
            }
            if (handle->control_info.mode != AIRCOND_MODE_HEAT) {
                response_frame.field.temp_heat = request_frame.field.temp_heat;
            }
            response_frame.field.mode |= (request_frame.field.mode & 0xF0);
            homebus_write_frame(handle, response_frame.data, HOMEBUS_FRAME_RESPONSE_SIZE, true);
            handle->control_flag = false;
            // ESP_LOGE(TAG, "===> control");
            // print_hex(response_frame.data, HOMEBUS_FRAME_RESPONSE_SIZE);
        } else {
            response_frame = _homebus_create_response_control(handle->info);
            response_frame.field.on_off = request_frame.field.on_off;
            response_frame.field.temp_cool = request_frame.field.temp_cool;
            response_frame.field.temp_heat = request_frame.field.temp_heat;
            response_frame.field.fan_speed_heat = (request_frame.field.fan_speed_heat & 0x70);
            response_frame.field.mode |= (request_frame.field.mode & 0xF0);
            homebus_write_frame(handle, response_frame.data, HOMEBUS_FRAME_RESPONSE_SIZE, true);
            handle->sent_sync = true;
            // ESP_LOGE(TAG, "===> sync");
            // print_hex(response_frame.data, HOMEBUS_FRAME_RESPONSE_SIZE);
        }
        return &handle->info;
    }
    return NULL;
}

aircond_info_t* periph_ac_homebus_process(void *ctx, aircond_info_t* control_info)
{
    homebus_handle_t handle = (homebus_handle_t)ctx;
    if (handle == NULL) {
        return NULL;
    }
    if (control_info != NULL) {
        memcpy(&handle->control_info, control_info, sizeof(aircond_info_t));
        handle->control_flag = true;
    }
    if (esp_periph_tick_get() - handle->last_exchange_data > TIMEOUT_EXCHANGE_DATA) {
        handle->connected = false;
    }
    int len = homebus_read_frame(handle, handle->rx_buffer);
    _homebus_pairing_master(handle, handle->rx_buffer, len);
    return _homebus_exchange_data(handle, handle->rx_buffer, len);
}

homebus_handle_t periph_ac_homebus_init(aircond_hardware_t *homebus_config)
{
    homebus_handle_t homebus_handle = calloc(1, sizeof(ac_homebus_t));
    PERIPH_MEM_CHECK(TAG, homebus_handle, goto _homebus_init_fail);
    memcpy(&homebus_handle->hw, homebus_config, sizeof(aircond_hardware_t));

    homebus_handle->tx_buffer = malloc(HOMEBUS_BUFFER_SIZE);
    PERIPH_MEM_CHECK(TAG, homebus_handle->tx_buffer, goto _homebus_init_fail);
    homebus_handle->rx_buffer = malloc(HOMEBUS_BUFFER_SIZE);
    PERIPH_MEM_CHECK(TAG, homebus_handle->rx_buffer, goto _homebus_init_fail);
    homebus_handle->last_send_pairing = esp_periph_tick_get();
    homebus_handle->last_exchange_data = -1;
    homebus_handle->control_flag = false;

    homebus_handle->control_info.fanspeed = AIRCOND_FANSPEED_1;
    homebus_handle->control_info.is_online = false;
    homebus_handle->control_info.mode = AIRCOND_MODE_OFF;
    homebus_handle->control_info.setpoint = 25;

    homebus_handle->connected = false;
    homebus_handle->pre_checksum = 0;

    return homebus_handle;
_homebus_init_fail:
    ESP_LOGE(TAG, "Failed to initial AIRCOND HOMEBUS");
    free(homebus_handle->tx_buffer);
    free(homebus_handle->rx_buffer);
    return NULL;
}

esp_err_t _homebus_init(void *ctx)
{
    homebus_handle_t handle = (homebus_handle_t)ctx;
    uart_config_t uart_config = {
        .baud_rate = HOMEBUS_DEFAULT_BAUDRATE,
        .data_bits = UART_DATA_8_BITS,
        .parity    = UART_PARITY_EVEN,
        .stop_bits = UART_STOP_BITS_1,
        .flow_ctrl = UART_HW_FLOWCTRL_DISABLE
    };
    uart_param_config(handle->hw.homebus.uart_no, &uart_config);
    uart_set_pin(handle->hw.homebus.uart_no, -1, handle->hw.homebus.rx, -1, -1);
    uart_driver_install(handle->hw.homebus.uart_no, 1024 * 2, 0, 0, NULL, 0);
    uart_set_mode(handle->hw.homebus.uart_no, UART_MODE_RS485_HALF_DUPLEX);
    homebus_config_t config = {
        .tx_pin = handle->hw.homebus.tx,
        .tx_channel = 0,
        .rx_pin = -1,
        .rx_channel = -1,
        .stop_bit = 1,
        .parity = PARITY_EVEN,
    };
    homebus_init(&config);
    return ESP_OK;
}
