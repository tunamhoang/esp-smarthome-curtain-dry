/*
 * This file is subject to the terms of the SunshineTech License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *
 *              ./LICENSE
 */
#include "periph_mesh.h"

static const char *TAG = "MESH_PIR";

esp_err_t periph_mesh_bridge_control_pir(esp_periph_handle_t self, char *hardware_id, int state)
{
    MotionClientRequest motionClientRequest = MOTION_CLIENT_REQUEST__INIT;
    motionClientRequest.hardwareid = hardware_id; //periph_mesh_get_hwid_from_devid(self, device_id);
    motionClientRequest.motionstate = state;
    // motionClientRequest.ignorebridge = true;

    MotionClientMessage motionClientMessage = MOTION_CLIENT_MESSAGE__INIT;
    motionClientMessage.motionclientrequest = &motionClientRequest;

    ClientMessage clientMessage = CLIENT_MESSAGE__INIT;
    clientMessage.motionclientmessage = &motionClientMessage;

    MainMessage mainMessage = MAIN_MESSAGE__INIT;
    mainMessage.clientmessage = &clientMessage;
    return periph_mesh_enqueue_protobuf(self, &mainMessage);
}

esp_err_t periph_mesh_pir_process_message(esp_periph_handle_t self, MainMessage *mainMessage)
{
    if (mainMessage &&
            mainMessage->clientmessage &&
            mainMessage->clientmessage->onchangedclientmessage &&
            mainMessage->clientmessage->onchangedclientmessage->motiononchangedclientresponse) {
        MotionOnChangedClientResponse *stateChanged = mainMessage->clientmessage->onchangedclientmessage->motiononchangedclientresponse;
        ESP_LOGD(TAG, "MotionOnChangedClientResponse, value=%d", stateChanged->motionstate);
        esp_err_t err = ESP_OK;
        if (periph_mesh_is_root(self)) {
            ESP_LOGD(TAG, "ROOT: Send to server");
            periph_mesh_set_touch_state(self, stateChanged->deviceid, 1, stateChanged->motionstate);

            if (stateChanged->bridge) {
                ESP_LOGD(TAG, "Process bridge running");
                BridgeInfo *bridgeInfo = stateChanged->bridge;
                bool target_state = false, source_state = false;
                int target_idx = bridgeInfo->targetswitcher;
                bridgeInfo->executed = true;
                const int source_idx = 1;

                err |= periph_mesh_get_touch_state(self, bridgeInfo->targethardwareid, target_idx + 1, &target_state);
                err |= periph_mesh_get_touch_state(self, stateChanged->deviceid, source_idx, &source_state);

                if (err == ESP_FAIL) {
                    bridgeInfo->executed = false;
                }

                if (err == ESP_OK) {
                    ESP_LOGD(TAG, "Get source and target device states: ok target[%d]: %d, source[%d]: %d", target_idx + 1, target_state, source_idx, source_state);
                }

                // ESP_LOGD(TAG, "ROOT: Process bridging, SRC: %s[%d]=%d, TARGET: %s[%d]=%d, bridge_type=%d, device_type=%d",
                //     stateChanged->deviceid ? stateChanged->deviceid : "", source_idx, source_state,
                //     bridgeInfo->targethardwareid, target_idx, target_state, bridgeInfo->bridgetype, (int)bridgeInfo->devicetype);

                if (bridgeInfo->devicetype == GROUP_DEVICE__SwitcherGroup) {
                    if (err == ESP_OK && (bridgeInfo->bridgetype == 1 || bridgeInfo->bridgetype == 3) && (target_state != source_state)) {
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
                    bridgeInfo->executed = false;
                    ESP_LOGD(TAG, "Control bridge motion not support");
                } else {
                    bridgeInfo->executed = false;
                    ESP_LOGD(TAG, "Control bridge unknown target device type");
                }
            } else {
                ESP_LOGD(TAG, "Motion onchange not support bridge");
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

    if (mainMessage &&
            mainMessage->clientmessage &&
            mainMessage->clientmessage->motionclientmessage &&
            mainMessage->clientmessage->motionclientmessage->motionclientrequest) {
        MotionClientRequest *motionClientRequest = mainMessage->clientmessage->motionclientmessage->motionclientrequest;

        if (motionClientRequest->hardwareid == NULL) {
            ESP_LOGD(TAG, "hardwareid NULLED");
            return ESP_ERR_INVALID_ARG;
        }
        ESP_LOGD(TAG, "motionClientRequest to %s", motionClientRequest->hardwareid);

        if (periph_mesh_is_mine(self, motionClientRequest->hardwareid)) {
            ESP_LOGD(TAG, "motionClientRequest=%d", (int)motionClientRequest->motionstate);
            int motion_state = motionClientRequest->motionstate == MOTION_STATE__MotionDetected? 1 : 0;
            esp_periph_send_event(self,
                                PERIPH_MESH_MOTION_REQUEST,
                                (void *)&motion_state,
                                sizeof(int)
                                );
            return ESP_OK;
        } else if (periph_mesh_is_root(self)) {
            ESP_LOGD(TAG, "ROOT| Forward motionClientRequest to NODE %s", motionClientRequest->hardwareid);
            return periph_mesh_send_protobuf(self, motionClientRequest->hardwareid, mainMessage);
        }
        return ESP_OK;
    }
    return ESP_ERR_NOT_SUPPORTED;
}

#ifdef CONFIG_DEVICE_TYPE_PIR
static esp_err_t periph_mesh_pir_report_msg(esp_periph_handle_t self, int state, bool en_bridge)
{
    VALIDATE_MESH(self, ESP_FAIL);

    MotionOnChangedClientResponse stateChanged = MOTION_ON_CHANGED_CLIENT_RESPONSE__INIT;
    stateChanged.deviceid = periph_mesh_get_device_id(self);
    stateChanged.motionstate = state ? MOTION_STATE__MotionDetected : MOTION_STATE__MotionNone;

    if (en_bridge) {
        BridgeInfo bridgeInfo = BRIDGE_INFO__INIT;
        if (g_bridge_info.bridge[0].target_hwid[0]) {
            bridgeInfo.targetswitcher = g_bridge_info.bridge[0].target_switcher;
            bridgeInfo.targethardwareid = g_bridge_info.bridge[0].target_hwid;
            bridgeInfo.bridgetype = g_bridge_info.bridge[0].bridge_type;
            stateChanged.bridge = &bridgeInfo;
        }
    }

    StatusCode responseCode = STATUS_CODE__INIT;
    responseCode.code = 0;
    responseCode.message = "Success";
    stateChanged.statuscode = &responseCode;

    ESP_LOGI(TAG, "MotionOnChangedClientResponse: state=%d, bridge=%s", state, en_bridge ? "enable" : "disable");

    OnChangedClientMessage onchangedMessage = ON_CHANGED_CLIENT_MESSAGE__INIT;
    onchangedMessage.motiononchangedclientresponse = &stateChanged;

    ClientMessage clientMessage = CLIENT_MESSAGE__INIT;
    clientMessage.onchangedclientmessage = &onchangedMessage;

    MainMessage mainMessage = MAIN_MESSAGE__INIT;
    mainMessage.clientmessage = &clientMessage;
    return periph_mesh_enqueue_protobuf(self, &mainMessage);
}
#endif

esp_err_t periph_mesh_pir_monitor_events(esp_periph_handle_t self, audio_event_iface_msg_t *event, void *context)
{
    if (event->source_type != PERIPH_ID_MONITOR) {
        return ESP_OK;
    }
    if (event->cmd == MONITOR_PIR_EVENT) {
        int* state = (int*)event->data;
        ESP_LOGI(TAG, "report pir state=%d", *state);

#ifdef CONFIG_DEVICE_TYPE_PIR
        bool en_bridge = true;
        if (sys_cfg.en_full_time || !periph_mesh_is_logged(self)) {
            return periph_mesh_pir_report_msg(self, *state, en_bridge);
        }
        time_t cur_time;
        tm_t time_info = {0};
        time(&cur_time);
        localtime_r(&cur_time, &time_info);

        uint32_t st_current = time_info.tm_hour * 60 + time_info.tm_min;
        uint32_t st_start = sys_cfg.time_start;
        uint32_t st_end = sys_cfg.time_end;
        uint8_t day_current = time_info.tm_wday == 0 ? 6 : time_info.tm_wday - 1;
        char strftime_buf[64];
        strftime(strftime_buf, sizeof(strftime_buf), "%c", &time_info);
        ESP_LOGW(TAG, "The current UTC date/time is: %s, day idx=%d, day map=%d", strftime_buf, day_current, sys_cfg.day_map);
        ESP_LOGW(TAG, "Current time=%d, start time=%d, endtime=%d", st_current, st_start, st_end);

        if (!((sys_cfg.day_map >> day_current) & (uint32_t)0x01)) {
            en_bridge &= false;
        }
        if ((st_start < st_end) && (st_current <= st_start || st_current >= st_end)) {
            en_bridge &= false;
        }
        if ((st_start > st_end) && (st_current <= st_start && st_current > st_end)) {
            en_bridge &= false;
        }
        if (st_start == st_end) {
            en_bridge = true;
        }
        return periph_mesh_pir_report_msg(self, *state, en_bridge);
#endif
    }
    return ESP_OK;
}
