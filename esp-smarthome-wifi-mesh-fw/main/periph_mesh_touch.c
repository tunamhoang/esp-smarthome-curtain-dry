/*
 * This file is subject to the terms of the SunshineTech License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *
 *              ./LICENSE
 */
#include "periph_mesh.h"

static const char *TAG = "MESH_TOUCH";

static esp_err_t periph_mesh_touch_switcher_update_response(esp_periph_handle_t self, uint8_t switcher, uint8_t reboot_state, uint8_t auto_off);

static esp_err_t periph_mesh_touch_update_switcher_state(esp_periph_handle_t self, int switcher, touch_power_state_t state);

static esp_err_t periph_mesh_touch_report_statistics(esp_periph_handle_t self, int switcher)
{

    int ch = switcher - 1;
    int io_num = sys_cfg.features & 0x0F;
    if (ch < 0 || ch > io_num) {
        return ESP_FAIL;
    }
    GetLogSwitcherClientResponse logResponse = GET_LOG_SWITCHER_CLIENT_RESPONSE__INIT;
    logResponse.switcher = switcher;
    logResponse.totaltimeonorgin = g_statistics_storage[ch].total_time_on_sec;
    logResponse.totaltimeonyear = g_statistics_storage[ch].year_time_on_sec;
    logResponse.totaltimeonmonth = g_statistics_storage[ch].month_time_on_sec;
    logResponse.timeonlastdate = g_statistics_storage[ch].last_action_sec;
    logResponse.timeofflastdate = g_statistics_storage[ch].last_action_sec;

    SwitcherClientMessage switcherClientMessage = SWITCHER_CLIENT_MESSAGE__INIT;
    switcherClientMessage.getlogswitcherclientresponse = &logResponse;

    ClientMessage clientMessage = CLIENT_MESSAGE__INIT;
    clientMessage.switcherclientmessage = &switcherClientMessage;

    MainMessage mainMessage = MAIN_MESSAGE__INIT;
    mainMessage.clientmessage = &clientMessage;
    return periph_mesh_enqueue_protobuf(self, &mainMessage);
}

esp_err_t periph_mesh_bridge_control_touch(esp_periph_handle_t self, char *hardware_id, int switcher, int state)
{
    SwitcherClientRequest switcherClientRequest = SWITCHER_CLIENT_REQUEST__INIT;
    switcherClientRequest.hardwareid = hardware_id; //periph_mesh_get_hwid_from_devid(self, device_id);
    switcherClientRequest.switcher = switcher;
    switcherClientRequest.powerstate = state;
    // switcherClientRequest.ignorebridge = true;

    SwitcherClientMessage switcherClientMessage = SWITCHER_CLIENT_MESSAGE__INIT;
    switcherClientMessage.switcherclientrequest = &switcherClientRequest;

    ClientMessage clientMessage = CLIENT_MESSAGE__INIT;
    clientMessage.switcherclientmessage = &switcherClientMessage;

    MainMessage mainMessage = MAIN_MESSAGE__INIT;
    mainMessage.clientmessage = &clientMessage;
    return periph_mesh_enqueue_protobuf(self, &mainMessage);
}

esp_err_t periph_mesh_touch_process_message(esp_periph_handle_t self, MainMessage *mainMessage)
{
    if (mainMessage &&
            mainMessage->clientmessage &&
            mainMessage->clientmessage->switcherclientmessage &&
            mainMessage->clientmessage->switcherclientmessage->switcherclientrequest) {
        SwitcherClientRequest *switcherClientRequest = mainMessage->clientmessage->switcherclientmessage->switcherclientrequest;

        if (switcherClientRequest->hardwareid == NULL) {
            ESP_LOGD(TAG, "hardwareid NULLED");
            return ESP_ERR_INVALID_ARG;
        }
        ESP_LOGD(TAG, "switcherClientRequest to %s", switcherClientRequest->hardwareid);

        if (periph_mesh_is_mine(self, switcherClientRequest->hardwareid)) {
            ESP_LOGD(TAG, "switcherClientRequest[%d]=%d", (int)switcherClientRequest->switcher, (int)switcherClientRequest->powerstate);
        } else if (periph_mesh_is_root(self)) {
            ESP_LOGD(TAG, "ROOT| Forward switcherClientRequest to NODE %s", switcherClientRequest->hardwareid);
            return periph_mesh_send_protobuf(self, switcherClientRequest->hardwareid, mainMessage);
        }

        esp_periph_send_event(self,
                              PERIPH_MESH_SWICHER_REQUEST,
                              (void *)&switcherClientRequest->switcher,
                              (int)switcherClientRequest->powerstate);
        return ESP_OK;
    }

    if (mainMessage &&
            mainMessage->clientmessage &&
            mainMessage->clientmessage->switcherclientmessage &&
            mainMessage->clientmessage->switcherclientmessage->updateswitcherclientrequest) {
        UpdateSwitcherClientRequest *updateSwitcherClientRequest = mainMessage->clientmessage->switcherclientmessage->updateswitcherclientrequest;
        ESP_LOGD(TAG, "UpdateSwitcherClientRequest %s", updateSwitcherClientRequest->hardwareid ? updateSwitcherClientRequest->hardwareid : "");
        //TODO: the server need to send hardware_id
        if (periph_mesh_is_mine(self, updateSwitcherClientRequest->hardwareid)) {
            esp_periph_send_event(self,
                                  MESH_EVENT_SWICHER_UPDATE,
                                  (void *)updateSwitcherClientRequest,
                                  (int)sizeof(UpdateSwitcherClientRequest));
            uint8_t switcher = updateSwitcherClientRequest->switcher;
            uint8_t keep_state = updateSwitcherClientRequest->keepstate;
            uint8_t auto_off = updateSwitcherClientRequest->autooff;
            return periph_mesh_touch_switcher_update_response(self, switcher, keep_state, auto_off);
        } else if (periph_mesh_is_root(self)) {
            ESP_LOGD(TAG, "ROOT| Forward updateDeviceClientRequest to NODE %s", updateSwitcherClientRequest->hardwareid);
            return periph_mesh_send_protobuf(self, updateSwitcherClientRequest->hardwareid, mainMessage);
        }
        return ESP_OK;
    }

    if (mainMessage &&
            mainMessage->clientmessage &&
            mainMessage->clientmessage->switcherclientmessage &&
            mainMessage->clientmessage->switcherclientmessage->updateswitcherclientresponse) {
        if (periph_mesh_is_root(self)) {
            ESP_LOGD(TAG, "ROOT: Send updateswitcherclientresponse to server");
            return periph_mesh_ws_send_protobuf(self, NULL, mainMessage);
        } else {
            ESP_LOGD(TAG, "NODE: Send to ROOT");
            return periph_mesh_send_protobuf(self, NULL, mainMessage);
        }
        return ESP_OK;
    }

    if (mainMessage &&
            mainMessage->clientmessage &&
            mainMessage->clientmessage->deviceclientmessage &&
            mainMessage->clientmessage->deviceclientmessage->updatedeviceclientrequest) {
        UpdateDeviceClientRequest *updateDeviceClientRequest = mainMessage->clientmessage->deviceclientmessage->updatedeviceclientrequest;
        ESP_LOGD(TAG, "updateDeviceClientRequest");
        if (periph_mesh_is_mine(self, updateDeviceClientRequest->hardwareid)) {
            esp_periph_send_event(self,
                                  PERIPH_MESH_UPDATE_CLIENT,
                                  (void *)updateDeviceClientRequest,
                                  (int)sizeof(UpdateDeviceClientRequest));
            periph_mesh_response_device_state(self, 0);
        } else if (periph_mesh_is_root(self)) {
            ESP_LOGD(TAG, "ROOT| Forward updateDeviceClientRequest to NODE %s", updateDeviceClientRequest->hardwareid);
            return periph_mesh_send_protobuf(self, updateDeviceClientRequest->hardwareid, mainMessage);
        }
        return ESP_OK;
    }
    //ClientMessage.DeviceClientMessage.GetLogSwitcherClientRequest
    if (mainMessage &&
            mainMessage->clientmessage &&
            mainMessage->clientmessage->switcherclientmessage &&
            mainMessage->clientmessage->switcherclientmessage->getlogswitcherclientrequest) {
        GetLogSwitcherClientRequest *getLogSwitcherClientRequest = mainMessage->clientmessage->switcherclientmessage->getlogswitcherclientrequest;
        ESP_LOGD(TAG, "getLogSwitcherClientRequest");
        if (periph_mesh_is_mine(self, getLogSwitcherClientRequest->hardwareid)) {
            return periph_mesh_touch_report_statistics(self, getLogSwitcherClientRequest->switcher);
        } else if (periph_mesh_is_root(self)) {
            ESP_LOGD(TAG, "ROOT| Forward getLogSwitcherClientRequest to NODE %s", getLogSwitcherClientRequest->hardwareid);
            return periph_mesh_send_protobuf(self, getLogSwitcherClientRequest->hardwareid, mainMessage);
        }
        return ESP_OK;
    }

    if (mainMessage &&
            mainMessage->clientmessage &&
            mainMessage->clientmessage->switcherclientmessage &&
            mainMessage->clientmessage->switcherclientmessage->updateswitcherstate) {
        if (periph_mesh_is_root(self)) {
            ESP_LOGD(TAG, "ROOT: Send updateswitcherstate to server");
            UpdateSwitcherState *updateSwitcherState = mainMessage->clientmessage->switcherclientmessage->updateswitcherstate;
            int state = updateSwitcherState->powerstate == POWER_STATE__On ? 1 : 0;
            periph_mesh_set_touch_state(self, updateSwitcherState->deviceid, updateSwitcherState->switcher, state);
            return periph_mesh_ws_send_protobuf(self, NULL, mainMessage);
        } else {
            ESP_LOGD(TAG, "NODE: Send to ROOT");
            return periph_mesh_send_protobuf(self, NULL, mainMessage);
        }
        return ESP_OK;
    }

    if (mainMessage &&
            mainMessage->clientmessage &&
            mainMessage->clientmessage->onchangedclientmessage &&
            mainMessage->clientmessage->onchangedclientmessage->switcheronchangedclientresponse) {
        SwitcherOnChangedClientResponse *stateChanged = mainMessage->clientmessage->onchangedclientmessage->switcheronchangedclientresponse;
        // ESP_LOGD(TAG, "SwitcherOnChangedClientResponse, ch=%d, value=%d", stateChanged->switcher, stateChanged->powerstate);
        esp_err_t err = ESP_OK;

        if (periph_mesh_is_root(self)) {
            ESP_LOGD(TAG, "ROOT: Send to server");
            //Update Touch state
            periph_mesh_set_touch_state(self, stateChanged->deviceid, stateChanged->switcher, stateChanged->powerstate);

            if (stateChanged->bridge) {

                BridgeInfo *bridgeInfo = stateChanged->bridge;
                bool target_state = false, source_state = false;
                int source_idx = stateChanged->switcher - 1;
                int target_idx = bridgeInfo->targetswitcher;
                bridgeInfo->executed = true;

                err |= periph_mesh_get_touch_state(self, bridgeInfo->targethardwareid, target_idx + 1, &target_state);
                err |= periph_mesh_get_touch_state(self, stateChanged->deviceid, source_idx + 1, &source_state);

                if (err == ESP_OK) {
                    ESP_LOGD(TAG, "Get source and target device states: ok target[%d]: %d, source[%d]: %d", target_idx, target_state, source_idx +1, source_state);
                } else {
                    bridgeInfo->executed = false;
                }

                // ESP_LOGD(TAG, "ROOT: Process bridging, SRC: %s[%d]=%d, TARGET: %s[%d]=%d, bridge_type=%d, device_type=%d",
                //     stateChanged->deviceid ? stateChanged->deviceid : "", source_idx, source_state,
                //     bridgeInfo->targethardwareid, target_idx, target_state, bridgeInfo->bridgetype, (int)bridgeInfo->devicetype);

                if (bridgeInfo->devicetype == GROUP_DEVICE__SwitcherGroup) {
                    if (err == ESP_OK && bridgeInfo->bridgetype == 1 && (target_state != source_state)) {
                        ESP_LOGD(TAG, "ROOT: Control switch %s, ch=%d, value=%d", bridgeInfo->targethardwareid, target_idx, source_state);
                        err |= periph_mesh_bridge_control_touch(self, bridgeInfo->targethardwareid, target_idx + 1, source_state);
                    } else if (err == ESP_OK && bridgeInfo->bridgetype == 2 && (target_state == source_state)) {
                        ESP_LOGD(TAG, "ROOT: Control switch %s, ch=%d, value=%d", bridgeInfo->targethardwareid, target_idx, source_state ^ 1);
                        err |= periph_mesh_bridge_control_touch(self, bridgeInfo->targethardwareid, target_idx + 1, source_state ^ 1);
                    } else {
                        bridgeInfo->executed = false;
                        ESP_LOGD(TAG, "Control bridge switch failed or dropped");
                    }
                } else if (bridgeInfo->devicetype == GROUP_DEVICE__MotionGroup) {
                    if (err == ESP_OK && (bridgeInfo->bridgetype == 3) && (target_state != source_state)) {
                        ESP_LOGD(TAG, "ROOT: Control PIR %s, ch=%d, value=%d", bridgeInfo->targethardwareid, target_idx, source_state);
                        err |= periph_mesh_bridge_control_pir(self, bridgeInfo->targethardwareid, source_state);
                    } else if (err == ESP_OK && bridgeInfo->bridgetype == 2 && (target_state == source_state)) {
                        ESP_LOGD(TAG, "ROOT: Control PIR %s, ch=%d, value=%d", bridgeInfo->targethardwareid, target_idx, source_state ^ 1);
                        err |= periph_mesh_bridge_control_pir(self, bridgeInfo->targethardwareid, source_state ^ 1);
                    } else {
                        bridgeInfo->executed = false;
                        ESP_LOGD(TAG, "Control bridge motion failed or dropped");
                    }
                } else {
                    bridgeInfo->executed = false;
                    ESP_LOGD(TAG, "Control bridge unknown target device type");
                }
            } else {
                ESP_LOGD(TAG, "Touch onchange not support bridge");
            }

            err |=  periph_mesh_ws_send_protobuf(self, NULL, mainMessage);
            periph_mesh_print(self);
            return ESP_OK;
        } else {
            ESP_LOGD(TAG, "NODE: Send to ROOT");
            return periph_mesh_send_protobuf(self, NULL, mainMessage);
        }
        return ESP_OK;
    }
    return ESP_ERR_NOT_SUPPORTED;
}

static esp_err_t periph_mesh_touch_switcher_update_response(esp_periph_handle_t self, uint8_t switcher, uint8_t reboot_state, uint8_t auto_off)
{
    VALIDATE_MESH(self, ESP_FAIL);
    UpdateSwitcherClientResponse updateSwitcherClientResponse = UPDATE_SWITCHER_CLIENT_RESPONSE__INIT;
    SwitcherClientMessage switcherClientMessage = SWITCHER_CLIENT_MESSAGE__INIT;
    ClientMessage clientMessage = CLIENT_MESSAGE__INIT;
    MainMessage mainMess = MAIN_MESSAGE__INIT;
    mainMess.clientmessage = &clientMessage;
    clientMessage.switcherclientmessage = &switcherClientMessage;
    switcherClientMessage.updateswitcherclientresponse = &updateSwitcherClientResponse;

    updateSwitcherClientResponse.deviceid = periph_mesh_get_device_id(self);
    updateSwitcherClientResponse.autooff = auto_off;
    updateSwitcherClientResponse.keepstate = reboot_state;
    updateSwitcherClientResponse.switcher = switcher;

    ESP_LOGD(TAG, "UpdateSwitcherClientResponse: Switcher[%d], reboot_state=%d, auto_off=%d",
                                                    switcher,
                                                    reboot_state,
                                                    auto_off);

    StatusCode responseCode = STATUS_CODE__INIT;
    responseCode.code = 0;
    responseCode.message = "Success";
    updateSwitcherClientResponse.statuscode = &responseCode;
    return periph_mesh_enqueue_protobuf(self, &mainMess);
}

static esp_err_t periph_mesh_touch_update_switcher_state(esp_periph_handle_t self, int switcher, touch_power_state_t state)
{
    VALIDATE_MESH(self, ESP_FAIL);
    UpdateSwitcherState updateSwitcherState = UPDATE_SWITCHER_STATE__INIT;
    SwitcherClientMessage switcherClientMessage = SWITCHER_CLIENT_MESSAGE__INIT;
    ClientMessage clientMessage = CLIENT_MESSAGE__INIT;
    MainMessage mainMess = MAIN_MESSAGE__INIT;
    mainMess.clientmessage = &clientMessage;
    clientMessage.switcherclientmessage = &switcherClientMessage;
    switcherClientMessage.updateswitcherstate = &updateSwitcherState;

    updateSwitcherState.deviceid = periph_mesh_get_device_id(self);
    updateSwitcherState.autooff = g_statistics_storage[switcher].auto_off & (uint32_t)0xFF;
    updateSwitcherState.keepstate = g_statistics_storage[switcher].reboot_state;
    updateSwitcherState.switcher = switcher + 1;

    switch ((int)state) {
        case TOUCH_STATE_SCENE:
            updateSwitcherState.powerstate = POWER_STATE__SceneTrigger;
            break;
        case TOUCH_STATE_ON:
            updateSwitcherState.powerstate = POWER_STATE__On;
            break;
        case TOUCH_STATE_OFF:
            updateSwitcherState.powerstate = POWER_STATE__Off;
            break;
        default:
            updateSwitcherState.powerstate = POWER_STATE__Off;
    }

    ESP_LOGD(TAG, "UpdateSwitcherState: Switcher[%d], state=%d, reboot_state=%d, auto_off=%d",
                                                    switcher, state,
                                                    g_statistics_storage[switcher].reboot_state,
                                                    g_statistics_storage[switcher].auto_off);

    return periph_mesh_enqueue_protobuf(self, &mainMess);
}

static esp_err_t periph_mesh_touch_report_msg(esp_periph_handle_t self, int ch, touch_power_state_t state)
{
    VALIDATE_MESH(self, ESP_FAIL);

    if (ch < 0 || ch >= MAX_TOUCH_PAD_NUM) {
        return ESP_FAIL;
    }

    SwitcherOnChangedClientResponse stateChanged = SWITCHER_ON_CHANGED_CLIENT_RESPONSE__INIT;
    stateChanged.switcher = ch + 1;
    stateChanged.deviceid = periph_mesh_get_device_id(self);
    switch ((int)state) {
        case TOUCH_STATE_SCENE:
            stateChanged.powerstate = POWER_STATE__SceneTrigger;
            break;
        case TOUCH_STATE_DOUBLE_TAP:
            stateChanged.powerstate = POWER_STATE__DoubleTap;
            break;
        case TOUCH_STATE_ON:
            stateChanged.powerstate = POWER_STATE__On;
            break;
        case TOUCH_STATE_OFF:
            stateChanged.powerstate = POWER_STATE__Off;
            break;
    }
    // stateChanged.bridgehardwareid = (char *)bridgeHardwareId;

    BridgeInfo bridgeInfo = BRIDGE_INFO__INIT;
    if (g_bridge_info.bridge[ch].target_hwid[0]) {
        bridgeInfo.targetswitcher = g_bridge_info.bridge[ch].target_switcher;
        bridgeInfo.targethardwareid = g_bridge_info.bridge[ch].target_hwid;
        bridgeInfo.bridgetype = g_bridge_info.bridge[ch].bridge_type;
        stateChanged.bridge = &bridgeInfo;
    }

    StatusCode responseCode = STATUS_CODE__INIT;
    responseCode.code = 0;
    responseCode.message = "Success";
    stateChanged.statuscode = &responseCode;

    OnChangedClientMessage onchangedMessage = ON_CHANGED_CLIENT_MESSAGE__INIT;
    onchangedMessage.switcheronchangedclientresponse = &stateChanged;

    ClientMessage clientMessage = CLIENT_MESSAGE__INIT;
    clientMessage.onchangedclientmessage = &onchangedMessage;

    MainMessage mainMessage = MAIN_MESSAGE__INIT;
    mainMessage.clientmessage = &clientMessage;
    return periph_mesh_enqueue_protobuf(self, &mainMessage);
}

esp_err_t periph_mesh_touch_monitor_events(esp_periph_handle_t self, audio_event_iface_msg_t *event, void *context)
{
    if (event->source_type != PERIPH_ID_MONITOR) {
        return ESP_OK;
    }
    if (event->cmd == MONITOR_TOUCH_EVENT ||
        event->cmd == MONITOR_TOUCH_DOUBLE_TAP_EVENT ||
        event->cmd == MONITOR_TOUCH_SCENE_EVENT) {
        hw_io_map_t *io = event->data;
        if (io) {
            touch_power_state_t state = (touch_power_state_t)io->state;
            if (event->cmd == MONITOR_TOUCH_DOUBLE_TAP_EVENT) {
                state = TOUCH_STATE_DOUBLE_TAP;
            }
            if (event->cmd == MONITOR_TOUCH_SCENE_EVENT) {
                state = TOUCH_STATE_SCENE;
            }
            ESP_LOGD(TAG, "report touch idx=%d, value=%d, Doube_tab=%s, Scene=%s", io->touch_idx, io->state, state == 2 ? "True" : "False", state == 3 ? "True" : "False");
            return periph_mesh_touch_report_msg(self, io->touch_idx, state);
        }
    }

    if (event->cmd == MONITOR_TOUCH_UPDATE_CONFIG) {
        int *data = event->data;
        int idx = *data;
        int state = event->data_len;
        periph_mesh_touch_update_switcher_state(self, idx, state);
    }
    return ESP_OK;
}
