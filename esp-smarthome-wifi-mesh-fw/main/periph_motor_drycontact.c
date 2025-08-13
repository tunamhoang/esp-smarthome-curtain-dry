#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#include "app_utility.h"
#include "driver/gpio.h"
#include "esp_log.h"
#include "esp_peripherals.h"
#include "esp_system.h"
#include "freertos/FreeRTOS.h"
#include "freertos/queue.h"
#include "freertos/task.h"
#include "periph_motor.h"
#include "sdkconfig.h"

static const char *TAG = "MOTOR_DRYCONTACT";

#define TIMEOUT_CONTROL_MS 5 * 1000
#define HIGH               1
#define LOW                0

#define VALIDATE_CONTROL(func)                     \
    if (func == ESP_FAIL) {                        \
        ESP_LOGE(TAG, "Drycontact control error"); \
        return ESP_FAIL;                           \
    }

esp_err_t _motor_drycontact_init(motor_drycontact_handle_t motor_drycontact_handle) {
    uint64_t pin_mark = 0;
    if (motor_drycontact_handle->hw.drycontact.type == MOTOR_TYPE_SINGLE) {
        pin_mark |= 1ULL << motor_drycontact_handle->hw.drycontact.motor_drycontact_single_conn.a_pin;
        pin_mark |= 1ULL << motor_drycontact_handle->hw.drycontact.motor_drycontact_single_conn.b_pin;
    } else if (motor_drycontact_handle->hw.drycontact.type == MOTOR_TYPE_DOUBLE) {
        pin_mark |= 1ULL << motor_drycontact_handle->hw.drycontact.motor_drycontact_in_conn.a_pin;
        pin_mark |= 1ULL << motor_drycontact_handle->hw.drycontact.motor_drycontact_in_conn.b_pin;
        pin_mark |= 1ULL << motor_drycontact_handle->hw.drycontact.motor_drycontact_out_conn.a_pin;
        pin_mark |= 1ULL << motor_drycontact_handle->hw.drycontact.motor_drycontact_out_conn.b_pin;
    }
    gpio_config_t io_cfg = {
        .intr_type = GPIO_INTR_DISABLE,
        .mode = GPIO_MODE_OUTPUT,
        .pin_bit_mask = pin_mark,
        .pull_down_en = 0,
        .pull_up_en = 1,
    };
    gpio_config(&io_cfg);
    if (motor_drycontact_handle->hw.drycontact.type == MOTOR_TYPE_SINGLE) {
        VALIDATE_CONTROL(gpio_set_level(motor_drycontact_handle->hw.drycontact.motor_drycontact_single_conn.a_pin, HIGH));
        VALIDATE_CONTROL(gpio_set_level(motor_drycontact_handle->hw.drycontact.motor_drycontact_single_conn.b_pin, HIGH));
    } else if (motor_drycontact_handle->hw.drycontact.type == MOTOR_TYPE_DOUBLE) {
        VALIDATE_CONTROL(gpio_set_level(motor_drycontact_handle->hw.drycontact.motor_drycontact_in_conn.a_pin, HIGH));
        VALIDATE_CONTROL(gpio_set_level(motor_drycontact_handle->hw.drycontact.motor_drycontact_in_conn.b_pin, HIGH));
        VALIDATE_CONTROL(gpio_set_level(motor_drycontact_handle->hw.drycontact.motor_drycontact_out_conn.a_pin, HIGH));
        VALIDATE_CONTROL(gpio_set_level(motor_drycontact_handle->hw.drycontact.motor_drycontact_out_conn.b_pin, HIGH));
    }
    return ESP_OK;
}

motor_drycontact_handle_t periph_motor_drycontact_init(motor_hw_t *motor_cfg) {
    motor_drycontact_handle_t motor_drycontact_handle = calloc(1, sizeof(motor_drycontact_t));
    PERIPH_MEM_CHECK(TAG, motor_drycontact_handle, return NULL);
    if (motor_cfg->drycontact.type == MOTOR_TYPE_SINGLE) {
        if (motor_cfg->drycontact.motor_drycontact_single_conn.a_pin > 0 && motor_cfg->drycontact.motor_drycontact_single_conn.b_pin > 0) {
            motor_drycontact_handle->hw.drycontact.motor_drycontact_single_conn = motor_cfg->drycontact.motor_drycontact_single_conn;
        } else {
            goto _motor_drycontact_init_fail;
        }
    } else if (motor_cfg->drycontact.type == MOTOR_TYPE_DOUBLE) {
        int check_type = 0;
        if (motor_cfg->drycontact.motor_drycontact_in_conn.a_pin > 0 && motor_cfg->drycontact.motor_drycontact_in_conn.b_pin > 0) {
            motor_drycontact_handle->hw.drycontact.motor_drycontact_in_conn = motor_cfg->drycontact.motor_drycontact_in_conn;
            check_type++;
        }
        if (motor_cfg->drycontact.motor_drycontact_out_conn.a_pin > 0 && motor_cfg->drycontact.motor_drycontact_out_conn.b_pin > 0) {
            motor_drycontact_handle->hw.drycontact.motor_drycontact_out_conn = motor_cfg->drycontact.motor_drycontact_out_conn;
            check_type++;
        }
        if ((int)motor_cfg->drycontact.type != check_type) {
            goto _motor_drycontact_init_fail;
        }
    }
    motor_drycontact_handle->hw.drycontact.type = motor_cfg->drycontact.type;
    motor_drycontact_handle->last_control = MOTOR_CTRL_NONE;
    return motor_drycontact_handle;
_motor_drycontact_init_fail:
    free(motor_drycontact_handle);
    return NULL;
}

static esp_err_t motor_drycontact_control(gpio_num_t a_pin, gpio_num_t b_pin, uint32_t a_state, uint32_t b_state) {
    VALIDATE_CONTROL(gpio_set_level(a_pin, a_state));
    VALIDATE_CONTROL(gpio_set_level(b_pin, b_state));
    vTaskDelay(200 / portTICK_PERIOD_MS);
    VALIDATE_CONTROL(gpio_set_level(a_pin, HIGH));
    VALIDATE_CONTROL(gpio_set_level(b_pin, HIGH));
    return ESP_OK;
}

esp_err_t periph_motor_drycontact_control(motor_drycontact_handle_t motor_drycontact_handle, motor_control_t control) {
    gpio_num_t single_a_pin = motor_drycontact_handle->hw.drycontact.motor_drycontact_single_conn.a_pin;
    gpio_num_t single_b_pin = motor_drycontact_handle->hw.drycontact.motor_drycontact_single_conn.b_pin;
    gpio_num_t curtain_in_a_pin = motor_drycontact_handle->hw.drycontact.motor_drycontact_in_conn.a_pin;
    gpio_num_t curtain_in_b_pin = motor_drycontact_handle->hw.drycontact.motor_drycontact_in_conn.b_pin;
    gpio_num_t curtain_out_a_pin = motor_drycontact_handle->hw.drycontact.motor_drycontact_out_conn.a_pin;
    gpio_num_t curtain_out_b_pin = motor_drycontact_handle->hw.drycontact.motor_drycontact_out_conn.b_pin;

    bool same = motor_drycontact_handle->last_control == control &&
                 (control == MOTOR_SINGLE_CTRL_OPEN || control == MOTOR_SINGLE_CTRL_CLOSE ||
                  control == MOTOR_IN_CTRL_OPEN || control == MOTOR_IN_CTRL_CLOSE ||
                  control == MOTOR_OUT_CTRL_OPEN || control == MOTOR_OUT_CTRL_CLOSE);
    if (same) {
        motor_control_t stop_ctrl = MOTOR_CTRL_NONE;
        if (control == MOTOR_SINGLE_CTRL_OPEN || control == MOTOR_SINGLE_CTRL_CLOSE) {
            stop_ctrl = MOTOR_SINGLE_CTRL_STOP;
        } else if (control == MOTOR_IN_CTRL_OPEN || control == MOTOR_IN_CTRL_CLOSE) {
            stop_ctrl = MOTOR_IN_CTRL_STOP;
        } else if (control == MOTOR_OUT_CTRL_OPEN || control == MOTOR_OUT_CTRL_CLOSE) {
            stop_ctrl = MOTOR_OUT_CTRL_STOP;
        }
        if (stop_ctrl != MOTOR_CTRL_NONE) {
            return periph_motor_drycontact_control(motor_drycontact_handle, stop_ctrl);
        }
    }

    bool reverse =
        (motor_drycontact_handle->last_control == MOTOR_SINGLE_CTRL_OPEN && control == MOTOR_SINGLE_CTRL_CLOSE) ||
        (motor_drycontact_handle->last_control == MOTOR_SINGLE_CTRL_CLOSE && control == MOTOR_SINGLE_CTRL_OPEN) ||
        (motor_drycontact_handle->last_control == MOTOR_IN_CTRL_OPEN && control == MOTOR_IN_CTRL_CLOSE) ||
        (motor_drycontact_handle->last_control == MOTOR_IN_CTRL_CLOSE && control == MOTOR_IN_CTRL_OPEN) ||
        (motor_drycontact_handle->last_control == MOTOR_OUT_CTRL_OPEN && control == MOTOR_OUT_CTRL_CLOSE) ||
        (motor_drycontact_handle->last_control == MOTOR_OUT_CTRL_CLOSE && control == MOTOR_OUT_CTRL_OPEN);

    if (reverse) {
        motor_control_t stop_ctrl = MOTOR_CTRL_NONE;
        if (motor_drycontact_handle->last_control == MOTOR_SINGLE_CTRL_OPEN ||
            motor_drycontact_handle->last_control == MOTOR_SINGLE_CTRL_CLOSE) {
            stop_ctrl = MOTOR_SINGLE_CTRL_STOP;
        } else if (motor_drycontact_handle->last_control == MOTOR_IN_CTRL_OPEN ||
                   motor_drycontact_handle->last_control == MOTOR_IN_CTRL_CLOSE) {
            stop_ctrl = MOTOR_IN_CTRL_STOP;
        } else if (motor_drycontact_handle->last_control == MOTOR_OUT_CTRL_OPEN ||
                   motor_drycontact_handle->last_control == MOTOR_OUT_CTRL_CLOSE) {
            stop_ctrl = MOTOR_OUT_CTRL_STOP;
        }
        if (stop_ctrl != MOTOR_CTRL_NONE) {
            periph_motor_drycontact_control(motor_drycontact_handle, stop_ctrl);
            vTaskDelay(200 / portTICK_PERIOD_MS);
        }
    }
    esp_err_t ret = ESP_OK;
    switch (control) {
        case MOTOR_SINGLE_CTRL_OPEN:
            LOGI(TAG, "Open single curtain!");
            ret = motor_drycontact_control(single_a_pin, single_b_pin, LOW, LOW);
            if (ret != ESP_OK) {
                return ESP_FAIL;
            }
            motor_drycontact_handle->position.in_pos = 100;
            break;
        case MOTOR_SINGLE_CTRL_CLOSE:
            LOGI(TAG, "Close single curtain!");
            ret = motor_drycontact_control(single_a_pin, single_b_pin, LOW, HIGH);
            if (ret != ESP_OK) {
                return ESP_FAIL;
            }
            motor_drycontact_handle->position.in_pos = 0;
            break;
        case MOTOR_SINGLE_CTRL_STOP:
            LOGI(TAG, "Stop single curtain!");
            ret = motor_drycontact_control(single_a_pin, single_b_pin, HIGH, LOW);
            if (ret != ESP_OK) {
                return ESP_FAIL;
            }
            break;
        case MOTOR_IN_CTRL_OPEN:
            LOGI(TAG, "Open in curtain!");
            ret = motor_drycontact_control(curtain_in_a_pin, curtain_in_b_pin, LOW, LOW);
            if (ret != ESP_OK) {
                return ESP_FAIL;
            }
            motor_drycontact_handle->position.in_pos = 100;
            break;
        case MOTOR_IN_CTRL_CLOSE:
            LOGI(TAG, "Close in curtain!");
            ret = motor_drycontact_control(curtain_in_a_pin, curtain_in_b_pin, HIGH, LOW);
            if (ret != ESP_OK) {
                return ESP_FAIL;
            }
            motor_drycontact_handle->position.in_pos = 0;
            break;
        case MOTOR_IN_CTRL_STOP:
            LOGI(TAG, "Stop in curtain!");
            ret = motor_drycontact_control(curtain_in_a_pin, curtain_in_b_pin, LOW, HIGH);
            if (ret != ESP_OK) {
                return ESP_FAIL;
            }
            break;
        case MOTOR_OUT_CTRL_OPEN:
            LOGI(TAG, "Open out curtain!");
            ret = motor_drycontact_control(curtain_out_a_pin, curtain_out_b_pin, LOW, HIGH);
            if (ret != ESP_OK) {
                return ESP_FAIL;
            }
            motor_drycontact_handle->position.out_pos = 100;
            break;
        case MOTOR_OUT_CTRL_CLOSE:
            LOGI(TAG, "Close out curtain!");
            ret = motor_drycontact_control(curtain_out_a_pin, curtain_out_b_pin, HIGH, LOW);
            if (ret != ESP_OK) {
                return ESP_FAIL;
            }
            motor_drycontact_handle->position.out_pos = 0;
            break;
        case MOTOR_OUT_CTRL_STOP:
            LOGI(TAG, "Stop out curtain!");
            ret = motor_drycontact_control(curtain_out_a_pin, curtain_out_b_pin, LOW, LOW);
            if (ret != ESP_OK) {
                return ESP_FAIL;
            }
            break;
        default:
            break;
    }
    motor_drycontact_handle->last_control = control;
    return ESP_OK;
}

motor_pos_t periph_motor_drycontact_set_pos(motor_drycontact_handle_t motor_drycontact_handle, int val_in, int val_out) {
    gpio_num_t single_a_pin = motor_drycontact_handle->hw.drycontact.motor_drycontact_single_conn.a_pin;
    gpio_num_t single_b_pin = motor_drycontact_handle->hw.drycontact.motor_drycontact_single_conn.b_pin;
    gpio_num_t curtain_in_a_pin = motor_drycontact_handle->hw.drycontact.motor_drycontact_in_conn.a_pin;
    gpio_num_t curtain_in_b_pin = motor_drycontact_handle->hw.drycontact.motor_drycontact_in_conn.b_pin;
    gpio_num_t curtain_out_a_pin = motor_drycontact_handle->hw.drycontact.motor_drycontact_out_conn.a_pin;
    gpio_num_t curtain_out_b_pin = motor_drycontact_handle->hw.drycontact.motor_drycontact_out_conn.b_pin;
    if (motor_drycontact_handle->hw.drycontact.type == MOTOR_TYPE_SINGLE) {
        motor_drycontact_handle->position.in_pos = val_in > 50 ? 100 : 0;
        motor_drycontact_control(single_a_pin, single_b_pin, LOW, val_in > 50 ? HIGH : LOW);
        LOGI(TAG, "Single curtain position: %d", motor_drycontact_handle->position.in_pos);
    } else if (motor_drycontact_handle->hw.drycontact.type == MOTOR_TYPE_DOUBLE) {
        if (val_in >= 0) {
            motor_drycontact_handle->position.in_pos = val_in > 50 ? 100 : 0;
            if (val_in > 50)
                periph_motor_drycontact_control(motor_drycontact_handle, MOTOR_IN_CTRL_OPEN);
            else
                periph_motor_drycontact_control(motor_drycontact_handle, MOTOR_IN_CTRL_CLOSE);
            vTaskDelay(200 / portTICK_PERIOD_MS);
        }
        if (val_out >= 0) {
            motor_drycontact_handle->position.out_pos = val_out > 50 ? 100 : 0;
            if (val_out > 50)
                periph_motor_drycontact_control(motor_drycontact_handle, MOTOR_OUT_CTRL_OPEN);
            else
                periph_motor_drycontact_control(motor_drycontact_handle, MOTOR_OUT_CTRL_CLOSE);
        }
        LOGI(TAG, "Double curtain position: %d (in) , %d (out)", motor_drycontact_handle->position.in_pos, motor_drycontact_handle->position.out_pos);
    }
    return motor_drycontact_handle->position;
}

esp_err_t periph_motor_drycontact_get_pos(motor_drycontact_handle_t motor_drycontact_handle, int *val_in, int *val_out) {
    if (val_in != NULL) {
        *val_in = motor_drycontact_handle->position.in_pos;
    }
    if (val_out != NULL) {
        *val_out = motor_drycontact_handle->position.out_pos;
    }
    return ESP_OK;
}
