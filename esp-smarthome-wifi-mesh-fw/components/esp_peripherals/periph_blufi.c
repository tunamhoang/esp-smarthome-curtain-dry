/*
 * This file is subject to the terms of the Nanochip License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *                             ./LICENSE
 */
#include "sdkconfig.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <sys/time.h>

#include "esp_log.h"
#include "esp_system.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "periph_blufi.h"
#include "periph_wifi.h"
#include "tct_template.h"
#include "blufi.h"

#if CONFIG_BT_ENABLED && CONFIG_ENABLE_PERIPH_BLUFI
#include "esp_blufi_api.h"
#include "esp_bt_defs.h"
#include "esp_gap_ble_api.h"
#include "esp_bt_main.h"
#include "esp_bt_device.h"
#include "esp_wifi.h"
#include "esp_bt.h"
#include "esp_blufi.h"

static const char* TAG = "PERIPH_BLUFI";

#define VALIDATE_BLUFI(periph, ret) if (!esp_periph_validate(periph, PERIPH_ID_BLUFI)) { \
    ESP_LOGE(TAG, "Invalid BLUFI periph, at line %d", __LINE__);\
    return ret;\
}

#define BLUFI_DEFAULT_DEVICE_NAME   "ESP_${id}"
#define TIME_TICK                   1000
esp_periph_handle_t g_blufi;

typedef struct periph_blufi* periph_blufi_handle_t;

typedef struct periph_blufi {
    char                                        *device_name;
    bool                                        disable_auto_start;
    bool                                        is_started;
    bool                                        is_stop;
    bool                                        request_stop;
    TimerHandle_t                               stop_timer;
    int64_t                                     tick;
    int64_t                                     time_out;
    EventGroupHandle_t                          evt_group;
} periph_blufi_t;

static uint8_t _blufi_service_uuid128[32] = {
    /* LSB <--------------------------------------------------------------------------------> MSB */
    //first uuid, 16bit, [12],[13] is the value
    0xfb, 0x34, 0x9b, 0x5f, 0x80, 0x00, 0x00, 0x80, 0x00, 0x10, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00,
};

static esp_ble_adv_data_t _blufi_adv_data = {
    .set_scan_rsp = false,
    .include_name = true,
    .include_txpower = true,
    .min_interval = 0x100,
    .max_interval = 0x100,
    .appearance = 0x00,
    .manufacturer_len = 0,
    .p_manufacturer_data =  NULL,
    .service_data_len = 0,
    .p_service_data = NULL,
    .service_uuid_len = 16,
    .p_service_uuid = _blufi_service_uuid128,
    .flag = 0x6,
};

static esp_ble_adv_params_t _blufi_adv_params = {
    .adv_int_min        = 0x100,
    .adv_int_max        = 0x100,
    .adv_type           = ADV_TYPE_IND,
    .own_addr_type      = BLE_ADDR_TYPE_PUBLIC,
    .channel_map        = ADV_CHNL_ALL,
    .adv_filter_policy = ADV_FILTER_ALLOW_SCAN_ANY_CON_ANY,
};

/* connect infor*/
static uint8_t server_if;
static uint16_t conn_id;
static wifi_config_t sta_config;
static wifi_config_t ap_config;

static const int STARTED_BIT            = BIT0;
static const int STOPPED_BIT            = BIT1;

static uint32_t _is_connected() {
    // tcpip_adapter_ip_info_t ip;
    // tcpip_adapter_get_ip_info(TCPIP_ADAPTER_IF_STA, &ip);
    // return ip.ip.addr;
    esp_netif_t *netif = esp_netif_get_default_netif();
    esp_netif_ip_info_t ip;
    esp_netif_get_ip_info(netif, &ip);
    return ip.ip.addr;
}

static void _blufi_event_callback(esp_blufi_cb_event_t event, esp_blufi_cb_param_t *param) {
    if (g_blufi == NULL) return;
    periph_blufi_handle_t periph_blufi = (periph_blufi_handle_t)esp_periph_get_data(g_blufi);
    switch (event) {
        case ESP_BLUFI_EVENT_INIT_FINISH:
            ESP_LOGI(TAG, "BLUFI init finish\n");
            esp_ble_gap_set_device_name(periph_blufi->device_name);
            esp_ble_gap_config_adv_data(&_blufi_adv_data);
            xEventGroupSetBits(periph_blufi->evt_group, STARTED_BIT);
            break;
        case ESP_BLUFI_EVENT_DEINIT_FINISH:
            ESP_LOGI(TAG, "BLUFI deinit finish\n");
            vTaskDelay(1000 / portTICK_PERIOD_MS);
            esp_periph_send_event(g_blufi, PERIPH_BLUFI_DEINIT_FINISH, NULL, 0);
            xEventGroupSetBits(periph_blufi->evt_group, STOPPED_BIT);
            break;
        case ESP_BLUFI_EVENT_BLE_CONNECT:
            periph_blufi->tick = esp_periph_tick_get();
            ESP_LOGI(TAG, "BLUFI ble connect\n");
            server_if = param->connect.server_if;
            conn_id = param->connect.conn_id;
            esp_ble_gap_stop_advertising();
            blufi_security_init();
            esp_periph_send_event(g_blufi, PERIPH_BLUFI_CONNECT, NULL, 0);
            break;
        case ESP_BLUFI_EVENT_BLE_DISCONNECT:
            ESP_LOGI(TAG, "BLUFI ble disconnect\n");
            blufi_security_deinit();
            esp_ble_gap_start_advertising(&_blufi_adv_params);
            esp_periph_send_event(g_blufi, PERIPH_BLUFI_DISCONNECT, NULL, 0);
            break;
        case ESP_BLUFI_EVENT_SET_WIFI_OPMODE:
            ESP_LOGI(TAG, "BLUFI Set WIFI opmode %d\n", param->wifi_mode.op_mode);
            ESP_ERROR_CHECK(esp_wifi_set_mode(param->wifi_mode.op_mode));
            break;
        case ESP_BLUFI_EVENT_REQ_CONNECT_TO_AP:
            ESP_LOGI(TAG, "BLUFI requset wifi connect to AP\n");
            esp_periph_send_event(g_blufi, PERIPH_BLUFI_WIFI_STA_INFO, (void*)&sta_config, sizeof(wifi_config_t));
            break;
        case ESP_BLUFI_EVENT_REQ_DISCONNECT_FROM_AP:
            ESP_LOGI(TAG, "BLUFI requset wifi disconnect from AP\n");
            esp_wifi_disconnect();
            break;
        case ESP_BLUFI_EVENT_REPORT_ERROR:
            ESP_LOGE(TAG, "BLUFI report error, error code %d\n", param->report_error.state);
            esp_blufi_send_error_info(param->report_error.state);
            break;
        case ESP_BLUFI_EVENT_GET_WIFI_STATUS: {
                periph_blufi_report_wifi_sta_status(g_blufi);
                ESP_LOGI(TAG, "BLUFI get wifi status from AP\n");
                break;
            }
        case ESP_BLUFI_EVENT_RECV_SLAVE_DISCONNECT_BLE:
            ESP_LOGI(TAG, "blufi close a gatt connection");
            esp_blufi_disconnect();
            break;
        case ESP_BLUFI_EVENT_DEAUTHENTICATE_STA:
            break;
        case ESP_BLUFI_EVENT_RECV_STA_BSSID:
            memcpy(sta_config.sta.bssid, param->sta_bssid.bssid, 6);
            sta_config.sta.bssid_set = 1;
            esp_wifi_set_config(WIFI_IF_STA, &sta_config);
            ESP_LOGI(TAG, "Recv STA BSSID %s\n", sta_config.sta.ssid);
            break;
        case ESP_BLUFI_EVENT_RECV_STA_SSID:
            strncpy((char *)sta_config.sta.ssid, (char *)param->sta_ssid.ssid, param->sta_ssid.ssid_len);
            sta_config.sta.ssid[param->sta_ssid.ssid_len] = '\0';
            ESP_LOGD(TAG, "Recv STA SSID %s\n", sta_config.sta.ssid);
            break;
        case ESP_BLUFI_EVENT_RECV_STA_PASSWD:
            strncpy((char *)sta_config.sta.password, (char *)param->sta_passwd.passwd, param->sta_passwd.passwd_len);
            sta_config.sta.password[param->sta_passwd.passwd_len] = '\0';
            ESP_LOGD(TAG, "Recv STA PASSWORD %s\n", sta_config.sta.password);
            break;
        case ESP_BLUFI_EVENT_RECV_SOFTAP_SSID:
            strncpy((char *)ap_config.ap.ssid, (char *)param->softap_ssid.ssid, param->softap_ssid.ssid_len);
            ap_config.ap.ssid[param->softap_ssid.ssid_len] = '\0';
            ap_config.ap.ssid_len = param->softap_ssid.ssid_len;
            ESP_LOGD(TAG, "Recv SOFTAP SSID %s, ssid len %d\n", ap_config.ap.ssid, ap_config.ap.ssid_len);
            break;
        case ESP_BLUFI_EVENT_RECV_SOFTAP_PASSWD:
            strncpy((char *)ap_config.ap.password, (char *)param->softap_passwd.passwd, param->softap_passwd.passwd_len);
            ap_config.ap.password[param->softap_passwd.passwd_len] = '\0';
            ESP_LOGD(TAG, "Recv SOFTAP PASSWORD %s len = %d\n", ap_config.ap.password, param->softap_passwd.passwd_len);
            break;
        case ESP_BLUFI_EVENT_RECV_SOFTAP_MAX_CONN_NUM:
            if (param->softap_max_conn_num.max_conn_num > 4) {
                return;
            }
            ap_config.ap.max_connection = param->softap_max_conn_num.max_conn_num;
            esp_wifi_set_config(WIFI_IF_AP, &ap_config);
            ESP_LOGD(TAG, "Recv SOFTAP MAX CONN NUM %d\n", ap_config.ap.max_connection);
            break;
        case ESP_BLUFI_EVENT_RECV_SOFTAP_AUTH_MODE:
            if (param->softap_auth_mode.auth_mode >= WIFI_AUTH_MAX) {
                return;
            }
            ap_config.ap.authmode = param->softap_auth_mode.auth_mode;
            ESP_LOGD(TAG, "Recv SOFTAP AUTH MODE %d\n", ap_config.ap.authmode);
            break;
        case ESP_BLUFI_EVENT_RECV_SOFTAP_CHANNEL:
            if (param->softap_channel.channel > 13) {
                return;
            }
            ap_config.ap.channel = param->softap_channel.channel;
            ESP_LOGD(TAG, "Recv SOFTAP CHANNEL %d\n", ap_config.ap.channel);
            break;
        case ESP_BLUFI_EVENT_GET_WIFI_LIST:
            break;
        case ESP_BLUFI_EVENT_RECV_CUSTOM_DATA:
            periph_blufi->tick = esp_periph_tick_get();
            ESP_LOGD(TAG, "Recv Custom Data %ld\n", param->custom_data.data_len);
            if (g_blufi == NULL || param->custom_data.data == NULL) {
                break;
            }
            if (param->custom_data.data_len && param->custom_data.data[0] == 0) {
                esp_periph_send_event(g_blufi,
                                  PERIPH_BLUFI_CUSTOM_DATA,
                                  NULL,
                                  0);
                break;
            }
            char *custom_data = calloc(1, param->custom_data.data_len + 1);
            if (custom_data == NULL) {
                break;
            }
            memcpy(custom_data, param->custom_data.data, param->custom_data.data_len);
            esp_periph_send_event(g_blufi,
                                  PERIPH_BLUFI_CUSTOM_DATA,
                                  (void*)custom_data,
                                  param->custom_data.data_len);
            break;
        case ESP_BLUFI_EVENT_RECV_USERNAME:
            break;
        case ESP_BLUFI_EVENT_RECV_CA_CERT:
            break;
        case ESP_BLUFI_EVENT_RECV_CLIENT_CERT:
            break;
        case ESP_BLUFI_EVENT_RECV_SERVER_CERT:
            break;
        case ESP_BLUFI_EVENT_RECV_CLIENT_PRIV_KEY:
            break;;
        case ESP_BLUFI_EVENT_RECV_SERVER_PRIV_KEY:
            break;
        default:
            break;
    }
}

static void _blufi_gap_event_handler(esp_gap_ble_cb_event_t event, esp_ble_gap_cb_param_t *param) {
    switch (event) {
        case ESP_GAP_BLE_ADV_DATA_SET_COMPLETE_EVT:
            esp_ble_gap_start_advertising(&_blufi_adv_params);
            break;
        default:
            break;
    }
}

static esp_err_t _blufi_run(esp_periph_handle_t self, audio_event_iface_msg_t *msg) {
    return ESP_OK;
}

static esp_err_t _blufi_destroy(esp_periph_handle_t self) {
    periph_blufi_t *periph_blufi = esp_periph_get_data(self);
    esp_bluedroid_deinit();
    esp_bt_controller_disable();
    esp_bt_controller_deinit();
    free(periph_blufi->device_name);
    free(periph_blufi);
    return ESP_OK;
}

static esp_blufi_callbacks_t _blufi_callbacks = {
    .event_cb = _blufi_event_callback,
    .negotiate_data_handler = blufi_dh_negotiate_data_handler,
    .encrypt_func = blufi_aes_encrypt,
    .decrypt_func = blufi_aes_decrypt,
    .checksum_func = blufi_crc_checksum,
};

static esp_err_t _blufi_init(esp_periph_handle_t self) {
    esp_err_t ret = 0;
    VALIDATE_BLUFI(self, ESP_FAIL);
    periph_blufi_t *periph_blufi = esp_periph_get_data(self);
    ESP_ERROR_CHECK(esp_bt_controller_mem_release(ESP_BT_MODE_CLASSIC_BT));
    if (!periph_blufi->disable_auto_start) {
        return periph_blufi_start(self);
    }
    return ret;
}

static void _blufi_stop_service(void *pv) {
    periph_blufi_handle_t periph_blufi = (periph_blufi_handle_t)esp_periph_get_data(g_blufi);
    if(periph_blufi->is_stop) return;
    esp_blufi_profile_deinit();
    esp_bluedroid_disable();
    esp_bluedroid_deinit();
    esp_bt_controller_disable();
    esp_bt_controller_deinit();
    periph_blufi->is_stop = true;
    esp_periph_send_event(g_blufi, PERIPH_BLUFI_DISCONNECT, NULL, 0);
}

void _blufi_timer_handle(TimerHandle_t xTimer) {
    void *pv = pvTimerGetTimerID(xTimer);
    periph_blufi_handle_t periph_blufi = (periph_blufi_handle_t)esp_periph_get_data(g_blufi);
    if(!periph_blufi->is_started) {
        if(periph_blufi->stop_timer != NULL) xTimerStop(periph_blufi->stop_timer, portMAX_DELAY);
        return;
    }
    if(periph_blufi->request_stop) {
        if(esp_periph_tick_get() - periph_blufi->tick > 10000) {
            periph_blufi->tick = esp_periph_tick_get();
            ESP_LOGW(TAG, "Stop request...");
            _blufi_stop_service(pv);
            periph_blufi->is_started = false;
        }
    }
    else {
        if(esp_periph_tick_get() - periph_blufi->tick > periph_blufi->time_out) {
            periph_blufi->tick = esp_periph_tick_get();
            ESP_LOGW(TAG, "Timeout...");
            _blufi_stop_service(pv);
            periph_blufi->is_started = false;
        }
    }
}

esp_periph_handle_t periph_blufi_init(periph_blufi_cfg_t* blufi_cfg) {
    esp_periph_handle_t periph = esp_periph_create(PERIPH_ID_BLUFI, blufi_cfg->tag ? blufi_cfg->tag : "periph_blufi");
    PERIPH_MEM_CHECK(TAG, periph, return NULL);
    periph_blufi_t *periph_blufi = calloc(1, sizeof(periph_blufi_t));
    PERIPH_MEM_CHECK(TAG, periph_blufi, {
        free(periph);
        return NULL;
    });
    uint64_t dev_id = esp_periph_get_device_id_full();
    if (blufi_cfg->device_name) {
        periph_blufi->device_name = tct_render_id(blufi_cfg->device_name, dev_id);
    } else {
        periph_blufi->device_name = tct_render_id(BLUFI_DEFAULT_DEVICE_NAME, dev_id);;
    }
    PERIPH_MEM_CHECK(TAG, periph_blufi->device_name, {
        free(periph);
        return NULL;
    });
    periph_blufi->disable_auto_start = blufi_cfg->disable_auto_start;
    periph_blufi->time_out = (int64_t)blufi_cfg->time_out_interval_sec*1000;
    periph_blufi->is_stop = false;
    periph_blufi->request_stop = false;
    periph_blufi->evt_group = xEventGroupCreate();
    xEventGroupClearBits(periph_blufi->evt_group, STARTED_BIT | STOPPED_BIT);
    periph_blufi->stop_timer = xTimerCreate("blufi_timer", TIME_TICK / portTICK_RATE_MS, pdTRUE, NULL, _blufi_timer_handle);
    esp_periph_set_data(periph, periph_blufi);
    esp_periph_set_function(periph, _blufi_init, _blufi_run, _blufi_destroy);
    g_blufi = periph;
    return periph;
}

esp_err_t periph_blufi_start(esp_periph_handle_t periph) {
    VALIDATE_BLUFI(periph, ESP_FAIL);
    periph_blufi_t *periph_blufi = esp_periph_get_data(periph);
    xEventGroupClearBits(periph_blufi->evt_group, STARTED_BIT);
    esp_err_t ret;

    esp_bt_controller_config_t bt_cfg = BT_CONTROLLER_INIT_CONFIG_DEFAULT();
    ret = esp_bt_controller_init(&bt_cfg);
    if (ret) {
        ESP_LOGE(TAG, "%s initialize bt controller failed: %s\n", __func__, esp_err_to_name(ret));
    }
    ret = esp_bt_controller_enable(ESP_BT_MODE_BLE);
    if (ret) {
        ESP_LOGE(TAG, "%s enable bt controller failed: %s\n", __func__, esp_err_to_name(ret));
        return ret;
    }
    ret = esp_bluedroid_init();
    if (ret) {
        ESP_LOGE(TAG, "%s init bluedroid failed: %s\n", __func__, esp_err_to_name(ret));
        return ret;
    }
    ret = esp_bluedroid_enable();
    if (ret) {
        ESP_LOGE(TAG, "%s init bluedroid failed: %s\n", __func__, esp_err_to_name(ret));
        return ret;
    }
    ESP_LOGI(TAG, "BD ADDR: "ESP_BD_ADDR_STR"\n", ESP_BD_ADDR_HEX(esp_bt_dev_get_address()));
    ESP_LOGI(TAG, "BLUFI VERSION %04x\n", esp_blufi_get_version());
    ret = esp_ble_gap_register_callback(_blufi_gap_event_handler);
    if(ret){
        ESP_LOGE(TAG, "%s gap register failed, error code = %x\n", __func__, ret);
        return ret;
    }
    ret = esp_blufi_register_callbacks(&_blufi_callbacks);
    if(ret){
        ESP_LOGE(TAG, "%s blufi register failed, error code = %x\n", __func__, ret);
        return ret;
    }
    ret = esp_blufi_profile_init();
    if(ret){
        ESP_LOGE(TAG, "%s blufi profile init failed, error code = %x\n", __func__, ret);
        return ret;
    }
    periph_blufi->is_started = true;
    xTimerStart(periph_blufi->stop_timer, portMAX_DELAY);
    periph_blufi->tick = esp_periph_tick_get();
    return ESP_OK;
}

esp_err_t periph_blufi_stop(esp_periph_handle_t periph) {
    VALIDATE_BLUFI(periph, ESP_FAIL);
    periph_blufi_t *periph_blufi = esp_periph_get_data(periph);
    xEventGroupClearBits(periph_blufi->evt_group, STOPPED_BIT);
    periph_blufi->request_stop = true;
    if((xEventGroupWaitBits(periph_blufi->evt_group, STOPPED_BIT, false, true, 30000/portTICK_RATE_MS) & STOPPED_BIT) == 0) {
        ESP_LOGE(TAG, "blufi stop fail");
    }
    ESP_LOGW(TAG, "blufi stop request...");
    /* periph_blufi->is_started = false;
    xTimerStart(periph_blufi->stop_timer, portMAX_DELAY);
    return esp_bt_controller_deinit(); */
    // return esp_bt_controller_mem_release(ESP_BT_MODE_BLE);
    return ESP_OK;
}

esp_err_t periph_blufi_response_custom_data(uint8_t *data, uint32_t data_len) {
    return esp_blufi_send_custom_data(data, data_len);
}

esp_err_t periph_blufi_report_wifi_sta_status(esp_periph_handle_t periph) {
    VALIDATE_BLUFI(periph, ESP_FAIL);
    periph_blufi_t *periph_blufi = esp_periph_get_data(periph);
    if (!periph_blufi->is_started) {
        return ESP_FAIL;
    }
    wifi_mode_t mode;
    esp_blufi_extra_info_t info;
    esp_wifi_get_mode(&mode);
    if (_is_connected()) {
        memset(&info, 0, sizeof(esp_blufi_extra_info_t));
        esp_wifi_get_config(WIFI_IF_STA, &sta_config);

        memcpy(info.sta_bssid, sta_config.sta.bssid, 6);
        info.sta_bssid_set = true;
        info.sta_ssid = sta_config.sta.ssid;
        info.sta_ssid_len = strlen((char *)sta_config.sta.ssid);
        esp_blufi_send_wifi_conn_report(mode, ESP_BLUFI_STA_CONN_SUCCESS, 0, &info);
    } else {
        esp_blufi_send_wifi_conn_report(mode, ESP_BLUFI_STA_CONN_FAIL, 0, NULL);
    }
    return ESP_OK;
}

#endif
