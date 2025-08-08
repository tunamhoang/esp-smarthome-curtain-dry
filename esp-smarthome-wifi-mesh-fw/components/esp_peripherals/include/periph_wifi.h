/*
 * ESPRESSIF MIT License
 *
 * Copyright (c) 2018 <ESPRESSIF SYSTEMS (SHANGHAI) PTE LTD>
 *
 * Permission is hereby granted for use on all ESPRESSIF SYSTEMS products, in which case,
 * it is free of charge, to any person obtaining a copy of this software and associated
 * documentation files (the "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the Software is furnished
 * to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all copies or
 * substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 */

#ifndef _DEV_WIFI_H_
#define _DEV_WIFI_H_

#include "esp_err.h"
#include "esp_peripherals.h"
#include "esp_wifi_types.h"

#ifdef __cplusplus
extern "C" {
#endif

#define MAX_WIFI_STRING_CONFIG 32

typedef struct {
    char ssid[MAX_WIFI_STRING_CONFIG];
    char password[MAX_WIFI_STRING_CONFIG];
    char ap_ssid[MAX_WIFI_STRING_CONFIG];
    char ap_password[MAX_WIFI_STRING_CONFIG];
} periph_wifi_storage_t;

/**
 * @brief      Peripheral Wi-Fi event id
 */
typedef enum {
    PERIPH_WIFI_UNCHANGE = 0,
    PERIPH_WIFI_CONNECTED,
    PERIPH_WIFI_GOT_IP,
    PERIPH_WIFI_UPDATE_CREDENTIAL,
    PERIPH_WIFI_DISCONNECTED,
    PERIPH_WIFI_SMARTCONFIG_DONE,
    PERIPH_WIFI_SMARTCONFIG_ERROR,
    PERIPH_WIFI_ERROR,
    PERIPH_WIFI_SAVE_CONFIG,
} periph_wifi_event_id_t;

/**
 * @brief   Wi-Fi setup mode type
 */
typedef enum {
    WIFI_CONFIG_ESPTOUCH,           /*!< Using smartconfig with ESPTOUCH protocol */
    WIFI_CONFIG_AIRKISS,            /*!< Using smartconfig with AIRKISS protocol */
    WIFI_CONFIG_ESPTOUCH_AIRKISS,   /*!< Using smartconfig with ESPTOUCH_AIRKISS protocol */
    WIFI_CONFIG_WPS,                /*!< Using WPS (not support) */
    WIFI_CONFIG_BLUEFI,             /*!< Using BLUEFI (not support) */
    WIFI_CONFIG_WEB,                /*!< Using HTTP Server (not support) */
} periph_wifi_config_mode_t;

/**
 * @brief The Wi-Fi peripheral configuration
 */
typedef struct {
    bool    disable_auto_reconnect;   /*!< Disable Wi-Fi auto reconnect */
    int     reconnect_timeout_ms;     /*!< The reconnect timeout after disconnected from Wi-Fi network */
    const   char *ssid;               /*!< SSID of target AP */
    const   char *password;           /*!< password of target AP */
    const   char *ap_ssid;               /*!< SSID of target AP */
    const   char *ap_password;           /*!< password of target AP */
    const   char *tag;
    bool    disable_storage;
} periph_wifi_cfg_t;

/**
 * @brief      Create the wifi peripheral handle for esp_peripherals
 *
 * @note       The handle was created by this function automatically destroy when `esp_periph_destroy` is called
 *
 * @param      config  The configuration
 *
 * @return     The esp peripheral handle
 */
esp_periph_handle_t periph_wifi_init(periph_wifi_cfg_t* config);

/**
 * @brief      This function will block current thread (in `tick_to_wait` tick) and wait until ESP32 connected to the Wi-Fi network, and got ip
 *
 * @param[in]  periph        The periph
 * @param[in]  tick_to_wait  The tick to wait
 *
 * @return
 *     - ESP_OK
 *     - ESP_FAIL
 */
esp_err_t periph_wifi_wait_for_connected(esp_periph_handle_t periph, TickType_t tick_to_wait);

esp_err_t periph_wifi_connect(const char *ssid, const char *password, TickType_t tick_to_wait);
esp_err_t periph_wifi_set_ap(const char *ap_ssid, const char *ap_password);

/**
 * @brief      Check the Wi-Fi connection status
 *
 * @return     Wi-Fi network status
 */
bool periph_wifi_is_connected();

/**
 * @brief      Start Wi-Fi network setup in `mode`
 *
 * @param[in]  periph   The periph
 * @param[in]  mode     The mode
 *
 * @return
 *     - ESP_OK
 *     - ESP_FAIL
 */
esp_err_t periph_wifi_config_start(esp_periph_handle_t periph, periph_wifi_config_mode_t mode);

/**
 * @brief      Wait for Wi-Fi setup done
 * @param[in]  periph        The periph
 * @param[in]  tick_to_wait  The tick to wait
 *
 * @return
 *     - ESP_OK
 *     - ESP_FAIL
 */
esp_err_t periph_wifi_config_wait_done(esp_periph_handle_t periph, TickType_t tick_to_wait);

int periph_wifi_scan(wifi_ap_record_t **result, TickType_t tick_to_wait);
char *periph_wifi_get_ap_ssid_config();

esp_err_t periph_wifi_set_config(esp_periph_handle_t periph, const periph_wifi_storage_t *storage);
esp_err_t periph_wifi_get_config(esp_periph_handle_t periph, periph_wifi_storage_t *storage);
char *periph_wifi_get_json_status(const char *template, ...);

esp_err_t periph_wifi_start_ap();
esp_err_t periph_wifi_stop_ap();
int8_t periph_wifi_get_rssi();

#ifdef __cplusplus
}
#endif

#endif


