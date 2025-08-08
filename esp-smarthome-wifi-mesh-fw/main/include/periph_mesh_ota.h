/*
 * This file is subject to the terms of the SunshineTech License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *
 *              ./LICENSE
 */

#ifndef _PERIPH_MESH_OTA_H_
#define _PERIPH_MESH_OTA_H_

#include "app_config.h"
#include "protobuf-c/protobuf-c.h"
#include "client-main-message.pb-c.h"
#include "client-message.pb-c.h"

#ifdef __cplusplus
extern "C" {
#endif
typedef struct ota_state* ota_state_handle_t;

ota_state_handle_t periph_mesh_ota_init();
esp_err_t periph_mesh_ota_process(esp_periph_handle_t mesh_handle, ota_state_handle_t ota, DownloadFirmwareOnChangedDeviceServerResponse *download);

#ifdef __cplusplus
}
#endif

#endif
