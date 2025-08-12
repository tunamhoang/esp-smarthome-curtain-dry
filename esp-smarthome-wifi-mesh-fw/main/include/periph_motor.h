#ifndef _PERIPH_MOTOR_H_
#define _PERIPH_MOTOR_H_

#include "sys/queue.h"
#include "esp_err.h"
#include "time.h"
#include <sys/time.h>
#include "esp_peripherals.h"

#ifdef __cplusplus
extern "C" {
#endif

#define PERIPH_ID_MOTOR           (PERIPH_ID_MAX + 6)

typedef enum {
    MOTOR_EVENT_NONE = 0,
    MOTOR_EVENT_UPDATE_POS,
} periph_motor_event_t;

typedef enum {
    MOTOR_CTRL_NONE = 0,
    MOTOR_SINGLE_CTRL_OPEN,
    MOTOR_SINGLE_CTRL_STOP,
    MOTOR_SINGLE_CTRL_CLOSE,
    MOTOR_IN_CTRL_OPEN,
    MOTOR_IN_CTRL_CLOSE,
    MOTOR_OUT_CTRL_OPEN,
    MOTOR_OUT_CTRL_CLOSE,
    MOTOR_IN_CTRL_STOP,
    MOTOR_OUT_CTRL_STOP,
} motor_control_t;
typedef enum {
    MOTOR_UART = 0,
    MOTOR_DRYCONTACT,
} motor_physic_t;

typedef enum {
    MOTOR_TYPE_NONE = 0,
    MOTOR_TYPE_SINGLE,
    MOTOR_TYPE_DOUBLE,
} motor_type_t;

typedef struct {
    int in_pos;
    int out_pos;
} motor_pos_t;

typedef struct {
    int tx_pin;
    int rx_pin;
    int uart_num;
} periph_motor_uart_conn_t;

typedef struct {
    int a_pin;
    int b_pin;
} periph_motor_drycontact_conn_t;
typedef union {
    struct {
        motor_type_t                   type;
        periph_motor_uart_conn_t       motor_uart_in_conn;
        periph_motor_uart_conn_t       motor_uart_out_conn;
        periph_motor_uart_conn_t       motor_uart_single_conn;
    } uart;

    struct {
        motor_type_t                   type;
        periph_motor_drycontact_conn_t motor_drycontact_in_conn;
        periph_motor_drycontact_conn_t motor_drycontact_out_conn;
        periph_motor_drycontact_conn_t motor_drycontact_single_conn;
    } drycontact;
} motor_hw_t;

typedef struct {
    motor_physic_t                  physic;
    motor_hw_t                      hw;
} periph_motor_cfg_t;

typedef struct {
    motor_hw_t                      hw;
    char                            *buffer;
    motor_pos_t                     position;
    motor_control_t                 pre_control;
} motor_uart_t;

typedef struct {
    motor_hw_t                      hw;
    motor_pos_t                     position;
    motor_control_t                 last_control;
} motor_drycontact_t;

typedef motor_uart_t* motor_uart_handle_t;
typedef motor_drycontact_t* motor_drycontact_handle_t;

esp_periph_handle_t periph_motor_init(periph_motor_cfg_t* motor_cfg);
esp_err_t periph_motor_control(esp_periph_handle_t periph_motor, motor_control_t control);
motor_pos_t periph_motor_set_pos(esp_periph_handle_t periph_motor, int val_in, int val_out);
esp_err_t periph_motor_get_pos(esp_periph_handle_t periph_motor, int* val_in, int* val_out);

motor_uart_handle_t periph_motor_uart_init(motor_hw_t* motor_cfg);
esp_err_t _motor_uart_init(motor_uart_handle_t motor_uart_handle);
esp_err_t periph_motor_uart_control(motor_uart_handle_t motor_uart_handle, motor_control_t control);
motor_pos_t periph_motor_uart_set_pos(motor_uart_handle_t motor_uart_handle, int val_in, int val_out);
esp_err_t periph_motor_uart_get_pos(motor_uart_handle_t motor_uart_handle, int* val_in, int* val_out);

motor_drycontact_handle_t periph_motor_drycontact_init(motor_hw_t* motor_drycontact_cfg);
esp_err_t _motor_drycontact_init(motor_drycontact_handle_t motor_drycontact_handle);
esp_err_t periph_motor_drycontact_control(motor_drycontact_handle_t motor_drycontact_handle, motor_control_t control);
motor_pos_t periph_motor_drycontact_set_pos(motor_drycontact_handle_t motor_drycontact_handle, int val_in, int val_out);
esp_err_t periph_motor_drycontact_get_pos(motor_drycontact_handle_t motor_drycontact_handle, int* val_in, int* val_out);


#ifdef __cplusplus
}
#endif

#endif
