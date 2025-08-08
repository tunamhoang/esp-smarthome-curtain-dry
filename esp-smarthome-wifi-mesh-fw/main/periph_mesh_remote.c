/*
 * This file is subject to the terms of the SunshineTech License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *
 *              ./LICENSE
 */
#include "periph_mesh.h"

static const char *TAG = "MESH_REMOTE";

static char *remotemutillibrarycmdid = NULL;
static periph_remote_type_t learnType = -1;


static esp_err_t periph_mesh_remote_learning_cmd_response(esp_periph_handle_t self, void *data, int data_len, bool is_compressed)
{
    VALIDATE_MESH(self, ESP_FAIL);

    if (remotemutillibrarycmdid == NULL) {
        return ESP_OK;
    }

    LearnCommandRemoteClientResponse rsp = LEARN_COMMAND_REMOTE_CLIENT_RESPONSE__INIT;
    rsp.remotemutillibrarycmdid = remotemutillibrarycmdid;
    ESP_LOGD(TAG, "remotemutillibrarycmdid = %s", remotemutillibrarycmdid);
    rsp.commands = (uint32_t *)data;
    rsp.n_commands = data_len / 4 + (data_len % 4 ? 1 : 0);
    rsp.commands[rsp.n_commands] = data_len;
    rsp.n_commands++;
    rsp.commands[rsp.n_commands] = is_compressed ? COMPRESSED_CODE : NONE_COMPRESSED_CODE;
    rsp.n_commands++;
    rsp.type = learnType;

    ESP_LOGI(TAG, "ncmd=%d", rsp.n_commands);
    StatusCode responseCode = STATUS_CODE__INIT;
    responseCode.code = 0;
    responseCode.message = "Success";
    rsp.statuscode = &responseCode;

    RemoteClientMessage remoteclientmessage = REMOTE_CLIENT_MESSAGE__INIT;
    remoteclientmessage.learncommandremoteclientresponse = &rsp;

    ClientMessage clientMessage = CLIENT_MESSAGE__INIT;
    clientMessage.remoteclientmessage = &remoteclientmessage;

    MainMessage mainMessage = MAIN_MESSAGE__INIT;
    mainMessage.clientmessage = &clientMessage;
    esp_err_t ret = periph_mesh_enqueue_protobuf(self, &mainMessage);
    esp_periph_send_event(self, PERIPH_MESH_REMOTE_FINISH_LEARNING, NULL, 0);
    return ret;
}

static esp_err_t periph_mesh_remote_send_cmd_response(esp_periph_handle_t self)
{
    VALIDATE_MESH(self, ESP_FAIL);

    SendCommandRemoteClientResponse rsp = SEND_COMMAND_REMOTE_CLIENT_RESPONSE__INIT;

    StatusCode responseCode = STATUS_CODE__INIT;
    responseCode.code = 0;
    responseCode.message = "Success";
    rsp.statuscode = &responseCode;

    RemoteClientMessage remoteclientmessage = REMOTE_CLIENT_MESSAGE__INIT;
    remoteclientmessage.sendcommandremoteclientresponse = &rsp;

    ClientMessage clientMessage = CLIENT_MESSAGE__INIT;
    clientMessage.remoteclientmessage = &remoteclientmessage;

    MainMessage mainMessage = MAIN_MESSAGE__INIT;
    mainMessage.clientmessage = &clientMessage;
    return periph_mesh_enqueue_protobuf(self, &mainMessage);
}

esp_err_t periph_mesh_remote_process_message(esp_periph_handle_t self, MainMessage *mainMessage)
{
    esp_err_t err = ESP_OK;

    if (mainMessage &&
            mainMessage->clientmessage &&
            mainMessage->clientmessage->remoteclientmessage &&
            mainMessage->clientmessage->remoteclientmessage->learncommandremoteclientrequest) {
        LearnCommandRemoteClientRequest *learnCommandRemoteClientRequest = mainMessage->clientmessage->remoteclientmessage->learncommandremoteclientrequest;

        if (periph_mesh_is_mine(self, learnCommandRemoteClientRequest->hardwareid)) {
            ESP_LOGD(TAG, "ROOT| Forward learnCommandRemoteClientRequest to NODE %s", learnCommandRemoteClientRequest->hardwareid);
            ESP_LOGE(TAG, "LEARN REQ remoteid=%s, remotelibrarycmdid=%s, remotemutillibrarycmdid=%s",
                     learnCommandRemoteClientRequest->remoteid,
                     learnCommandRemoteClientRequest->remotelibrarycmdid,
                     learnCommandRemoteClientRequest->remotemutillibrarycmdid);
            free(remotemutillibrarycmdid);
            remotemutillibrarycmdid = strdup(learnCommandRemoteClientRequest->remotemutillibrarycmdid);
            learnType = learnCommandRemoteClientRequest->type;
            if (learnCommandRemoteClientRequest->type == (TypeLearn)REMOTE_TYPE_IR) {
                if ((sys_cfg.features & DEVICE_FEATURE_GW_IR) == DEVICE_FEATURE_GW_IR) {
                    esp_periph_send_event(self, PERIPH_MESH_REMOTE_LEARNING_IR_REQUEST, NULL, 0);
                } else {
                    LearnCommandRemoteClientResponse rsp = LEARN_COMMAND_REMOTE_CLIENT_RESPONSE__INIT;
                    rsp.remotemutillibrarycmdid = remotemutillibrarycmdid;
                    StatusCode responseCode = STATUS_CODE__INIT;
                    responseCode.code = 1;
                    responseCode.message = "Not support IR";
                    rsp.statuscode = &responseCode;

                    RemoteClientMessage remoteclientmessage = REMOTE_CLIENT_MESSAGE__INIT;
                    remoteclientmessage.learncommandremoteclientresponse = &rsp;

                    ClientMessage clientMessage = CLIENT_MESSAGE__INIT;
                    clientMessage.remoteclientmessage = &remoteclientmessage;

                    MainMessage mainMessage = MAIN_MESSAGE__INIT;
                    mainMessage.clientmessage = &clientMessage;
                    return periph_mesh_enqueue_protobuf(self, &mainMessage);
                }
            }
            if (learnCommandRemoteClientRequest->type == (TypeLearn)REMOTE_TYPE_RF) {
                if ((sys_cfg.features & DEVICE_FEATURE_GW_RF) == DEVICE_FEATURE_GW_RF) {
                    esp_periph_send_event(self, PERIPH_MESH_REMOTE_LEARNING_RF_REQUEST, NULL, 0);
                } else {
                    ESP_LOGI(TAG, "response not support RF");
                    LearnCommandRemoteClientResponse rsp = LEARN_COMMAND_REMOTE_CLIENT_RESPONSE__INIT;
                    rsp.remotemutillibrarycmdid = remotemutillibrarycmdid;
                    StatusCode responseCode = STATUS_CODE__INIT;
                    responseCode.code = 1;
                    responseCode.message = "Not support RF";
                    rsp.statuscode = &responseCode;

                    RemoteClientMessage remoteclientmessage = REMOTE_CLIENT_MESSAGE__INIT;
                    remoteclientmessage.learncommandremoteclientresponse = &rsp;

                    ClientMessage clientMessage = CLIENT_MESSAGE__INIT;
                    clientMessage.remoteclientmessage = &remoteclientmessage;

                    MainMessage mainMessage = MAIN_MESSAGE__INIT;
                    mainMessage.clientmessage = &clientMessage;
                    return periph_mesh_enqueue_protobuf(self, &mainMessage);
                }
            }
        } else if (periph_mesh_is_root(self)) {
            return periph_mesh_send_protobuf(self, learnCommandRemoteClientRequest->hardwareid, mainMessage);
        }
        return ESP_OK;
    }

    if (mainMessage &&
            mainMessage->clientmessage &&
            mainMessage->clientmessage->remoteclientmessage &&
            mainMessage->clientmessage->remoteclientmessage->learncommandremoteclientresponse) {
        ESP_LOGI(TAG, "LearnCommandRemoteClientResponse");
        if (periph_mesh_is_root(self)) {
            ESP_LOGD(TAG, "ROOT: Send to server");
            err = periph_mesh_ws_send_protobuf(self, NULL, mainMessage);
            free(remotemutillibrarycmdid);
            remotemutillibrarycmdid = NULL;
            return err;
        } else {
            ESP_LOGD(TAG, "NODE: Send to ROOT");
            err = periph_mesh_send_protobuf(self, NULL, mainMessage);
            free(remotemutillibrarycmdid);
            remotemutillibrarycmdid = NULL;
            return err;
        }
        return ESP_OK;
    }

    if (mainMessage &&
            mainMessage->clientmessage &&
            mainMessage->clientmessage->remoteclientmessage &&
            mainMessage->clientmessage->remoteclientmessage->sendcommandremoteclientrequest) {

        SendCommandRemoteClientRequest *sendCommandRemoteClientRequest = mainMessage->clientmessage->remoteclientmessage->sendcommandremoteclientrequest;

        if (periph_mesh_is_mine(self, sendCommandRemoteClientRequest->hardwareid)) {
            ESP_LOGI(TAG, "SendCommandRemoteClientRequest");
            if (sendCommandRemoteClientRequest->type == (TypeLearn)REMOTE_TYPE_IR) {
                esp_periph_send_event(self, PERIPH_MESH_REMOTE_SEND_IR_CMD,
                                      (void *)sendCommandRemoteClientRequest->commands,
                                      sendCommandRemoteClientRequest->n_commands);
            }
            if (sendCommandRemoteClientRequest->type == (TypeLearn)REMOTE_TYPE_RF) {
                esp_periph_send_event(self, PERIPH_MESH_REMOTE_SEND_RF_CMD,
                    (void*)sendCommandRemoteClientRequest->commands,
                    sendCommandRemoteClientRequest->n_commands);
            }
        } else if (periph_mesh_is_root(self)) {
            ESP_LOGD(TAG, "ROOT| Forward sendCommandRemoteClientRequest to NODE %s", sendCommandRemoteClientRequest->hardwareid);
            return periph_mesh_send_protobuf(self, sendCommandRemoteClientRequest->hardwareid, mainMessage);
        }
        return ESP_OK;
    }

    if (mainMessage &&
            mainMessage->clientmessage &&
            mainMessage->clientmessage->remoteclientmessage &&
            mainMessage->clientmessage->remoteclientmessage->sendcommandremoteclientresponse) {
        ESP_LOGI(TAG, "SendCommandRemoteClientResponse");
        if (periph_mesh_is_root(self)) {
            ESP_LOGD(TAG, "ROOT: Send to server");
            return periph_mesh_ws_send_protobuf(self, NULL, mainMessage);
        } else {
            ESP_LOGD(TAG, "NODE: Send to ROOT");
            return periph_mesh_send_protobuf(self, NULL, mainMessage);
        }
        return ESP_OK;
    }

    if (mainMessage &&
            mainMessage->clientmessage &&
            mainMessage->clientmessage->remoteclientmessage &&
            mainMessage->clientmessage->remoteclientmessage->controlremoteaccommandclientrequest) {
        ESP_LOGI(TAG, "controlremoteaccommandclientrequest");
        ControlRemoteACCommandClientRequest *controlRemoteACCommandClientRequest = mainMessage->clientmessage->remoteclientmessage->controlremoteaccommandclientrequest;
        esp_periph_send_event(self, PERIPH_MESH_REMOTE_CONTROL_IR_CMD, controlRemoteACCommandClientRequest, sizeof(ControlRemoteACCommandClientRequest));
        return ESP_OK;
    }


    return ESP_ERR_NOT_SUPPORTED;
}

esp_err_t periph_mesh_remote_monitor_events(esp_periph_handle_t self, audio_event_iface_msg_t *event, void *context)
{
    if (event->source_type == PERIPH_ID_REMOTE && event->cmd == REMOTE_EVENT_RECEIVED) {
        ESP_LOGI(TAG, "REMOTE_EVENT_RECEIVED %d", event->data_len);
        periph_remote_data_t* remote_data = (periph_remote_data_t*)event->data;
        return periph_mesh_remote_learning_cmd_response(self, (void*)remote_data->data, remote_data->data_len, remote_data->is_compressed);
    }

    if (event->source_type == PERIPH_ID_MONITOR && event->cmd == MONITOR_REMOTE_SEND_CMD_COMPLETE) {
        ESP_LOGI(TAG, "periph_mesh_send_cmd_response");
        return periph_mesh_remote_send_cmd_response(self);
    }
    return ESP_OK;
}
