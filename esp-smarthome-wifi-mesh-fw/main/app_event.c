#include "app_event.h"
#include "app_utility.h"
#include "esp_log.h"
#include "json_utils.h"
#include "periph_wifi.h"
#include "esp_netif.h"

#define TAG     "APP_EVENT"

typedef struct app_event_ {
    esp_periph_handle_t monitor_handle;
    esp_periph_handle_t mesh_handle;
    esp_periph_handle_t bluefi_handle;
} app_event_t;

static esp_err_t app_event_blufi(app_event_handle_t event_handle, audio_event_iface_msg_t *event, void *context);
static esp_err_t app_event_ota(app_event_handle_t event_handle, audio_event_iface_msg_t *event, void *context);
static esp_err_t app_event_monitor(app_event_handle_t event_handle, audio_event_iface_msg_t *event, void *context);

char *get_json_status(const char *template, ...) {
    tct_arguments *args = NULL;
    esp_netif_t        *netif = esp_netif_get_default_netif();
    esp_netif_ip_info_t ip;
    esp_netif_get_ip_info(netif, &ip);
    uint64_t dev_id = esp_periph_get_device_id();

    tct_add_argument(args, "ssid", "%s", sys_cfg.wifi_sta_ssid);
    tct_add_argument(args, "ip", "%s", ip4addr_ntoa((ip4_addr_t *)&ip.ip));
    tct_add_argument(args, "password", "%s", sys_cfg.wifi_sta_pass);
    tct_add_argument(args, "id", "%06llX", dev_id);
    tct_add_argument(args, "rssi", "%d", "");

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

app_event_handle_t app_event_init(app_event_config_t event_config) {
    app_event_handle_t event_handle = malloc(sizeof(struct app_event_));
    event_handle->monitor_handle = event_config.monitor_handle;
    event_handle->mesh_handle = event_config.mesh_handle;
    event_handle->bluefi_handle = event_config.bluefi_handle;
    return event_handle;
}

esp_err_t app_event_callback(app_event_handle_t event_handle, audio_event_iface_msg_t *event, void *context) {
    if (event_handle == NULL) {
        return ESP_FAIL;
    }
    app_event_blufi(event_handle, event, context);
    app_event_ota(event_handle, event, context);
    app_event_monitor(event_handle, event, context);

    return ESP_OK;
}

static esp_err_t app_event_ota(app_event_handle_t event_handle, audio_event_iface_msg_t *event, void *context) {
    if (event->source_type != PERIPH_ID_OTA) {
        return ESP_OK;
    }

    if (event->cmd == OTA_STATUS_UPDATE_PREPARE) {
        LOGW(TAG, "OTA_STATUS_UPDATE_PREPARE");
        return periph_mesh_stop(event_handle->mesh_handle, MAX_TIME_WAITING_OTA_MS / portTICK_PERIOD_MS);
    }

    if (event->cmd == OTA_STATUS_UPDATE_EXIT) {
        ESP_LOGD(TAG, "OTA_STATUS_UPDATE_EXIT");
        vTaskDelay(1000 / portTICK_RATE_MS);
        esp_restart();
        return ESP_OK;
    }
    if (event->cmd == OTA_STATUS_UPDATE_BEGIN) {
        ESP_LOGD(TAG, "OTA Begin");
        return ESP_OK;
    }
    if (event->cmd == OTA_STATUS_INVALID_TOKEN) {
        ESP_LOGD(TAG, "Invalid token, clear storage, clear periph_api device_token, reg again");
        return ESP_OK;
    }
    if (event->cmd == OTA_STATUS_UPDATE_PROCESS) {
        ESP_LOGD(TAG, "OTA downloading %d bytes", (int)event->data);
        return ESP_OK;
    }
    if (event->cmd == OTA_STATUS_UPDATE_FINISH) {
        ESP_LOGD(TAG, "OTA Finish");
        vTaskDelay(1000 / portTICK_RATE_MS);
        esp_restart();
        return ESP_OK;
    }
    return ESP_OK;
}

static esp_err_t app_event_blufi(app_event_handle_t event_handle, audio_event_iface_msg_t *event, void *context) {
    char *blufi_data = event->data;
    char *cmd = NULL, *ssid = NULL, *password = NULL, *access_id = NULL, *access_key = NULL, *response = NULL;
    char *gpio = NULL;
    const char *response_data = "{\"cmd\":\"%s\", \"data\":\"%s\"}";

    if (event->source_type != PERIPH_ID_BLUFI) {
        return ESP_OK;
    }

    if (event->cmd == PERIPH_BLUFI_WIFI_STA_INFO) {
        wifi_config_t *sta_config = event->data;
        ESP_LOGD(TAG, "BLUFI ssid=%s, pass=%s", sta_config->sta.ssid, sta_config->sta.password);
        return ESP_OK;
    }
    if (event->cmd == PERIPH_BLUFI_DEINIT_FINISH) {
        periph_mesh_start(event_handle->mesh_handle);
        return ESP_OK;
    }
    if (event->cmd != PERIPH_BLUFI_CUSTOM_DATA) {
        return ESP_OK;
    }
    // GET STATUS
    if (event->data_len == 0) {
        response = get_json_status(
                       "{\"cmd\": \"read_data\", \"ssid\":\"${ssid}\", \"ip\":\"${ip}\", \"hw_id\": \""MODEL_NAME"-${id}\","\
                       " \"model\":\"${0}\", \"access_id\": \"${1}\", \"access_key\": \"${2}\","
                       " \"fw_version\":\""FIRMWARE_VERSION"\","\
                       " \"hw_version\": \"${3}\", \"rssi\": ${rssi}}",
                       sys_cfg.model,
                       sys_cfg.device_access_id,
                       sys_cfg.device_access_key,
                       sys_cfg.hw_version,
                       NULL);
        LOGW(TAG, "Send response: %s", response);
        periph_blufi_response_custom_data((uint8_t *)response, strlen(response));

        goto _exit_blufi_cmd;
    }
    blufi_data[event->data_len] = 0;
    LOGI(TAG, "BLUFI: %s", (char *)blufi_data);


    if (json_parser(blufi_data,
                    "cmd", &cmd,
                    "ssid", &ssid,
                    "password", &password,
                    "access_id", &access_id,
                    "access_key", &access_key,
                    "gpio", &gpio, NULL) != 0) {
        LOGE(TAG, "Error parse JSON DATA");
        return ESP_OK;
    }
    if (cmd == NULL) {
        return ESP_OK;
    }

    LOGI(TAG, "cmd = %s", cmd);
    // BEEP(80, 80, false, 6);
    // CMD REBOOT
    if (strcmp(cmd, "reboot") == 0) {
        LOGW(TAG, "device will reboot after 1 second");
        // if (_reboot_timer == NULL) {
        //     _reboot_timer = xTimerCreate("reboot_timer", 1 * 1000 / portTICK_RATE_MS, pdTRUE, NULL, _reboot_timeout);
        //     xTimerStart(_reboot_timer, portMAX_DELAY);
        // }
        int resp_len = asprintf(&response, response_data, "reboot", "success");
        periph_blufi_response_custom_data((uint8_t *)response, resp_len);
        goto _exit_blufi_cmd;
    }

    if (strcmp(cmd, "exit_config") == 0) {
        int resp_len = asprintf(&response, response_data, "exit_config", "success");
        periph_blufi_response_custom_data((uint8_t *)response, resp_len);
        LOGI(TAG, "process exit config mode");
        // periph_monitor_exit_config_mode(event_handle->monitor_handle);
        set_reboot_timer(1000);
        goto _exit_blufi_cmd;
    }

    if (strcmp(cmd, "restore_default") == 0) {
        LOGW(TAG, "restore_default");
        int resp_len = asprintf(&response, response_data, "restore_default", "success");
        periph_blufi_response_custom_data((uint8_t *)response, resp_len);
        // periph_monitor_restore_default(event_handle->monitor_handle);
        goto _exit_blufi_cmd;
    }

    // CMD GET STATUS
    if (strcmp(cmd, "read_data") == 0) {
        response = get_json_status(
                       "{\"cmd\": \"read_data\", \"ssid\":\"${ssid}\", \"ip\":\"${ip}\", \"hw_id\": \""MODEL_NAME"-${id}\","\
                       " \"model\":\"${0}\", \"access_id\": \"${1}\", \"access_key\": \"${2}\","
                       "\"device_token\":\"${3}\","
                       " \"fw_version\":\""FIRMWARE_VERSION"\","\
                       " \"hw_version\": \"${4}\", \"mode\": \"${5}\", \"rssi\": ${rssi}}",
                       sys_cfg.model,
                       sys_cfg.device_access_id,
                       sys_cfg.device_access_key,
                       sys_cfg.device_token,
                       sys_cfg.hw_version,
#ifdef CONFIG_DEVELOPMENT_MODE
                        "develop",
#else
                        "production",
#endif
                       NULL);
        LOGI(TAG, "Read data: %s", response);
        periph_blufi_response_custom_data((uint8_t *)response, strlen(response));
        periph_monitor_blink_status(event_handle->monitor_handle, 100, 4);
        goto _exit_blufi_cmd;
    }


    // CMD WRITE DATA
    if (strcmp(cmd, "write_data") == 0) {
        // ssid = json_get_token_value(blufi_data, "ssid");
        // password = json_get_token_value(blufi_data, "password");
        // access_id = json_get_token_value(blufi_data, "access_id");
        // access_key = json_get_token_value(blufi_data, "access_key");

        if (ssid) {
            LOGI(TAG, "set new router");
            periph_mesh_set_router(event_handle->mesh_handle, ssid, password, 1);
            // esp_blufi_send_wifi_conn_report(mode, ESP_BLUFI_STA_CONN_SUCCESS, 0, NULL);
        }
        if (ssid) {
            strncpy(sys_cfg.wifi_sta_ssid, ssid, MAX_TOKEN_SIZE);
        }
        if (password) {
            strncpy(sys_cfg.wifi_sta_pass, password, MAX_TOKEN_SIZE);
        }
        if (access_id && access_key && access_id[0] != 0 && access_key[0] != 0) {
            periph_mesh_set_auth_token(event_handle->mesh_handle, access_id, access_key);
            if (strcmp(sys_cfg.device_access_key, access_key) != 0) {
                cfg_reset_user_setting();
            }
            strncpy(sys_cfg.device_access_id, access_id, MAX_TOKEN_SIZE);
            strncpy(sys_cfg.device_access_key, access_key, MAX_TOKEN_SIZE);
            response = get_json_status(
                           "{\"cmd\": \"read_data\", \"ssid\":\"${ssid}\", \"ip\":\"${ip}\", \"hw_id\": \""MODEL_NAME"-${id}\","\
                           " \"model\":\"${0}\", \"access_id\": \"${1}\", \"access_key\": \"${2}\", \"rssi\": ${rssi}}",
                           sys_cfg.model,
                           sys_cfg.device_access_id,
                           sys_cfg.device_access_key,
                           NULL);
            LOGI(TAG, "Write data: %s", response);
            periph_blufi_response_custom_data((uint8_t *)response, strlen(response));
        }
        cfg_save();
        // storage_save();
        // is_request_connect_from_blufi = true;
        goto _exit_blufi_cmd;
    }

    if (strcmp(cmd, "toggle_gpio") == 0) {
        // gpio = json_get_token_value(blufi_data, "gpio");
        if (gpio) {
            int gpio_idx = atoi(gpio);
            int resp_len = 0;
            // if (gpio_idx >= g_storage.touch_pad_num) {
            //     resp_len = asprintf(&response, response_data, "toggle_gpio", "failed");
            //     periph_blufi_response_custom_data((uint8_t*)response, resp_len);
            //     goto _exit_blufi_cmd;
            // }
            LOGW(TAG, "Toggle gpio %d", gpio_idx);
            // periph_monitor_set_touch_state(monitor_handle, gpio_idx, g_storage_io_map[gpio_idx].state ^ 1);
            resp_len = asprintf(&response, response_data, "toggle_gpio", "success");
            periph_blufi_response_custom_data((uint8_t *)response, resp_len);
            goto _exit_blufi_cmd;
        }
    }

    if (strcmp(cmd, "force_update") == 0) {
        // periph_ota_force_update(ota_handle);
        LOGW(TAG, "force_update");
        int resp_len = asprintf(&response, response_data, "force_update", "success");
        periph_blufi_response_custom_data((uint8_t *)response, resp_len);
        goto _exit_blufi_cmd;
    }

    if (event->cmd == PERIPH_BLUFI_CONNECT) {
        periph_monitor_blink_status(event_handle->monitor_handle, 100, 4);
        return ESP_OK;
    }
    return ESP_OK;
_exit_blufi_cmd:
    free(cmd);
    free(response);
    free(access_id);
    free(access_key);
    free(ssid);
    free(password);
    free(gpio);
    free(event->data);
    return ESP_OK;
}

static esp_err_t app_event_monitor(app_event_handle_t event_handle, audio_event_iface_msg_t *event, void *context) {
    if (event->source_type != PERIPH_ID_MONITOR) {
        return ESP_OK;
    }
    if (event->cmd == MONITOR_ENTER_CONFIG_MODE) {
        LOGE(TAG, "MONITOR_ENTER_CONFIG_MODE");
        periph_mesh_stop(event_handle->mesh_handle, portMAX_DELAY);
        periph_blufi_start(event_handle->bluefi_handle);
    }

    if (event->cmd == MONITOR_EVENT_RESTART) {
        periph_blufi_stop(event_handle->bluefi_handle);
        LOGE(TAG, "RESTART");
        //periph_mesh_start(event_handle->mesh_handle);
    }

    if (event->cmd == MONITOR_EXIT_CONFIG_MODE) {
        LOGE(TAG, "MONITOR_EXIT_CONFIG_MODE");
        periph_blufi_stop(event_handle->bluefi_handle);
        //vTaskDelay(2000/portTICK_RATE_MS);
        //periph_mesh_start(event_handle->mesh_handle);
    }

    if (event->cmd == MONITOR_TOGGLE_JOINING_GW) {
        periph_mesh_set_router(event_handle->mesh_handle, NULL, NULL, 1);
        periph_monitor_exit_config_mode(event_handle->monitor_handle);
    }

    return ESP_OK;
}
