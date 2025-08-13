#include "periph_motor.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "driver/gpio.h"
#include "driver/uart.h"
#include "esp_log.h"
#include "esp_peripherals.h"
#include "esp_system.h"
#include "freertos/FreeRTOS.h"
#include "freertos/queue.h"
#include "freertos/task.h"
#include "sdkconfig.h"

static const char *TAG = "PERIPH_MOTOR";

#define DEFAULT_BUF_SIZE      1024
#define DEFAULT_TX_PIN        21
#define DEFAULT_RX_PIN        22
#define DEFAULT_UART_NUM      UART_NUM_1
#define DEFAULT_ENCODER_A_PIN 34
#define DEFAULT_ENCODER_B_PIN 35

#define VALIDATE_MOTOR(periph, ret)                                  \
    if (!esp_periph_validate(periph, PERIPH_ID_MOTOR)) {             \
        ESP_LOGE(TAG, "Invalid MOTOR periph, at line %d", __LINE__); \
        return ret;                                                  \
    }

// static const char set_pos_cmd[6]    = { 0x11, 0x22, 0x33, 0x04, 0x32, 0x98 };   // SET POSITION 0x00 ~ 0x64  0 ~100%

static esp_periph_handle_t g_periph = NULL;

typedef struct {
    motor_type_t              type;
    motor_physic_t            physic;
    motor_uart_handle_t       motor_uart_handle;
    motor_drycontact_handle_t motor_drycontact_handle;
} periph_motor_t;

static esp_err_t _motor_init(esp_periph_handle_t periph) {
    periph_motor_t *periph_motor = esp_periph_get_data(periph);
    esp_err_t ret = ESP_OK;
    if (periph_motor->physic == MOTOR_UART) {
        ret = _motor_uart_init(periph_motor->motor_uart_handle);
    } else if (periph_motor->physic == MOTOR_DRYCONTACT) {
        ret = _motor_drycontact_init(periph_motor->motor_drycontact_handle);
    }
    return ret;
}

static esp_err_t _motor_run(esp_periph_handle_t periph, audio_event_iface_msg_t *msg) { return ESP_OK; }

static esp_err_t _motor_destroy(esp_periph_handle_t periph) {
    periph_motor_t *periph_motor = esp_periph_get_data(periph);
    vTaskDelay(2000 / portTICK_RATE_MS);
    if (periph_motor->motor_drycontact_handle) {
        free(periph_motor->motor_drycontact_handle);
        periph_motor->motor_drycontact_handle = NULL;
    }
    if (periph_motor->motor_uart_handle) {
        free(periph_motor->motor_uart_handle);
        periph_motor->motor_uart_handle = NULL;
    }
    free(periph_motor);
    g_periph = NULL;
    return ESP_OK;
}

esp_periph_handle_t periph_motor_init(periph_motor_cfg_t *motor_cfg) {
    esp_periph_handle_t periph = esp_periph_create(PERIPH_ID_MOTOR, "periph_motor");
    PERIPH_MEM_CHECK(TAG, periph, return NULL);
    periph_motor_t *periph_motor = calloc(1, sizeof(periph_motor_t));
    PERIPH_MEM_CHECK(TAG, periph_motor, return NULL);
    periph_motor->physic = motor_cfg->physic;
    if (periph_motor->physic == MOTOR_UART) {
        periph_motor->motor_uart_handle = periph_motor_uart_init(&motor_cfg->hw);
    } else if (periph_motor->physic == MOTOR_DRYCONTACT) {
        periph_motor->motor_drycontact_handle = periph_motor_drycontact_init(&motor_cfg->hw);
    }
    esp_periph_set_data(periph, periph_motor);
    esp_periph_set_function(periph, _motor_init, _motor_run, _motor_destroy);
    return periph;
}

esp_err_t periph_motor_control(esp_periph_handle_t periph_motor, motor_control_t control) {
    VALIDATE_MOTOR(periph_motor, ESP_FAIL);
    periph_motor_t *motor_handle = esp_periph_get_data(periph_motor);
    if (motor_handle->physic == MOTOR_UART) {
        return periph_motor_uart_control(motor_handle->motor_uart_handle, control);
    } else if (motor_handle->physic == MOTOR_DRYCONTACT) {
        return periph_motor_drycontact_control(motor_handle->motor_drycontact_handle, control);
    }
    return ESP_FAIL;
}

motor_pos_t periph_motor_set_pos(esp_periph_handle_t periph_motor, int val_in, int val_out) {
    motor_pos_t resp_pos = {0, 0};
    VALIDATE_MOTOR(periph_motor, resp_pos);
    periph_motor_t *motor_handle = esp_periph_get_data(periph_motor);
    if (val_in < -1 || val_in > 100 || val_out < -1 || val_out > 100) {
        ESP_LOGE(TAG, "Position values error!!!");
        return resp_pos;
    }
    if (motor_handle->physic == MOTOR_UART) {
        resp_pos = periph_motor_uart_set_pos(motor_handle->motor_uart_handle, val_in, val_out);
    } else if (motor_handle->physic == MOTOR_DRYCONTACT) {
        resp_pos = periph_motor_drycontact_set_pos(motor_handle->motor_drycontact_handle, val_in, val_out);
    }
    return resp_pos;
}

esp_err_t periph_motor_get_pos(esp_periph_handle_t periph_motor, int *val_in, int *val_out) {
    VALIDATE_MOTOR(periph_motor, ESP_FAIL);
    periph_motor_t *motor_handle = esp_periph_get_data(periph_motor);
    if (motor_handle->physic == MOTOR_UART) {
        return periph_motor_uart_get_pos(motor_handle->motor_uart_handle, val_in, val_out);
    } else if (motor_handle->physic == MOTOR_DRYCONTACT) {
        return periph_motor_drycontact_get_pos(motor_handle->motor_drycontact_handle, val_in, val_out);
    }
    return ESP_FAIL;
}
