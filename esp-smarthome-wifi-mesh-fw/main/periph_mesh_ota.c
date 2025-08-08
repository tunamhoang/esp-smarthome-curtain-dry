/*
 * This file is subject to the terms of the SunshineTech License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *
 *              ./LICENSE
 */
#include "periph_mesh_ota.h"
#include "esp_ota_ops.h"

struct ota_state {
    bool is_begin;
    int  ota_tick;
    int  last_idx;
    char *device_id;
    esp_ota_handle_t update_handle;
};

static const char *TAG = "OTA";

ota_state_handle_t periph_mesh_ota_init()
{
    ota_state_handle_t ota = calloc(1, sizeof(struct ota_state));
    return ota;
}

esp_err_t periph_mesh_ota_process(esp_periph_handle_t mesh_handle, ota_state_handle_t ota, DownloadFirmwareOnChangedDeviceServerResponse *download)
{
    esp_err_t err = ESP_FAIL;
    StatusCode status = STATUS_CODE__INIT;
    ProgressUpdateFirmwareOnChangedDeviceClientResponse response = PROGRESS_UPDATE_FIRMWARE_ON_CHANGED_DEVICE_CLIENT_RESPONSE__INIT;
    OnChangedClientMessage onChange = ON_CHANGED_CLIENT_MESSAGE__INIT;
    ClientMessage client = CLIENT_MESSAGE__INIT;
    MainMessage mainResponse = MAIN_MESSAGE__INIT;

    mainResponse.clientmessage = &client;
    client.onchangedclientmessage = &onChange;
    onChange.progressupdatefirmwareonchangeddeviceclientresponse = &response;
    response.statuscode = &status;

    status.code = 0;

    ESP_LOGD(TAG, "devid=%s, hwid=%s, size=%ld, pagesz=%ld, pageindex=%ld, totalpage=%ld",
             download->deviceid,
             download->hardwareid,
             download->datasize,
             download->pagesize,
             download->pageindex,
             download->totalpage);
    ESP_LOGI(TAG, "OTA Progress %ld/%ld", download->pageindex + 1, download->totalpage);

    const esp_partition_t *update_partition = esp_ota_get_next_update_partition(NULL);

    response.deviceid = download->deviceid;
    response.hardwareid = download->hardwareid;
    response.pagesize = download->pagesize;
    response.pageindex = download->pageindex;
    response.totalpage = download->totalpage;

    if (download->pageindex == 0 && ota->is_begin && ota->update_handle) {
        esp_ota_end(ota->update_handle);
        ota->is_begin = false;
        ota->update_handle = 0;
        ESP_LOGW(TAG, "last ota failed");
    }

    if (download->pageindex == 0 && !ota->is_begin) {
        ESP_LOGI(TAG, "Writing to partition subtype %d at offset 0x%lx", update_partition->subtype, update_partition->address);

        err = esp_ota_begin(update_partition, OTA_SIZE_UNKNOWN, &ota->update_handle);
        if (err != ESP_OK) {
            ESP_LOGE(TAG, "esp_ota_begin failed (%d)", (err));
            goto _exit_ota_task;
        }
        ota->is_begin = true;
        ota->last_idx = -1;
    }


    if (ota->is_begin && (ota->last_idx + 1) == download->pageindex) {
        err = esp_ota_write(ota->update_handle, (const void *)download->data.data, download->data.len);
        if (err != ESP_OK) {
            ESP_LOGE(TAG, "Error: esp_ota_write failed (%d)!", (err));
            goto _exit_ota_task;
        }
        ota->last_idx = download->pageindex;
    }

    if (ota->is_begin && download->totalpage == (download->pageindex + 1)) {
        if (esp_ota_end(ota->update_handle) != ESP_OK) {
            ESP_LOGE(TAG, "esp_ota_end failed!");
            goto _exit_ota_task;
        }
        err = esp_ota_set_boot_partition(update_partition);
        if (err != ESP_OK) {
            ESP_LOGE(TAG, "esp_ota_set_boot_partition failed (%d)!", (err));
            goto _exit_ota_task;
        }
        ESP_LOGI(TAG, "Finish OTA");
        // esp_restart();
        // return periph_mesh_enqueue_protobuf(mesh_handle, &mainResponse);
    }

_exit_ota_task:
    if (err != ESP_OK) {
        ESP_LOGE(TAG, "Error ota");
        status.code = -1;
        ota->is_begin = false;
        if (ota->update_handle) {
            esp_ota_end(ota->update_handle);
            ota->update_handle = 0;
        }
    }
    return periph_mesh_enqueue_protobuf(mesh_handle, &mainResponse);
}
