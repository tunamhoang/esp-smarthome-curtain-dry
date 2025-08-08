/*
 * This file is subject to the terms of the SunshineTech License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *
 *              ./LICENSE
 */
#include "periph_mesh.h"
#include "app_utility.h"

static const char *TAG = "MESH_AIRCOND";

#define FILTER_ADDR     (0x00)

static aircond_info_t aircond_info = { 0 };

static esp_err_t periph_mesh_aircond_update_state(esp_periph_handle_t self, aircond_info_t *info);

static esp_err_t _print_info(const char *st, int line, aircond_info_t *info) {
    const char *mode_str[] = {"NO_CHANGE", "OFF", "HEAT", "COOL", "AUTO","DRY", "FAN", "ON_LAST_MODE"};
    const char *speed_str[] = {"AUTO", "1", "2", "3", "4"};
    const char *vanes_str[] = {"SWING", "POS1", "POS2", "POS3", "POS4"};
    LOGI(TAG, "(%-10s,%-4d) Aircond Address: %x\tMode: %s\tSetpoint: %d\tTemp: %3.1f\tHump: %3.1f\tFanspeed: %s\tVanes: %s\tonline: %s", st, line,
         info->address, mode_str[info->mode]
         , info->setpoint, info->temperature, info->humidity, speed_str[info->fanspeed], vanes_str[info->vanes], info->is_online ? "true" : "false");
    return ESP_OK;
}

esp_err_t periph_mesh_aircond_monitor_events(esp_periph_handle_t self, esp_periph_handle_t aircond_handle, audio_event_iface_msg_t *event, void *context) {
    if (aircond_handle == NULL) {
        return ESP_OK;
    }
    if (event->source_type == PERIPH_ID_MESH && event->cmd == PERIPH_MESH_LOGGED) {
        // if (cfg_check_if_has_attribute(DEVICE_ATTR_GW_RS485)) {
        //     periph_mesh_aircond_add_new_indoor(self, indoor_id, n_indoor);
        // }
        return periph_mesh_aircond_onchanged_client_respone(self, 0);
    }
    if (event->source_type == PERIPH_ID_AIRCOND && event->cmd == AIRCOND_EVENT_ADD_NEW_INDOOR) {
        if (!periph_mesh_is_logged(self)) {
            //ESP_LOGE(TAG, "Register indoor failed, reason device not logged");
            return ESP_FAIL;
        }
        uint32_t indoor_id = (uint32_t)(*(uint8_t*)event->data);
        int n_indoor = (int)event->data_len;
        LOGW(TAG, "Register indoor with address %ld", indoor_id);
        if (cfg_check_if_has_attribute(DEVICE_ATTR_GW_RS485) || cfg_check_if_has_feature(DEVICE_FEATURE_THERMOSTAT_RS485)) {
            periph_mesh_aircond_add_new_indoor(self, &indoor_id, n_indoor);
        }
        return ESP_OK;
    }
    if (event->source_type == PERIPH_ID_AIRCOND && event->cmd == AIRCOND_EVENT_UPDATE) {
        return periph_mesh_aircond_update_state(self, event->data);
    }
    if (event->source_type == PERIPH_ID_AIRCOND && event->cmd > 0) {
        return periph_mesh_aircond_onchanged_client_respone(self, 0);
    }
    return ESP_OK;
}

esp_err_t periph_mesh_aircond_process_message(esp_periph_handle_t self, MainMessage *mainMessage) {
    if (mainMessage &&
            mainMessage->clientmessage &&
            mainMessage->clientmessage->airconditionerclientmessage &&
            mainMessage->clientmessage->airconditionerclientmessage->airconditionerclientrequest) {
        AirConditionerClientRequest *airConditionerClientRequest = mainMessage->clientmessage->airconditionerclientmessage->airconditionerclientrequest;
        if (periph_mesh_is_root(self) && !periph_mesh_is_mine(self, airConditionerClientRequest->hardwareid)) {
            LOGI(TAG, "ROOT| Forward AirConditionerClientRequest to NODE %s", airConditionerClientRequest->hardwareid);
            return periph_mesh_send_protobuf(self, airConditionerClientRequest->hardwareid, mainMessage);
        }
        aircond_info_t set_info = { 0 };
        AirConditionerState *state = airConditionerClientRequest->state;
        if (state->powerstate == POWER_STATE__Off) {
            set_info.mode = AIRCOND_MODE_OFF;
        } else if (state->mode == MODE_AC__HeatMode) {
            set_info.mode = AIRCOND_MODE_HEAT;
        } else if (state->mode == MODE_AC__CoolMode) {
            set_info.mode = AIRCOND_MODE_COOL;
        } else if (state->mode == MODE_AC__AutoMode) {
            set_info.mode = AIRCOND_MODE_AUTO;
        } else if (state->mode == MODE_AC__DryMode) {
            set_info.mode = AIRCOND_MODE_DRY;
        } else if (state->mode == MODE_AC__FanMode) { //FAN MODE
            set_info.mode = AIRCOND_MODE_FAN;
        }
        // set_info.humidityroom = state->humidityroom;
        set_info.vanes = state->swing;
        set_info.fanspeed = state->fan;
        set_info.setpoint = state->temperature;
        set_info.address = state->indoorid;
        _print_info("Request", __LINE__, &set_info);
        periph_thermostat_request_control(NULL, &set_info);
        return periph_aircond_set_info(NULL, &set_info);
    }

    if (mainMessage &&
            mainMessage->clientmessage &&
            mainMessage->clientmessage->airconditionerclientmessage &&
            mainMessage->clientmessage->airconditionerclientmessage->getairconditionerclientrequest) {
        GetAirConditionerClientRequest *getAirConditionerClientRequest = mainMessage->clientmessage->airconditionerclientmessage->getairconditionerclientrequest;
        if (periph_mesh_is_root(self) && !periph_mesh_is_mine(self, getAirConditionerClientRequest->hardwareid)) {
            LOGI(TAG, "ROOT| Forward GetAirConditionerClientRequest to NODE %s", getAirConditionerClientRequest->hardwareid);
            return periph_mesh_send_protobuf(self, getAirConditionerClientRequest->hardwareid, mainMessage);
        }
        return periph_mesh_aircond_onchanged_client_respone(self, getAirConditionerClientRequest->indoorid);
    }

    if (mainMessage &&
            mainMessage->clientmessage &&
            mainMessage->clientmessage->onchangedclientmessage &&
            mainMessage->clientmessage->onchangedclientmessage->airconditioneronchangedclientresponse) {

        if (periph_mesh_is_root(self)) {
            LOGI(TAG, "ROOT: Send airConditionerOnChangedClientResponse to server");
            return periph_mesh_ws_send_protobuf(self, NULL, mainMessage);
        } else {
            LOGI(TAG, "NODE: Send airConditionerOnChangedClientResponse to ROOT");
            return periph_mesh_send_protobuf(self, NULL, mainMessage);
        }
        return ESP_OK;
    }

    if (mainMessage &&
            mainMessage->clientmessage &&
            mainMessage->clientmessage->airconditionerclientmessage &&
            mainMessage->clientmessage->airconditionerclientmessage->airconditioneraddindoorsrequest) {

        if (periph_mesh_is_root(self)) {
            LOGI(TAG, "ROOT: Send airconditioneraddindoorrequest to server");
            return periph_mesh_ws_send_protobuf(self, NULL, mainMessage);
        } else {
            LOGI(TAG, "NODE: Send airconditioneraddindoorrequest to ROOT");
            return periph_mesh_send_protobuf(self, NULL, mainMessage);
        }
        return ESP_OK;
    }

    if (mainMessage &&
            mainMessage->clientmessage &&
            mainMessage->clientmessage->airconditionerclientmessage &&
            mainMessage->clientmessage->airconditionerclientmessage->airconditioneraddindoorsresponse) {

        AirConditionerAddIndoorsResponse *airconditioneraddindoorsresponse =
            mainMessage->clientmessage->airconditionerclientmessage->airconditioneraddindoorsresponse;
        if (periph_mesh_is_mine(self, airconditioneraddindoorsresponse->hardwareid)) {
            LOGI(TAG, "Process airconditioneraddindoorsresponse");
            if (cfg_check_if_has_attribute(DEVICE_ATTR_GW_RS485) || cfg_check_if_has_feature(DEVICE_FEATURE_THERMOSTAT_RS485)) {
                periph_aircond_check_reg((uint32_t*)airconditioneraddindoorsresponse->indoorid, (int)airconditioneraddindoorsresponse->n_indoorid);
            }
        } else if (periph_mesh_is_root(self)) {
            LOGI(TAG, "ROOT| Forward airconditioneraddindoorsresponse to NODE %s", airconditioneraddindoorsresponse->hardwareid);
            return periph_mesh_send_protobuf(self, airconditioneraddindoorsresponse->hardwareid, mainMessage);
        }
        return ESP_OK;
    }
    return ESP_ERR_NOT_SUPPORTED;
}

ClientMessage *_mesh_aircond_onchange_client_respone(esp_periph_handle_t self, ClientMessage *clientMessage, AirConditionerOnChangedClientResponse *airConditionerOnChangedClientResponse,
        AirConditionerState *state, OnChangedClientMessage *onchangedMessage, StatusCode *responseCode, aircond_info_t *aircond_info) {
    state->powerstate = aircond_info->mode > AIRCOND_MODE_OFF ? POWER_STATE__On : POWER_STATE__Off;
    state->temperature = aircond_info->setpoint;
    state->temperatureroom = (int)(aircond_info->temperature + 0.5f);
    state->humidityroom = (int)(aircond_info->humidity + 0.5f);
    if (aircond_info->mode == AIRCOND_MODE_HEAT) {
        state->mode = MODE_AC__HeatMode;
    } else if (aircond_info->mode == AIRCOND_MODE_COOL) {
        state->mode = MODE_AC__CoolMode;
    } else if (aircond_info->mode == AIRCOND_MODE_AUTO) {
        state->mode = MODE_AC__AutoMode;
    } else if (aircond_info->mode == AIRCOND_MODE_DRY) {
        state->mode = MODE_AC__DryMode;
    } else if (aircond_info->mode == AIRCOND_MODE_FAN) {
        state->mode = MODE_AC__FanMode;
    }
    state->swing = aircond_info->vanes;
    state->fan = aircond_info->fanspeed;
    state->connectionstate = aircond_info->is_online ? CONNECTION_STATE__Online : CONNECTION_STATE__Offline;
    state->indoorid = aircond_info->address;
    responseCode->code = 0;
    responseCode->message = "Success";
    airConditionerOnChangedClientResponse->state = state;
    airConditionerOnChangedClientResponse->deviceid = periph_mesh_get_device_id(self);
    airConditionerOnChangedClientResponse->statuscode = responseCode;
    onchangedMessage->airconditioneronchangedclientresponse = airConditionerOnChangedClientResponse;
    clientMessage->onchangedclientmessage = onchangedMessage;
    return clientMessage;
}

ClientMessage *_mesh_aircond_client_respone(esp_periph_handle_t self, ClientMessage *clientMessage, GetAirConditionerClientResponse *getAirConditionerClientResponse,
        AirConditionerState *state, AirConditionerClientMessage *airConditionerClientMessage, StatusCode *responseCode) {
    responseCode->code = 0;
    responseCode->message = "Success";
    getAirConditionerClientResponse->state = state;
    getAirConditionerClientResponse->deviceid = periph_mesh_get_device_id(self);
    getAirConditionerClientResponse->statuscode = responseCode;
    airConditionerClientMessage->getairconditionerclientresponse = getAirConditionerClientResponse;
    clientMessage->airconditionerclientmessage = airConditionerClientMessage;
    return clientMessage;
}

esp_err_t periph_mesh_aircond_onchanged_client_respone(esp_periph_handle_t self, int address) {
    VALIDATE_MESH(self, ESP_FAIL);
    aircond_info.address = FILTER_ADDR;
    periph_aircond_get_info(NULL, &aircond_info, address);
    _print_info("Onchange", __LINE__, &aircond_info);
    AirConditionerState state = AIR_CONDITIONER_STATE__INIT;
    MainMessage mainMessage = MAIN_MESSAGE__INIT;
    ClientMessage clientMessage = CLIENT_MESSAGE__INIT;
    AirConditionerOnChangedClientResponse airConditionerOnChangedClientResponse = AIR_CONDITIONER_ON_CHANGED_CLIENT_RESPONSE__INIT;
    OnChangedClientMessage onchangedMessage = ON_CHANGED_CLIENT_MESSAGE__INIT;
    StatusCode responseCode = STATUS_CODE__INIT;
    mainMessage.clientmessage = _mesh_aircond_onchange_client_respone(self, &clientMessage, &airConditionerOnChangedClientResponse, &state, &onchangedMessage, &responseCode, &aircond_info);
    return periph_mesh_enqueue_protobuf(self, &mainMessage);
}

static esp_err_t periph_mesh_aircond_update_state(esp_periph_handle_t self, aircond_info_t *info) {
    VALIDATE_MESH(self, ESP_FAIL);
    if (info == NULL) return ESP_FAIL;
    _print_info("Response", __LINE__, info);
    AirConditionerState state = AIR_CONDITIONER_STATE__INIT;
    MainMessage mainMessage = MAIN_MESSAGE__INIT;
    ClientMessage clientMessage = CLIENT_MESSAGE__INIT;
    AirConditionerOnChangedClientResponse airConditionerOnChangedClientResponse = AIR_CONDITIONER_ON_CHANGED_CLIENT_RESPONSE__INIT;
    OnChangedClientMessage onchangedMessage = ON_CHANGED_CLIENT_MESSAGE__INIT;
    StatusCode responseCode = STATUS_CODE__INIT;
    mainMessage.clientmessage = _mesh_aircond_onchange_client_respone(self, &clientMessage, &airConditionerOnChangedClientResponse, &state, &onchangedMessage, &responseCode, info);
    return periph_mesh_enqueue_protobuf(self, &mainMessage);
}

esp_err_t periph_mesh_aircond_add_new_indoor(esp_periph_handle_t self, uint32_t *new_indoor_address, int n_indoor) {
    VALIDATE_MESH(self, ESP_FAIL);
    if (new_indoor_address == NULL) return ESP_FAIL;

    AirConditionerAddIndoorsRequest request = AIR_CONDITIONER_ADD_INDOORS_REQUEST__INIT;
    request.deviceid = periph_mesh_get_device_id(self);

    request.indoorid = new_indoor_address;
    request.n_indoorid = n_indoor;
    LOGI(TAG, "AirConditionerAddIndoorsRequest: address %ld", new_indoor_address[0]);

    AirConditionerClientMessage airConditionerClientMessage = AIR_CONDITIONER_CLIENT_MESSAGE__INIT;
    airConditionerClientMessage.airconditioneraddindoorsrequest = &request;

    ClientMessage clientMessage = CLIENT_MESSAGE__INIT;
    clientMessage.airconditionerclientmessage = &airConditionerClientMessage;

    MainMessage mainMessage = MAIN_MESSAGE__INIT;
    mainMessage.clientmessage = &clientMessage;
    esp_err_t ret = periph_mesh_enqueue_protobuf(self, &mainMessage);
    return ret;
}
