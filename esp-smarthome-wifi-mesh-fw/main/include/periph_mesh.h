/*
 * This file is subject to the terms of the SunshineTech License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *
 *              ./LICENSE
 */

#ifndef _PERIPH_MESH_H_
#define _PERIPH_MESH_H_

#include "app_config.h"
#include "protobuf-c/protobuf-c.h"
#include "client-main-message.pb-c.h"
#include "client-message.pb-c.h"

#ifdef __cplusplus
extern "C" {
#endif

#define VALIDATE_MESH(periph, ret) if (!esp_periph_validate(periph, PERIPH_ID_MESH)) { \
        ESP_LOGE(TAG, "Invalid MESH periph, at line %d", __LINE__);\
        return ret;\
    }

#define PERIPH_ID_MESH      (PERIPH_ID_MAX + 3)

#define COMPRESSED_CODE         0x11
#define NONE_COMPRESSED_CODE    0x22

typedef enum {
    PERIPH_MESH_EVENT_NONE = 0,
    PERIPH_MESH_SWICHER_REQUEST,
    PERIPH_MESH_CURTAIN_REQUEST,
    PERIPH_MESH_MOTION_REQUEST,
    PERIPH_MESH_REMOTE_LEARNING_IR_REQUEST,
    PERIPH_MESH_REMOTE_LEARNING_RF_REQUEST,
    PERIPH_MESH_REMOTE_FINISH_LEARNING,
    PERIPH_MESH_REMOTE_SEND_IR_CMD,
    PERIPH_MESH_REMOTE_SEND_RF_CMD,
    PERIPH_MESH_REMOTE_CONTROL_IR_CMD,
    PERIPH_MESH_PARENT_CONNECTED,
    PERIPH_MESH_PARENT_DISCONNECTED,
    PERIPH_MESH_WS_CONNECTED,
    PERIPH_MESH_WS_DISCONNECTED,
    PERIPH_MESH_LOGGED,
    PERIPH_MESH_UPDATE_CLIENT,
    PERIPH_MESH_FORCE_UPDATE_OTA,
    MESH_EVENT_SWICHER_UPDATE,
    PERIPH_MESH_SET_BRIDGE,
    PERIPH_MESH_REMOVE_BRIDGE,
    PERIPH_MESH_SET_ACTIVE_TIME,
} periph_mesh_event_t;

typedef enum {
    MY_MESSAGE = 0,
    MESH_MESSAGE,
} message_type_t;

typedef struct {
    const char *tag;
    const char *ssid;
    const char *password;
    int mesh_channel;
    int model_group;
    const char *device_token;
    const char *hardware_id;
    const char *access_id;
    const char *access_key;
    const char *model;
    const char *hw_version;
    const char *register_template;
    const char *http_url;
    const char *ws_url;
    const char *reg_token;
    int reactivity;
    int brightness;
    int time_delay;
    uint32_t sceneActiveMap;
    bool joined_gw_flag;
    bool attempt_find_gw_first;
    int ws_data_type;
} periph_mesh_cfg_t;

esp_periph_handle_t periph_mesh_init(periph_mesh_cfg_t* config);
esp_err_t periph_mesh_stop(esp_periph_handle_t periph, TickType_t tick);
esp_err_t periph_mesh_start(esp_periph_handle_t periph);
esp_err_t periph_mesh_enqueue(esp_periph_handle_t periph, char *data, int data_len, message_type_t message_type);
esp_err_t periph_mesh_enqueue_protobuf(esp_periph_handle_t self, MainMessage *message);
esp_err_t periph_mesh_report_curtain_msg(esp_periph_handle_t periph, int percent_in, int percent_out);
esp_err_t periph_mesh_set_auth_token(esp_periph_handle_t periph, const char *access_id, const char *access_key);
esp_err_t periph_mesh_set_router(esp_periph_handle_t periph, char *ssid, char *password, int channel);
esp_err_t periph_mesh_response_device_state(esp_periph_handle_t periph, int status);
esp_err_t periph_mesh_learning_cmd_response(esp_periph_handle_t periph, void* data, int data_len, bool is_compressed);
esp_err_t periph_mesh_send_cmd_response(esp_periph_handle_t periph);
esp_err_t periph_mesh_send_protobuf(esp_periph_handle_t self, const char *hardware_id, MainMessage *message);
esp_err_t periph_mesh_ws_send_protobuf(esp_periph_handle_t self, int *sz, MainMessage *message);
esp_err_t periph_mesh_response_log(esp_periph_handle_t periph, const char *label, char *message);

bool periph_mesh_is_mine(esp_periph_handle_t self, const char *hardware_id);
bool periph_mesh_is_root(esp_periph_handle_t self);
char *periph_mesh_get_device_id(esp_periph_handle_t self);

esp_err_t periph_mesh_remote_process_message(esp_periph_handle_t self, MainMessage *mainMessage);
esp_err_t periph_mesh_remote_monitor_events(esp_periph_handle_t self, audio_event_iface_msg_t *event, void *context);

esp_err_t periph_mesh_aircond_process_message(esp_periph_handle_t self, MainMessage *mainMessage);
esp_err_t periph_mesh_aircond_monitor_events(esp_periph_handle_t self, esp_periph_handle_t aircond_handle, audio_event_iface_msg_t *event, void *context);
esp_err_t periph_mesh_aircond_onchanged_client_respone(esp_periph_handle_t self, int address);

esp_err_t periph_mesh_curtain_process_message(esp_periph_handle_t self, MainMessage *mainMessage);
esp_err_t periph_mesh_curtain_monitor_events(esp_periph_handle_t self, audio_event_iface_msg_t *event, void *context);

esp_err_t periph_mesh_touch_process_message(esp_periph_handle_t self, MainMessage *mainMessage);
esp_err_t periph_mesh_touch_monitor_events(esp_periph_handle_t self, audio_event_iface_msg_t *event, void *context);
esp_err_t periph_mesh_force_default_ota(const char *ssid, const char *password, int timeout_ms);
esp_err_t periph_mesh_bridge_control_touch(esp_periph_handle_t self, char *hardware_id, int switcher, int state);

esp_err_t periph_mesh_pir_monitor_events(esp_periph_handle_t self, audio_event_iface_msg_t *event, void *context);
esp_err_t periph_mesh_pir_process_message(esp_periph_handle_t self, MainMessage *mainMessage);
esp_err_t periph_mesh_bridge_control_pir(esp_periph_handle_t self, char *hardware_id, int state);

esp_err_t periph_mesh_set_touch_state(esp_periph_handle_t self, const char *dev_hw_id, int switcher, bool state);
esp_err_t periph_mesh_get_touch_state(esp_periph_handle_t self, const char *dev_hw_id, int switcher, bool *state);
char *periph_mesh_get_hwid_from_devid(esp_periph_handle_t self, const char *devid);
esp_err_t periph_mesh_print(esp_periph_handle_t self);
bool periph_mesh_is_logged(esp_periph_handle_t self);
esp_err_t periph_mesh_aircond_add_new_indoor(esp_periph_handle_t self, uint32_t* new_indoor_address, int n_indoor);

#ifdef __cplusplus
}
#endif

#endif
