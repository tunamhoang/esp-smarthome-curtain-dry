/*
 * This file is subject to the terms of the Nanochip License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *                             ./LICENSE
 */
#ifndef _OTA_DEV_H_
#define _OTA_DEV_H_

#include "esp_err.h"
#include "esp_peripherals.h"

#ifdef __cplusplus
extern "C" {
#endif

/**
 * Peripheral OTA configuration
 */
typedef struct {
    const char *uri;
    const char *version;
    const char *update_template;
    const char *token;
    const char *model;
    bool        disable_storage;
    const char *tag;
    int         update_interval_in_seconds;
    int         enable_random_delay;
    bool        disable_auto_ota;
    bool        disable_acquire_connection;
} periph_ota_cfg_t;

#define MAX_OTA_URI_SIZE 256

typedef struct {
    char uri[MAX_OTA_URI_SIZE];
    int  update_interval_in_seconds;
} periph_ota_storage_t;

/**
 * Peripheral OTA events
 */
typedef enum {
    OTA_STATUS_UNKNOWN,
    OTA_STATUS_UPDATE_PREPARE,
    OTA_STATUS_UPDATE_BEGIN,
    OTA_STATUS_UPDATE_PROCESS,
    OTA_STATUS_UPDATE_FINISH,
    OTA_STATUS_UPDATE_EXIT,
    OTA_STATUS_UPDATE_ERROR,
    OTA_STATUS_INVALID_TOKEN,
} periph_ota_event_id_t;

/**
 * @brief      Initialize OTA
 *
 * @param      ota_cfg  The ota configuration
 *
 * @return     ota handle
 */
esp_periph_handle_t periph_ota_init(periph_ota_cfg_t *ota_cfg);

/**
 * @brief      Force update OTA
 *
 * @param[in]  periph  The periph
 *
 * @return
 *     - ESP_OK
 *     - ESP_*
 */
esp_err_t periph_ota_force_update(esp_periph_handle_t periph);
esp_err_t periph_ota_set_config(esp_periph_handle_t periph, const periph_ota_storage_t *storage);
esp_err_t periph_ota_get_config(esp_periph_handle_t periph, periph_ota_storage_t *storage);
esp_err_t periph_ota_set_token(esp_periph_handle_t periph, const char *token);
esp_err_t periph_ota_set_uri(esp_periph_handle_t periph, const char *uri);
#ifdef __cplusplus
}
#endif

#endif
