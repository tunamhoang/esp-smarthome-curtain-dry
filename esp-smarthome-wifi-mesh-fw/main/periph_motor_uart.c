#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#include "app_utility.h"
#include "driver/gpio.h"
#include "driver/uart.h"
#include "esp_log.h"
#include "esp_peripherals.h"
#include "esp_system.h"
#include "freertos/FreeRTOS.h"
#include "freertos/queue.h"
#include "freertos/task.h"
#include "periph_motor.h"
#include "sdkconfig.h"

static const char *TAG = "MOTOR_UART";

#define DEFAULT_BUF_SIZE 1024
#define DEFAULT_TX_PIN   21
#define DEFAULT_RX_PIN   22
#define DEFAULT_UART_NUM UART_NUM_1

static const char close_cmd[6] = {0x11, 0x22, 0x33, 0x01, 0x00, 0x67};
static const char stop_cmd[6] = {0x11, 0x22, 0x33, 0x02, 0x00, 0x68};
static const char open_cmd[6] = {0x11, 0x22, 0x33, 0x03, 0x00, 0x69};
static const char read_pos_cmd[6] = {0x11, 0x22, 0x33, 0x00, 0x00, 0x66};

static bool check_installed_motor_single(motor_uart_t *motor_handle) { return motor_handle->hw.uart.motor_uart_single_conn.uart_num != -1; }

static bool check_installed_motor_in(motor_uart_t *motor_handle) { return motor_handle->hw.uart.motor_uart_in_conn.uart_num != -1; }

static bool check_installed_motor_out(motor_uart_t *motor_handle) { return motor_handle->hw.uart.motor_uart_out_conn.uart_num != -1; }

static esp_err_t motor_uart_control(int uart_num, const char *cmd, uint8_t cmd_len) {
    if (uart_num < 0) {
        return ESP_FAIL;
    }
    uart_write_bytes(uart_num, cmd, cmd_len);
    return ESP_OK;
}

static esp_err_t motor_update_pos(motor_uart_handle_t motor_uart_handle) {
    char buf[16];
    if (motor_uart_handle->hw.uart.type == MOTOR_TYPE_SINGLE) {
        if (check_installed_motor_single(motor_uart_handle)) {
            uart_write_bytes(motor_uart_handle->hw.uart.motor_uart_single_conn.uart_num, (const char *)read_pos_cmd, 6);
            int rb = uart_read_bytes(motor_uart_handle->hw.uart.motor_uart_single_conn.uart_num, (uint8_t *)buf, 6, 1000 / portTICK_PERIOD_MS);
            if (rb == 6) {
                if (buf[3] == 0) {
                    motor_uart_handle->position.in_pos = 100 - buf[4];
                }
            } else {
                LOGE(TAG, "Get position motor_in failed");
            }
        }
    }
    if (motor_uart_handle->hw.uart.type == MOTOR_TYPE_DOUBLE) {
        if (check_installed_motor_in(motor_uart_handle)) {
            uart_write_bytes(motor_uart_handle->hw.uart.motor_uart_in_conn.uart_num, (const char *)read_pos_cmd, 6);
            int rb = uart_read_bytes(motor_uart_handle->hw.uart.motor_uart_in_conn.uart_num, (uint8_t *)buf, 6, 1000 / portTICK_PERIOD_MS);
            if (rb == 6) {
                if (buf[3] == 0) {
                    motor_uart_handle->position.in_pos = 100 - buf[4];
                }
            } else {
                LOGE(TAG, "Get position motor_in failed");
            }
        }
        if (check_installed_motor_out(motor_uart_handle)) {
            uart_write_bytes(motor_uart_handle->hw.uart.motor_uart_out_conn.uart_num, (const char *)read_pos_cmd, 6);
            int rb = uart_read_bytes(motor_uart_handle->hw.uart.motor_uart_out_conn.uart_num, (uint8_t *)buf, 6, 1000 / portTICK_PERIOD_MS);
            if (rb == 6) {
                if (buf[3] == 0) {
                    motor_uart_handle->position.out_pos = 100 - buf[4];
                }
            } else {
                LOGE(TAG, "Get position motor_out failed");
            }
        }
    }
    return ESP_OK;
}

esp_err_t _motor_uart_init(motor_uart_handle_t motor_uart_handle) {
    uart_config_t uart_config = {
#ifdef CONFIG_CURTAIN_BAUD
        .baud_rate = 115200,
#else
        .baud_rate = 115200,
#endif
        .data_bits = UART_DATA_8_BITS,
        .parity = UART_PARITY_DISABLE,
        .stop_bits = UART_STOP_BITS_1,
        .flow_ctrl = UART_HW_FLOWCTRL_DISABLE};
    if (motor_uart_handle->hw.uart.type == MOTOR_TYPE_SINGLE) {
        if (check_installed_motor_single(motor_uart_handle)) {
            uart_param_config(motor_uart_handle->hw.uart.motor_uart_single_conn.uart_num, &uart_config);
            LOGI(TAG, "Configuring UART%d GPIOs: TX:%d RX:%d RTS:%d CTS: %d", motor_uart_handle->hw.uart.motor_uart_single_conn.uart_num, motor_uart_handle->hw.uart.motor_uart_single_conn.tx_pin,
                 motor_uart_handle->hw.uart.motor_uart_single_conn.rx_pin, -1, -1);
            uart_set_pin(motor_uart_handle->hw.uart.motor_uart_single_conn.uart_num, motor_uart_handle->hw.uart.motor_uart_single_conn.tx_pin, motor_uart_handle->hw.uart.motor_uart_single_conn.rx_pin,
                         -1, -1);
            uart_driver_install(motor_uart_handle->hw.uart.motor_uart_in_conn.uart_num, DEFAULT_BUF_SIZE, DEFAULT_BUF_SIZE, 0, NULL, 0);
        }
    } else if (motor_uart_handle->hw.uart.type == MOTOR_TYPE_DOUBLE) {
        if (check_installed_motor_in(motor_uart_handle)) {
            uart_param_config(motor_uart_handle->hw.uart.motor_uart_in_conn.uart_num, &uart_config);
            LOGI(TAG, "Configuring UART%d GPIOs: TX:%d RX:%d RTS:%d CTS: %d", motor_uart_handle->hw.uart.motor_uart_in_conn.uart_num, motor_uart_handle->hw.uart.motor_uart_in_conn.tx_pin,
                 motor_uart_handle->hw.uart.motor_uart_in_conn.rx_pin, -1, -1);
            uart_set_pin(motor_uart_handle->hw.uart.motor_uart_in_conn.uart_num, motor_uart_handle->hw.uart.motor_uart_in_conn.tx_pin, motor_uart_handle->hw.uart.motor_uart_in_conn.rx_pin, -1, -1);
            uart_driver_install(motor_uart_handle->hw.uart.motor_uart_in_conn.uart_num, DEFAULT_BUF_SIZE, DEFAULT_BUF_SIZE, 0, NULL, 0);
        }
        if (check_installed_motor_out(motor_uart_handle)) {
            uart_param_config(motor_uart_handle->hw.uart.motor_uart_out_conn.uart_num, &uart_config);
            LOGI(TAG, "Configuring UART%d GPIOs: TX:%d RX:%d RTS:%d CTS: %d", motor_uart_handle->hw.uart.motor_uart_out_conn.uart_num, motor_uart_handle->hw.uart.motor_uart_out_conn.tx_pin,
                 motor_uart_handle->hw.uart.motor_uart_out_conn.rx_pin, -1, -1);
            uart_set_pin(motor_uart_handle->hw.uart.motor_uart_out_conn.uart_num, motor_uart_handle->hw.uart.motor_uart_out_conn.tx_pin, motor_uart_handle->hw.uart.motor_uart_out_conn.rx_pin, -1, -1);
            uart_driver_install(motor_uart_handle->hw.uart.motor_uart_out_conn.uart_num, DEFAULT_BUF_SIZE, DEFAULT_BUF_SIZE, 0, NULL, 0);
        }
    }
    motor_uart_handle->position.in_pos = 0;
    motor_uart_handle->position.out_pos = 0;
    motor_uart_handle->pre_control = MOTOR_CTRL_NONE;
    // motor_uart_handle->state_event = xEventGroupCreate();
    return ESP_OK;
}

motor_uart_handle_t periph_motor_uart_init(motor_hw_t *motor_cfg) {
    motor_uart_handle_t motor_uart_handle = calloc(1, sizeof(motor_uart_t));
    PERIPH_MEM_CHECK(TAG, motor_uart_handle, return NULL);
    // motor_uart_handle->buffer = malloc(DEFAULT_BUF_SIZE);
    // PERIPH_MEM_CHECK(TAG, motor_uart_handle->buffer, goto _motor_uart_init_fail);
    motor_uart_handle->hw.uart.motor_uart_in_conn.uart_num = -1;
    motor_uart_handle->hw.uart.motor_uart_out_conn.uart_num = -1;
    if (motor_cfg->uart.type == MOTOR_TYPE_SINGLE) {
        if (motor_cfg->uart.motor_uart_single_conn.tx_pin > 0 && motor_cfg->uart.motor_uart_single_conn.rx_pin > 0 && motor_cfg->uart.motor_uart_single_conn.uart_num > 0) {
            motor_uart_handle->hw.uart.motor_uart_single_conn = motor_cfg->uart.motor_uart_single_conn;
        } else {
            goto _motor_uart_init_fail;
        }
    } else if (motor_cfg->uart.type == MOTOR_TYPE_DOUBLE) {
        int check_type = 0;
        if (motor_cfg->uart.motor_uart_in_conn.tx_pin > 0 && motor_cfg->uart.motor_uart_in_conn.rx_pin > 0 && motor_cfg->uart.motor_uart_in_conn.uart_num > 0) {
            motor_uart_handle->hw.uart.motor_uart_in_conn = motor_cfg->uart.motor_uart_in_conn;
            check_type++;
        }
        if (motor_cfg->uart.motor_uart_out_conn.tx_pin > 0 && motor_cfg->uart.motor_uart_out_conn.rx_pin > 0 && motor_cfg->uart.motor_uart_out_conn.uart_num > 0) {
            motor_uart_handle->hw.uart.motor_uart_out_conn = motor_cfg->uart.motor_uart_out_conn;
            check_type++;
        }
        if ((int)motor_cfg->uart.type != check_type) {
            goto _motor_uart_init_fail;
        }
    }
    motor_uart_handle->hw.uart.type = motor_cfg->uart.type;
    return motor_uart_handle;
_motor_uart_init_fail:
    LOGE(TAG, "Failed to initial MOTOR UART");
    // free(motor_uart_handle->buffer);
    free(motor_uart_handle);
    return NULL;
}

static int control_to_uart(motor_uart_handle_t motor_uart_handle, motor_control_t ctrl) {
    switch (ctrl) {
        case MOTOR_SINGLE_CTRL_OPEN:
        case MOTOR_SINGLE_CTRL_CLOSE:
        case MOTOR_SINGLE_CTRL_STOP:
            return motor_uart_handle->hw.uart.motor_uart_single_conn.uart_num;
        case MOTOR_IN_CTRL_OPEN:
        case MOTOR_IN_CTRL_CLOSE:
        case MOTOR_IN_CTRL_STOP:
            return motor_uart_handle->hw.uart.motor_uart_in_conn.uart_num;
        case MOTOR_OUT_CTRL_OPEN:
        case MOTOR_OUT_CTRL_CLOSE:
        case MOTOR_OUT_CTRL_STOP:
            return motor_uart_handle->hw.uart.motor_uart_out_conn.uart_num;
        default:
            return -1;
    }
}

static bool is_opposite_cmd(motor_control_t prev, motor_control_t current) {
    return (prev == MOTOR_SINGLE_CTRL_OPEN && current == MOTOR_SINGLE_CTRL_CLOSE) ||
           (prev == MOTOR_SINGLE_CTRL_CLOSE && current == MOTOR_SINGLE_CTRL_OPEN) ||
           (prev == MOTOR_IN_CTRL_OPEN && current == MOTOR_IN_CTRL_CLOSE) ||
           (prev == MOTOR_IN_CTRL_CLOSE && current == MOTOR_IN_CTRL_OPEN) ||
           (prev == MOTOR_OUT_CTRL_OPEN && current == MOTOR_OUT_CTRL_CLOSE) ||
           (prev == MOTOR_OUT_CTRL_CLOSE && current == MOTOR_OUT_CTRL_OPEN);
}

esp_err_t periph_motor_uart_control(motor_uart_handle_t motor_uart_handle, motor_control_t control) {
    if (is_opposite_cmd(motor_uart_handle->pre_control, control)) {
        int uart_num = control_to_uart(motor_uart_handle, motor_uart_handle->pre_control);
        motor_uart_control(uart_num, stop_cmd, 6);
        vTaskDelay(200 / portTICK_PERIOD_MS);
        motor_uart_handle->pre_control = MOTOR_CTRL_NONE;
    }
    switch (control) {
        case MOTOR_SINGLE_CTRL_OPEN:
            if (motor_uart_handle->pre_control != MOTOR_SINGLE_CTRL_OPEN) {
                LOGI(TAG, "Open curtain!");
                motor_uart_control(motor_uart_handle->hw.uart.motor_uart_single_conn.uart_num, open_cmd, 6);
                motor_uart_handle->position.in_pos = 100;
            } else {
                LOGI(TAG, "Stop curtain!");
                motor_uart_control(motor_uart_handle->hw.uart.motor_uart_single_conn.uart_num, stop_cmd, 6);
                motor_update_pos(motor_uart_handle);
                control = MOTOR_SINGLE_CTRL_STOP;
            }
            break;
        case MOTOR_SINGLE_CTRL_CLOSE:
            if (motor_uart_handle->pre_control != MOTOR_SINGLE_CTRL_CLOSE) {
                LOGI(TAG, "Close curtain!");
                motor_uart_control(motor_uart_handle->hw.uart.motor_uart_single_conn.uart_num, close_cmd, 6);
                motor_uart_handle->position.in_pos = 0;
            } else {
                LOGI(TAG, "Stop curtain!");
                motor_uart_control(motor_uart_handle->hw.uart.motor_uart_single_conn.uart_num, stop_cmd, 6);
                vTaskDelay(100 / portTICK_PERIOD_MS);
                motor_update_pos(motor_uart_handle);
                control = MOTOR_SINGLE_CTRL_STOP;
            }
            break;
        case MOTOR_SINGLE_CTRL_STOP:
            LOGI(TAG, "Stop curtain!");
            motor_uart_control(motor_uart_handle->hw.uart.motor_uart_single_conn.uart_num, stop_cmd, 6);
            vTaskDelay(100 / portTICK_PERIOD_MS);
            motor_update_pos(motor_uart_handle);
            break;
        case MOTOR_IN_CTRL_OPEN:
            if (motor_uart_handle->pre_control != MOTOR_IN_CTRL_OPEN) {
                LOGI(TAG, "Open in curtain!");
                motor_uart_control(motor_uart_handle->hw.uart.motor_uart_in_conn.uart_num, (const char *)open_cmd, 6);
                motor_uart_handle->position.in_pos = 100;
            } else {
                LOGI(TAG, "Stop in curtain");
                motor_uart_control(motor_uart_handle->hw.uart.motor_uart_in_conn.uart_num, (const char *)stop_cmd, 6);
                motor_update_pos(motor_uart_handle);
                control = MOTOR_IN_CTRL_STOP;
            }
            break;
        case MOTOR_IN_CTRL_CLOSE:
            if (motor_uart_handle->pre_control != MOTOR_IN_CTRL_CLOSE) {
                LOGI(TAG, "Close in curtain!");
                motor_uart_control(motor_uart_handle->hw.uart.motor_uart_in_conn.uart_num, (const char *)close_cmd, 6);
                motor_uart_handle->position.in_pos = 0;
            } else {
                LOGI(TAG, "Stop in curtain");
                motor_uart_control(motor_uart_handle->hw.uart.motor_uart_in_conn.uart_num, (const char *)stop_cmd, 6);
                vTaskDelay(100 / portTICK_PERIOD_MS);
                motor_update_pos(motor_uart_handle);
                control = MOTOR_IN_CTRL_STOP;
            }
            break;
        case MOTOR_OUT_CTRL_OPEN:
            if (motor_uart_handle->pre_control != MOTOR_OUT_CTRL_OPEN) {
                LOGI(TAG, "Open out curtain!");
                motor_uart_control(motor_uart_handle->hw.uart.motor_uart_out_conn.uart_num, (const char *)open_cmd, 6);
                motor_uart_handle->position.out_pos = 100;
            } else {
                LOGI(TAG, "Stop out curtain");
                motor_uart_control(motor_uart_handle->hw.uart.motor_uart_out_conn.uart_num, (const char *)stop_cmd, 6);
                motor_update_pos(motor_uart_handle);
                control = MOTOR_OUT_CTRL_STOP;
            }
            break;
        case MOTOR_OUT_CTRL_CLOSE:
            if (motor_uart_handle->pre_control != MOTOR_OUT_CTRL_CLOSE) {
                LOGI(TAG, "Close out curtain!");
                motor_uart_control(motor_uart_handle->hw.uart.motor_uart_out_conn.uart_num, (const char *)close_cmd, 6);
                motor_uart_handle->position.out_pos = 0;
            } else {
                LOGI(TAG, "Stop out curtain");
                motor_uart_control(motor_uart_handle->hw.uart.motor_uart_out_conn.uart_num, (const char *)stop_cmd, 6);
                vTaskDelay(100 / portTICK_PERIOD_MS);
                motor_update_pos(motor_uart_handle);
                control = MOTOR_OUT_CTRL_STOP;
            }
            break;

        default:
            break;
    }
    motor_uart_handle->pre_control = control;
    return ESP_OK;
}

motor_pos_t periph_motor_uart_set_pos(motor_uart_handle_t motor_uart_handle, int val_in, int val_out) {
    char set_pos_cmd[6] = {0x11, 0x22, 0x33, 0x04, 0x00, 0x00};
    motor_uart_handle->position.in_pos = val_in;
    val_in = 100 - val_in;
    motor_uart_handle->position.out_pos = val_out;
    val_out = 100 - val_out;
    if (motor_uart_handle->hw.uart.type == MOTOR_TYPE_SINGLE) {
        if (check_installed_motor_single(motor_uart_handle)) {
            set_pos_cmd[4] = val_in;
            set_pos_cmd[5] = 0x66 + 0x04 + val_in;
            uart_write_bytes(motor_uart_handle->hw.uart.motor_uart_single_conn.uart_num, (const char *)set_pos_cmd, 6);
        }
        LOGI(TAG, "Single curtain position: %d", motor_uart_handle->position.in_pos);
    } else if (motor_uart_handle->hw.uart.type == MOTOR_TYPE_DOUBLE) {
        if (check_installed_motor_in(motor_uart_handle)) {
            set_pos_cmd[4] = val_in;
            set_pos_cmd[5] = 0x66 + 0x04 + val_in;
            uart_write_bytes(motor_uart_handle->hw.uart.motor_uart_in_conn.uart_num, (const char *)set_pos_cmd, 6);
        }
        if (check_installed_motor_out(motor_uart_handle)) {
            set_pos_cmd[4] = val_out;
            set_pos_cmd[5] = 0x66 + 0x04 + val_out;
            uart_write_bytes(motor_uart_handle->hw.uart.motor_uart_out_conn.uart_num, (const char *)set_pos_cmd, 6);
        }
        LOGI(TAG, "Double curtain position: %d (in) , %d (out)", motor_uart_handle->position.in_pos, motor_uart_handle->position.out_pos);
    }
    return motor_uart_handle->position;
}

esp_err_t periph_motor_uart_get_pos(motor_uart_handle_t motor_uart_handle, int *val_in, int *val_out) {
    if (val_in != NULL) {
        *val_in = motor_uart_handle->position.in_pos;
    }
    if (val_out != NULL) {
        *val_out = motor_uart_handle->position.out_pos;
    }
    return ESP_OK;
}
