/*
 * SPDX-FileCopyrightText: 2015-2021 Espressif Systems (Shanghai) CO LTD
 *
 * SPDX-License-Identifier: Apache-2.0
 * https://github.com/espressif/esp-protocols/tree/master/components/esp_websocket_client
 */

#ifndef _WEBSOCKET_CLIENT_H_
#define _WEBSOCKET_CLIENT_H_

#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include "freertos/FreeRTOS.h"
#include "esp_err.h"
#include "esp_event.h"
#include <sys/socket.h>
#include "esp_transport_ws.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct websocket_client *websocket_client_handle_t;

ESP_EVENT_DECLARE_BASE(WEBSOCKET_EVENTS);         // declaration of the task events family

/**
 * @brief Websocket Client events id
 */
typedef enum {
    WEBSOCKET_EVENT_ANY = -1,
    WEBSOCKET_EVENT_ERROR = 0,      /*!< This event occurs when there are any errors during execution */
    WEBSOCKET_EVENT_CONNECTED,      /*!< Once the Websocket has been connected to the server, no data exchange has been performed */
    WEBSOCKET_EVENT_DISCONNECTED,   /*!< The connection has been disconnected */
    WEBSOCKET_EVENT_DATA,           /*!< When receiving data from the server, possibly multiple portions of the packet */
    WEBSOCKET_EVENT_CLOSED,         /*!< The connection has been closed cleanly */
    WEBSOCKET_EVENT_MAX
} websocket_event_id_t;

/**
 * @brief Websocket event data
 */
typedef struct {
    const char *data_ptr;                   /*!< Data pointer */
    int data_len;                           /*!< Data length */
    bool fin;                               /*!< Fin flag */
    uint8_t op_code;                        /*!< Received opcode */
    websocket_client_handle_t client;   /*!< websocket_client_handle_t context */
    void *user_context;                     /*!< user_data context, from websocket_client_config_t user_data */
    int payload_len;                        /*!< Total payload length, payloads exceeding buffer will be posted through multiple events */
    int payload_offset;                     /*!< Actual offset for the data associated with this event */
} websocket_event_data_t;

/**
 * @brief Websocket Client transport
 */
typedef enum {
    WEBSOCKET_TRANSPORT_UNKNOWN = 0x0,  /*!< Transport unknown */
    WEBSOCKET_TRANSPORT_OVER_TCP,       /*!< Transport over tcp */
    WEBSOCKET_TRANSPORT_OVER_SSL,       /*!< Transport over ssl */
} websocket_transport_t;

/**
 * @brief Websocket client setup configuration
 */
typedef struct {
    const char                  *uri;                       /*!< Websocket URI, the information on the URI can be overrides the other fields below, if any */
    const char                  *host;                      /*!< Domain or IP as string */
    int                         port;                       /*!< Port to connect, default depend on websocket_transport_t (80 or 443) */
    const char                  *username;                  /*!< Using for Http authentication - Not supported for now */
    const char                  *password;                  /*!< Using for Http authentication - Not supported for now */
    const char                  *path;                      /*!< HTTP Path, if not set, default is `/` */
    bool                        disable_auto_reconnect;     /*!< Disable the automatic reconnect function when disconnected */
    void                        *user_context;              /*!< HTTP user data context */
    int                         task_prio;                  /*!< Websocket task priority */
    int                         task_stack;                 /*!< Websocket task stack */
    int                         buffer_size;                /*!< Websocket buffer size */
    const char                  *cert_pem;                  /*!< Pointer to certificate data in PEM or DER format for server verify (with SSL), default is NULL, not required to verify the server. PEM-format must have a terminating NULL-character. DER-format requires the length to be passed in cert_len. */
    size_t                      cert_len;                   /*!< Length of the buffer pointed to by cert_pem. May be 0 for null-terminated pem */
    const char                  *client_cert;               /*!< Pointer to certificate data in PEM or DER format for SSL mutual authentication, default is NULL, not required if mutual authentication is not needed. If it is not NULL, also `client_key` has to be provided. PEM-format must have a terminating NULL-character. DER-format requires the length to be passed in client_cert_len. */
    size_t                      client_cert_len;            /*!< Length of the buffer pointed to by client_cert. May be 0 for null-terminated pem */
    const char                  *client_key;                /*!< Pointer to private key data in PEM or DER format for SSL mutual authentication, default is NULL, not required if mutual authentication is not needed. If it is not NULL, also `client_cert` has to be provided. PEM-format must have a terminating NULL-character. DER-format requires the length to be passed in client_key_len */
    size_t                      client_key_len;             /*!< Length of the buffer pointed to by client_key_pem. May be 0 for null-terminated pem */
    websocket_transport_t   transport;                  /*!< Websocket transport type, see `websocket_transport_t */
    const char                  *subprotocol;               /*!< Websocket subprotocol */
    const char                  *user_agent;                /*!< Websocket user-agent */
    const char                  *headers;                   /*!< Websocket additional headers */
    int                         pingpong_timeout_sec;       /*!< Period before connection is aborted due to no PONGs received */
    bool                        disable_pingpong_discon;    /*!< Disable auto-disconnect due to no PONG received within pingpong_timeout_sec */
    bool                        use_global_ca_store;        /*!< Use a global ca_store for all the connections in which this bool is set. */
    esp_err_t (*crt_bundle_attach)(void *conf);             /*!< Function pointer to esp_crt_bundle_attach. Enables the use of certification bundle for server verification, MBEDTLS_CERTIFICATE_BUNDLE must be enabled in menuconfig. Include esp_crt_bundle.h, and use `esp_crt_bundle_attach` here to include bundled CA certificates. */
    bool                        skip_cert_common_name_check;/*!< Skip any validation of server certificate CN field */
    bool                        keep_alive_enable;          /*!< Enable keep-alive timeout */
    int                         keep_alive_idle;            /*!< Keep-alive idle time. Default is 5 (second) */
    int                         keep_alive_interval;        /*!< Keep-alive interval time. Default is 5 (second) */
    int                         keep_alive_count;           /*!< Keep-alive packet retry send count. Default is 3 counts */
    int                         reconnect_timeout_ms;       /*!< Reconnect after this value in miliseconds if disable_auto_reconnect is not enabled (defaults to 10s) */
    int                         network_timeout_ms;         /*!< Abort network operation if it is not completed after this value, in milliseconds (defaults to 10s) */
    size_t                      ping_interval_sec;          /*!< Websocket ping interval, defaults to 10 seconds if not set */
    struct ifreq                *if_name;                   /*!< The name of interface for data to go through. Use the default interface without setting */
} websocket_client_config_t;

websocket_client_handle_t websocket_client_init(const websocket_client_config_t *config);
esp_err_t websocket_client_set_uri(websocket_client_handle_t client, const char *uri);
esp_err_t websocket_client_start(websocket_client_handle_t client);
esp_err_t websocket_client_stop(websocket_client_handle_t client);
esp_err_t websocket_client_destroy(websocket_client_handle_t client);
int websocket_client_send(websocket_client_handle_t client, const char *data, int len, TickType_t timeout);
int websocket_client_send_bin(websocket_client_handle_t client, const char *data, int len, TickType_t timeout);
int websocket_client_send_text(websocket_client_handle_t client, const char *data, int len, TickType_t timeout);
int websocket_client_send_with_opcode(websocket_client_handle_t client, ws_transport_opcodes_t opcode, const uint8_t *data, int len, TickType_t timeout);
esp_err_t websocket_client_close(websocket_client_handle_t client, TickType_t timeout);
esp_err_t websocket_client_close_with_code(websocket_client_handle_t client, int code, const char *data, int len, TickType_t timeout);
bool websocket_client_is_connected(websocket_client_handle_t client);
size_t websocket_client_get_ping_interval_sec(websocket_client_handle_t client);
esp_err_t websocket_client_set_ping_interval_sec(websocket_client_handle_t client, size_t ping_interval_sec);
esp_err_t websocket_register_events(websocket_client_handle_t client,
                                        websocket_event_id_t event,
                                        esp_event_handler_t event_handler,
                                        void *event_handler_arg);

#ifdef __cplusplus
}
#endif

#endif
