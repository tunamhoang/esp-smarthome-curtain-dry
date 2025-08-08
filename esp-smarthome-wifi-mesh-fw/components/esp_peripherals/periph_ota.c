/*
 * This file is subject to the terms of the Nanochip License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *                             ./LICENSE
 */
#include "periph_ota.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "button.h"
#include "esp_http_client.h"
#include "esp_log.h"
#include "esp_ota_ops.h"
#include "esp_system.h"
#include "freertos/FreeRTOS.h"
#include "freertos/queue.h"
#include "freertos/task.h"
#include "soc/rtc_cntl_reg.h"
#include "soc/sens_reg.h"
#include "soc/soc.h"
#include "tct_template.h"

static const char *TAG = "PERIPH_OTA";

#define VALIDATE_OTA(periph, ret)                                  \
    if (!esp_periph_validate(periph, PERIPH_ID_OTA)) {             \
        ESP_LOGE(TAG, "Invalid OTA periph, at line %d", __LINE__); \
        return ret;                                                \
    }
#define OTA_BUFFSIZE           1024
#define OTA_CHECK_DELAY_SEC    (10)
#define OTA_NETWORK_TIMEOUT_MS (60 * 1000)
#define DEFAULT_OTA_TASK_STACK (5 * 1024)

typedef struct {
    char *uri;
    char *update_template;
    char *token;
    char *version;
    char *model;
    int   update_interval_in_seconds;
    int   tick;
    bool  updating;
    bool  disable_storage;
    bool  disable_auto_ota;
    int   enable_random_delay;
    int   random_delay_tick;
    bool  disable_acquire_connection;
} periph_ota_t;

typedef enum {
    OTA_CMD_UNKNOWN,
    OTA_CMD_UPDATE,
} periph_ota_cmd_id_t;

static void _ota_task(void *pv) {
    esp_periph_handle_t      periph = (esp_periph_handle_t)pv;
    periph_ota_t            *ota = esp_periph_get_data(periph);
    char                    *ota_write_data = NULL;
    esp_http_client_handle_t client = NULL;
    const esp_partition_t   *configured = esp_ota_get_boot_partition();
    const esp_partition_t   *running = esp_ota_get_running_partition();
    char                    *ota_uri = NULL;

    if (ota->updating) {
        ESP_LOGW(TAG, "OTA processing...");
        goto _exit_ota_task;
    }

    ota->updating = true;

    if (ota->enable_random_delay == 1 && ota->random_delay_tick == 0) {
        int delay_ms = esp_random();
        delay_ms = delay_ms < 0 ? -delay_ms : delay_ms;
        delay_ms += 2000;
        delay_ms %= 10000;
        ota->random_delay_tick = esp_periph_tick_get() + ota->random_delay_tick;
        ESP_LOGD(TAG, "random delay (%d) ms before check OTA", delay_ms);

    } else if (ota->enable_random_delay > 1 && ota->random_delay_tick == 0) {
        ESP_LOGD(TAG, "delay (%d) ms before check OTA", ota->enable_random_delay);
        ota->random_delay_tick = esp_periph_tick_get() + ota->enable_random_delay;
    }

    if (ota->random_delay_tick && esp_periph_tick_get() - ota->random_delay_tick < 0) {
        ota->random_delay_tick = 0;
        goto _exit_ota_task;
    }
    ota->random_delay_tick = 0;

    esp_periph_send_event(periph, OTA_STATUS_UPDATE_PREPARE, NULL, 0);

    if (configured != running) {
        ESP_LOGW(TAG, "Configured OTA boot partition at offset 0x%08lx, but running from offset 0x%08lx", configured->address, running->address);
        ESP_LOGW(TAG, "(This can happen if either the OTA boot data or preferred boot image become corrupted somehow.)");
    }
    ESP_LOGD(TAG, "Running partition type %d subtype %d (offset 0x%08lx)", running->type, running->subtype, running->address);

    if (ota->uri == NULL || ota->version == NULL || ota->update_template == NULL || ota->token == NULL) {
        ESP_LOGE(TAG, "Invalid OTA configuration");
        goto _exit_ota_task;
    }

    // if (ota->token[0] == 0) {
    //     ESP_LOGW(TAG, "Invalid update token");
    //     esp_periph_send_event(periph, OTA_STATUS_INVALID_TOKEN, NULL, 0);
    //     goto _exit_ota_task;
    // }
    tct_arguments *args = NULL;
    uint64_t       dev_id = esp_periph_get_device_id_full();

    tct_add_argument(args, "uri", "%s", ota->uri);
    tct_add_argument(args, "token", "%s", ota->token);
    tct_add_argument(args, "id", "%06llX", (dev_id >> 8) & 0xFFFFFF);
    tct_add_argument(args, "xid", "%08llX", dev_id & 0xFFFFFFFF);
    tct_add_argument(args, "version", "%s", ota->version);
    tct_add_argument(args, "model", "%s", ota->model);

    ota_uri = tct_render((char *)ota->update_template, args);  // str_replace((char*)ota_cfg->uri, "${id}", dev_id_hex);
    tct_free_argument(args);
    if (ota_uri == NULL) {
        ESP_LOGE(TAG, "Cannot generate OTA update URL");
        goto _exit_ota_task;
    }

    ESP_LOGD(TAG, "OTA URI=%s", ota_uri);

    esp_http_client_config_t http_cfg = {
        .url = ota_uri,
        .user_data = &ota,
        .timeout_ms = 30 * 1000,
        .buffer_size = 1024,
    };

    if (!ota->disable_acquire_connection) {
        if (esp_periph_acquire_connection(OTA_NETWORK_TIMEOUT_MS / portTICK_RATE_MS) != ESP_OK) {
            ESP_LOGW(TAG, "OTA Accquite connection timeout");
            goto _exit_ota_task;
        }
    }

    client = esp_http_client_init(&http_cfg);
    PERIPH_MEM_CHECK(TAG, client, goto _exit_ota_task);
    // esp_http_client_set_header(client, "Accept", "application/octet-stream");

    esp_err_t err = esp_http_client_open(client, 0);

    if (err != ESP_OK) {
        ESP_LOGE(TAG, "error open the http connection");
        goto _exit_ota_task;
    }
    int content_length = esp_http_client_fetch_headers(client);

    ESP_LOGD(TAG, "Status = %d, content_length = %lld", esp_http_client_get_status_code(client), esp_http_client_get_content_length(client));

    if (esp_http_client_get_status_code(client) == 304) {
        ESP_LOGW(TAG, "There are no new firmware, mem=%ld", esp_get_free_heap_size());
        ota->tick = 0;
        goto _exit_ota_with_success;
    }
    // reset ota timer
    int status;
    if ((status = esp_http_client_get_status_code(client)) != 200) {
        if (status == 498) {
            ESP_LOGW(TAG, "Invalid ota token");
            esp_periph_send_event(periph, OTA_STATUS_INVALID_TOKEN, NULL, 0);
        }
        goto _exit_ota_task;
    }
    esp_periph_send_event(periph, OTA_STATUS_UPDATE_BEGIN, (void *)content_length, 0);

    esp_ota_handle_t       update_handle = 0;
    const esp_partition_t *update_partition = esp_ota_get_next_update_partition(NULL);
    ESP_LOGD(TAG, "Writing to partition subtype %d at offset 0x%lx", update_partition->subtype, update_partition->address);

    err = esp_ota_begin(update_partition, OTA_SIZE_UNKNOWN, &update_handle);
    if (err != ESP_OK) {
        ESP_LOGE(TAG, "esp_ota_begin failed (%d)", (err));
        goto _exit_ota_task;
    }
    ota_write_data = calloc(1, OTA_BUFFSIZE);
    PERIPH_MEM_CHECK(TAG, ota_write_data, goto _exit_ota_task);
    int total_read_len = 0;
    while (total_read_len < content_length) {
        int read_len = esp_http_client_read(client, ota_write_data, OTA_BUFFSIZE);
        if (read_len <= 0) {
            goto _exit_ota_task;
        }
        err = esp_ota_write(update_handle, (const void *)ota_write_data, read_len);
        if (err != ESP_OK) {
            ESP_LOGE(TAG, "Error: esp_ota_write failed (%d)!", (err));
            goto _exit_ota_task;
        }
        ESP_LOGD(TAG, "Writing... %d/%d", total_read_len, content_length);
        total_read_len += read_len;
        esp_periph_send_event(periph, OTA_STATUS_UPDATE_PROCESS, (void *)total_read_len, 0);
    }

    ESP_LOGI(TAG, "Total Write binary data length : %d", total_read_len);
    if (esp_ota_end(update_handle) != ESP_OK) {
        ESP_LOGE(TAG, "esp_ota_end failed!");
        goto _exit_ota_task;
    }
    err = esp_ota_set_boot_partition(update_partition);
    if (err != ESP_OK) {
        ESP_LOGE(TAG, "esp_ota_set_boot_partition failed (%d)!", (err));
        goto _exit_ota_task;
    }
    ESP_LOGI(TAG, "Prepare to restart system!");
    esp_periph_send_event(periph, OTA_STATUS_UPDATE_FINISH, NULL, 0);

_exit_ota_task:
    ota->tick = ota->update_interval_in_seconds - OTA_CHECK_DELAY_SEC;
    ota->tick = ota->tick < 0 ? 0 : ota->tick;
_exit_ota_with_success:
    ESP_LOGD(TAG, "Destroying task ...");
    if (client) {
        esp_periph_release_connection();
    }
    // esp_periph_send_event(periph, OTA_STATUS_UPDATE_ERROR, NULL, 0);
    esp_http_client_cleanup(client);
    free(ota_write_data);
    free(ota_uri);
    ota->updating = false;
    esp_periph_send_event(periph, OTA_STATUS_UPDATE_EXIT, NULL, 0);
    vTaskDelete(NULL);
}

static void ota_timer_handler(TimerHandle_t tmr) {
    esp_periph_handle_t periph = (esp_periph_handle_t)pvTimerGetTimerID(tmr);
    periph_ota_t       *periph_ota = esp_periph_get_data(periph);
    periph_ota->tick++;

    if (periph_ota->disable_auto_ota) {
        return;
    }
    ESP_LOGI(TAG, "Tick = %d/%d, freemem=%ld", periph_ota->tick, periph_ota->update_interval_in_seconds, esp_get_free_heap_size());
    if (periph_ota->tick >= periph_ota->update_interval_in_seconds && !periph_ota->updating) {
        esp_periph_send_cmd(periph, OTA_CMD_UPDATE, NULL, 0);
    }
}

static esp_err_t _ota_init(esp_periph_handle_t self) {
    // int ret = 0;
    VALIDATE_OTA(self, ESP_FAIL);
    periph_ota_t *periph_ota = esp_periph_get_data(self);
    if (!periph_ota->disable_storage) {
        esp_periph_load_config(self);
    }

    esp_periph_start_timer(self, 1000 / portTICK_RATE_MS, ota_timer_handler);
    // First check
    periph_ota->tick = periph_ota->update_interval_in_seconds;
    periph_ota->tick = periph_ota->tick < 0 ? 0 : periph_ota->tick;
    // esp_periph_send_cmd(self, OTA_CMD_UPDATE, NULL, 0);
    return ESP_OK;
}

static esp_err_t _ota_run(esp_periph_handle_t self, audio_event_iface_msg_t *msg) {
    if (msg->cmd != OTA_CMD_UPDATE) {
        return ESP_OK;
    }
    if (!esp_periph_is_network_available()) {
        return ESP_OK;
    }
    periph_ota_t *periph_ota = esp_periph_get_data(self);
    if (!periph_ota->updating) {
        ESP_LOGD(TAG, "Creating task ...");
        if (xTaskCreate(_ota_task, "ota_task", DEFAULT_OTA_TASK_STACK, (void *)self, 5, NULL) != pdTRUE) {
            ESP_LOGE(TAG, "Error create ota_task");
            return ESP_OK;
        }
    }
    return ESP_OK;
}

static esp_err_t _ota_destroy(esp_periph_handle_t self) {
    periph_ota_t *periph_ota = esp_periph_get_data(self);
    free(periph_ota);
    return ESP_OK;
}

static esp_err_t _ota_config_unpack(void *context, char *buffer, int loaded_len) {
    esp_periph_handle_t self = context;
    periph_ota_t       *periph_ota = esp_periph_get_data(self);
    if (loaded_len < sizeof(periph_ota_storage_t)) {
        ESP_LOGE(TAG, "Invalid storage size");
        return ESP_FAIL;
    }
    periph_ota_storage_t *storate = (periph_ota_storage_t *)buffer;
    if (periph_ota->uri) {
        free(periph_ota->uri);
    }
    periph_ota->uri = strdup(storate->uri);
    PERIPH_MEM_CHECK(TAG, periph_ota->uri, return ESP_ERR_NO_MEM);
    periph_ota->update_interval_in_seconds = storate->update_interval_in_seconds;
    return ESP_OK;
}

static int _ota_config_pack(void *context, char *buffer, int max_buffer_size) {
    esp_periph_handle_t self = context;
    periph_ota_t       *periph_ota = esp_periph_get_data(self);
    if (max_buffer_size < sizeof(periph_ota_storage_t)) {
        ESP_LOGE(TAG, "Invalid storage size");
        return ESP_FAIL;
    }
    periph_ota_storage_t *storate = (periph_ota_storage_t *)buffer;
    memset(storate, 0, sizeof(periph_ota_storage_t));
    strcpy(storate->uri, periph_ota->uri);
    storate->update_interval_in_seconds = periph_ota->update_interval_in_seconds;
    return sizeof(periph_ota_storage_t);
}

esp_periph_handle_t periph_ota_init(periph_ota_cfg_t *ota_cfg) {
    esp_periph_handle_t periph = esp_periph_create(PERIPH_ID_OTA, ota_cfg->tag ? ota_cfg->tag : "periph_ota");
    PERIPH_MEM_CHECK(TAG, periph, return NULL);

    if (ota_cfg->version == NULL || ota_cfg->update_template == NULL) {
        ESP_LOGE(TAG, "Invalid argument");
        return NULL;
    }

    periph_ota_t *periph_ota = calloc(1, sizeof(periph_ota_t));
    PERIPH_MEM_CHECK(TAG, periph_ota, {
        free(periph);
        return NULL;
    });

    periph_ota->update_interval_in_seconds = ota_cfg->update_interval_in_seconds;
    periph_ota->disable_storage = ota_cfg->disable_storage;
    periph_ota->enable_random_delay = ota_cfg->enable_random_delay;
    periph_ota->disable_auto_ota = ota_cfg->disable_auto_ota;
    periph_ota->disable_acquire_connection = ota_cfg->disable_acquire_connection;

    periph_ota->uri = ota_cfg->uri ? strdup(ota_cfg->uri) : strdup("");
    PERIPH_MEM_CHECK(TAG, periph_ota->uri, goto _ota_init_fail);
    periph_ota->update_template = strdup(ota_cfg->update_template);
    PERIPH_MEM_CHECK(TAG, periph_ota->uri, goto _ota_init_fail);
    if (ota_cfg->token) {
        periph_ota->token = strdup(ota_cfg->token);
    } else {
        periph_ota->token = strdup("");
    }

    PERIPH_MEM_CHECK(TAG, periph_ota->token, goto _ota_init_fail);

    if (ota_cfg->model) {
        periph_ota->model = strdup(ota_cfg->model);
    } else {
        periph_ota->model = strdup("");
    }
    PERIPH_MEM_CHECK(TAG, periph_ota->model, goto _ota_init_fail);
    if (ota_cfg->version == NULL) {
        goto _ota_init_fail;
    }
    periph_ota->version = strdup(ota_cfg->version);
    PERIPH_MEM_CHECK(TAG, periph_ota->version, goto _ota_init_fail);

    esp_periph_set_data(periph, periph_ota);
    esp_periph_set_function(periph, _ota_init, _ota_run, _ota_destroy);
    if (!periph_ota->disable_storage) {
        esp_periph_set_config_func(periph, _ota_config_unpack, _ota_config_pack);
    }
    return periph;
_ota_init_fail:
    ESP_LOGE(TAG, "Failed to initial OTA");
    free(periph_ota->uri);
    free(periph_ota->update_template);
    free(periph_ota->token);
    free(periph_ota->version);
    free(periph_ota->model);
    free(periph);
    return NULL;
}

esp_err_t periph_ota_force_update(esp_periph_handle_t periph) {
    VALIDATE_OTA(periph, ESP_ERR_INVALID_ARG);
    periph_ota_t *periph_ota = esp_periph_get_data(periph);
    periph_ota->tick = periph_ota->update_interval_in_seconds;
    periph_ota->enable_random_delay = 0;
    esp_periph_send_cmd(periph, OTA_CMD_UPDATE, NULL, 0);
    return ESP_OK;
}

esp_err_t periph_ota_set_token(esp_periph_handle_t periph, const char *token) {
    VALIDATE_OTA(periph, ESP_ERR_INVALID_ARG);
    periph_ota_t *periph_ota = esp_periph_get_data(periph);
    free(periph_ota->token);
    if (token == NULL) {
        periph_ota->token = strdup("");
        return ESP_OK;
    } else {
        periph_ota->token = strdup(token);
        if (!periph_ota->disable_auto_ota) {
            return periph_ota_force_update(periph);
        }
        return ESP_OK;
    }
    return ESP_OK;
}

esp_err_t periph_ota_set_config(esp_periph_handle_t periph, const periph_ota_storage_t *storage) {
    periph_ota_t *periph_ota = esp_periph_get_data(periph);
    if (periph_ota->uri && strlen(storage->uri)) {
        free(periph_ota->uri);
        periph_ota->uri = strdup(storage->uri);
        PERIPH_MEM_CHECK(TAG, periph_ota->uri, return ESP_ERR_NO_MEM);
    }
    periph_ota->update_interval_in_seconds = storage->update_interval_in_seconds;
    return esp_periph_save_config(periph);
}

esp_err_t periph_ota_get_config(esp_periph_handle_t periph, periph_ota_storage_t *storage) {
    periph_ota_t *periph_ota = esp_periph_get_data(periph);
    esp_err_t     err = esp_periph_load_config(periph);
    if (err != ESP_OK) {
        return err;
    }
    memset(storage, 0, sizeof(periph_ota_storage_t));
    strcpy(storage->uri, periph_ota->uri);
    storage->update_interval_in_seconds = periph_ota->update_interval_in_seconds;
    return ESP_OK;
}

esp_err_t periph_ota_set_uri(esp_periph_handle_t periph, const char *uri) {
    VALIDATE_OTA(periph, ESP_ERR_INVALID_ARG);
    periph_ota_t *periph_ota = esp_periph_get_data(periph);
    if (periph_ota->uri && uri) {
        free(periph_ota->uri);
        periph_ota->uri = strdup(uri);
        PERIPH_MEM_CHECK(TAG, periph_ota->uri, return ESP_ERR_NO_MEM);
    }
    return ESP_OK;
}
