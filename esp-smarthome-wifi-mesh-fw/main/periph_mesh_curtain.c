/*
 * This file is subject to the terms of the SunshineTech License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *
 *              ./LICENSE
 */
#include "app_utility.h"
#include "periph_mesh.h"

static const char *TAG = "MESH_CURTAIN";

static esp_err_t periph_mesh_curtain_report_msg(esp_periph_handle_t self, int percent_in, int percent_out) {
    CurtainSwitcherOnChangedClientResponse stateChanged = CURTAIN_SWITCHER_ON_CHANGED_CLIENT_RESPONSE__INIT;
    stateChanged.deviceid = periph_mesh_get_device_id(self);
    stateChanged.percentin = percent_in;
    stateChanged.percentout = percent_out;

    StatusCode responseCode = STATUS_CODE__INIT;
    responseCode.code = 0;
    responseCode.message = "Success";
    stateChanged.statuscode = &responseCode;

    OnChangedClientMessage onchangedMessage = ON_CHANGED_CLIENT_MESSAGE__INIT;
    onchangedMessage.curtainswitcheronchangedclientresponse = &stateChanged;

    ClientMessage clientMessage = CLIENT_MESSAGE__INIT;
    clientMessage.onchangedclientmessage = &onchangedMessage;

    MainMessage mainMessage = MAIN_MESSAGE__INIT;
    mainMessage.clientmessage = &clientMessage;
    return periph_mesh_enqueue_protobuf(self, &mainMessage);
}

esp_err_t periph_mesh_curtain_monitor_events(esp_periph_handle_t self, audio_event_iface_msg_t *event, void *context) {
    VALIDATE_MESH(self, ESP_FAIL);
    if (event->cmd == MONITOR_CURTAIN_EVENT && event->source_type == PERIPH_ID_MONITOR) {
        int *data = event->data;
        LOGI(TAG, "Report message: %d", *data);
        return periph_mesh_curtain_report_msg(self, *data, (int)event->data_len);
    }
    return ESP_OK;
}

esp_err_t periph_mesh_curtain_process_message(esp_periph_handle_t self, MainMessage *mainMessage) {
    if (mainMessage && mainMessage->clientmessage && mainMessage->clientmessage->curtainswitcherclientmessage &&
        mainMessage->clientmessage->curtainswitcherclientmessage->curtainswitcherclientrequest) {
        CurtainSwitcherClientRequest *curtainswitcherclientrequest = mainMessage->clientmessage->curtainswitcherclientmessage->curtainswitcherclientrequest;
        if (curtainswitcherclientrequest->hardwareid == NULL) {
            ESP_LOGD(TAG, "hardwareid NULLED");
            return ESP_ERR_INVALID_ARG;
        }
        ESP_LOGD(TAG, "curtainswitcherclientrequest to %s", curtainswitcherclientrequest->hardwareid);
        if (periph_mesh_is_mine(self, curtainswitcherclientrequest->hardwareid)) {
            ESP_LOGD(TAG, "curtainswitcherclientrequest: in[%d], out[%d]", (int)curtainswitcherclientrequest->percentin, (int)curtainswitcherclientrequest->percentout);
        } else if (periph_mesh_is_root(self)) {
            ESP_LOGD(TAG, "ROOT| Forward curtainswitcherclientrequest to NODE %s", curtainswitcherclientrequest->hardwareid);
            return periph_mesh_send_protobuf(self, curtainswitcherclientrequest->hardwareid, mainMessage);
        }
        esp_periph_send_event(self, PERIPH_MESH_CURTAIN_REQUEST, (void *)curtainswitcherclientrequest, sizeof(CurtainSwitcherClientRequest));
        return ESP_OK;
    }
    if (mainMessage && mainMessage->clientmessage && mainMessage->clientmessage->onchangedclientmessage && mainMessage->clientmessage->onchangedclientmessage->curtainswitcheronchangedclientresponse) {
        CurtainSwitcherOnChangedClientResponse *stateChanged = mainMessage->clientmessage->onchangedclientmessage->curtainswitcheronchangedclientresponse;
        // ESP_LOGD(TAG, "CurtainSwitcherOnChangedClientResponse: in[%d], out[%d]", stateChanged->percentin, stateChanged->percentout);
        if (periph_mesh_is_root(self)) {
            ESP_LOGD(TAG, "ROOT: Send to server");
            return periph_mesh_ws_send_protobuf(self, NULL, mainMessage);
        } else {
            ESP_LOGD(TAG, "NODE: Send to ROOT");
            return periph_mesh_send_protobuf(self, NULL, mainMessage);
        }
        return ESP_OK;
    }
    return ESP_ERR_NOT_SUPPORTED;
}
