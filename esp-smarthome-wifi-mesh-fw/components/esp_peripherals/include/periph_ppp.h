/*
 * This file is subject to the terms of the Nanochip License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *                             ./LICENSE
 */
#ifndef _PERIPH_PPP_H_
#define _PERIPH_PPP_H_

#include "esp_err.h"
#include "esp_peripherals.h"
#include <time.h>
#include <sys/time.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef enum {
    MODEM_TYPE_SIM800 = 1,
    MODEM_TYPE_SIM868,
} periph_ppp_modem_type_t;

typedef struct {
    int tx_pin;
    int rx_pin;
    int reset_pin;
    int ri_pin;
    int dtr_pin;
    int uart_num;
} periph_ppp_modem_conn_t;

typedef struct {
    periph_ppp_modem_conn_t modem_conn;
    periph_ppp_modem_type_t modem_type;
    const char *tag;
    int task_stack;
    int task_prio;
} periph_ppp_cfg_t;


typedef enum {
    TEST
} periph_ppp_event_id_t;


esp_periph_handle_t periph_ppp_init(periph_ppp_cfg_t* ppp_cfg);

bool periph_ppp_is_connected(esp_periph_handle_t periph);
void periph_ppp_get_ip_address(esp_periph_handle_t periph);
void periph_ppp_recv_sms();
void periph_ppp_send_sms();
esp_err_t periph_ppp_reset_connection(esp_periph_handle_t periph);

#ifdef __cplusplus
}
#endif

#endif
