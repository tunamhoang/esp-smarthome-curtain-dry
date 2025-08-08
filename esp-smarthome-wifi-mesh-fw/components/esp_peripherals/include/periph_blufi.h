/*
 * This file is subject to the terms of the Nanochip License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *                             ./LICENSE
 */
#ifndef _PERIPH_BLUFI_H_
#define _PERIPH_BLUFI_H_

#include "esp_err.h"
#include "esp_peripherals.h"
#include <time.h>
#include <sys/time.h>

#ifdef __cplusplus
extern "C" {
#endif


typedef struct {
    const char      *tag;
    const char      *device_name;
    bool            run_on_init;
    int             task_stack;
    int             task_prio;
    bool            disable_auto_start;
    int             time_out_interval_sec;
} periph_blufi_cfg_t;

#define MAX_BLUFI_NAME_SIZE  64

typedef struct {
    char name[MAX_BLUFI_NAME_SIZE];
} periph_blufi_storage_t;

typedef enum {
    PERIPH_BLUFI_UNCHANGE = 0, /*!< No event */
    PERIPH_BLUFI_WIFI_STA_INFO = 1,
    PERIPH_BLUFI_CUSTOM_DATA,
    PERIPH_BLUFI_CONNECT,
    PERIPH_BLUFI_DISCONNECT,
    PERIPH_BLUFI_DEINIT_FINISH,
} periph_blufi_event_id_t;

esp_periph_handle_t periph_blufi_init(periph_blufi_cfg_t* blufi_cfg);
esp_err_t periph_blufi_start(esp_periph_handle_t periph);
esp_err_t periph_blufi_stop(esp_periph_handle_t periph);
esp_err_t periph_blufi_response_custom_data(uint8_t *data, uint32_t data_len);
esp_err_t periph_blufi_report_wifi_sta_status(esp_periph_handle_t periph);


#ifdef __cplusplus
}
#endif

#endif
