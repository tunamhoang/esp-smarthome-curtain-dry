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
#include "app_config.h"

#define UART_AIRCOND_BUFFER         512
#define UART_DEFAULT_BAUDRATE       2400
#define UART_FRAME_CONTROL_SIZE     9
#define UART_FRAME_DATA_SIZE        10
#define UART_TIMEOUT_EXCHANGE_DATA  10*1000
#define COUNTER_SAMPLE_TO_UPDATE    4

#define UART_CONTROL_PACKET_ID      0x3144
#define UART_START_FRAME            0x02
#define UART_END_FRAME              0x03
#define UART_ACK_CODE               0x06

#define UART_ON                     0x31
#define UART_OFF                    0x30
#define UART_MODE_COOL              0x33
#define UART_MODE_HEAT              0x34
#define UART_MODE_FAN               0x36
#define UART_MODE_DRY               0x32
#define UART_MODE_AUTO              0x30
#define UART_SPEED_AUTO             0x41
#define UART_SPEED_HIGH             0x37
#define UART_SPEED_MED              0x35
#define UART_SPEED_LOW              0x33

static const char *TAG = "AIRCOND_UART";

typedef struct ac_uart_ {
    uint8_t *tx_buffer;
    uint8_t *rx_buffer;
    aircond_info_t info;
    aircond_info_t new_info;
    aircond_hardware_t hw;
    bool control_flag;
    int32_t last_exchange_data;
    int counter_update;
} ac_uart_t;

uint8_t get_data_frame[] = {0x02, 0x46, 0x31, 0x77, 0x03};
uint8_t sample_control_frame[] = {0x02,0x44,0x31,0x31,0x30,0x50,0x41,0x67,0x03};

//  02   | 44      | 31   | 30     | 33   | 4e   | 41  | 67       | 03
// START | COMMAND | TYPE | ON/OFF | MODE | TEMP | FAN | CHECKSUM | END |

typedef union __attribute__((__packed__)){
    uint8_t data[UART_FRAME_CONTROL_SIZE];
    struct __attribute__((__packed__)){
        uint8_t     start;
        uint16_t    id;
        uint8_t     on_off;
        uint8_t     mode;
        uint8_t     temp;
        uint8_t     fan_speed;
        uint8_t     checksum;
        uint8_t     end;
    } field;
} uart_control_frame_t;

// 06  | 02    | 47 | 31 | 30     | 33   | 40   | 35  | 50       | 03
// ACK | START |         | ON/OFF | MODE | TEMP | FAN | CHECKSUM | END

typedef union __attribute__((__packed__)) {
    uint8_t data[UART_FRAME_DATA_SIZE];
    struct __attribute__((__packed__)) {
        uint8_t ack;
        uint8_t start;
        uint16_t id;
        uint8_t on_off;
        uint8_t mode;
        uint8_t temp;
        uint8_t fan_speed;
        uint8_t checksum;
        uint8_t end;
    } field;
} uart_data_frame_t;

uart_handle_t periph_ac_uart_init(aircond_hardware_t *uart_config)
{
    uart_handle_t uart_handle = calloc(1, sizeof(ac_uart_t));
    PERIPH_MEM_CHECK(TAG, uart_handle, goto _uart_init_fail);
    memcpy(&uart_handle->hw, uart_config, sizeof(aircond_hardware_t));
    uart_handle->tx_buffer = malloc(UART_AIRCOND_BUFFER);
    PERIPH_MEM_CHECK(TAG, uart_handle->tx_buffer, goto _uart_init_fail);
    uart_handle->rx_buffer = malloc(UART_AIRCOND_BUFFER);
    PERIPH_MEM_CHECK(TAG, uart_handle->rx_buffer, goto _uart_init_fail);
    uart_handle->control_flag = false;
    memset(&uart_handle->new_info, 0, sizeof(aircond_info_t));
    memset(&uart_handle->info, 0, sizeof(aircond_info_t));
    return uart_handle;
_uart_init_fail:
    ESP_LOGE(TAG, "Failed to initial AIRCOND UART");
    free(uart_handle->tx_buffer);
    free(uart_handle->rx_buffer);
    free(uart_handle);
    return NULL;
}

esp_err_t _uart_init(void *ctx)
{
    uart_handle_t handle = (uart_handle_t)ctx;
    if (handle == NULL) {
        return ESP_FAIL;
    }
    uart_config_t uart_config = {
        .baud_rate = UART_DEFAULT_BAUDRATE,
        .data_bits = UART_DATA_8_BITS,
        .parity    = UART_PARITY_EVEN,
        .stop_bits = UART_STOP_BITS_2,
        .flow_ctrl = UART_HW_FLOWCTRL_DISABLE
    };

    uart_param_config(handle->hw.uart.uart_no, &uart_config);
    uart_set_pin(handle->hw.uart.uart_no, handle->hw.uart.tx, handle->hw.uart.rx, -1, -1);
    return uart_driver_install(handle->hw.uart.uart_no, UART_AIRCOND_BUFFER * 2, 0, 0, NULL, 0);
}

static uint8_t _checksum(uint8_t *data, int len)
{
    uint8_t ck = 0;
    for (int i = 0; i < len; i++) {
        ck += *data;
        data++;
    }
    return ck;
}

static bool _uart_is_valid_checksum(uint8_t *data, int len)
{
    if (data == NULL || len <= 0) {
        return false;
    }
    uint8_t sum = _checksum(data, len - 1);
    return (data[len - 1] == sum);
}

uint8_t _uart_exchange_info(uart_handle_t handle, uint8_t* frame, int size)
{
    uart_write_bytes(handle->hw.uart.uart_no, (const char *) frame, size);
    int len = uart_read_bytes(handle->hw.uart.uart_no, handle->rx_buffer, UART_AIRCOND_BUFFER, 10 / portTICK_RATE_MS);
    return len;
}

static bool _is_valid_data_frame(uint8_t *data, uint8_t len)
{
    if (len != UART_FRAME_DATA_SIZE) {
        return false;
    }
    if (data[0] != UART_ACK_CODE || data[1] != UART_START_FRAME || data[len - 1] != UART_END_FRAME) {
        return false;
    }
    return _uart_is_valid_checksum(data + 2, len - 3);
}

static aircond_mode_t _uart_get_aircond_mode(uart_data_frame_t frame)
{
    if (frame.field.on_off == UART_OFF) {
        return AIRCOND_MODE_OFF;
    }
    if (frame.field.mode == UART_MODE_COOL) {
        return AIRCOND_MODE_COOL;
    }
    if (frame.field.mode == UART_MODE_HEAT) {
        return AIRCOND_MODE_HEAT;
    }
    if (frame.field.mode == UART_MODE_DRY) {
        return AIRCOND_MODE_DRY;
    }
    if (frame.field.mode == UART_MODE_FAN) {
        return AIRCOND_MODE_FAN;
    }
    if (frame.field.mode == UART_MODE_AUTO) {
        return AIRCOND_MODE_AUTO;
    }
    return AIRCOND_MODE_COOL;
}

static aircond_fanspeed_t _uart_get_aircond_fanspeed(uart_data_frame_t frame)
{
    if (frame.field.fan_speed >= UART_SPEED_LOW && frame.field.fan_speed < UART_SPEED_MED) {
        return AIRCOND_FANSPEED_1;
    } else if (frame.field.fan_speed >= UART_SPEED_MED && frame.field.fan_speed < UART_SPEED_HIGH) {
        return AIRCOND_FANSPEED_2;
    } else if (frame.field.fan_speed == UART_SPEED_HIGH) {
        return AIRCOND_FANSPEED_3;
    } else if (frame.field.fan_speed == UART_SPEED_AUTO) {
        return AIRCOND_FANSPEED_AUTO;
    }
    return AIRCOND_FANSPEED_AUTO;
}

static int _uart_get_aircond_temperature(uart_data_frame_t frame)
{
    return (frame.field.temp - 0x40) / 2 + 18;
}

static void _uart_get_aircond_info(aircond_info_t* info, uart_data_frame_t frame)
{
    info->mode = _uart_get_aircond_mode(frame);
    info->setpoint = _uart_get_aircond_temperature(frame);
    info->fanspeed = _uart_get_aircond_fanspeed(frame);
    // info->temperature = 27;
}

aircond_info_t* _uart_get_info(uart_handle_t handle)
{
    if (handle == NULL) {
        return NULL;
    }
    int len = _uart_exchange_info(handle, get_data_frame, sizeof(get_data_frame));
    vTaskDelay(250 / portTICK_PERIOD_MS);
    if (_is_valid_data_frame(handle->rx_buffer, len)) {
        handle->last_exchange_data = esp_periph_tick_get();
        uart_data_frame_t data_frame;
        memcpy(data_frame.data, handle->rx_buffer, len);
        _uart_get_aircond_info(&handle->info, data_frame);
        handle->info.is_online = true;
        handle->counter_update++;
        if (handle->counter_update >= COUNTER_SAMPLE_TO_UPDATE) {
            handle->counter_update = 0;
            ESP_LOGD(TAG, "setpoint=%d, fanspeed = %d mode=%d",
                    handle->info.setpoint,
                    handle->info.fanspeed,
                    handle->info.mode);
            return &handle->info;
        }
        return NULL;
    }
    if (esp_periph_tick_get() - handle->last_exchange_data > UART_TIMEOUT_EXCHANGE_DATA) {
        handle->info.is_online = false;
        return &handle->info;
    }
    return NULL;
}

uint8_t _uart_get_control_on_off(aircond_info_t control_info)
{
    if (control_info.mode == AIRCOND_MODE_OFF) {
        return UART_OFF;
    }
    return UART_ON;
}

uint8_t _uart_get_control_mode(aircond_info_t control_info)
{
    switch (control_info.mode)
    {
    case AIRCOND_MODE_COOL:
        return UART_MODE_COOL;
    case AIRCOND_MODE_DRY:
        return UART_MODE_DRY;
    case AIRCOND_MODE_FAN:
        return UART_MODE_FAN;
    case AIRCOND_MODE_HEAT:
        return UART_MODE_HEAT;
    case AIRCOND_MODE_AUTO:
        return UART_MODE_AUTO;
    default:
        break;
    }
    return UART_MODE_COOL;
}

uint8_t _uart_get_control_temperature(aircond_info_t control_info)
{
    return (uint8_t)(control_info.setpoint - 18) * 2 + 0x40;
}

uint8_t _uart_get_control_fan(aircond_info_t control_info)
{
    uint8_t speed = UART_SPEED_MED;
    switch (control_info.fanspeed)
    {
        case AIRCOND_FANSPEED_AUTO:
            speed = UART_SPEED_AUTO;
            break;
        case AIRCOND_FANSPEED_1:
            speed = UART_SPEED_LOW;
            break;
        case AIRCOND_FANSPEED_2:
            speed = UART_SPEED_MED;
            break;
        case AIRCOND_FANSPEED_3:
            speed = UART_SPEED_HIGH;
            break;
        case AIRCOND_FANSPEED_4:
            speed = UART_SPEED_HIGH;
            break;
    }
    return speed;
}

static uart_control_frame_t _uart_create_control_aircond_frame(aircond_info_t info)
{
    uart_control_frame_t ret_frame;
    memcpy(ret_frame.data, sample_control_frame, UART_FRAME_CONTROL_SIZE);
    ret_frame.field.on_off = _uart_get_control_on_off(info);
    ret_frame.field.mode = _uart_get_control_mode(info);
    ret_frame.field.temp = _uart_get_control_temperature(info);
    ret_frame.field.fan_speed = _uart_get_control_fan(info);
    return ret_frame;
}

static void _uart_control_aircond(uart_handle_t handle)
{
    if (handle == NULL || !handle->control_flag) {
        return;
    }
    uart_control_frame_t control_frame = _uart_create_control_aircond_frame(handle->new_info);
    control_frame.field.checksum = _checksum(control_frame.data + 1, UART_FRAME_CONTROL_SIZE - 3);
    handle->counter_update = 0;
    _uart_exchange_info(handle, control_frame.data, UART_FRAME_CONTROL_SIZE);
    vTaskDelay(500 / portTICK_PERIOD_MS);
    handle->control_flag = false;
}

aircond_info_t* periph_ac_uart_process(void *ctx, aircond_info_t* control_info)
{
    uart_handle_t handle = (uart_handle_t)ctx;
    if (handle == NULL) {
        return NULL;
    }
    if (control_info != NULL) {
        memcpy(&handle->new_info, control_info, sizeof(aircond_info_t));
        handle->control_flag = true;
    }
    _uart_control_aircond(handle);
    return _uart_get_info(handle);
}
