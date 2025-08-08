/*
 * This file is subject to the terms of the SunshineTech License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *
 *              ./LICENSE
 */
#include "periph_mesh.h"

#include <mbedtls/md5.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

#include "app_utility.h"
// #include "esp32/rom/md5_hash.h"
#include "esp_mesh.h"
#include "mbedtls/base64.h"
#include "periph_mesh_ota.h"
#include "websocket_client.h"

#define DEFAULT_MESH_CHANNEL            (1)
#define DEFAULT_MESH_BUFSZ              (1 * 1024)
#define DEFAULT_MESH_RX_BUFSZ           (2 * 1024)
#define MAC_SZ                          (6)
#define DEFAULT_MESH_REQUEST_TIMEOUT_MS (30 * 1000)
#define DEFAULT_MY_RINGBUFFER_SIZE      (2 * 1024)
#define DEFAULT_MESH_RINGBUFFER_SIZE    (3 * 1024)
#define DEFAULT_MESH_BUFFER_SIZE        (1024)
#define MESH_NETWORK_TIMEOUT_MS         (10 * 1000)
#define MESH_REGISTER_TIMEOUT_MS        (10 * 1000)
#define MESH_LOGIN_TIMEOUT_MS           (10 * 1000)
#define NETWORK_TIMEOUT_MS              (120 * 1000)
#define WS_KEEPALIVE                    (15)
#define MAX_TIME_WAIVE_ROOT             (10)
#define WAITING_GATEWAY_NETWORK_MS      (5 * 60 * 1000)
#define MESH_LOG_TIMEOUT                (60 * 60 * 1000)
#define MAX_RECONNECT_TIMES             (50)

#if defined(CONFIG_DEVICE_TYPE_TOUCH) || defined(CONFIG_DEVICE_TYPE_CURTAIN)
#define MAX_NODE_IN_NETWORK (30)
#else
#define MAX_NODE_IN_NETWORK (20)
#endif

#define AWAIT(a) \
    if (a != ESP_OK) continue

#define IS_NOT_STR(x) (x == NULL || (x && strlen(x) == 0))
#define IS_STR(x)     (!IS_NOT_STR(x))

#define _mutex_lock(x)    while (xSemaphoreTake(x, portMAX_DELAY) != pdPASS);
#define _mutex_unlock(x)  xSemaphoreGive(x)
#define _mutex_create()   xSemaphoreCreateMutex()
#define _mutex_destroy(x) vSemaphoreDelete(x)

static esp_err_t _mesh_process_data(esp_periph_handle_t self, const uint8_t *data, size_t sz);
static esp_err_t _mesh_report_onchange(esp_periph_handle_t self, bool is_connected, mesh_addr_t *addr, const char *hardware_id);
static esp_err_t _mesh_report_root_status(esp_periph_handle_t self, bool is_connected, const char *hardware_id);
static esp_err_t _mesh_report_disconnect(esp_periph_handle_t self, mesh_addr_t *addr);
static esp_err_t set_force_ota_timer(int timeout);

typedef struct mesh_node {
    uint8_t   addr[MAC_SZ];
    char     *hardware_id;
    char     *device_id;
    bool      mine;
    bool      logged;
    long long last_login_tick;
    char      touch_state[MAX_RELAY_TOUCH_PAD_NUM];
    STAILQ_ENTRY(mesh_node) next;
} mesh_node_t;

typedef STAILQ_HEAD(mesh_list, mesh_node) mesh_list_t;

typedef struct {
    int                       mesh_layer;
    int                       mesh_channel;
    bool                      is_start;
    bool                      is_mesh_connected;
    bool                      is_root;
    bool                      is_got_ip;
    mesh_addr_t               mesh_parent_addr;
    char                     *ssid;
    char                     *password;
    bool                      run;
    EventGroupHandle_t        evt_group;
    bool                      is_ws_connected;
    bool                      is_ws_started;
    websocket_client_handle_t ws_client;
    char                     *reg_token;
    char                     *register_template;
    char                     *http_url;
    char                     *ws_url;
    char                     *model;
    int                       model_group;
    char                     *hw_version;
    char                     *device_token;
    char                     *hardware_id;
    char                     *access_id;
    char                     *access_key;
    int                       last_reg_tick;
    int                       login_random_tick;
    int                       login_random_ms;
    char                     *buffer;
    char                     *mac_bufer;
    uint8_t                  *rx_buf;
    uint8_t                  *tx_buf;
    uint64_t                  timeout_tick;
    uint64_t                  timeout_ms;
    uint64_t                  last_login_tick;
    uint64_t                  network_tick;
    bool                      logged;
    int                       ws_keepalive;
    bool                      paused;
    bool                      request_pause;
    bool                      is_registered;
    bool                      is_receive_ep;
    bool                      gateway_connected;
    SemaphoreHandle_t         lock;
    RingbufHandle_t           rb;
    RingbufHandle_t           my_rb;
    RingbufHandle_t           rx_rb;
    mesh_list_t               mesh_list;
    ota_state_handle_t        ota;
    int                       reactivity;
    int                       brightness;
    int                       time_delay;
    uint32_t                  sceneActiveMap;
    int                       invalid_key_counter;
    int                       got_ip_timeout_ms;
    bool                      joined_gw_flag;
    unsigned long long        wait_gw_network_tick;
    long long                 mesh_log_tick;
    bool                      attempt_find_gw;
    int                       mesh_rssi;
    bool                      req_change_ws_url;
    ws_datatype_t             ws_data_type;
    char                     *login_request_id;
} periph_mesh_t;

static const int CONNECTED_BIT = BIT1;
static const int GOTIP_BIT = BIT2;
static const int MESH_STOPPED_BIT = BIT3;
static const int MESH_RECV_STOPPED_BIT = BIT4;
static const int MESH_OTA_BIT = BIT4;
static const int WS_DISCONNECTED_BIT = BIT5;
static const int WS_CONNECTED_BIT = BIT6;
static const int WS_PAUSED_BIT = BIT7;

static const char         *TAG = "PERIPH_MESH";
static periph_mesh_t      *g_mesh;
static esp_periph_handle_t g_periph_mesh = NULL;
static TimerHandle_t       g_ota_timer = NULL;
static esp_netif_t        *netif_sta = NULL;

bool periph_mesh_is_mine(esp_periph_handle_t self, const char *hardware_id) {
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    if (hardware_id && periph_mesh->hardware_id && strcmp(hardware_id, periph_mesh->hardware_id) == 0) {
        return true;
    }
    return false;
}

bool periph_mesh_is_root(esp_periph_handle_t self) {
    VALIDATE_MESH(self, false);
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    return periph_mesh->is_root;
}

char *periph_mesh_get_device_id(esp_periph_handle_t self) {
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    return periph_mesh->access_id ? periph_mesh->access_id : "";
}

static void check_and_waive_root(esp_periph_handle_t self) {
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    periph_mesh->invalid_key_counter++;
    if (periph_mesh->invalid_key_counter > MAX_TIME_WAIVE_ROOT) {
        periph_mesh->invalid_key_counter = 0;
        if (periph_mesh->is_root) {
            int count = esp_mesh_get_routing_table_size();
            if (count > 1) {
                LOGW(TAG, "esp_mesh_waive_root %d", count);
                esp_mesh_set_type(MESH_LEAF);
            }
        }
    }
}

static esp_err_t _mesh_get_id(uint8_t *mesh_id, const char *ssid, const char *password, int channel, int offset, bool join_gw_net) {
    unsigned char             *ssid_pass = NULL;
    struct mbedtls_md5_context md5_ctx;
    unsigned char              digest[16];
    uint64_t                   hw_id = 0;
    esp_efuse_mac_get_default((uint8_t *)&hw_id);
#ifdef CONFIG_DEVELOPMENT_MODE
    int len = 0;
    if (join_gw_net) {
        len = asprintf((char **)&ssid_pass, "Unicloud_Gateway_Dev|ssid=%s|pass=%s", ssid ? ssid : "", password ? password : "");
    } else {
        len = asprintf((char **)&ssid_pass, "Unicloud_Dev|ssid=%s|pass=%s|channel=%d|id=%llx", ssid ? ssid : "", password ? password : "", channel, hw_id);
    }
#else
    int len = 0;
    if (join_gw_net) {
        len = asprintf((char **)&ssid_pass, "Unicloud_Gateway|ssid=%s|pass=%s", ssid ? ssid : "", password ? password : "");
    } else {
        len = asprintf((char **)&ssid_pass, "Unicloud|ssid=%s|pass=%s|channel=%d|id=%llx", ssid ? ssid : "", password ? password : "", channel, hw_id);
    }
#endif
    mbedtls_md5_init(&md5_ctx);
    mbedtls_md5_update(&md5_ctx, ssid_pass, len);
    mbedtls_md5_finish(&md5_ctx, digest);
    for (int i = 0; i < 6; i++) {
        mesh_id[i] = digest[i + offset] ^ digest[(i + offset) * 2];
    }
    free(ssid_pass);
    LOGI_HEX(mesh_id, 6, "MESH_ID");
    return ESP_OK;
}

static esp_err_t _mesh_set_timeout(esp_periph_handle_t self, uint64_t timeout_ms) {
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    if (periph_mesh->timeout_ms == 0 || timeout_ms == 0) {
        periph_mesh->timeout_tick = esp_periph_tick_get();
        periph_mesh->timeout_ms = timeout_ms;
    }
    return ESP_OK;
}

static esp_err_t _mesh_force_set_timeout(esp_periph_handle_t self, uint64_t timeout_ms) {
    _mesh_set_timeout(self, 0);
    _mesh_set_timeout(self, timeout_ms);
    return ESP_OK;
}

static void _mesh_print(mesh_list_t *mesh_list) {
    mesh_node_t *node;
    int          i = 0;
    STAILQ_FOREACH(node, mesh_list, next) {
        LOGD(TAG, "[%d] " MACSTR " is_mine=%d, logged=%d, hwid=%s, devid=%s, state=|%d|%d|%d|%d|", i++, MAC2STR(node->addr), node->mine, node->logged, node->hardware_id ? node->hardware_id : "",
             node->device_id ? node->device_id : "", node->touch_state[0], node->touch_state[1], node->touch_state[2], node->touch_state[3]);
    }
}

static esp_err_t _mesh_delete(mesh_node_t *node) {
    free(node->hardware_id);
    free(node->device_id);
    free(node);
    return ESP_OK;
}

static mesh_node_t *_mesh_add_node(mesh_list_t *mesh_list, uint8_t *addr) {
    mesh_node_t *node = calloc(1, sizeof(mesh_node_t));
    PERIPH_MEM_CHECK(TAG, node, return NULL);
    memcpy(node->addr, addr, MAC_SZ);
    STAILQ_INSERT_TAIL(mesh_list, node, next);
    return node;
}

static mesh_node_t *_mesh_find_node_by_addr(mesh_list_t *mesh_list, uint8_t *addr) {
    mesh_node_t *node;
    STAILQ_FOREACH(node, mesh_list, next) {
        if (memcmp(node->addr, addr, MAC_SZ) == 0) {
            return node;
        }
    }
    return NULL;
}

static mesh_node_t *_mesh_find_node_by_hw_id(mesh_list_t *mesh_list, const char *hardware_id) {
    mesh_node_t *node;
    if (hardware_id == NULL) {
        return NULL;
    }
    STAILQ_FOREACH(node, mesh_list, next) {
        if (node->hardware_id && strcmp(node->hardware_id, hardware_id) == 0) {
            return node;
        }
    }
    int len = strlen(hardware_id);
    if (len < 6) {
        return NULL;
    }
    uint64_t hw_addr = (uint64_t)strtol(&hardware_id[len - 6], NULL, 16);  ////SWITCH-E0B5DC
    STAILQ_FOREACH(node, mesh_list, next) {
        uint64_t *ptr = (uint64_t *)node->addr;
        uint64_t  ptr_shift = (*ptr >> 24) & 0xFFFFFF;
        if (ptr_shift == hw_addr) {
            return node;
        }
    }
    return NULL;
}

static mesh_node_t *_mesh_find_node_by_dev_id(mesh_list_t *mesh_list, const char *device_id) {
    mesh_node_t *node;
    if (device_id == NULL) {
        return NULL;
    }
    STAILQ_FOREACH(node, mesh_list, next) {
        if (node->device_id && strcmp(node->device_id, device_id) == 0) {
            return node;
        }
    }
    return NULL;
}

static bool _node_is_exist_in_list(uint8_t *addr, mesh_list_t *mesh_list) {
    mesh_node_t *node = _mesh_find_node_by_addr(mesh_list, addr);
    return node ? true : false;
}

static bool _node_is_exist_in_table(uint8_t *addr, mesh_addr_t *table, int sz) {
    for (int i = 0; i < sz; i++) {
        if (memcmp(addr, table[i].addr, MAC_SZ) == 0) {
            return true;
        }
    }
    return false;
}

static esp_err_t periph_mesh_report_node_offline(esp_periph_handle_t self, mesh_node_t *node) {
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    if (node == NULL || self == NULL || periph_mesh == NULL) {
        LOGE(TAG, "args is not NULL");
        return ESP_FAIL;
    }
    if (!node->logged || node->device_id == NULL || node->mine) {
        LOGE(TAG, "device must logged and device_id is not NULL");
        return ESP_FAIL;
    }
    DeviceOnChangedDeviceClientResponse statusChanged = DEVICE_ON_CHANGED_DEVICE_CLIENT_RESPONSE__INIT;
    statusChanged.deviceid = node->device_id;
    statusChanged.connectionstate = CONNECTION_STATE__Disconnect;

    StatusCode responseCode = STATUS_CODE__INIT;
    responseCode.code = 0;
    responseCode.message = "Success";
    statusChanged.statuscode = &responseCode;

    OnChangedClientMessage onchangedMessage = ON_CHANGED_CLIENT_MESSAGE__INIT;
    onchangedMessage.deviceonchangeddeviceclientresponse = &statusChanged;

    ClientMessage clientMessage = CLIENT_MESSAGE__INIT;
    clientMessage.onchangedclientmessage = &onchangedMessage;

    MainMessage mainMessage = MAIN_MESSAGE__INIT;
    mainMessage.clientmessage = &clientMessage;
    return periph_mesh_enqueue_protobuf(self, &mainMessage);
}

static esp_err_t _mesh_sync_node(periph_mesh_t *periph_mesh) {
    int     route_table_size = 0;
    uint8_t self_addr[MAC_SZ];

    if (!periph_mesh->is_root) {
        return ESP_OK;
    }
    esp_err_t err = esp_mesh_get_routing_table((mesh_addr_t *)periph_mesh->mac_bufer, DEFAULT_MESH_BUFSZ, &route_table_size);
    if (err != ESP_OK) {
        return err;
    }
    mesh_node_t *node, *tmp;

    // remove all nodes not exist on routing table
    LOGD(TAG, "routing table size = %d", route_table_size);

    STAILQ_FOREACH_SAFE(node, &periph_mesh->mesh_list, next, tmp) {
        if (!_node_is_exist_in_table(node->addr, (mesh_addr_t *)periph_mesh->mac_bufer, route_table_size)) {
            // TODO: Send offline status to server
            LOGW(TAG, "Send offline status to server, addr: " MACSTR, MAC2STR(node->addr));
            periph_mesh_report_node_offline(g_periph_mesh, node);
            STAILQ_REMOVE(&periph_mesh->mesh_list, node, mesh_node, next);
            _mesh_delete(node);
        }
    }
    // Add new node if not exist on list
    mesh_addr_t *nodes = (mesh_addr_t *)periph_mesh->mac_bufer;
    esp_efuse_mac_get_default(self_addr);
    for (int i = 0; i < route_table_size; i++) {
        if (!_node_is_exist_in_list(nodes[i].addr, &periph_mesh->mesh_list)) {
            LOGW(TAG, "Add node " MACSTR, MAC2STR(nodes[i].addr));
            mesh_node_t *node = _mesh_add_node(&periph_mesh->mesh_list, nodes[i].addr);

            if (node == NULL) {
                return ESP_ERR_NO_MEM;
            }
            if (memcmp(nodes[i].addr, self_addr, MAC_SZ) == 0) {
                node->mine = true;
                node->hardware_id = strdup(periph_mesh->hardware_id);
                if (periph_mesh->access_id) {
                    node->device_id = strdup(periph_mesh->access_id);
                }
            }
            if (!node->mine && node->logged == false && route_table_size > MAX_NODE_IN_NETWORK) {
                LOGW(TAG, "Remove node " MACSTR ". HwID: %s, reason: freeheap is low %ld", MAC2STR(nodes[i].addr), node->hardware_id ? node->hardware_id : "", esp_get_free_heap_size());
                _mesh_report_disconnect(g_periph_mesh, (mesh_addr_t *)nodes[i].addr);
                return ESP_OK;
            }
            _mesh_report_onchange(g_periph_mesh, periph_mesh->logged, (mesh_addr_t *)nodes[i].addr, NULL);
        }
    }
    _mesh_print(&periph_mesh->mesh_list);
    return ESP_OK;
}

static esp_err_t _mesh_reset_node(periph_mesh_t *periph_mesh) {
    mesh_node_t *node;
    STAILQ_FOREACH(node, &periph_mesh->mesh_list, next) {
        node->logged = false;
        node->last_login_tick = esp_periph_tick_get();
    }
    return ESP_OK;
}

static esp_err_t _mesh_clear_node(mesh_list_t *mesh_list) {
    mesh_node_t *node, *tmp;
    STAILQ_FOREACH_SAFE(node, mesh_list, next, tmp) { _mesh_delete(node); }
    STAILQ_INIT(mesh_list);
    return ESP_OK;
}

static esp_err_t _mesh_ws_stop(esp_periph_handle_t self) {
    if (self == NULL) return ESP_FAIL;
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    if (periph_mesh->is_ws_started) {
        periph_mesh->is_ws_started = false;
        periph_mesh->is_registered = false;
        if (websocket_client_is_connected(periph_mesh->ws_client)) {
            LOGW(TAG, "ws close request");
            event_clear(periph_mesh->evt_group, WS_DISCONNECTED_BIT);
            websocket_client_close(periph_mesh->ws_client, 1000 / portTICK_RATE_MS);
            EVEN_CHECK(periph_mesh->evt_group, WS_DISCONNECTED_BIT, 30000 / portTICK_RATE_MS, NEXT(), "ws close request fail");
        }
        LOGW(TAG, "ws stop request");
        websocket_client_stop(periph_mesh->ws_client);
    }
    return ESP_OK;
}

static esp_err_t _mesh_check_logged_node(esp_periph_handle_t self) {
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    if (!periph_mesh->is_root) {
        return ESP_OK;
    }
    mesh_node_t *node;
    STAILQ_FOREACH(node, &periph_mesh->mesh_list, next) {
        if (!node->logged && esp_periph_tick_get() - node->last_login_tick > (MESH_LOGIN_TIMEOUT_MS + 5000)) {
            _mesh_report_onchange(self, periph_mesh->logged, (mesh_addr_t *)node->addr, NULL);
            node->last_login_tick = esp_periph_tick_get();
        }
    }

    if (esp_periph_tick_get() - periph_mesh->network_tick > NETWORK_TIMEOUT_MS) {
        LOGW(TAG, "Server timeout");
        _mesh_ws_stop(self);
        esp_periph_send_event(self, PERIPH_MESH_WS_DISCONNECTED, NULL, 0);
        _mesh_force_set_timeout(self, 0);
    }
    return ESP_OK;
}

static void _mesh_print_login(LoginServerRequest *loginRequest) {
    // LOGD(TAG, "\r\nLoginServerRequest:\n"
    //          "local-ip: %s\n"
    //          "access-key: %s\n"
    //          "device-id: %s\n"
    //          "hardware-id: %s\n"
    //          "gateway-id: %s\n"
    //          "model: %s\n"
    //          "group: %d\n"
    //          "firmware: %s\n"
    //          "hardware: %s\n"
    //          "mdns: %s\n"
    //          "rssi: %d\n"
    //          "reactivity: %d\n"
    //          "brightness: %d\n"
    //          "sceneactivemap: %X\n"
    //          "time_delay: %d\n"
    //          "deviceToken: %s",
    //          loginRequest->loggedip ? loginRequest->loggedip : "",
    //          loginRequest->accesskey,
    //          loginRequest->deviceid,
    //          loginRequest->hardwareid,
    //          loginRequest->gatewayid,
    //          loginRequest->model,
    //          loginRequest->group,
    //          loginRequest->firmware,
    //          loginRequest->hardware,
    //          loginRequest->mdns,
    //          loginRequest->signal,
    //          loginRequest->reactivity,
    //          loginRequest->brightness,
    //          loginRequest->sceneactivemap,
    //          loginRequest->timedelay,
    //          loginRequest->devicetoken
    //         );
}

static char *_mesh_generate_log_message(periph_mesh_t *periph_mesh, char *event_name) {
    if (periph_mesh == NULL) {
        return NULL;
    }
    if (event_name == NULL) {
        strcpy(event_name, "unknow");
    }
    char *message = NULL;
    asprintf(&message,
             "Msg:["
             "event: %s, "
             "ssid: %s, "
             "rssi: %d, "
             "layer: %d, "
             "channel: %d, "
             "is_root: %s, "
             "en_root_fixed: %s, "
             "is_logged: %s, "
             "gateway_connected: %s, "
             "join_gateway_flag: %s, "
             "attempt_gw: %s, "
             "free heap: %ld]",
             event_name, periph_mesh->ssid, periph_mesh->mesh_rssi, periph_mesh->mesh_layer, periph_mesh->mesh_channel, esp_mesh_is_root() ? "y" : "n", esp_mesh_is_root_fixed() ? "y" : "n",
             periph_mesh->logged ? "y" : "n", periph_mesh->gateway_connected ? "y" : "n", periph_mesh->joined_gw_flag ? "y" : "n", periph_mesh->attempt_find_gw ? "y" : "n", esp_get_free_heap_size());
    return message;
}

static esp_err_t _mesh_root_check_restart(esp_periph_handle_t periph) {
    VALIDATE_MESH(periph, ESP_FAIL);
    periph_mesh_t *periph_mesh = esp_periph_get_data(periph);
    bool           state = false;
    int            count = 0;
#if defined(CONFIG_DEVICE_TYPE_PIR) || defined(CONFIG_DEVICE_TYPE_REMOTE)
    esp_restart();
    return ESP_OK;
#endif
    do {
        if (count == MAX_RELAY_TOUCH_PAD_NUM) {
            // esp_websocket_client_stop(periph_mesh->ws_client);
            esp_restart();
        }
        count++;
        periph_mesh_get_touch_state(periph, periph_mesh->hardware_id, count, &state);
    } while (!state);
    return ESP_OK;
}

esp_err_t periph_mesh_response_log(esp_periph_handle_t periph, const char *label, char *message) {
    VALIDATE_MESH(periph, ESP_FAIL);
    periph_mesh_t *periph_mesh = esp_periph_get_data(periph);
    if (label == NULL || message == NULL) {
        return ESP_FAIL;
    }
    LOGD(TAG, "%s", message);
    DebugLoggingResponse debugLog = DEBUG_LOGGING_RESPONSE__INIT;
    debugLog.deviceid = periph_mesh->access_id;
    debugLog.label = (char *)label;
    debugLog.message = message;

    StatusCode responseCode = STATUS_CODE__INIT;
    responseCode.code = 0;
    responseCode.message = "Success";
    debugLog.statuscode = &responseCode;

    OnChangedClientMessage onchangedMessage = ON_CHANGED_CLIENT_MESSAGE__INIT;
    onchangedMessage.debugloggingresponse = &debugLog;

    ClientMessage clientMessage = CLIENT_MESSAGE__INIT;
    clientMessage.onchangedclientmessage = &onchangedMessage;

    MainMessage mainMessage = MAIN_MESSAGE__INIT;
    mainMessage.clientmessage = &clientMessage;
    size_t size = main_message__pack(&mainMessage, (uint8_t *)periph_mesh->buffer);
    return periph_mesh_enqueue(periph, periph_mesh->buffer, size, MESH_MESSAGE);
}

void mesh_event_handler(void *arg, esp_event_base_t event_base, int32_t event_id, void *event_data) {
    mesh_addr_t id = {
        0,
    };
    static uint8_t last_layer = 0;
    LOGD(TAG, "esp_event_handler:%ld", event_id);
    if (g_periph_mesh == NULL) return;
    periph_mesh_t *mesh_handle = (periph_mesh_t *)esp_periph_get_data(g_periph_mesh);
    switch (event_id) {
        case MESH_EVENT_STARTED: {
            esp_mesh_get_id(&id);
            LOGI(TAG, "<MESH_EVENT_STARTED> ID:" MACSTR "", MAC2STR(id.addr));
            mesh_handle->mesh_layer = esp_mesh_get_layer();
            event_clear(mesh_handle->evt_group, MESH_STOPPED_BIT);
            break;
        }
        case MESH_EVENT_STOPPED: {
            esp_mesh_get_id(&id);
            LOGI(TAG, "<MESH_EVENT_STOPPED> ID:" MACSTR "", MAC2STR(id.addr));
            mesh_handle->mesh_layer = esp_mesh_get_layer();
            event_set(mesh_handle->evt_group, MESH_STOPPED_BIT);
            break;
        }
        case MESH_EVENT_PARENT_CONNECTED: {
            mesh_event_connected_t *connected = (mesh_event_connected_t *)event_data;
            esp_mesh_get_id(&id);
            mesh_handle->mesh_layer = connected->self_layer;
            memcpy(&mesh_handle->mesh_parent_addr.addr, connected->connected.bssid, 6);
            LOGI(TAG, "<MESH_EVENT_PARENT_CONNECTED>layer:%d-->%d, parent:" MACSTR "%s, ID:" MACSTR "", last_layer, mesh_handle->mesh_layer, MAC2STR(mesh_handle->mesh_parent_addr.addr),
                 esp_mesh_is_root()               ? "<ROOT>"
                 : (mesh_handle->mesh_layer == 2) ? "<layer2>"
                                                  : "",
                 MAC2STR(id.addr));
            last_layer = mesh_handle->mesh_layer;
            mesh_handle->is_mesh_connected = true;
            mesh_handle->is_root = esp_mesh_is_root();
            if (mesh_handle->is_root) {
                esp_netif_dhcpc_stop(netif_sta);
                esp_netif_dhcpc_start(netif_sta);
            }
            mesh_handle->is_registered = false;
            mesh_handle->is_got_ip = false;
            mesh_handle->last_reg_tick = esp_periph_tick_get();
            mesh_handle->logged = false;
            esp_periph_send_event(g_periph_mesh, PERIPH_MESH_PARENT_CONNECTED, NULL, 0);
            xEventGroupSetBits(mesh_handle->evt_group, CONNECTED_BIT);
            if (mesh_handle->attempt_find_gw && !g_gw_joined_info.flag) {
                g_gw_joined_info.flag = true;
                cfg_save_joining_gw_flag();
            }
            mesh_assoc_t     assoc;
            wifi_ap_record_t record;
            int              ie_len = 0;
            esp_mesh_scan_get_ap_ie_len(&ie_len);
            esp_mesh_scan_get_ap_record(&record, &assoc);
            LOGD(TAG, "<MESH>ssid: %s, layer:%d/%d, assoc:%d/%d, %d, " MACSTR ", channel:%u, rssi:%d, ID<" MACSTR "><%s>", record.ssid, assoc.layer, assoc.layer_cap, assoc.assoc, assoc.assoc_cap,
                 assoc.layer2_cap, MAC2STR(record.ssid), record.primary, record.rssi, MAC2STR(assoc.mesh_id), assoc.encrypted ? "IE Encrypted" : "IE Unencrypted");
            mesh_handle->mesh_rssi = record.rssi;
            break;
        }
        case MESH_EVENT_PARENT_DISCONNECTED: {
            mesh_event_disconnected_t *disconnected = (mesh_event_disconnected_t *)event_data;
            LOGI(TAG, "<MESH_EVENT_PARENT_DISCONNECTED>reason:%d", disconnected->reason);
            mesh_handle->is_mesh_connected = false;
            mesh_handle->is_got_ip = false;
            mesh_handle->mesh_layer = esp_mesh_get_layer();
            mesh_handle->logged = false;
            _mesh_report_root_status(g_periph_mesh, mesh_handle->logged, NULL);
            esp_periph_send_event(g_periph_mesh, PERIPH_MESH_PARENT_DISCONNECTED, NULL, 0);
            xEventGroupClearBits(mesh_handle->evt_group, CONNECTED_BIT);
            if (mesh_handle->attempt_find_gw) {
                esp_mesh_fix_root(true);
            }
            break;
        }
        case MESH_EVENT_LAYER_CHANGE: {
            mesh_event_layer_change_t *layer_change = (mesh_event_layer_change_t *)event_data;
            mesh_handle->mesh_layer = layer_change->new_layer;
            mesh_handle->is_mesh_connected = true;
            mesh_handle->is_root = esp_mesh_is_root();
            LOGI(TAG, "<MESH_EVENT_LAYER_CHANGE>layer:%d-->%d%s", last_layer, mesh_handle->mesh_layer, mesh_handle->is_root ? "<ROOT>" : (mesh_handle->mesh_layer == 2) ? "<layer2>" : "");
            last_layer = mesh_handle->mesh_layer;
            xEventGroupSetBits(mesh_handle->evt_group, CONNECTED_BIT);
            break;
        }
        case MESH_EVENT_CHILD_CONNECTED: {
            mesh_event_child_connected_t *child_connected = (mesh_event_child_connected_t *)event_data;
            LOGI(TAG, "<MESH_EVENT_CHILD_CONNECTED>aid: %d, " MACSTR "", child_connected->aid, MAC2STR(child_connected->mac));
            break;
        }
        case MESH_EVENT_CHILD_DISCONNECTED: {
            mesh_event_child_disconnected_t *child_disconnected = (mesh_event_child_disconnected_t *)event_data;
            LOGI(TAG, "<MESH_EVENT_CHILD_DISCONNECTED>aid: %d, " MACSTR "", child_disconnected->aid, MAC2STR(child_disconnected->mac));
            break;
        }
        case MESH_EVENT_ROUTING_TABLE_ADD: {
            mesh_event_routing_table_change_t *routing_table = (mesh_event_routing_table_change_t *)event_data;
            LOGW(TAG, "<MESH_EVENT_ROUTING_TABLE_ADD>add %d, new:%d", routing_table->rt_size_change, routing_table->rt_size_new);
            _mesh_sync_node(mesh_handle);
            break;
        }
        case MESH_EVENT_ROUTING_TABLE_REMOVE: {
            mesh_event_routing_table_change_t *routing_table = (mesh_event_routing_table_change_t *)event_data;
            LOGW(TAG, "<MESH_EVENT_ROUTING_TABLE_REMOVE>remove %d, new:%d", routing_table->rt_size_change, routing_table->rt_size_new);
            _mesh_sync_node(mesh_handle);
            break;
        }
        case MESH_EVENT_NO_PARENT_FOUND: {
            mesh_event_no_parent_found_t *no_parent = (mesh_event_no_parent_found_t *)event_data;
            LOGI(TAG, "<MESH_EVENT_NO_PARENT_FOUND>scan times:%d", no_parent->scan_times);
            /* TODO handler for the failure */
            if (mesh_handle->attempt_find_gw) {
                LOGI(TAG, "Can not find gateway, change network");
                mesh_handle->attempt_find_gw = false;
                mesh_attempts_t attempts = {
                    .scan = MESH_ATTEMPT_SCANNING_TIME,
                    .vote = MESH_ATTEMPT_VOTING_TIME,
                    .fail = MESH_ATTEMPT_FAIL_TIME,
                    .monitor_ie = MESH_ATTEMPT_MONITOR_IE,
                };
                esp_mesh_set_attempts(&attempts);
                esp_mesh_fix_root(false);
                periph_mesh_set_router(g_periph_mesh, NULL, NULL, mesh_handle->mesh_channel);
                if (g_gw_joined_info.flag) {
                    g_gw_joined_info.flag = false;
                    cfg_save_joining_gw_flag();
                }
            }
            break;
        }
    }
}

void ip_event_handler(void *arg, esp_event_base_t event_base, int32_t event_id, void *event_data) {
    ip_event_got_ip_t   *event = (ip_event_got_ip_t *)event_data;
    esp_netif_ip_info_t *ip_info = &event->ip_info;
    periph_mesh_t       *mesh_handle = (periph_mesh_t *)esp_periph_get_data(g_periph_mesh);
    LOGI(TAG, "Mesh Got IP Address");
    LOGI(TAG, "===============================");
    LOGI(TAG, "IP    :" IPSTR, IP2STR(&ip_info->ip));
    LOGI(TAG, "GW    :" IPSTR, IP2STR(&ip_info->gw));
    LOGI(TAG, "MASK  :" IPSTR, IP2STR(&ip_info->netmask));
    LOGI(TAG, "===============================");
    xEventGroupSetBits(mesh_handle->evt_group, GOTIP_BIT);
    mesh_handle->is_got_ip = true;
    mesh_handle->last_reg_tick = esp_periph_tick_get() - MESH_REGISTER_TIMEOUT_MS;
    _mesh_sync_node(mesh_handle);
}

static esp_err_t _mesh_prepare(esp_periph_handle_t self) {
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    if (!periph_mesh->is_mesh_connected) {
        LOGD(TAG, "Waiting for network...");
        vTaskDelay(500 / portTICK_RATE_MS);
        return ESP_FAIL;
    }
    if (g_gw_joined_info.flag) {
        periph_mesh->wait_gw_network_tick = esp_periph_tick_get();
    }
    if (periph_mesh->paused) {
        LOGD(TAG, "Paused....");
        vTaskDelay(500 / portTICK_RATE_MS);
        return ESP_FAIL;
    }

    if (periph_mesh->request_pause && !periph_mesh->paused) {
        periph_mesh->request_pause = false;
        periph_mesh->paused = true;
        LOGW(TAG, "Request pause");
        _mesh_ws_stop(self);
        if (periph_mesh->is_root) {
            esp_mesh_waive_root(NULL, MESH_VOTE_REASON_ROOT_INITIATED);
        }
        event_set(periph_mesh->evt_group, WS_PAUSED_BIT);
        return ESP_FAIL;
    }
    if (periph_mesh->timeout_ms == 0) {
        return ESP_OK;
    }

    if (esp_periph_tick_get() - periph_mesh->timeout_tick > periph_mesh->timeout_ms) {
        periph_mesh->timeout_tick = 0;
        periph_mesh->timeout_ms = 0;
        return ESP_OK;
    }
    return ESP_FAIL;
}

static esp_err_t _mesh_write(esp_periph_handle_t self, const char *hardware_id, uint8_t *data, int len) {
    mesh_addr_t   *dest = NULL;  // TODO = find_by_hardware_id
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);

    // Find address by hardware id
    mesh_node_t *node = _mesh_find_node_by_hw_id(&periph_mesh->mesh_list, hardware_id);
    if (node) {
        dest = (mesh_addr_t *)node->addr;
    }
    if (periph_mesh->is_root && node == NULL) {
        LOGD(TAG, "Nothing to send out");
        return ESP_FAIL;
    }

    mesh_data_t tx_data = {
        .data = data,
        .size = len,
        .proto = MESH_PROTO_BIN,
    };
    return esp_mesh_send(dest, &tx_data, MESH_DATA_P2P, NULL, 0);
}

static esp_err_t _mesh_write_by_addr(esp_periph_handle_t self, mesh_addr_t *addr, uint8_t *data, int len) {
    mesh_addr_t   *dest = addr;
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    if (periph_mesh->is_root && addr == NULL) {
        LOGD(TAG, "Nothing to send out");
        return ESP_FAIL;
    }

    mesh_data_t tx_data = {
        .data = data,
        .size = len,
        .proto = MESH_PROTO_BIN,
    };
    return esp_mesh_send(dest, &tx_data, MESH_DATA_P2P, NULL, 0);
}

esp_err_t periph_mesh_send_protobuf(esp_periph_handle_t self, const char *hardware_id, MainMessage *message) {
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    size_t         size = main_message__pack(message, (uint8_t *)periph_mesh->tx_buf);
    return _mesh_write(self, hardware_id, periph_mesh->tx_buf, size);
}

esp_err_t periph_mesh_write_protobuf(esp_periph_handle_t self, mesh_addr_t *addr, MainMessage *message) {
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    size_t         size = main_message__pack(message, (uint8_t *)periph_mesh->buffer);
    return _mesh_write_by_addr(self, (mesh_addr_t *)addr, (uint8_t *)periph_mesh->buffer, size);
}

static esp_err_t _mesh_report_onchange(esp_periph_handle_t self, bool is_connected, mesh_addr_t *addr, const char *hardware_id) {
    MeshOnChangedMessage meshOnChangedMessage = MESH_ON_CHANGED_MESSAGE__INIT;
    MeshMessage          meshMessage = MESH_MESSAGE__INIT;
    MainMessage          mainMessage = MAIN_MESSAGE__INIT;

    meshMessage.meshonchangedmessage = &meshOnChangedMessage;
    mainMessage.meshmessage = &meshMessage;
    meshOnChangedMessage.serverconnected = is_connected;
    if (addr) {
        return periph_mesh_write_protobuf(self, addr, &mainMessage);
    }
    if (hardware_id) {
        meshOnChangedMessage.hardwareid = (char *)hardware_id;
        return periph_mesh_enqueue_protobuf(self, &mainMessage);
    }
    return ESP_FAIL;
}

static esp_err_t _mesh_report_disconnect(esp_periph_handle_t self, mesh_addr_t *addr) {
    periph_mesh_t        *periph_mesh = esp_periph_get_data(self);
    MeshDisconnectMessage meshDisconnectMessage = MESH_DISCONNECT_MESSAGE__INIT;
    MeshMessage           meshMessage = MESH_MESSAGE__INIT;
    MainMessage           mainMessage = MAIN_MESSAGE__INIT;

    meshMessage.meshdisconnectmessage = &meshDisconnectMessage;
    mainMessage.meshmessage = &meshMessage;
    meshDisconnectMessage.rootchannel = periph_mesh->mesh_channel;

    if (addr) {
        return periph_mesh_write_protobuf(self, addr, &mainMessage);
    }
    return ESP_OK;
}

static esp_err_t _ws_write(periph_mesh_t *periph_mesh, char *data, int len) {
    if ((!periph_mesh->is_ws_started) || (!periph_mesh->is_ws_connected)) return ESP_FAIL;
    return websocket_client_send(periph_mesh->ws_client, (const char *)data, len, portMAX_DELAY);
}

esp_err_t periph_mesh_ws_send_protobuf(esp_periph_handle_t self, int *sz, MainMessage *message) {
    esp_err_t      err;
    char          *data_encode = NULL;
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    size_t         size = main_message__pack(message, (uint8_t *)periph_mesh->buffer);
    if (periph_mesh->ws_data_type == WS_DATA_BASE64) {
        int    data_sz;
        size_t n;
        mbedtls_base64_encode(NULL, 0, &n, (const unsigned char *)periph_mesh->buffer, size);
        data_encode = malloc(n + 1);
        ERROR_CHECKW(IS_NULL(data_encode), "Error allocate, memory exhausted?", return ESP_FAIL);
        mbedtls_base64_encode((unsigned char *)data_encode, n, (size_t *)&data_sz, (const unsigned char *)periph_mesh->buffer, size);
        if ((err = _ws_write(periph_mesh, data_encode, data_sz)) != ESP_OK) {
            goto _exit;
        }
    } else if (periph_mesh->ws_data_type == WS_DATA_BINARY) {
        if ((err = _ws_write(periph_mesh, periph_mesh->buffer, size)) != ESP_OK) {
            goto _exit;
        }
    }
    if (sz) {
        *sz = size;
    }
_exit:
    if (data_encode) free(data_encode);
    return ESP_OK;
}

esp_err_t periph_mesh_enqueue_protobuf(esp_periph_handle_t self, MainMessage *message) {
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    size_t         size = main_message__pack(message, (uint8_t *)periph_mesh->buffer);
    return periph_mesh_enqueue(self, periph_mesh->buffer, size, MY_MESSAGE);
}

esp_err_t _http_event_handler(esp_http_client_event_t *evt) {
    esp_periph_handle_t self = evt->user_data;
    periph_mesh_t      *periph_mesh = esp_periph_get_data(self);
    switch (evt->event_id) {
        case HTTP_EVENT_ON_CONNECTED:
            LOGW(TAG, "HTTP_EVENT_ON_CONNECTED");
            break;
        case HTTP_EVENT_ERROR:
        case HTTP_EVENT_DISCONNECTED:
            LOGW(TAG, "HTTP_EVENT_DISCONNECTED");
            // int mbedtls_err = 0;
            // esp_err_t err = esp_tls_get_and_clear_last_error(evt->data, &mbedtls_err, NULL);
            // if (err != 0) {
            //     LOGE(TAG, "Last esp error code: %s", esp_err_to_name(err));
            //     LOGE(TAG, "Last mbedtls failure: 0x%x", mbedtls_err); //ESP_ERR_ESP_TLS_CONNECTION_TIMEOUT
            // }
            break;
        case HTTP_EVENT_ON_DATA:
            LOGD(TAG, "HTTP_EVENT_ON_DATA, len=%d, data %s", evt->data_len, (char *)evt->data);
            if (!esp_http_client_is_chunked_response(evt->client)) {
                ws_datatype_t ws_data_type;
                char          ws_url[50];
                char         *data = (char *)evt->data;
                data[evt->data_len] = 0;
                char *url = json_get_token_value(data, "wsEndpoint");
                if (url == NULL) {
                    strcpy(ws_url, DEVICE_WEBSOCKET_ENDPOINT);
                } else {
                    strcpy(ws_url, url);
                }
                LOGW(TAG, "ws_url: %s", ws_url);
                periph_mesh->is_receive_ep = true;

                char *data_type = json_get_token_value(data, "dataType");
                if (data_type == NULL) {
                    ws_data_type = WS_DATA_BINARY;
                } else {
                    if (strcmp(data_type, "BASE64") == 0) {
                        ws_data_type = WS_DATA_BASE64;
                    } else {
                        ws_data_type = WS_DATA_BINARY;
                    }
                }
                LOGW(TAG, "ws_data_type: %d", ws_data_type);
                char *token = json_get_token_value(data, "deviceToken");
                if (token != NULL) {
                    LOGW(TAG, "Got token = %s", token);
                    // send mesh response to NODE by hardware id
                    MeshRegisterResponse meshRegisterResponse = MESH_REGISTER_RESPONSE__INIT;
                    meshRegisterResponse.hardwareid = periph_mesh->login_request_id;
                    meshRegisterResponse.devicetoken = token;
                    meshRegisterResponse.wsenpoint = ws_url;
                    meshRegisterResponse.datatype = ws_data_type == WS_DATA_BASE64 ? DATA_TYPE__BASE64 : DATA_TYPE__BINARIES;

                    MeshMessage meshMessage = MESH_MESSAGE__INIT;
                    meshMessage.meshregisterresponse = &meshRegisterResponse;

                    MainMessage mainRspMessage = MAIN_MESSAGE__INIT;
                    mainRspMessage.meshmessage = &meshMessage;
                    periph_mesh_enqueue_protobuf(self, &mainRspMessage);
                    free(token);
                    free(periph_mesh->login_request_id);
                    periph_mesh->login_request_id = NULL;
                } else {
                    LOGE(TAG, "error get token, %s", data);
                }
            }
            break;
        default:
            LOGD(TAG, "%d", evt->event_id);
            break;
    }
    return ESP_OK;
}

static esp_err_t _mesh_http_register(esp_periph_handle_t self, const char *hardware_id, const char *model, const char *reg_token, char *output_ws_url, ws_datatype_t *output_ws_datatype) {
    periph_mesh_t           *periph_mesh = esp_periph_get_data(self);
    esp_http_client_handle_t http_client = NULL;
    if (reg_token == NULL || hardware_id == NULL || model == NULL) {
        LOGE(TAG, "reg_token required");
        return ESP_FAIL;
    }
    if (!periph_mesh->is_got_ip) return ESP_OK;
    tct_arguments *args = NULL;
    tct_add_argument(args, "http_url", "%s", periph_mesh->http_url);
    tct_add_argument(args, "reg_token", "%s", reg_token);
    tct_add_argument(args, "model", "%s", model);
    tct_add_argument(args, "hw_id", "%s", hardware_id);
    char *reg_url = tct_render((char *)periph_mesh->register_template, args);
    tct_free_argument(args);
    if (reg_url == NULL) return ESP_FAIL;
    if (periph_mesh->ws_client == NULL) goto _exit_reg;
    _mesh_ws_stop(self);
    LOGI(TAG, "REG url=%s", reg_url);
    esp_http_client_config_t http_cfg = {
        .url = reg_url,
        .method = HTTP_METHOD_POST,
        .buffer_size = 1024,
        .event_handler = _http_event_handler,
        .user_data = self,
        .timeout_ms = 5 * 1000,
    };
    http_client = esp_http_client_init(&http_cfg);
    PERIPH_MEM_CHECK(TAG, http_client, goto _exit_reg);
    esp_http_client_set_header(http_client, "Content-Type", "application/json");
    esp_http_client_set_header(http_client, "Accept", "*/*");
    esp_http_client_set_header(http_client, "x-wait-done", "true");
    if (esp_http_client_perform(http_client) != ESP_OK) {
        LOGE(TAG, "Error register device");
        goto _exit_reg;
    }
_exit_reg:
    free(reg_url);
    if (http_client) {
        LOGW(TAG, "http cleanup ...");
        esp_http_client_cleanup(http_client);
    }
    return ESP_OK;
}

static esp_err_t _mesh_register(esp_periph_handle_t self) {
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    // If device has token, send register to root node
    // If device does't have the token, send register and resend if timeout
    if (periph_mesh->is_root && !periph_mesh->is_got_ip) {
        return ESP_FAIL;
    }

    if (periph_mesh->logged) {
        return ESP_OK;
    }

    if (periph_mesh->is_receive_ep) {
        return ESP_OK;
    }

    if (esp_periph_tick_get() > periph_mesh->last_reg_tick + MESH_REGISTER_TIMEOUT_MS) {
        vTaskDelay(1000 / portTICK_RATE_MS);
        periph_mesh->is_registered = true;

        MeshRegisterRequest meshRegisterRequest = MESH_REGISTER_REQUEST__INIT;
        meshRegisterRequest.hardwareid = periph_mesh->hardware_id;
        meshRegisterRequest.deviceid = periph_mesh->access_id;
        meshRegisterRequest.model = periph_mesh->model;
        meshRegisterRequest.regtoken = periph_mesh->reg_token;
        meshRegisterRequest.devicetoken = "";
        meshRegisterRequest.fwversion = FIRMWARE_VERSION;

        MeshMessage meshMessage = MESH_MESSAGE__INIT;
        meshMessage.meshregisterrequest = &meshRegisterRequest;

        MainMessage mainMessage = MAIN_MESSAGE__INIT;
        mainMessage.meshmessage = &meshMessage;

        periph_mesh->last_reg_tick = esp_periph_tick_get();
        periph_mesh_enqueue_protobuf(self, &mainMessage);
    }
    return ESP_FAIL;
}

static void _mesh_receiver_task(void *pv) {
    esp_periph_handle_t self = pv;
    periph_mesh_t      *periph_mesh = esp_periph_get_data(self);
    mesh_addr_t         from;
    mesh_data_t         rx_data = {
                .data = periph_mesh->rx_buf,
                .size = DEFAULT_MESH_RX_BUFSZ,
                .proto = MESH_PROTO_BIN,
    };
    int flag = 0;
    xEventGroupClearBits(periph_mesh->evt_group, MESH_RECV_STOPPED_BIT);
    int32_t mesh_log_timeout = MESH_LOG_TIMEOUT + esp_random() % 3000;

    while (periph_mesh->run) {
        if ((periph_mesh->paused) || (!periph_mesh->is_mesh_connected)) {
            LOGD(TAG, "Paused....");
            vTaskDelay(500 / portTICK_RATE_MS);
            continue;
        }
        if (periph_mesh->logged) {
            if (esp_periph_tick_get() - periph_mesh->mesh_log_tick > mesh_log_timeout) {
                char *message = NULL;
                message = _mesh_generate_log_message(periph_mesh, "RESPONSE FREQUENCE");
                periph_mesh_response_log(self, TAG, message);
                periph_mesh->mesh_log_tick = esp_periph_tick_get();
                free(message);
            }
        }
        rx_data.size = DEFAULT_MESH_RX_BUFSZ;
        esp_err_t err = esp_mesh_recv(&from, &rx_data, 100 / portTICK_RATE_MS, &flag, NULL, 0);
        if (err != ESP_OK || rx_data.size <= 0) {
            continue;
        }
        if (periph_mesh->is_root) {
            LOGD(TAG, "ROOT: received %d bytes from " MACSTR, rx_data.size, MAC2STR(from.addr));
            periph_mesh_enqueue(self, (char *)rx_data.data, (int)rx_data.size, MESH_MESSAGE);
        } else {
            LOGD(TAG, "NODE: received %d bytes ROOT", rx_data.size);
            periph_mesh_enqueue(self, (char *)rx_data.data, (int)rx_data.size, MY_MESSAGE);
        }
    }
    xEventGroupSetBits(periph_mesh->evt_group, MESH_RECV_STOPPED_BIT);
    vTaskDelete(NULL);
}

static esp_err_t _mesh_report_root_status(esp_periph_handle_t self, bool is_connected, const char *hardware_id) {
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    mesh_node_t   *node;

    STAILQ_FOREACH(node, &periph_mesh->mesh_list, next) {
        if (!node->mine && esp_periph_tick_get() - node->last_login_tick > MESH_LOGIN_TIMEOUT_MS) {
            node->last_login_tick = esp_periph_tick_get();
            if (hardware_id && node->hardware_id) {
                if (strcmp(hardware_id, node->hardware_id) == 0) {
                    LOGD(TAG, "Enqueuing mesh on change message, and send to %s", node->hardware_id);
                    return _mesh_report_onchange(self, is_connected, NULL, node->hardware_id);
                }
            } else {
                LOGD(TAG, "Enqueuing mesh on change message, and send to " MACSTR, MAC2STR(node->addr));
                _mesh_report_onchange(self, is_connected, (mesh_addr_t *)node->addr, NULL);
            }
        }
    }
    return ESP_OK;
}

static esp_err_t _mesh_login(esp_periph_handle_t self) {
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);

    if (periph_mesh->logged) {
        return ESP_OK;
    }

    if (periph_mesh->is_root && !websocket_client_is_connected(periph_mesh->ws_client)) {
        return ESP_FAIL;
    }

    _mutex_lock(periph_mesh->lock);
    if (IS_NOT_STR(periph_mesh->access_key) || IS_NOT_STR(periph_mesh->access_id) || IS_NOT_STR(periph_mesh->device_token)) {
        _mesh_set_timeout(self, MESH_NETWORK_TIMEOUT_MS);
        _mutex_unlock(periph_mesh->lock);
        LOGW(TAG, "Invalid key/id");
        vTaskDelay(100 / portTICK_RATE_MS);
        check_and_waive_root(self);
        return ESP_FAIL;
    }
    _mutex_unlock(periph_mesh->lock);

    if (esp_periph_tick_get() < periph_mesh->last_login_tick + MESH_LOGIN_TIMEOUT_MS) {
        return ESP_OK;
    }

    if (esp_periph_tick_get() - periph_mesh->login_random_tick < periph_mesh->login_random_ms) {
        return ESP_OK;
    }

    LoginServerRequest loginRequest = LOGIN_SERVER_REQUEST__INIT;
    loginRequest.accesskey = periph_mesh->access_key;
    loginRequest.deviceid = periph_mesh->access_id;
    loginRequest.loggedip = NULL;
    loginRequest.signal = 0;

    loginRequest.brandname = BRANDNAME;
    loginRequest.model = periph_mesh->model;
    loginRequest.group = periph_mesh->model_group;
    loginRequest.firmware = FIRMWARE_VERSION;
    loginRequest.hardware = periph_mesh->hw_version ? periph_mesh->hw_version : HARDWARE_VERSION;

    loginRequest.devicetoken = periph_mesh->device_token;
    loginRequest.mdns = periph_mesh->hardware_id;
    loginRequest.hardwareid = periph_mesh->hardware_id;
    loginRequest.reactivity = periph_mesh->reactivity;
    loginRequest.brightness = periph_mesh->brightness;
    loginRequest.timedelay = periph_mesh->time_delay;
    loginRequest.sceneactivemap = periph_mesh->sceneActiveMap;

    AuthServerMessage authServerMessage = AUTH_SERVER_MESSAGE__INIT;
    authServerMessage.loginserverrequest = &loginRequest;
    ServerMessage serverMessage = SERVER_MESSAGE__INIT;
    serverMessage.authservermessage = &authServerMessage;
    MainMessage mainMessage = MAIN_MESSAGE__INIT;
    mainMessage.servermessage = &serverMessage;

    periph_mesh->last_login_tick = esp_periph_tick_get();
    periph_mesh->login_random_ms = esp_random() % 1000;
    return periph_mesh_enqueue_protobuf(self, &mainMessage);
}

static esp_err_t _mesh_ws_connect(esp_periph_handle_t self) {
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    if (!periph_mesh->is_root) {
        LOGD(TAG, "Not root mesh_ws_stop");
        _mesh_ws_stop(self);
        return ESP_OK;
    }
    if (periph_mesh->is_root && (IS_NOT_STR(periph_mesh->access_key) || IS_NOT_STR(periph_mesh->access_id) || IS_NOT_STR(periph_mesh->device_token))) {
        LOGW(TAG, "Invalid key/id");
        check_and_waive_root(self);
        _mesh_set_timeout(self, MESH_NETWORK_TIMEOUT_MS);
        return ESP_FAIL;
    }
    if (periph_mesh->req_change_ws_url) {
        periph_mesh->req_change_ws_url = false;
        _mesh_ws_stop(self);
        websocket_client_set_uri(periph_mesh->ws_client, periph_mesh->ws_url);
        LOGE(TAG, "Connect ws: %s, %d", periph_mesh->ws_url, sys_cfg.ws_data_type);
    }
    if (periph_mesh->is_ws_started) return ESP_OK;
    if (!websocket_client_is_connected(periph_mesh->ws_client)) {
        periph_mesh->is_ws_started = true;
        LOGW(TAG, "ws start request");
        periph_mesh->network_tick = esp_periph_tick_get();
        websocket_client_start(periph_mesh->ws_client);
        event_clear(periph_mesh->evt_group, WS_PAUSED_BIT);
    }
    return ESP_OK;
}

static esp_err_t _socket_enqueue_rx_message(esp_periph_handle_t self, uint8_t *data, size_t size) {
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    if ((size == 0) || (size > DEFAULT_MESH_RX_BUFSZ) || (data == NULL)) return ESP_FAIL;
    if (xRingbufferSend(periph_mesh->rx_rb, data, size, 100 / portTICK_RATE_MS) != pdTRUE) {
        LOGE(TAG, "Error rx enqueuing...");
        return ESP_FAIL;
    }
    return ESP_OK;
}

static void websocket_event_handler(void *handler_args, esp_event_base_t base, int32_t event_id, void *event_data) {
    esp_periph_handle_t self = handler_args;
    periph_mesh_t      *periph_mesh = esp_periph_get_data(self);
    switch (event_id) {
        case WEBSOCKET_EVENT_CONNECTED:
            LOGD(TAG, "WEBSOCKET_EVENT_CONNECTED");
            periph_mesh->is_ws_connected = true;
            periph_mesh->logged = false;
            periph_mesh->invalid_key_counter = 0;
            esp_periph_send_event(self, PERIPH_MESH_WS_CONNECTED, NULL, 0);
            periph_mesh->last_login_tick = esp_periph_tick_get() - MESH_LOGIN_TIMEOUT_MS;
            periph_mesh->network_tick = esp_periph_tick_get();
            _mesh_sync_node(periph_mesh);
            event_set(periph_mesh->evt_group, WS_CONNECTED_BIT);
            break;
        case WEBSOCKET_EVENT_DISCONNECTED:
            LOGD(TAG, "WEBSOCKET_EVENT_DISCONNECTED");
            periph_mesh->is_ws_connected = false;
            periph_mesh->logged = false;
            _mesh_reset_node(periph_mesh);
            _mesh_report_root_status(self, periph_mesh->logged, NULL);
            event_set(periph_mesh->evt_group, WS_DISCONNECTED_BIT);
            break;
        case WEBSOCKET_EVENT_DATA: {
            websocket_event_data_t *data = (websocket_event_data_t *)event_data;
            if (data->op_code == 0x08 && data->data_len == 2) {
                LOGW(TAG, "Received closed message with code=%d", 256 * data->data_ptr[0] + data->data_ptr[1]);
            } else if (data->op_code == 0x0a) {
                LOGD(TAG, "PONG received");
                periph_mesh->network_tick = esp_periph_tick_get();
            } else {
                LOGD(TAG, "Received=%.*s", data->data_len, (char *)data->data_ptr);
                periph_mesh->network_tick = esp_periph_tick_get();
                if (periph_mesh->ws_data_type == WS_DATA_BASE64) {
                    int    data_sz;
                    size_t n = 0;
                    mbedtls_base64_decode(NULL, 0, &n, (const unsigned char *)data->data_ptr, data->data_len);
                    char *data_decode = malloc(n + 1);
                    ERROR_CHECKW(IS_NULL(data_decode), "Error allocate, memory exhausted?", return);
                    mbedtls_base64_decode((unsigned char *)data_decode, n, (size_t *)&data_sz, (const unsigned char *)data->data_ptr, data->data_len);
                    //_mesh_process_data(self, (const uint8_t *)data_decode, (size_t)data_sz);
                    _socket_enqueue_rx_message(self, (uint8_t *)data_decode, data_sz);
                    free(data_decode);
                } else if (periph_mesh->ws_data_type == WS_DATA_BINARY) {
                    _socket_enqueue_rx_message(self, (uint8_t *)data->data_ptr, data->data_len);
                    //_mesh_process_data(self, rx_data, (size_t)data->data_len);
                }
            }
            break;
        }
        case WEBSOCKET_EVENT_ERROR:
            LOGW(TAG, "WEBSOCKET_EVENT_ERROR");
            event_set(periph_mesh->evt_group, WS_DISCONNECTED_BIT);
            break;
        case WEBSOCKET_EVENT_CLOSED:
            LOGW(TAG, "WEBSOCKET_EVENT_CLOSED");
            event_set(periph_mesh->evt_group, WS_DISCONNECTED_BIT);
            break;
    }
}

static esp_err_t _mesh_request_change_ws_url(esp_periph_handle_t self) {
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    if (!periph_mesh->is_root) return ESP_FAIL;
    periph_mesh->req_change_ws_url = true;
    LOGI(TAG, "Request change ws uri to: %s", periph_mesh->ws_url);
    return ESP_OK;
}

static esp_err_t _mesh_process_common_message(esp_periph_handle_t self, MainMessage *mainMessage) {
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    esp_err_t      err = ESP_OK;

    if (mainMessage->servermessage && mainMessage->servermessage->deviceservermessage && mainMessage->servermessage->deviceservermessage->registerdeviceserverresponse) {
        RegisterDeviceServerResponse *regResponse = mainMessage->servermessage->deviceservermessage->registerdeviceserverresponse;

        LOGW(TAG, "HWID: %s, Register response: %s (code %ld), token: %s, EP: %s, dataType: %d", regResponse->hardwareid ? regResponse->hardwareid : "", regResponse->statuscode->message,
             regResponse->statuscode->code, regResponse->devicetoken, regResponse->wsenpoint, regResponse->datatype);
        MeshRegisterResponse meshRegisterResponse = MESH_REGISTER_RESPONSE__INIT;
        meshRegisterResponse.hardwareid = regResponse->hardwareid;
        meshRegisterResponse.devicetoken = regResponse->devicetoken;
        meshRegisterResponse.statuscode = regResponse->statuscode;
        meshRegisterResponse.wsenpoint = regResponse->wsenpoint;
        meshRegisterResponse.datatype = regResponse->datatype;

        MeshMessage meshMessage = MESH_MESSAGE__INIT;
        meshMessage.meshregisterresponse = &meshRegisterResponse;

        MainMessage mainRspMessage = MAIN_MESSAGE__INIT;
        mainRspMessage.meshmessage = &meshMessage;
        return periph_mesh_enqueue_protobuf(self, &mainRspMessage);
    }

    // Login request
    if (mainMessage->servermessage && mainMessage->servermessage->authservermessage && mainMessage->servermessage->authservermessage->loginserverrequest) {
        LoginServerRequest *loginRequest = mainMessage->servermessage->authservermessage->loginserverrequest;

        mesh_node_t *node = _mesh_find_node_by_hw_id(&periph_mesh->mesh_list, loginRequest->hardwareid);
        if (node) {
            free(node->hardware_id);
            node->hardware_id = strdup(loginRequest->hardwareid);
            free(node->device_id);
            node->device_id = loginRequest->deviceid ? strdup(loginRequest->deviceid) : NULL;
            node->last_login_tick = esp_periph_tick_get();
            // _mesh_print(&periph_mesh->mesh_list);
        }

        if (periph_mesh->is_root) {
            if ((!periph_mesh->logged && strcmp(periph_mesh->hardware_id, loginRequest->hardwareid) == 0) || (periph_mesh->logged && strcmp(periph_mesh->hardware_id, loginRequest->hardwareid) != 0)) {
                LOGD(TAG, "ROOT: send loginRequest to SERVER");
                loginRequest->gatewayid = periph_mesh->hardware_id;
                _mesh_print_login(loginRequest);
                err = periph_mesh_ws_send_protobuf(self, NULL, mainMessage);
            }
        } else {
            LOGD(TAG, "NODE: send loginRequest to ROOT");
            err = periph_mesh_send_protobuf(self, NULL, mainMessage);
        }
        loginRequest->gatewayid = NULL;
        return err;
    }

    // Login response
    if (mainMessage && mainMessage->servermessage && mainMessage->servermessage->authservermessage && mainMessage->servermessage->authservermessage->loginserverresponse) {
        LoginServerResponse *loginResponse = mainMessage->servermessage->authservermessage->loginserverresponse;

        LOGW(TAG, "HWID: %s, Login response: %s (%ld), keepalive=%ld", loginResponse->hardwareid ? loginResponse->hardwareid : "", loginResponse->statuscode->message, loginResponse->statuscode->code,
             loginResponse->keepalive);

        if (loginResponse->statuscode->code == 209) {
            if (strstr(sys_cfg.ws_url, DEVICE_WEBSOCKET_ENDPOINT) == NULL) {
                LOGE(TAG, "Error login reson (209). Change to default ws_url: %s", DEVICE_WEBSOCKET_ENDPOINT);
                periph_mesh->ws_url = DEVICE_WEBSOCKET_ENDPOINT;
                periph_mesh->ws_data_type = WS_DATA_BINARY;
                strcpy(sys_cfg.ws_url, periph_mesh->ws_url);
                sys_cfg.ws_data_type = periph_mesh->ws_data_type;
                _mesh_request_change_ws_url(self);
                cfg_save();
            }
        }

        mesh_node_t *node = _mesh_find_node_by_hw_id(&periph_mesh->mesh_list, loginResponse->hardwareid);
        if (node && loginResponse->statuscode->code == 0) {
            node->logged = true;
            // _mesh_print(&periph_mesh->mesh_list);
        }

        if (strcmp(loginResponse->hardwareid, periph_mesh->hardware_id) == 0) {
            LOGD(TAG, "loginResponse");
            if (loginResponse->statuscode->code == 0) {
                periph_mesh->logged = true;
                // esp_websocket_client_set_keepalive(periph_mesh->ws_client, loginResponse->keepalive);
                LOGI(TAG, "LOGGED");
                if (loginResponse->loggeddate) {
                    LOGD(TAG, "timestamp: %lld", loginResponse->loggeddate);
                    time_t logged_time = loginResponse->loggeddate;
                    esp_periph_send_event(self, PERIPH_MESH_LOGGED, &logged_time, sizeof(time_t));
                } else {
                    esp_periph_send_event(self, PERIPH_MESH_LOGGED, NULL, 0);
                }
            } else {
                LOGE(TAG, "Login error response: %s (%ld)", loginResponse->statuscode->message, loginResponse->statuscode->code);
                periph_mesh->logged = false;
            }
            // Report status to NODE
            if (periph_mesh->is_root) {
                return _mesh_report_root_status(self, periph_mesh->logged, NULL);
            }
        }

        if (periph_mesh->is_root) {
            LOGD(TAG, "ROOT: Forward loginResponse to NODE");
            return periph_mesh_send_protobuf(self, loginResponse->hardwareid, mainMessage);
        }
        return ESP_OK;
    }

    // Firmware force update
    if (mainMessage && mainMessage->clientmessage && mainMessage->clientmessage->deviceclientmessage && mainMessage->clientmessage->deviceclientmessage->forceupdatefirmwaredeviceclientrequest) {
        LOGE(TAG, "Force update");
        ForceUpdateFirmwareDeviceClientRequest *forceOtaReq = mainMessage->clientmessage->deviceclientmessage->forceupdatefirmwaredeviceclientrequest;
        if (periph_mesh_is_mine(self, forceOtaReq->hardwareid)) {
            return set_force_ota_timer(5 * 1000);
        } else if (periph_mesh->is_root) {
            return periph_mesh_send_protobuf(self, forceOtaReq->hardwareid, mainMessage);
        }
        return ESP_OK;
    }

    if (mainMessage && mainMessage->clientmessage && mainMessage->clientmessage->onchangedclientmessage && mainMessage->clientmessage->onchangedclientmessage->deviceonchangeddeviceclientresponse) {
        if (periph_mesh->is_root) {
            LOGD(TAG, "ROOT: Send deviceonchangeddeviceclientresponse to server");
            return periph_mesh_ws_send_protobuf(self, NULL, mainMessage);
        }
        return ESP_OK;
    }

    if (mainMessage && mainMessage->clientmessage && mainMessage->clientmessage->onchangedclientmessage && mainMessage->clientmessage->onchangedclientmessage->debugloggingresponse) {
        if (periph_mesh->is_root) {
            LOGD(TAG, "ROOT: Send debugloggingresponse to server");
            return periph_mesh_ws_send_protobuf(self, NULL, mainMessage);
        } else {
            LOGD(TAG, "NODE: send debugloggingresponse to ROOT");
            return periph_mesh_send_protobuf(self, NULL, mainMessage);
        }
        return ESP_OK;
    }

    if (mainMessage && mainMessage->clientmessage && mainMessage->clientmessage->deviceclientmessage && mainMessage->clientmessage->deviceclientmessage->updatedeviceclientresponse) {
        if (periph_mesh->is_root) {
            LOGD(TAG, "ROOT: Send updatedeviceclientresponse to server");
            return periph_mesh_ws_send_protobuf(self, NULL, mainMessage);
        } else {
            LOGD(TAG, "NODE: send updatedeviceclientresponse to ROOT");
            return periph_mesh_send_protobuf(self, NULL, mainMessage);
        }
        return ESP_OK;
    }

    if (mainMessage && mainMessage->clientmessage && mainMessage->clientmessage->sceneclientmessage && mainMessage->clientmessage->sceneclientmessage->sceneclientrequest) {
        SceneClientRequest *sceneClientRequest = mainMessage->clientmessage->sceneclientmessage->sceneclientrequest;
        if (periph_mesh_is_mine(self, sceneClientRequest->hardwareid)) {
            if (sceneClientRequest->n_target != 1) {
                return ESP_ERR_NOT_SUPPORTED;
            }

            char         *source_hwid = NULL;
            char         *target_hwid = NULL;
            int           source_switcher = 0;
            int           target_switcher = 0;
            device_type_t target_type = DEVICE_UNKNOWN;
            if (sceneClientRequest && sceneClientRequest->source && sceneClientRequest->source->switcher) {
                Switcher *source = sceneClientRequest->source->switcher;
                source_hwid = source->device->hardwareid;
                if (source_hwid == NULL || !periph_mesh_is_mine(self, source_hwid)) {
                    LOGE(TAG, "[Scene Bridge] Source SWITCH id was null or not of this device");
                    return ESP_ERR_INVALID_ARG;
                }
                source_switcher = source->switcher;
            } else if (sceneClientRequest && sceneClientRequest->source && sceneClientRequest->source->motion) {
                Motion *source = sceneClientRequest->source->motion;
                source_hwid = source->device->hardwareid;
                if (source_hwid == NULL || !periph_mesh_is_mine(self, source_hwid)) {
                    LOGE(TAG, "[Scene Bridge] Source MOTION id was null or not of this device");
                    return ESP_ERR_INVALID_ARG;
                }
                source_switcher = 1;
            }

            if (sceneClientRequest && sceneClientRequest->target[0] && sceneClientRequest->target[0]->switcher) {
                Switcher *target = sceneClientRequest->target[0]->switcher;
                target_hwid = target->device->hardwareid;
                if (target_hwid == NULL) {
                    LOGE(TAG, "[Scene Bridge] Target SWITCH was null");
                    return ESP_ERR_INVALID_ARG;
                }
                target_switcher = target->switcher;
                target_type = TOUCH_SWITCH;
            } else if (sceneClientRequest && sceneClientRequest->target[0]->motion) {
                Motion *target = sceneClientRequest->target[0]->motion;
                target_hwid = target->device->hardwareid;
                if (target_hwid == NULL) {
                    LOGE(TAG, "[Scene Bridge] Target MOTION was null");
                    return ESP_ERR_INVALID_ARG;
                }
                target_switcher = 1;
                target_type = MOTION_SENSOR;
            }

            LOGI(TAG, "[Scene Bridge] source %s[%d] target %s[%d] mode=%ld", source_hwid, source_switcher, target_hwid, target_switcher, sceneClientRequest->mode);

            BridgeInfo bridgeInfo = BRIDGE_INFO__INIT;
            bridgeInfo.targetswitcher = target_switcher;
            bridgeInfo.targethardwareid = target_hwid;
            bridgeInfo.bridgetype = sceneClientRequest->type;
            if (target_type == TOUCH_SWITCH) {
                bridgeInfo.devicetype = GROUP_DEVICE__SwitcherGroup;
            } else if (target_type == MOTION_SENSOR) {
                bridgeInfo.devicetype = GROUP_DEVICE__MotionGroup;
            }
            // add or edit
            if (sceneClientRequest->mode == 1 || sceneClientRequest->mode == 2) {
                esp_periph_send_event(self, PERIPH_MESH_SET_BRIDGE, &bridgeInfo, source_switcher);

                // remove
            } else if (sceneClientRequest->mode == 3) {
                esp_periph_send_event(self, PERIPH_MESH_REMOVE_BRIDGE, &bridgeInfo, source_switcher);
            }

            if (sceneClientRequest->activetime) {
                esp_periph_send_event(self, PERIPH_MESH_SET_ACTIVE_TIME, (void *)sceneClientRequest->activetime, sizeof(ActiveTime));
            }

            MainMessage         replyMainMessage = MAIN_MESSAGE__INIT;
            ClientMessage       replyClientMessage = CLIENT_MESSAGE__INIT;
            SceneClientMessage  replySceneClientMessage = SCENE_CLIENT_MESSAGE__INIT;
            SceneClientResponse replySceneClientResponse = SCENE_CLIENT_RESPONSE__INIT;

            StatusCode responseCode = STATUS_CODE__INIT;
            responseCode.code = 0;
            responseCode.message = "Success";
            replySceneClientResponse.statuscode = &responseCode;
            replySceneClientResponse.sceneid = sceneClientRequest->sceneid;
            replySceneClientResponse.switcher = NULL;
            replySceneClientResponse.mode = sceneClientRequest->mode;

            replySceneClientMessage.sceneclientresponse = &replySceneClientResponse;
            replyClientMessage.sceneclientmessage = &replySceneClientMessage;
            replyMainMessage.clientmessage = &replyClientMessage;

            return periph_mesh_enqueue_protobuf(self, &replyMainMessage);
        } else if (periph_mesh->is_root) {
            LOGD(TAG, "ROOT: Forward sceneClientRequest to NODE");
            return periph_mesh_send_protobuf(self, sceneClientRequest->hardwareid, mainMessage);
        }
        return ESP_OK;
    }

    if (mainMessage && mainMessage->clientmessage && mainMessage->clientmessage->sceneclientmessage && mainMessage->clientmessage->sceneclientmessage->sceneclientresponse) {
        if (periph_mesh->is_root) {
            LOGD(TAG, "ROOT: Send SceneClientResponse to server");
            return periph_mesh_ws_send_protobuf(self, NULL, mainMessage);
        } else {
            LOGD(TAG, "NODE: send SceneClientResponse to ROOT");
            return periph_mesh_send_protobuf(self, NULL, mainMessage);
        }
        return ESP_OK;
    }

    if (mainMessage && mainMessage->clientmessage && mainMessage->clientmessage->deviceclientmessage && mainMessage->clientmessage->deviceclientmessage->updatewsendpointclientrequest) {
        UpdateWSEndpointClientRequest *updateWSEndpointClientRequest = mainMessage->clientmessage->deviceclientmessage->updatewsendpointclientrequest;

        if (updateWSEndpointClientRequest->deviceid == NULL) {
            LOGD(TAG, "hardwareid NULLED");
            return ESP_ERR_INVALID_ARG;
        }

        LOGD(TAG, "updateWSEndpointServerRequest to %s", updateWSEndpointClientRequest->deviceid);

        if (periph_mesh_is_mine(self, updateWSEndpointClientRequest->deviceid)) {
            LOGD(TAG, "updateWSEndpointServerRequest, EP=%s", updateWSEndpointClientRequest->wsenpoint);
        } else if (periph_mesh_is_root(self)) {
            LOGD(TAG, "ROOT| Forward updateWSEndpointServerRequest to NODE %s", updateWSEndpointClientRequest->deviceid);
            periph_mesh_send_protobuf(self, updateWSEndpointClientRequest->deviceid, mainMessage);
        }

        return ESP_OK;
    }

    return ESP_ERR_NOT_SUPPORTED;
}

static esp_err_t _mesh_process_mesh_message(esp_periph_handle_t self, MainMessage *mainMessage) {
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);

    // MESH Register respones (Node)
    if (mainMessage->meshmessage && mainMessage->meshmessage->meshregisterresponse) {
        LOGD(TAG, "NODE receive meshRegisterResponse from ROOT");
        MeshRegisterResponse *meshRegisterResponse = mainMessage->meshmessage->meshregisterresponse;

        if (meshRegisterResponse->hardwareid && strcmp(meshRegisterResponse->hardwareid, periph_mesh->hardware_id) == 0) {
            free(periph_mesh->device_token);
            periph_mesh->device_token = meshRegisterResponse->devicetoken && meshRegisterResponse->devicetoken[0] ? strdup(meshRegisterResponse->devicetoken) : NULL;
            if (meshRegisterResponse->datatype != NULL) {
                if (meshRegisterResponse->datatype == DATA_TYPE__BINARIES) {
                    periph_mesh->ws_data_type = WS_DATA_BINARY;
                } else if (meshRegisterResponse->datatype == DATA_TYPE__BASE64) {
                    periph_mesh->ws_data_type = WS_DATA_BASE64;
                    // periph_mesh->ws_data_type = WS_DATA_BINARY;
                }
                LOGI(TAG, "Update ws data type: %d", periph_mesh->ws_data_type);
            } else {
                periph_mesh->ws_data_type = WS_DATA_BINARY;
            }
            if (periph_mesh->device_token) {
                strcpy(sys_cfg.device_token, periph_mesh->device_token);
                cfg_save();
                _mesh_force_set_timeout(self, 0);
            }
            if (meshRegisterResponse->wsenpoint != NULL && strcmp(meshRegisterResponse->wsenpoint, "") != 0) {
                strcpy(periph_mesh->ws_url, meshRegisterResponse->wsenpoint);
                if (strcmp(periph_mesh->ws_url, sys_cfg.ws_url) != 0) {
                    LOGI(TAG, "EP was changed to: %s", periph_mesh->ws_url);
                    strcpy(sys_cfg.ws_url, periph_mesh->ws_url);
                    sys_cfg.ws_data_type = periph_mesh->ws_data_type;
                    cfg_save();
                    _mesh_request_change_ws_url(self);
                }
            }
            periph_mesh->is_receive_ep = true;
        } else {
            return periph_mesh_send_protobuf(self, meshRegisterResponse->hardwareid, mainMessage);
        }
        return ESP_OK;
    }

    // MESH Register request (Root)
    if (mainMessage->meshmessage && mainMessage->meshmessage->meshregisterrequest) {
        MeshRegisterRequest *meshRegisterRequest = mainMessage->meshmessage->meshregisterrequest;

        if (meshRegisterRequest->hardwareid == NULL) {
            return ESP_ERR_INVALID_ARG;
        }
        if (periph_mesh->is_root) {
            LOGI(TAG, "ROOT receive meshRegisterRequest from NODE %s", meshRegisterRequest->hardwareid);
            if (IS_STR(meshRegisterRequest->devicetoken)) {
                LOGI(TAG, "ROOT: NODE has token %s", meshRegisterRequest->devicetoken);
                return ESP_OK;
            }
            mesh_node_t *node = _mesh_find_node_by_hw_id(&periph_mesh->mesh_list, meshRegisterRequest->hardwareid);
            if (node) {
                free(node->hardware_id);
                node->hardware_id = meshRegisterRequest->hardwareid ? strdup(meshRegisterRequest->hardwareid) : NULL;
                node->device_id = meshRegisterRequest->deviceid ? strdup(meshRegisterRequest->deviceid) : NULL;
                // _mesh_print(&periph_mesh->mesh_list);
                if (IS_STR(meshRegisterRequest->devicetoken)) {
                    return _mesh_report_root_status(self, periph_mesh->logged, meshRegisterRequest->hardwareid);
                }
            }
            if (websocket_client_is_connected(periph_mesh->ws_client)) {
                MainMessage                 mainMessageReg = MAIN_MESSAGE__INIT;
                ServerMessage               serverMessageReg = SERVER_MESSAGE__INIT;
                DeviceServerMessage         deviceServerMessageReg = DEVICE_SERVER_MESSAGE__INIT;
                RegisterDeviceServerRequest registerDeviceServerRequest = REGISTER_DEVICE_SERVER_REQUEST__INIT;

                registerDeviceServerRequest.hardwareid = meshRegisterRequest->hardwareid;
                registerDeviceServerRequest.mantoken = meshRegisterRequest->regtoken;
                registerDeviceServerRequest.model = meshRegisterRequest->model;
                registerDeviceServerRequest.firmware = meshRegisterRequest->fwversion;

                deviceServerMessageReg.registerdeviceserverrequest = &registerDeviceServerRequest;
                serverMessageReg.deviceservermessage = &deviceServerMessageReg;
                mainMessageReg.servermessage = &serverMessageReg;
                return periph_mesh_ws_send_protobuf(self, NULL, &mainMessageReg);
            }
            if (periph_mesh->login_request_id == NULL) {
                periph_mesh->login_request_id = strdup(meshRegisterRequest->hardwareid);
            }
            _mesh_http_register(self, meshRegisterRequest->hardwareid, meshRegisterRequest->model, meshRegisterRequest->regtoken, NULL, NULL);
        } else {
            LOGD(TAG, "NODE|MESH send meshRegisterRequest to ROOT");
            return periph_mesh_send_protobuf(self, NULL, mainMessage);
        }
        return ESP_OK;
    }

    if (!periph_mesh->is_root && mainMessage->meshmessage && mainMessage->meshmessage->meshonchangedmessage) {
        MeshOnChangedMessage *meshOnChangedMessage = mainMessage->meshmessage->meshonchangedmessage;
        LOGD(TAG, "NODE|MESH receive meshOnChangedMessage from ROOT: %ld", meshOnChangedMessage->serverconnected);
        periph_mesh->logged = false;
        if (meshOnChangedMessage->serverconnected == 0) {
            esp_periph_send_event(self, PERIPH_MESH_WS_DISCONNECTED, NULL, 0);
            periph_mesh->is_got_ip = false;
        } else {
            periph_mesh->is_got_ip = true;
            _mesh_force_set_timeout(self, 0);
            periph_mesh->last_login_tick = esp_periph_tick_get() - MESH_LOGIN_TIMEOUT_MS;
            periph_mesh->login_random_tick = esp_periph_tick_get();
        }
        return ESP_OK;
    }

    if (periph_mesh->is_root && mainMessage->meshmessage && mainMessage->meshmessage->meshonchangedmessage) {
        MeshOnChangedMessage *meshOnChangedMessage = mainMessage->meshmessage->meshonchangedmessage;

        LOGD(TAG, "ROOT|MESH forward meshOnChangedMessage to NODE: %ld", meshOnChangedMessage->serverconnected);
        return periph_mesh_send_protobuf(self, meshOnChangedMessage->hardwareid, mainMessage);
    }

    if (!periph_mesh->is_root && mainMessage->meshmessage && mainMessage->meshmessage->meshdisconnectmessage) {
        LOGD(TAG, "NODE|MESH receive meshdisconnectmessage from ROOT");
        int mesh_channel = 1 + mainMessage->meshmessage->meshdisconnectmessage->rootchannel;
        periph_mesh->mesh_channel = mesh_channel > 5 ? DEFAULT_MESH_CHANNEL : mesh_channel;

        mesh_attempts_t attempts = {
            .scan = MESH_ATTEMPT_SCANNING_TIME,
            .vote = MESH_ATTEMPT_VOTING_TIME,
            .fail = MESH_ATTEMPT_FAIL_TIME,
            .monitor_ie = MESH_ATTEMPT_MONITOR_IE,
        };
        esp_mesh_set_attempts(&attempts);
        esp_mesh_fix_root(false);
        periph_mesh_set_router(g_periph_mesh, NULL, NULL, periph_mesh->mesh_channel);
        return ESP_OK;
    }

    return ESP_ERR_NOT_SUPPORTED;
}

static esp_err_t _mesh_process_ota_message(esp_periph_handle_t self, MainMessage *mainMessage) {
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    esp_err_t      err = ESP_OK;
    if (mainMessage && mainMessage->servermessage && mainMessage->servermessage->onchangedservermessage &&
        mainMessage->servermessage->onchangedservermessage->downloadfirmwareonchangeddeviceserverresponse) {
        DownloadFirmwareOnChangedDeviceServerResponse *download = mainMessage->servermessage->onchangedservermessage->downloadfirmwareonchangeddeviceserverresponse;

        // LOGI(TAG, "DownloadFirmwareOnChangedDeviceServerResponse");
        if (download->hardwareid && strcmp(download->hardwareid, periph_mesh->hardware_id) == 0) {
            return periph_mesh_ota_process(self, periph_mesh->ota, download);
        } else {
            xEventGroupClearBits(periph_mesh->evt_group, MESH_OTA_BIT);
            err = periph_mesh_send_protobuf(self, download->hardwareid, mainMessage);
            EventBits_t evb = xEventGroupWaitBits(periph_mesh->evt_group, MESH_OTA_BIT, false, true, 5000 / portTICK_RATE_MS);
            if (evb & MESH_OTA_BIT) {
                return err;
            }
            LOGE(TAG, "Error wait for ACK from NODE");
            return ESP_ERR_TIMEOUT;
        }
        return ESP_OK;
    }

    if (mainMessage && mainMessage->clientmessage && mainMessage->clientmessage->onchangedclientmessage &&
        mainMessage->clientmessage->onchangedclientmessage->progressupdatefirmwareonchangeddeviceclientresponse) {
        ProgressUpdateFirmwareOnChangedDeviceClientResponse *response = mainMessage->clientmessage->onchangedclientmessage->progressupdatefirmwareonchangeddeviceclientresponse;
        xEventGroupSetBits(periph_mesh->evt_group, MESH_OTA_BIT);
        // LOGI(TAG, "ProgressUpdateFirmwareOnChangedDeviceClientResponse");

        LOGD(TAG, "err code = %ld, total=%ld, idx=%ld", response->statuscode->code, response->totalpage, response->pageindex);
        if (periph_mesh->is_root) {
            if (response->statuscode->code != 0 || response->totalpage == (response->pageindex + 1)) {
                LOGD(TAG, "ROOT: send progress to SERVER");
                return periph_mesh_ws_send_protobuf(self, NULL, mainMessage);
            }
            // response->gatewayid = periph_mesh->hardware_id;
            return ESP_OK;

        } else {
            LOGD(TAG, "NODE: send progress to ROOT");
            return periph_mesh_send_protobuf(self, NULL, mainMessage);
        }
        // response->gatewayid = NULL;
        return ESP_OK;
    }

    return ESP_ERR_NOT_SUPPORTED;
}

static esp_err_t _mesh_process_unknown_message(esp_periph_handle_t self, MainMessage *mainMessage) {
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    esp_err_t      err = ESP_OK;
    if (mainMessage && mainMessage->clientmessage) {
        if (periph_mesh->is_root) {
            LOGD(TAG, "ROOT: send progress unknown to SERVER");
            err = periph_mesh_ws_send_protobuf(self, NULL, mainMessage);
        } else {
            LOGD(TAG, "NODE: send progress unknows to ROOT");
            err = periph_mesh_send_protobuf(self, NULL, mainMessage);
        }
    }
    return err;
}

static esp_err_t _mesh_process_data(esp_periph_handle_t self, const uint8_t *data, size_t sz) {
    // periph_mesh_t *periph_mesh = esp_periph_get_data(self);

    // printf("\r\n");
    LOGD(TAG, "processing %d bytes", sz);

    MainMessage *mainMessage = main_message__unpack(NULL, (size_t)sz, (const uint8_t *)data);
    if (mainMessage == NULL) {
        LOGE(TAG, "Can not parse message");
        return ESP_OK;
    }
    // _mutex_lock(periph_mesh->lock);

    esp_err_t err = ESP_ERR_NOT_SUPPORTED;
    err &= _mesh_process_common_message(self, mainMessage);
    err &= _mesh_process_ota_message(self, mainMessage);
    err &= _mesh_process_mesh_message(self, mainMessage);
    err &= periph_mesh_remote_process_message(self, mainMessage);
    err &= periph_mesh_aircond_process_message(self, mainMessage);
    err &= periph_mesh_touch_process_message(self, mainMessage);
    err &= periph_mesh_curtain_process_message(self, mainMessage);
    err &= periph_mesh_pir_process_message(self, mainMessage);
    // if (err == ESP_ERR_NOT_SUPPORTED) {
    //     _mesh_process_unknown_message(self, mainMessage);
    // }
    // _mutex_unlock(periph_mesh->lock);
    // printf("\r\n");
    main_message__free_unpacked(mainMessage, NULL);

    return ESP_OK;
}

static esp_err_t _mesh_process_rb(esp_periph_handle_t self) {
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);

    size_t    item_sz;
    esp_err_t err = ESP_OK;

    void *item = xRingbufferReceive(periph_mesh->my_rb, &item_sz, 50 / portTICK_RATE_MS);
    if (item != NULL) {
        err = _mesh_process_data(self, item, item_sz);
        vRingbufferReturnItem(periph_mesh->my_rb, item);
    }

    item = xRingbufferReceive(periph_mesh->rb, &item_sz, 50 / portTICK_RATE_MS);
    if (item != NULL) {
        err |= _mesh_process_data(self, item, item_sz);
        vRingbufferReturnItem(periph_mesh->rb, item);
    }

    item = xRingbufferReceive(periph_mesh->rx_rb, &item_sz, 50 / portTICK_RATE_MS);
    if (item != NULL) {
        err |= _mesh_process_data(self, item, item_sz);
        vRingbufferReturnItem(periph_mesh->rx_rb, item);
    }

    return err;
}

void _mesh_task(void *pv) {
    esp_periph_handle_t self = pv;
    periph_mesh_t      *periph_mesh = esp_periph_get_data(self);
    xEventGroupClearBits(periph_mesh->evt_group, MESH_STOPPED_BIT);

    const websocket_client_config_t websocket_cfg = {
        .uri = periph_mesh->ws_url,
        .user_context = (void *)self,
        .keep_alive_interval = periph_mesh->ws_keepalive,
        .task_stack = 4 * 1024,
        .buffer_size = 1 * 1024,
    };
    LOGW(TAG, "keep_alive_interval %d", periph_mesh->ws_keepalive);
    periph_mesh->ws_client = websocket_client_init(&websocket_cfg);
    websocket_register_events(periph_mesh->ws_client, WEBSOCKET_EVENT_ANY, websocket_event_handler, (void *)self);

    periph_mesh->login_random_ms = esp_random() % 1000;
    periph_mesh->login_random_tick = esp_periph_tick_get();
    periph_mesh->network_tick = esp_periph_tick_get();
    while (periph_mesh->run) {
        vTaskDelay(100 / portTICK_RATE_MS);
        AWAIT(_mesh_prepare(self));
        AWAIT(_mesh_register(self));
        AWAIT(_mesh_ws_connect(self));
        AWAIT(_mesh_login(self));
        AWAIT(_mesh_check_logged_node(self));
    }
    xEventGroupSetBits(periph_mesh->evt_group, MESH_STOPPED_BIT);
    vTaskDelete(NULL);
}

void _mesh_process_rb_task(void *pv) {
    esp_periph_handle_t self = pv;
    periph_mesh_t      *periph_mesh = esp_periph_get_data(self);
    while (periph_mesh->run) {
        _mesh_process_rb(self);
    }
    vTaskDelete(NULL);
}

static char *_mesh_ap_password(const char *password) {
    char *outpass = NULL;
    asprintf(&outpass, "sunshine-%s", password ? password : "");
    return outpass;
}

esp_err_t _mesh_network_deinit(periph_mesh_t *periph_mesh) {
    if (!periph_mesh->is_start) return ESP_OK;
    periph_mesh->is_start = false;
    LOGW(TAG, "<-NETWORK DEINIT->");
    ESP_ERROR_CHECK(esp_mesh_disconnect());
    ESP_ERROR_CHECK(esp_mesh_stop());
    ESP_ERROR_CHECK(esp_mesh_deinit());
    ESP_ERROR_CHECK(esp_wifi_disconnect());
    ESP_ERROR_CHECK(esp_wifi_stop());
    ESP_ERROR_CHECK(esp_wifi_deinit());
    return ESP_OK;
}

esp_err_t _mesh_network_init(periph_mesh_t *periph_mesh) {
    if (periph_mesh->is_start) return ESP_OK;
    periph_mesh->is_start = true;
    LOGW(TAG, "<-NETWORK INIT->");
    wifi_init_config_t config = WIFI_INIT_CONFIG_DEFAULT();
    ESP_ERROR_CHECK(esp_wifi_init(&config));
    ESP_ERROR_CHECK(esp_wifi_set_storage(WIFI_STORAGE_RAM));
    ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_STA));
    ESP_ERROR_CHECK(esp_wifi_set_ps(WIFI_PS_NONE));
    ESP_ERROR_CHECK(esp_mesh_set_6m_rate(false));
    ESP_ERROR_CHECK(esp_wifi_start());

    /*  mesh initialization */
    ESP_ERROR_CHECK(esp_mesh_init());
    ESP_ERROR_CHECK(esp_mesh_set_max_layer(10));
    ESP_ERROR_CHECK(esp_mesh_set_ap_connections(5));
    ESP_ERROR_CHECK(esp_mesh_set_vote_percentage(1));
    ESP_ERROR_CHECK(esp_mesh_set_ap_assoc_expire(10));
    ESP_ERROR_CHECK(esp_mesh_set_capacity_num(512));

    mesh_cfg_t cfg = MESH_INIT_CONFIG_DEFAULT();
    _mesh_get_id((uint8_t *)&cfg.mesh_id, periph_mesh->ssid, periph_mesh->password, periph_mesh->mesh_channel, 1, periph_mesh->attempt_find_gw);

    cfg.router.ssid_len = strlen(periph_mesh->ssid);
    memcpy((uint8_t *)&cfg.router.ssid, periph_mesh->ssid, cfg.router.ssid_len);
    if (periph_mesh->password) {
        memcpy((uint8_t *)&cfg.router.password, periph_mesh->password, strlen(periph_mesh->password));
    }
    cfg.allow_channel_switch = true;
    cfg.router.allow_router_switch = true;
    memset((uint8_t *)&cfg.router.bssid, '\0', 6);

    /* mesh softAP */
    ESP_ERROR_CHECK(esp_mesh_set_ap_authmode(WIFI_AUTH_WPA_WPA2_PSK));
    cfg.mesh_ap.max_connection = 5;

    char *ap_pass = _mesh_ap_password(periph_mesh->password);
    if (ap_pass) {
        sprintf((char *)&cfg.mesh_ap.password, "%s", ap_pass);
        free(ap_pass);
    }
    ESP_ERROR_CHECK(esp_mesh_set_config(&cfg));
    // Check flag and assign to child node type if join to gateway network
    if (periph_mesh->attempt_find_gw) {
        esp_mesh_fix_root(true);
    }
    /* Setup attempt parameters to speed up building network */
    mesh_attempts_t attempts = {
        .scan = MESH_ATTEMPT_SCANNING_TIME,
        .vote = MESH_ATTEMPT_VOTING_TIME,
        .fail = MESH_ATTEMPT_FAIL_TIME,
        .monitor_ie = MESH_ATTEMPT_MONITOR_IE,
    };
    if (periph_mesh->joined_gw_flag) {
        attempts.fail = MESH_ATTEMPT_FAIL_TIME_GW;
    }
    esp_mesh_set_attempts(&attempts);

    ESP_ERROR_CHECK(esp_mesh_start());
    LOGD(TAG, "mesh starts successfully, heap:%ld, %s\n", esp_get_free_heap_size(), esp_mesh_is_root_fixed() ? "root fixed" : "root not fixed");
    int8_t tx_power;
    esp_wifi_get_max_tx_power(&tx_power);
    esp_wifi_set_max_tx_power(80);
    LOGI(TAG, "Mesh connect to ssid %s password %s tx power %ddb -> 20db", periph_mesh->ssid, periph_mesh->password, (uint8_t)((float)tx_power * 0.25));
    return ESP_OK;
}

static esp_err_t _mesh_init(esp_periph_handle_t self) {
    if (g_periph_mesh == NULL) return ESP_FAIL;
    LOGI(TAG, "Memory free: %d", heap_caps_get_free_size(MALLOC_CAP_INTERNAL));
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    ESP_ERROR_CHECK(esp_netif_init());
    ESP_ERROR_CHECK(esp_event_loop_create_default());
    ESP_ERROR_CHECK(esp_netif_create_default_wifi_mesh_netifs(&netif_sta, NULL));
    ESP_ERROR_CHECK(esp_event_handler_register(IP_EVENT, IP_EVENT_STA_GOT_IP, &ip_event_handler, NULL));
    ESP_ERROR_CHECK(esp_event_handler_register(MESH_EVENT, ESP_EVENT_ANY_ID, &mesh_event_handler, NULL));
    _mesh_network_init(periph_mesh);
    STAILQ_INIT(&periph_mesh->mesh_list);
#if CONFIG_WIFI_POWER_SAVE
    esp_wifi_set_ps(WIFI_PS_MIN_MODEM);
#endif
    if (!periph_mesh->run) {
        periph_mesh->run = true;
        BaseType_t xReturned = pdPASS;
        xReturned = xTaskCreate(_mesh_task, "mesh", 3 * 1024, self, 5, NULL);
        ERROR_CHECKW(xReturned != pdPASS, "Error create mesh, memory exhausted?", return ESP_FAIL);
        xReturned = xTaskCreate(_mesh_receiver_task, "mesh_recv", 3 * 1024, self, 5, NULL);
        ERROR_CHECKW(xReturned != pdPASS, "Error create mesh_recv, memory exhausted?", return ESP_FAIL);
        xReturned = xTaskCreate(_mesh_process_rb_task, "mesh_process_rb", 8 * 1024, self, 5, NULL);
        ERROR_CHECKW(xReturned != pdPASS, "Error create mesh_process_rb, memory exhausted?", return ESP_FAIL);
    }
    LOGI(TAG, "Memory free: %d", heap_caps_get_free_size(MALLOC_CAP_INTERNAL));
    return ESP_OK;
}

static esp_err_t _mesh_run(esp_periph_handle_t self, audio_event_iface_msg_t *msg) { return ESP_OK; }

static esp_err_t _mesh_destroy(esp_periph_handle_t self) {
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    periph_mesh->run = false;
    free(periph_mesh->buffer);
    free(periph_mesh->mac_bufer);
    free(periph_mesh->rx_buf);
    free(periph_mesh->tx_buf);
    free(periph_mesh->ssid);
    free(periph_mesh->password);
    free(periph_mesh->device_token);
    free(periph_mesh->hardware_id);
    free(periph_mesh->access_id);
    free(periph_mesh->access_key);
    free(periph_mesh->model);
    free(periph_mesh->hw_version);
    free(periph_mesh->register_template);
    free(periph_mesh->reg_token);
    free(periph_mesh->ws_url);
    free(periph_mesh->http_url);
    _mutex_destroy(periph_mesh->lock);
    if (periph_mesh->evt_group) {
        vEventGroupDelete(periph_mesh->evt_group);
    }
    if (periph_mesh->rb) {
        vRingbufferDelete(periph_mesh->rb);
    }
    if (periph_mesh->my_rb) {
        vRingbufferDelete(periph_mesh->my_rb);
    }
    _mesh_clear_node(&periph_mesh->mesh_list);

    return ESP_OK;
}

esp_periph_handle_t periph_mesh_init(periph_mesh_cfg_t *config) {
    esp_periph_handle_t periph = esp_periph_create(PERIPH_ID_MESH, config->tag ? config->tag : "periph_mesh");
    PERIPH_MEM_CHECK(TAG, periph, return NULL);
    periph_mesh_t *periph_mesh = calloc(1, sizeof(periph_mesh_t));
    PERIPH_MEM_CHECK(TAG, periph_mesh, goto _init_mesh_failed);
    periph_mesh->mesh_channel = config->mesh_channel ? config->mesh_channel : DEFAULT_MESH_CHANNEL;

    periph_mesh->evt_group = xEventGroupCreate();
    PERIPH_MEM_CHECK(TAG, periph_mesh->evt_group, goto _init_mesh_failed);
    event_clear(periph_mesh->evt_group, CONNECTED_BIT | GOTIP_BIT | MESH_OTA_BIT | WS_CONNECTED_BIT | WS_DISCONNECTED_BIT);
    event_set(periph_mesh->evt_group, MESH_STOPPED_BIT);
    event_set(periph_mesh->evt_group, MESH_RECV_STOPPED_BIT);
    event_set(periph_mesh->evt_group, WS_PAUSED_BIT);

    periph_mesh->buffer = malloc(DEFAULT_MESH_BUFSZ);
    PERIPH_MEM_CHECK(TAG, periph_mesh->buffer, goto _init_mesh_failed);

    periph_mesh->mac_bufer = malloc(DEFAULT_MESH_BUFSZ);
    PERIPH_MEM_CHECK(TAG, periph_mesh->mac_bufer, goto _init_mesh_failed);

    periph_mesh->rx_buf = malloc(DEFAULT_MESH_RX_BUFSZ);
    PERIPH_MEM_CHECK(TAG, periph_mesh->rx_buf, goto _init_mesh_failed);

    periph_mesh->tx_buf = malloc(DEFAULT_MESH_RX_BUFSZ);
    PERIPH_MEM_CHECK(TAG, periph_mesh->tx_buf, goto _init_mesh_failed);

    periph_mesh->ssid = config->ssid ? strdup(config->ssid) : NULL;
    periph_mesh->password = config->password ? strdup(config->password) : NULL;
    periph_mesh->joined_gw_flag = config->joined_gw_flag;
    periph_mesh->attempt_find_gw = config->attempt_find_gw_first;

    periph_mesh->device_token = IS_STR(config->device_token) ? strdup(config->device_token) : NULL;
    periph_mesh->hardware_id = IS_STR(config->hardware_id) ? strdup(config->hardware_id) : NULL;
    periph_mesh->access_id = IS_STR(config->access_id) ? strdup(config->access_id) : NULL;
    periph_mesh->access_key = IS_STR(config->access_key) ? strdup(config->access_key) : NULL;
    periph_mesh->model = IS_STR(config->model) ? strdup(config->model) : NULL;
    periph_mesh->hw_version = IS_STR(config->hw_version) ? strdup(config->hw_version) : NULL;
    periph_mesh->http_url = IS_STR(config->http_url) ? strdup(config->http_url) : NULL;
    periph_mesh->ws_url = IS_STR(config->ws_url) ? strdup(config->ws_url) : NULL;
    periph_mesh->reg_token = IS_STR(config->reg_token) ? strdup(config->reg_token) : NULL;
    periph_mesh->register_template = IS_STR(config->register_template) ? strdup(config->register_template) : NULL;
    periph_mesh->ws_data_type = (ws_datatype_t)config->ws_data_type;

    periph_mesh->ws_keepalive = WS_KEEPALIVE;
    periph_mesh->request_pause = false;
    periph_mesh->is_receive_ep = false;
    periph_mesh->req_change_ws_url = false;
    periph_mesh->reactivity = config->reactivity;
    periph_mesh->brightness = config->brightness;
    periph_mesh->sceneActiveMap = config->sceneActiveMap;
    periph_mesh->time_delay = config->time_delay;
    periph_mesh->lock = _mutex_create();
    periph_mesh->model_group = config->model_group;
    periph_mesh->ota = periph_mesh_ota_init();
    periph_mesh->mesh_log_tick = esp_periph_tick_get();
    periph_mesh->is_ws_started = false;
    periph_mesh->is_ws_connected = false;
    periph_mesh->is_start = false;

    periph_mesh->rb = xRingbufferCreate(DEFAULT_MESH_RINGBUFFER_SIZE, RINGBUF_TYPE_NOSPLIT);
    PERIPH_MEM_CHECK(TAG, periph_mesh->rb, goto _init_mesh_failed);

    periph_mesh->my_rb = xRingbufferCreate(DEFAULT_MY_RINGBUFFER_SIZE, RINGBUF_TYPE_NOSPLIT);
    PERIPH_MEM_CHECK(TAG, periph_mesh->my_rb, goto _init_mesh_failed);

    periph_mesh->rx_rb = xRingbufferCreate(DEFAULT_MY_RINGBUFFER_SIZE, RINGBUF_TYPE_NOSPLIT);
    PERIPH_MEM_CHECK(TAG, periph_mesh->rx_rb, goto _init_mesh_failed);

    LOGD(TAG, "Mesh init, ssid:%s, pass:%s", periph_mesh->ssid ? periph_mesh->ssid : "", periph_mesh->password ? periph_mesh->password : "");

    esp_periph_set_data(periph, periph_mesh);
    esp_periph_set_function(periph, _mesh_init, _mesh_run, _mesh_destroy);
    g_mesh = periph_mesh;
    g_periph_mesh = periph;
    return periph;
_init_mesh_failed:
    LOGE(TAG, "Init mesh failed");
    _mesh_destroy(periph);
    free(periph);
    return NULL;
}

esp_err_t periph_mesh_stop(esp_periph_handle_t periph, TickType_t tick) {
    VALIDATE_MESH(periph, ESP_FAIL);
    periph_mesh_t *periph_mesh = esp_periph_get_data(periph);
    LOGW(TAG, "Mesh request stop...");
    periph_mesh->request_pause = true;
    EVEN_CHECK(periph_mesh->evt_group, WS_PAUSED_BIT, 60000 / portTICK_RATE_MS, return ESP_FAIL, "websocket stop fail");
    _mesh_network_deinit(periph_mesh);
    EVEN_CHECK(periph_mesh->evt_group, MESH_STOPPED_BIT, 60000 / portTICK_RATE_MS, return ESP_FAIL, "mesh stop fail");
    return ESP_OK;
}

esp_err_t periph_mesh_start(esp_periph_handle_t periph) {
    VALIDATE_MESH(periph, ESP_FAIL);
    periph_mesh_t *periph_mesh = esp_periph_get_data(periph);
    LOGW(TAG, "Mesh request start...");
    _mesh_set_timeout(periph, 0);
    _mesh_network_init(periph_mesh);
    event_clear(periph_mesh->evt_group, MESH_STOPPED_BIT);
    periph_mesh->request_pause = false;
    periph_mesh->paused = false;
    periph_mesh->logged = false;
    periph_mesh->last_reg_tick = esp_periph_tick_get();
    return ESP_OK;
}

esp_err_t periph_mesh_enqueue(esp_periph_handle_t periph, char *data, int data_len, message_type_t message_type) {
    VALIDATE_MESH(periph, ESP_ERR_INVALID_ARG);
    periph_mesh_t *periph_mesh = esp_periph_get_data(periph);

    if (data_len > DEFAULT_MESH_RINGBUFFER_SIZE) {
        return -1;
    }
    if (message_type == MY_MESSAGE) {
        if (xRingbufferSend(periph_mesh->my_rb, data, data_len, 100 / portTICK_RATE_MS) != pdTRUE) {
            LOGE(TAG, "Error enqueuing my_rb...");
            return ESP_FAIL;
        }
    } else if (message_type == MESH_MESSAGE) {
        if (xRingbufferSend(periph_mesh->rb, data, data_len, 100 / portTICK_RATE_MS) != pdTRUE) {
            LOGE(TAG, "Error enqueuing rb...");
            size_t item_sz;
            void  *item = xRingbufferReceive(periph_mesh->rb, &item_sz, 50 / portTICK_RATE_MS);
            vRingbufferReturnItem(periph_mesh->rb, item);
            return ESP_FAIL;
        }
    }
    return ESP_OK;
}

esp_err_t periph_mesh_response_device_state(esp_periph_handle_t periph, int status) {
    VALIDATE_MESH(periph, ESP_FAIL);
    periph_mesh_t *periph_mesh = esp_periph_get_data(periph);

    UpdateDeviceClientResponse updateDeviceClientResponse = UPDATE_DEVICE_CLIENT_RESPONSE__INIT;
    updateDeviceClientResponse.deviceid = periph_mesh->access_id ? periph_mesh->access_id : "";

    StatusCode responseCode = STATUS_CODE__INIT;
    responseCode.code = status;
    responseCode.message = "Success";
    updateDeviceClientResponse.statuscode = &responseCode;

    DeviceClientMessage deviceClientMessage = DEVICE_CLIENT_MESSAGE__INIT;
    deviceClientMessage.updatedeviceclientresponse = &updateDeviceClientResponse;

    ClientMessage clientMessage = CLIENT_MESSAGE__INIT;
    clientMessage.deviceclientmessage = &deviceClientMessage;

    MainMessage mainMessage = MAIN_MESSAGE__INIT;
    mainMessage.clientmessage = &clientMessage;
    return periph_mesh_enqueue_protobuf(periph, &mainMessage);
}

esp_err_t periph_mesh_set_auth_token(esp_periph_handle_t periph, const char *access_id, const char *access_key) {
    LOGI(TAG, "config id/key for mesh");
    VALIDATE_MESH(periph, ESP_ERR_INVALID_ARG);
    periph_mesh_t *periph_mesh = esp_periph_get_data(periph);
    free(periph_mesh->access_id);
    free(periph_mesh->access_key);
    periph_mesh->access_id = NULL;
    periph_mesh->access_key = NULL;
    if (access_id || access_key) {
        periph_mesh->logged = false;
    }
    if (access_id) {
        periph_mesh->access_id = strdup(access_id);
        PERIPH_MEM_CHECK(TAG, periph_mesh->access_id, return ESP_ERR_NO_MEM);
    }
    if (access_key) {
        periph_mesh->access_key = strdup(access_key);
        PERIPH_MEM_CHECK(TAG, periph_mesh->access_key, return ESP_ERR_NO_MEM);
    }
    return ESP_OK;
}

esp_err_t periph_mesh_set_router(esp_periph_handle_t periph, char *ssid, char *password, int channel) {
    VALIDATE_MESH(periph, ESP_ERR_INVALID_ARG);
    periph_mesh_t *periph_mesh = esp_periph_get_data(periph);
    periph_mesh->wait_gw_network_tick = esp_periph_tick_get();
    mesh_router_t newinfo = {0};
    // New router
    if (ssid && password) {
        LOGI(TAG, "Setup new router");
        periph_mesh->ssid = ssid ? strdup(ssid) : periph_mesh->ssid;
        periph_mesh->password = password ? strdup(password) : periph_mesh->password;
    }
    strcpy((char *)newinfo.ssid, periph_mesh->ssid);
    strcpy((char *)newinfo.password, periph_mesh->password);
    newinfo.ssid_len = strlen(periph_mesh->ssid);
    LOGI(TAG, "About to call set router org ssid[%s] password[%s] len[%d]", newinfo.ssid, newinfo.password, newinfo.ssid_len);
    esp_err_t err = esp_mesh_set_router(&newinfo);
    char     *ap_pass = _mesh_ap_password(periph_mesh->password);
    if (ap_pass) {
        esp_mesh_set_ap_password((const uint8_t *)ap_pass, strlen(ap_pass));
        free(ap_pass);
    }
    esp_mesh_disconnect();
    mesh_addr_t mesh_id;
    _mesh_get_id((uint8_t *)&mesh_id, (const char *)periph_mesh->ssid, (const char *)periph_mesh->password, channel, 1, periph_mesh->attempt_find_gw);
    esp_mesh_set_id(&mesh_id);
    esp_mesh_set_self_organized(true, true);
    LOGI(TAG, "Finished set router err [%d = %s]", err, esp_err_to_name(err));
    return err;
}

static void force_ota_timer_callback(TimerHandle_t timer) {
    if (g_ota_timer) {
        xTimerStop(g_ota_timer, portMAX_DELAY);
        xTimerDelete(g_ota_timer, portMAX_DELAY);
        g_ota_timer = NULL;
    }
    if (g_periph_mesh == NULL) {
        return;
    }
    periph_mesh_t *mesh_handle = (periph_mesh_t *)esp_periph_get_data(g_periph_mesh);
    if (mesh_handle->is_root) {
        LOGE(TAG, "force_ota_timer_callback");
        periph_mesh_stop(g_periph_mesh, portMAX_DELAY);
        esp_mesh_disconnect();
    }
    mesh_addr_t mesh_id;
    _mesh_get_id((uint8_t *)&mesh_id, (const char *)mesh_handle->hardware_id, (const char *)mesh_handle->hardware_id, mesh_handle->mesh_channel, 2, false);
    esp_mesh_set_id(&mesh_id);
    xEventGroupClearBits(mesh_handle->evt_group, GOTIP_BIT);
    if (mesh_handle->got_ip_timeout_ms == 0) {
        mesh_handle->got_ip_timeout_ms = 1000 * 60 * 3;
    }
    EventBits_t evb = xEventGroupWaitBits(mesh_handle->evt_group, GOTIP_BIT, false, true, mesh_handle->got_ip_timeout_ms / portTICK_RATE_MS);
    if ((evb & GOTIP_BIT) == 0) {
        vTaskDelay(1000 / portTICK_PERIOD_MS);
        esp_restart();
    }
    mesh_handle->got_ip_timeout_ms = 0;
    esp_periph_send_event(g_periph_mesh, PERIPH_MESH_FORCE_UPDATE_OTA, NULL, 0);
}

static esp_err_t set_force_ota_timer(int timeout) {
    if (g_ota_timer == NULL) {
        g_ota_timer = xTimerCreate("sys_timer", timeout / portTICK_RATE_MS, pdFALSE, NULL, force_ota_timer_callback);
        if (g_ota_timer == NULL) {
            LOGE(TAG, "Error creating timer");
            return ESP_FAIL;
        }
        if (xTimerStart(g_ota_timer, 0) != pdTRUE) {
            LOGE(TAG, "Error to start saving timer");
            return ESP_FAIL;
        }
    }
    return ESP_OK;
}

esp_err_t periph_mesh_force_default_ota(const char *ssid, const char *password, int timeout_ms) {
    if (g_periph_mesh == NULL) {
        return ESP_FAIL;
    }
    periph_mesh_t *mesh_handle = (periph_mesh_t *)esp_periph_get_data(g_periph_mesh);
    LOGI(TAG, "Mesh force ota, connect to SSID=%s, pass=%s", ssid, password);
    mesh_router_t mesh_router = {0};
    mesh_router.ssid_len = strlen(ssid);
    sprintf((char *)&mesh_router.ssid, "%s", ssid);
    if (password) {
        sprintf((char *)&mesh_router.password, "%s", password);
    }
    if (esp_mesh_set_router(&mesh_router) != ESP_OK) {
        return ESP_FAIL;
    }
    mesh_handle->got_ip_timeout_ms = timeout_ms;
    set_force_ota_timer(1000);
    return ESP_OK;
}

esp_err_t periph_mesh_set_touch_state(esp_periph_handle_t self, const char *dev_hw_id, int switcher, bool state) {
    VALIDATE_MESH(self, ESP_FAIL);
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    mesh_node_t   *node = _mesh_find_node_by_dev_id(&periph_mesh->mesh_list, dev_hw_id);
    if (node == NULL) {
        node = _mesh_find_node_by_hw_id(&periph_mesh->mesh_list, dev_hw_id);
    }
    if (node == NULL) {
        return ESP_FAIL;
    }
    int ch = switcher - 1;
    if (ch < 0 || ch >= MAX_RELAY_TOUCH_PAD_NUM) {
        return ESP_FAIL;
    }
    node->touch_state[ch] = state;
    return ESP_OK;
}

esp_err_t periph_mesh_get_touch_state(esp_periph_handle_t self, const char *dev_hw_id, int switcher, bool *state) {
    VALIDATE_MESH(self, ESP_FAIL);
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    mesh_node_t   *node = _mesh_find_node_by_dev_id(&periph_mesh->mesh_list, dev_hw_id);
    if (node == NULL) {
        node = _mesh_find_node_by_hw_id(&periph_mesh->mesh_list, dev_hw_id);
    }
    if (node == NULL) {
        return ESP_FAIL;
    }
    int ch = switcher - 1;
    if (ch < 0 || ch >= MAX_RELAY_TOUCH_PAD_NUM || state == NULL) {
        return ESP_FAIL;
    }
    *state = node->touch_state[ch];
    return ESP_OK;
}

esp_err_t periph_mesh_print(esp_periph_handle_t self) {
    VALIDATE_MESH(self, ESP_FAIL);
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    if (periph_mesh->is_root) {
        _mesh_print(&periph_mesh->mesh_list);
    }
    return ESP_OK;
}

char *periph_mesh_get_hwid_from_devid(esp_periph_handle_t self, const char *devid) {
    VALIDATE_MESH(self, NULL);
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    mesh_node_t   *node = _mesh_find_node_by_dev_id(&periph_mesh->mesh_list, devid);
    if (node == NULL) {
        return NULL;
    }
    return node->hardware_id;
}

bool periph_mesh_is_logged(esp_periph_handle_t self) {
    VALIDATE_MESH(self, NULL);
    periph_mesh_t *periph_mesh = esp_periph_get_data(self);
    return periph_mesh->logged;
}
