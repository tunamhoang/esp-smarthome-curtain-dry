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

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "soc/soc.h"
#include "soc/rtc_cntl_reg.h"
#include "soc/sens_reg.h"
#include "esp_wifi.h"
#include "mdns.h"
#include "esp_event_loop.h"
#include "esp_log.h"
#include "esp_smartconfig.h"
#include "esp_system.h"
#include "periph_wifi.h"
#include "tct_template.h"
#include "esp_peripherals.h"

static const char *TAG = "PERIPH_WIFI";

#define VALIDATE_WIFI(periph, ret) if (!esp_periph_validate(periph, PERIPH_ID_WIFI)) { \
        ESP_LOGE(TAG, "Invalid WIFI periph, at line %d", __LINE__);\
        return ret;\
    }

#define PERIPH_WIFI_ERROR_CHECK(x) if (x != ESP_OK) { return ESP_FAIL; }

#define DEFAULT_RECONNECT_TIMEOUT_MS (3*1000)
#define DEFAULT_ROLLBACK_TIMEOUT (30*1000)

typedef struct periph_wifi *periph_wifi_handle_t;

struct periph_wifi {
    bool connected;
    bool disable_auto_reconnect;
    bool is_open;
    char *ssid;
    char *password;
    char *ap_ssid;
    char *ap_password;
    EventGroupHandle_t state_event;
    uint64_t reconnect_timeout_ms;
    uint64_t rollback_tick;
    bool disable_storage;
};


static const int CONNECTED_BIT = BIT0;
static const int DISCONNECTED_BIT = BIT1;
static const int SMARTCONFIG_DONE_BIT = BIT2;
static const int SMARTCONFIG_ERROR_BIT = BIT3;
static const int SCAN_DONE_BIT = BIT4;

static esp_periph_handle_t g_wifi_periph = NULL;
static wifi_ap_record_t *g_wifi_scan_list = NULL;
static uint16_t g_wifi_scan_ap_count = 0;


int periph_wifi_scan(wifi_ap_record_t **result, TickType_t tick_to_wait)
{
    if (g_wifi_periph == NULL) {
        return 0;
    }
    periph_wifi_handle_t periph_wifi = (periph_wifi_handle_t)esp_periph_get_data(g_wifi_periph);

    wifi_scan_config_t scan_cfg = {
        .ssid = NULL,
        .bssid = NULL,
        .channel = 0,
        .show_hidden = true
    };
    xEventGroupClearBits(periph_wifi->state_event, SCAN_DONE_BIT);
    if (g_wifi_scan_list) {
        free(g_wifi_scan_list);
        g_wifi_scan_list = NULL;
    }
    bool save_auto_reconnect = periph_wifi->disable_auto_reconnect;

    periph_wifi->disable_auto_reconnect = true;
    esp_wifi_disconnect();

    PERIPH_WIFI_ERROR_CHECK(esp_wifi_scan_start(&scan_cfg, true));
    EventBits_t scan_bit = xEventGroupWaitBits(periph_wifi->state_event, SCAN_DONE_BIT, false, true, tick_to_wait);
    periph_wifi->disable_auto_reconnect = save_auto_reconnect;
    if (!periph_wifi->connected) {
        esp_wifi_connect();
    }
    if (scan_bit & SCAN_DONE_BIT) {
        *result = g_wifi_scan_list;
        return g_wifi_scan_ap_count;
    }
    return 0;
}

esp_err_t periph_wifi_wait_for_connected(esp_periph_handle_t periph, TickType_t tick_to_wait)
{
    VALIDATE_WIFI(periph, ESP_FAIL);
    periph_wifi_handle_t periph_wifi = (periph_wifi_handle_t)esp_periph_get_data(periph);
    EventBits_t connected_bit = xEventGroupWaitBits(periph_wifi->state_event, CONNECTED_BIT, false, true, tick_to_wait);
    if (connected_bit & CONNECTED_BIT) {
        return ESP_OK;
    }
    return ESP_FAIL;
}

bool periph_wifi_is_connected()
{
    if (g_wifi_periph  != NULL) {
        periph_wifi_handle_t periph_wifi = (periph_wifi_handle_t)esp_periph_get_data(g_wifi_periph);
        return periph_wifi->connected;
    }
    return false;
}

// static void _wifi_smartconfig_event_callback(smartconfig_status_t status, void *pdata)
// {
//     wifi_config_t sta_conf;
//     smartconfig_type_t *type;
//     periph_wifi_handle_t periph_wifi = (periph_wifi_handle_t)esp_periph_get_data(g_wifi_periph);
//     switch (status) {
//         case SC_STATUS_WAIT:
//             ESP_LOGD(TAG, "SC_STATUS_WAIT");
//             break;

//         case SC_STATUS_FIND_CHANNEL:
//             ESP_LOGD(TAG, "SC_STATUS_FIND_CHANNEL");
//             break;

//         case SC_STATUS_GETTING_SSID_PSWD:
//             type = pdata;
//             ESP_LOGD(TAG, "SC_STATUS_GETTING_SSID_PSWD, SC_TYPE=%d", (int)*type);
//             break;

//         case SC_STATUS_LINK:
//             ESP_LOGD(TAG, "SC_STATUS_LINK");
//             memset(&sta_conf, 0x00, sizeof(sta_conf));
//             memcpy(&sta_conf.sta, pdata, sizeof(wifi_sta_config_t));
//             ESP_LOGD(TAG, "SSID=%s, PASS=%s", sta_conf.sta.ssid, sta_conf.sta.password);
//             esp_wifi_disconnect();

//             if (esp_wifi_set_config(WIFI_IF_STA, &sta_conf) != ESP_OK) {
//                 xEventGroupSetBits(periph_wifi->state_event, SMARTCONFIG_ERROR_BIT);
//             }
//             if (esp_wifi_connect() != ESP_OK) {
//                 xEventGroupSetBits(periph_wifi->state_event, SMARTCONFIG_ERROR_BIT);
//                 esp_periph_send_event(g_wifi_periph, PERIPH_WIFI_SMARTCONFIG_ERROR, NULL, 0);
//                 break;
//             }
//             break;

//         case SC_STATUS_LINK_OVER:
//             ESP_LOGD(TAG, "SC_STATUS_LINK_OVER");

//             if (pdata != NULL) {
//                 char phone_ip[4] = {0};
//                 memcpy(phone_ip, (const void *)pdata, 4);
//                 ESP_LOGD(TAG, "Phone ip: %d.%d.%d.%d\n", phone_ip[0], phone_ip[1], phone_ip[2], phone_ip[3]);
//                 esp_periph_send_event(g_wifi_periph, PERIPH_WIFI_SMARTCONFIG_DONE, NULL, 0);
//                 xEventGroupSetBits(periph_wifi->state_event, SMARTCONFIG_DONE_BIT);
//             } else {
//                 esp_periph_send_event(g_wifi_periph, PERIPH_WIFI_SMARTCONFIG_ERROR, NULL, 0);
//                 xEventGroupSetBits(periph_wifi->state_event, SMARTCONFIG_ERROR_BIT);
//             }

//             break;
//     }
// }

esp_err_t periph_wifi_wait_for_disconnected(esp_periph_handle_t periph, TickType_t tick_to_wait)
{
    VALIDATE_WIFI(periph, ESP_FAIL);
    periph_wifi_handle_t periph_wifi = (periph_wifi_handle_t)esp_periph_get_data(periph);
    EventBits_t disconnected_bit = xEventGroupWaitBits(periph_wifi->state_event, DISCONNECTED_BIT, false, true, tick_to_wait);
    if (disconnected_bit & DISCONNECTED_BIT) {
        return ESP_OK;
    }
    return ESP_FAIL;
}


esp_err_t periph_wifi_config_start(esp_periph_handle_t periph, periph_wifi_config_mode_t mode)
{
    VALIDATE_WIFI(periph, ESP_FAIL);
    periph_wifi_handle_t periph_wifi = (periph_wifi_handle_t)esp_periph_get_data(periph);
    esp_err_t err = ESP_OK;
    periph_wifi->disable_auto_reconnect = true;

    if (periph_wifi->connected) {
        esp_wifi_stop();
    }

    if (periph_wifi_wait_for_disconnected(periph, portMAX_DELAY) != ESP_OK) {
        return ESP_FAIL;
    }

    if (mode >= WIFI_CONFIG_ESPTOUCH && mode <= WIFI_CONFIG_ESPTOUCH_AIRKISS) {
        err = ESP_OK; //0;
        err |= esp_smartconfig_set_type(mode);
        err |= esp_smartconfig_fast_mode(true);
        // err |= esp_smartconfig_start(_wifi_smartconfig_event_callback, 0);
        xEventGroupClearBits(periph_wifi->state_event, SMARTCONFIG_DONE_BIT);
        xEventGroupClearBits(periph_wifi->state_event, SMARTCONFIG_ERROR_BIT);

    } else if (mode == WIFI_CONFIG_WPS) {
        //todo : add wps
        return ESP_OK;
    } else if (mode == WIFI_CONFIG_BLUEFI) {
        //todo : add ble config
        return ESP_OK;
    }

    return err;
}

esp_err_t periph_wifi_config_wait_done(esp_periph_handle_t periph, TickType_t tick_to_wait)
{
    VALIDATE_WIFI(periph, ESP_FAIL);
    periph_wifi_handle_t periph_wifi = (periph_wifi_handle_t)esp_periph_get_data(periph);
    EventBits_t smartconfig_bit = xEventGroupWaitBits(periph_wifi->state_event,
                                  SMARTCONFIG_DONE_BIT | SMARTCONFIG_ERROR_BIT, false, true, tick_to_wait);

    if (smartconfig_bit & SMARTCONFIG_DONE_BIT) {
        return ESP_OK;
    }
    if (smartconfig_bit & SMARTCONFIG_ERROR_BIT) {
        return ESP_FAIL;
    }
    return ESP_FAIL;
}

char *periph_wifi_get_json_status(const char *template, ...)
{
    if (g_wifi_periph == NULL) {
        return NULL;
    }
    periph_wifi_handle_t periph_wifi = (periph_wifi_handle_t)esp_periph_get_data(g_wifi_periph);
    tct_arguments *args = NULL;
    tcpip_adapter_ip_info_t ip_info;

    tcpip_adapter_get_ip_info(TCPIP_ADAPTER_IF_STA, &ip_info);
    uint64_t dev_id = esp_periph_get_device_id_full();

    tct_add_argument(args, "ssid", "%s", periph_wifi->ssid);
    tct_add_argument(args, "ip", "%s", ip4addr_ntoa(&ip_info.ip));
    tct_add_argument(args, "password", "%s", periph_wifi->password);
    tct_add_argument(args, "id", "%06llX", (dev_id >> 8) & 0xFFFFFF);
    tct_add_argument(args, "xid", "%08llX", dev_id & 0xFFFFFFFF);
    tct_add_argument(args, "rssi", "%d", periph_wifi_get_rssi());

    va_list vargs;
    va_start(vargs, template);
    char *tmp_str;
    int idx = 0;
    char arg_id[16];
    while ((tmp_str = va_arg(vargs, char *)) != NULL) {
        snprintf(arg_id, 16, "%d", idx++);
        tct_add_argument(args, arg_id, "%s", tmp_str);
    }
    va_end(vargs);

    char *render = tct_render((char *)template, args);
    tct_free_argument(args);
    return render;
}

static void wifi_reconnect_timer(xTimerHandle tmr)
{
    esp_periph_handle_t periph = (esp_periph_handle_t) pvTimerGetTimerID(tmr);
    esp_periph_stop_timer(periph);
    esp_wifi_connect();
}

static esp_err_t _wifi_event_callback(void *ctx, system_event_t *event)
{
    esp_periph_handle_t self = (esp_periph_handle_t)ctx;
    periph_wifi_handle_t periph_wifi = (periph_wifi_handle_t)esp_periph_get_data(self);
    switch (event->event_id) {
        case SYSTEM_EVENT_STA_START:
            esp_wifi_connect();
            break;

        case SYSTEM_EVENT_STA_CONNECTED:
            esp_periph_send_event(self, PERIPH_WIFI_CONNECTED, NULL, 0);
            break;
        case SYSTEM_EVENT_STA_GOT_IP:
            periph_wifi->connected = true;
            if (periph_wifi->rollback_tick) {
                periph_wifi->rollback_tick = 0;
            }
            xEventGroupClearBits(periph_wifi->state_event, DISCONNECTED_BIT);
            esp_periph_send_event(self, PERIPH_WIFI_GOT_IP, NULL, 0);
            xEventGroupSetBits(periph_wifi->state_event, CONNECTED_BIT);
            break;

        case SYSTEM_EVENT_STA_DISCONNECTED:
            periph_wifi->connected = false;
            xEventGroupClearBits(periph_wifi->state_event, CONNECTED_BIT);
            xEventGroupSetBits(periph_wifi->state_event, DISCONNECTED_BIT);
            esp_periph_send_event(self, PERIPH_WIFI_DISCONNECTED, NULL, 0);

            ESP_LOGW(TAG, "Wi-Fi disconnected from SSID %s, auto-reconnect %s, reconnect after %lld ms",
                     periph_wifi->ssid,
                     periph_wifi->disable_auto_reconnect == 0 ? "enabled" : "disabled",
                     periph_wifi->reconnect_timeout_ms);

            if (periph_wifi->rollback_tick && esp_periph_tick_get() - periph_wifi->rollback_tick > DEFAULT_ROLLBACK_TIMEOUT) {
                ESP_LOGW(TAG, "Rolback to old wifi configuration");
                periph_wifi->rollback_tick = 0;
                periph_wifi_connect(NULL, NULL, 0);
                break;
            }
            if (periph_wifi->disable_auto_reconnect) {
                break;
            }
            esp_periph_start_timer(self, periph_wifi->reconnect_timeout_ms / portTICK_RATE_MS, wifi_reconnect_timer);
            break;
        case SYSTEM_EVENT_SCAN_DONE:
            ESP_LOGD(TAG, "SYSTEM_EVENT_SCAN_DONE");
            esp_wifi_scan_get_ap_num(&g_wifi_scan_ap_count);
            if (g_wifi_scan_ap_count) {
                if (g_wifi_scan_list) {
                    free(g_wifi_scan_list);
                }
                g_wifi_scan_list = (wifi_ap_record_t *)malloc(sizeof(wifi_ap_record_t) * g_wifi_scan_ap_count);
                PERIPH_MEM_CHECK(TAG, g_wifi_scan_list, return ESP_ERR_NO_MEM);
                PERIPH_WIFI_ERROR_CHECK(esp_wifi_scan_get_ap_records(&g_wifi_scan_ap_count, g_wifi_scan_list));
                xEventGroupSetBits(periph_wifi->state_event, SCAN_DONE_BIT);
            }
            esp_wifi_scan_stop();
            break;
        default:
            break;
    }
    mdns_handle_system_event(ctx, event);
    return ESP_OK;
}

static esp_err_t _wifi_run(esp_periph_handle_t self, audio_event_iface_msg_t *msg)
{
    esp_periph_send_event(self, msg->cmd, NULL, 0);
    return ESP_OK;
}

static esp_err_t _wifi_init(esp_periph_handle_t self)
{
    periph_wifi_handle_t periph_wifi = (periph_wifi_handle_t)esp_periph_get_data(self);
    wifi_config_t wifi_config;
    esp_err_t err;

    if (periph_wifi->is_open) {
        ESP_LOGE(TAG, "Wifi has initialized");
        return ESP_FAIL;
    }

    wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
    if ((err = esp_wifi_init(&cfg)) != ESP_OK) {
        return err;
    }

    esp_event_loop_set_cb(_wifi_event_callback, self);
    if (!periph_wifi->disable_storage) {
        esp_periph_load_config(self);
    }

    if ((err = esp_wifi_set_mode(WIFI_MODE_STA)) != ESP_OK) {
        return err;
    }

    if (periph_wifi->ssid) {
        memset(&wifi_config, 0x00, sizeof(wifi_config_t));
        strcpy((char *)wifi_config.sta.ssid, periph_wifi->ssid);
        ESP_LOGD(TAG, "WIFI_SSID=%s", wifi_config.sta.ssid);
        if (periph_wifi->password) {
            strcpy((char *)wifi_config.sta.password, periph_wifi->password);
            ESP_LOGD(TAG, "WIFI_PASS=%s", wifi_config.sta.password);
        }
        if ((err = esp_wifi_set_storage(WIFI_STORAGE_RAM)) != ESP_OK) {
            return err;
        }
        if ((err = esp_wifi_set_config(WIFI_IF_STA, &wifi_config)) != ESP_OK) {
            return err;
        }
    }
    if (periph_wifi->ap_ssid) {
        periph_wifi_set_ap(periph_wifi->ap_ssid, periph_wifi->ap_password);
    }
    periph_wifi->is_open = true;
    periph_wifi->connected = false;
    xEventGroupClearBits(periph_wifi->state_event, CONNECTED_BIT);
    xEventGroupSetBits(periph_wifi->state_event, DISCONNECTED_BIT);
    if ((err = esp_wifi_start()) != ESP_OK) {
        return err;
    }
    return ESP_OK;
}

static esp_err_t _wifi_destroy(esp_periph_handle_t self)
{
    periph_wifi_handle_t periph_wifi = (periph_wifi_handle_t)esp_periph_get_data(self);
    esp_wifi_disconnect();
    periph_wifi_wait_for_disconnected(self, portMAX_DELAY);
    esp_wifi_stop();
    esp_wifi_deinit();
    free(periph_wifi->ssid);
    free(periph_wifi->ap_ssid);
    free(periph_wifi->password);
    free(periph_wifi->ap_password);
    vEventGroupDelete(periph_wifi->state_event);
    free(periph_wifi);
    g_wifi_periph = NULL;
    return ESP_OK;
}

static esp_err_t _wifi_config_unpack(void *context, char *buffer, int loaded_len)
{
    esp_periph_handle_t self = context;
    periph_wifi_handle_t periph_wifi = (periph_wifi_handle_t)esp_periph_get_data(self);
    if (loaded_len < sizeof(periph_wifi_storage_t)) {
        ESP_LOGE(TAG, "Invalid storage size");
        return ESP_FAIL;
    }
    periph_wifi_storage_t *storate = (periph_wifi_storage_t *)buffer;
    free(periph_wifi->ssid);
    free(periph_wifi->password);
    free(periph_wifi->ap_ssid);
    free(periph_wifi->ap_password);
    periph_wifi->ssid = strdup(storate->ssid);
    PERIPH_MEM_CHECK(TAG, periph_wifi->ssid, return ESP_ERR_NO_MEM);
    periph_wifi->password = strdup(storate->password);
    PERIPH_MEM_CHECK(TAG, periph_wifi->password, return ESP_ERR_NO_MEM);
    periph_wifi->ap_ssid = strdup(storate->ap_ssid);
    PERIPH_MEM_CHECK(TAG, periph_wifi->ap_ssid, return ESP_ERR_NO_MEM);
    periph_wifi->ap_password = strdup(storate->ap_password);
    PERIPH_MEM_CHECK(TAG, periph_wifi->ap_password, return ESP_ERR_NO_MEM);
    return ESP_OK;
}

static esp_err_t _wifi_config_pack(void *context, char *buffer, int max_buffer_size)
{
    esp_periph_handle_t self = context;
    periph_wifi_handle_t periph_wifi = (periph_wifi_handle_t)esp_periph_get_data(self);
    if (max_buffer_size < sizeof(periph_wifi_storage_t)) {
        ESP_LOGE(TAG, "Invalid storage size");
        return ESP_FAIL;
    }
    periph_wifi_storage_t *storate = (periph_wifi_storage_t *)buffer;
    memset(storate, 0, sizeof(periph_wifi_storage_t));
    if (periph_wifi->ssid) {
        strcpy(storate->ssid, periph_wifi->ssid);
    }
    if (periph_wifi->password) {
        strcpy(storate->password, periph_wifi->password);
    }
    if (periph_wifi->ap_ssid) {
        strcpy(storate->ap_ssid, periph_wifi->ap_ssid);
    }
    if (periph_wifi->ap_password) {
        strcpy(storate->ap_password, periph_wifi->ap_password);
    }

    return sizeof(periph_wifi_storage_t);
}

esp_periph_handle_t periph_wifi_init(periph_wifi_cfg_t *config)
{
    periph_wifi_handle_t periph_wifi = calloc(1, sizeof(struct periph_wifi));
    PERIPH_MEM_CHECK(TAG, periph_wifi, return NULL);
    if (config->ssid) {
        periph_wifi->ssid = strdup(config->ssid);
        PERIPH_MEM_CHECK(TAG, periph_wifi->ssid, goto _periph_wifi_exit);
    }

    if (config->password) {
        periph_wifi->password = strdup(config->password);
        PERIPH_MEM_CHECK(TAG, periph_wifi->password, goto _periph_wifi_exit);
    }

    if (config->ap_ssid) {
        periph_wifi->ap_ssid = strdup(config->ap_ssid);
        PERIPH_MEM_CHECK(TAG, periph_wifi->ap_ssid, goto _periph_wifi_exit);
    }

    if (config->ap_password) {
        periph_wifi->ap_password = strdup(config->ap_password);
        PERIPH_MEM_CHECK(TAG, periph_wifi->ap_password, goto _periph_wifi_exit);
    }
    periph_wifi->reconnect_timeout_ms = config->reconnect_timeout_ms;
    if (periph_wifi->reconnect_timeout_ms == 0) {
        periph_wifi->reconnect_timeout_ms = DEFAULT_RECONNECT_TIMEOUT_MS;
    }
    periph_wifi->disable_storage = config->disable_storage;

    periph_wifi->disable_auto_reconnect = config->disable_auto_reconnect;
    periph_wifi->state_event = xEventGroupCreate();
    esp_periph_handle_t periph = esp_periph_create(PERIPH_ID_WIFI, config->tag ? config->tag : "periph_wifi");
    PERIPH_MEM_CHECK(TAG, periph, goto _periph_wifi_exit);
    esp_periph_set_data(periph, periph_wifi);
    esp_periph_set_function(periph, _wifi_init, _wifi_run, _wifi_destroy);
    if (!periph_wifi->disable_storage) {
        esp_periph_set_config_func(periph, _wifi_config_unpack, _wifi_config_pack);
    }
    g_wifi_periph = periph;
    return periph;
_periph_wifi_exit:
    free(periph_wifi->ssid);
    free(periph_wifi->password);
    free(periph_wifi->ap_ssid);
    free(periph_wifi->ap_password);
    free(periph_wifi);
    return NULL;
}


esp_err_t periph_wifi_connect(const char *ssid, const char *password, TickType_t tick_to_wait)
{
    wifi_config_t wifi_config;
    if (g_wifi_periph == NULL) {
        return ESP_FAIL;
    }
    periph_wifi_handle_t periph_wifi = (periph_wifi_handle_t)esp_periph_get_data(g_wifi_periph);
    bool save_auto_reconnect = periph_wifi->disable_auto_reconnect;
    periph_wifi->disable_auto_reconnect = true;
    esp_wifi_disconnect();
    xEventGroupClearBits(periph_wifi->state_event, CONNECTED_BIT);

    memset(&wifi_config, 0x00, sizeof(wifi_config_t));
    if (ssid == NULL) {
        strcpy((char *)wifi_config.sta.ssid, periph_wifi->ssid);
        if (periph_wifi->password) {
            strcpy((char *)wifi_config.sta.password, periph_wifi->password);
        }
    } else {
        strcpy((char *)wifi_config.sta.ssid, ssid);
        ESP_LOGD(TAG, "connecting to ssid=%s", ssid);
        if (password) {
            ESP_LOGD(TAG, "password=%s", password);
            strcpy((char *)wifi_config.sta.password, password);
        }
    }

    PERIPH_WIFI_ERROR_CHECK(esp_wifi_set_config(WIFI_IF_STA, &wifi_config));
    esp_wifi_connect();
    EventBits_t connected_bit = xEventGroupWaitBits(periph_wifi->state_event, CONNECTED_BIT, false, true, tick_to_wait);
    periph_wifi->rollback_tick = esp_periph_tick_get();
    periph_wifi->disable_auto_reconnect = save_auto_reconnect;
    ESP_LOGD(TAG, "Connect timeout");
    if (connected_bit & CONNECTED_BIT) {
        bool need_to_save = false;
        periph_wifi->rollback_tick = 0;
        // If the wifi is connected and the credential was difference
        if (periph_wifi->password && strcmp(periph_wifi->password, (char *)wifi_config.sta.password) != 0) {
            free(periph_wifi->password);
            periph_wifi->password = strdup((char *)wifi_config.sta.password);
            need_to_save = true;
            PERIPH_MEM_CHECK(TAG, periph_wifi->password, return ESP_ERR_NO_MEM);
        }
        if (periph_wifi->ssid && strcmp(periph_wifi->ssid, (char *)wifi_config.sta.ssid) != 0) {
            free(periph_wifi->ssid);
            periph_wifi->ssid = strdup((char *)wifi_config.sta.ssid);
            need_to_save = true;
            PERIPH_MEM_CHECK(TAG, periph_wifi->ssid, return ESP_ERR_NO_MEM);
        }
        if (!need_to_save) {
            return ESP_OK;
        }
        ESP_LOGD(TAG, "Connected, save new configuration");
        esp_periph_send_event(g_wifi_periph, PERIPH_WIFI_UPDATE_CREDENTIAL, &wifi_config, WIFI_IF_STA);

        if (!periph_wifi->disable_storage) {
            return esp_periph_save_config(g_wifi_periph);
        }

        return ESP_OK;
    }
    return ESP_FAIL;
}

char *periph_wifi_get_ap_ssid_config()
{
    if (g_wifi_periph == NULL) {
        return NULL;
    }
    periph_wifi_handle_t periph_wifi = (periph_wifi_handle_t)esp_periph_get_data(g_wifi_periph);
    return periph_wifi->ap_ssid;
}

esp_err_t periph_wifi_set_ap(const char *ap_ssid, const char *ap_password)
{
    esp_err_t err;
    if (g_wifi_periph == NULL || ap_ssid == NULL) {
        return ESP_FAIL;
    }
    periph_wifi_handle_t periph_wifi = (periph_wifi_handle_t)esp_periph_get_data(g_wifi_periph);

    wifi_config_t wifi_config;
    memset(&wifi_config, 0x00, sizeof(wifi_config_t));
    uint64_t dev_id = esp_periph_get_device_id_full();

    char *ssid_format = tct_render_id(ap_ssid, dev_id);
    strcpy((char *)wifi_config.sta.ssid, ssid_format);
    free(ssid_format);

    ESP_LOGD(TAG, "WIFI_AP_SSID=%s, ID=%llx", wifi_config.sta.ssid, dev_id);
    if (ap_password && ap_password[0]) {
        strcpy((char *)wifi_config.sta.password, ap_password);
        ESP_LOGD(TAG, "WIFI_AP_PASS=%s", wifi_config.sta.password);
        wifi_config.ap.authmode = WIFI_AUTH_WPA_PSK;
    } else {
        wifi_config.ap.authmode = WIFI_AUTH_OPEN;
        wifi_config.sta.password[0] = 0;
    }

    wifi_config.ap.max_connection = 4;
    wifi_config.ap.beacon_interval = 100;
    wifi_config.ap.channel = 1;

    if ((err = esp_wifi_set_config(WIFI_IF_AP, &wifi_config)) != ESP_OK) {
        return err;
    }
    if (periph_wifi->ap_ssid &&
            strcmp(ap_ssid, periph_wifi->ap_ssid) != 0) {
        esp_periph_send_event(g_wifi_periph, PERIPH_WIFI_UPDATE_CREDENTIAL, &wifi_config, WIFI_IF_AP);
    }

    return ESP_OK;
}

esp_err_t periph_wifi_set_config(esp_periph_handle_t periph, const periph_wifi_storage_t *storage)
{
    if (storage == NULL) {
        return ESP_ERR_NO_MEM;
    }
    periph_wifi_handle_t periph_wifi = esp_periph_get_data(periph);
    if (periph_wifi->disable_storage) {
        return ESP_FAIL;
    }
    if (periph_wifi->ssid) {
        free(periph_wifi->ssid);
        periph_wifi->ssid = strdup(storage->ssid);
        PERIPH_MEM_CHECK(TAG, periph_wifi->ssid, return ESP_ERR_NO_MEM);
    }
    if (periph_wifi->password) {
        free(periph_wifi->password);
        periph_wifi->password = strdup(storage->password);
        PERIPH_MEM_CHECK(TAG, periph_wifi->password, return ESP_ERR_NO_MEM);
    }
    if (periph_wifi->ap_ssid) {
        free(periph_wifi->ap_ssid);
        periph_wifi->ap_ssid = strdup(storage->ap_ssid);
        PERIPH_MEM_CHECK(TAG, periph_wifi->ap_ssid, return ESP_ERR_NO_MEM);
    }
    if (periph_wifi->ap_password) {
        free(periph_wifi->ap_password);
        periph_wifi->ap_password = strdup(storage->ap_password);
        PERIPH_MEM_CHECK(TAG, periph_wifi->ap_password, return ESP_ERR_NO_MEM);
    }
    return esp_periph_save_config(periph);
}

esp_err_t periph_wifi_get_config(esp_periph_handle_t periph, periph_wifi_storage_t *storage)
{
    periph_wifi_handle_t periph_wifi = (periph_wifi_handle_t)esp_periph_get_data(periph);
    if (periph_wifi->disable_storage) {
        return ESP_FAIL;
    }
    esp_err_t err = esp_periph_load_config(periph);
    if (err != ESP_OK) {
        return err;
    }
    if (storage != NULL) {
        memset(storage, 0, sizeof(periph_wifi_storage_t));
        strcpy(storage->ssid, periph_wifi->ssid);
        if (periph_wifi->password) {
            strcpy(storage->password, periph_wifi->password);
        }
        strcpy(storage->ap_ssid, periph_wifi->ap_ssid);
        if (periph_wifi->ap_password) {
            strcpy(storage->ap_password, periph_wifi->ap_password);
        }

    }
    return ESP_OK;
}

esp_err_t periph_wifi_start_ap()
{
    esp_err_t err;
    if (g_wifi_periph == NULL) {
        return ESP_FAIL;
    }
    periph_wifi_handle_t periph_wifi = (periph_wifi_handle_t)esp_periph_get_data(g_wifi_periph);
    if (periph_wifi->ap_ssid == NULL) {
        ESP_LOGE(TAG, "ap_ssid must not NULL");
        return ESP_FAIL;
    }
    bool save_auto_reconnect = periph_wifi->disable_auto_reconnect;
    periph_wifi->disable_auto_reconnect = true;
    if ((err = esp_wifi_stop()) != ESP_OK) {
        periph_wifi->disable_auto_reconnect = save_auto_reconnect;
        return err;
    }
    xEventGroupClearBits(periph_wifi->state_event, CONNECTED_BIT);
    xEventGroupSetBits(periph_wifi->state_event, DISCONNECTED_BIT);

    if ((err = esp_wifi_set_mode(WIFI_MODE_APSTA)) != ESP_OK) {
        ESP_LOGE(TAG, "error set mode WIFI_MODE_APSTA");
        periph_wifi->disable_auto_reconnect = save_auto_reconnect;
        return err;
    }

    if ((err = periph_wifi_set_ap(periph_wifi->ap_ssid, periph_wifi->ap_password)) != ESP_OK) {
        periph_wifi->disable_auto_reconnect = save_auto_reconnect;
        return err;
    }

    if ((err = esp_wifi_start()) != ESP_OK) {
        ESP_LOGE(TAG, "error start wifi");
        periph_wifi->disable_auto_reconnect = save_auto_reconnect;
        return err;
    }

    periph_wifi->disable_auto_reconnect = save_auto_reconnect;
    if (!periph_wifi->disable_auto_reconnect) {
        esp_wifi_connect();
    }
    return ESP_OK;
}

esp_err_t periph_wifi_stop_ap()
{
    esp_err_t err;
    if (g_wifi_periph == NULL) {
        return ESP_FAIL;
    }
    periph_wifi_handle_t periph_wifi = (periph_wifi_handle_t)esp_periph_get_data(g_wifi_periph);

    if ((err = esp_wifi_stop()) != ESP_OK) {
        return err;
    }
    xEventGroupClearBits(periph_wifi->state_event, CONNECTED_BIT);
    xEventGroupSetBits(periph_wifi->state_event, DISCONNECTED_BIT);

    if ((err = esp_wifi_set_mode(WIFI_MODE_STA)) != ESP_OK) {
        return err;
    }
    if ((err = esp_wifi_start()) != ESP_OK) {
        return err;
    }
    return ESP_OK;
}


int8_t periph_wifi_get_rssi()
{
    wifi_ap_record_t ap_info;
    esp_err_t err = esp_wifi_sta_get_ap_info(&ap_info);
    if (err == ESP_OK) {
        return ap_info.rssi;
    }
    return 0;
}
