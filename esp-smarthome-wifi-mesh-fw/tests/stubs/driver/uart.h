#pragma once
#include <stdint.h>
#include <stddef.h>
#include "esp_err.h"

typedef int uart_port_t;

typedef struct {
    int baud_rate;
    int data_bits;
    int parity;
    int stop_bits;
    int flow_ctrl;
} uart_config_t;

#define UART_NUM_1 1
#define UART_DATA_8_BITS 8
#define UART_PARITY_DISABLE 0
#define UART_STOP_BITS_1 1
#define UART_HW_FLOWCTRL_DISABLE 0

static inline esp_err_t uart_param_config(uart_port_t uart_num, const uart_config_t *uart_config) { return ESP_OK; }
static inline esp_err_t uart_set_pin(uart_port_t uart_num, int tx_pin, int rx_pin, int rts_pin, int cts_pin) { return ESP_OK; }
static inline esp_err_t uart_driver_install(uart_port_t uart_num, int rx_buf_size, int tx_buf_size, int queue_size, void *queue, int flags) { return ESP_OK; }
static inline int uart_write_bytes(uart_port_t uart_num, const char *src, size_t size) { return (int)size; }
static inline int uart_read_bytes(uart_port_t uart_num, uint8_t *buf, uint32_t length, uint32_t ticks_to_wait) { return 0; }
