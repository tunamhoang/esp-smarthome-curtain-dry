/*
 * This file is subject to the terms of the Nanochip License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *                             ./LICENSE
 */
#ifndef _PERIPH_WEB_
#define _PERIPH_WEB_

#include "freertos/FreeRTOS.h"
#include "freertos/queue.h"
#include "esp_peripherals.h"
#include "esp_http_server.h"

#ifdef __cplusplus
extern "C" {
#endif

#define WEB_SERVER_BUFFER_SIZE (2*1024)

typedef enum {
    PERIPH_WEB_NOTTHING = 0, /*!< No event */
    PERIPH_WEB_STARTED,      /*!< Server started */
    PERIPH_WEB_BEFORE_STOP,      /*!< Server started */
    PERIPH_WEB_EVENT_MAX,
} periph_web_event_id_t;

typedef struct periph_web_config {
    int port;                   /*!< Server port */
    int max_uri_handlers;       /*!< max uri handlers */
    const char *basic_auth;     /*!< Server basic auth */
    bool disable_auto_start;
} periph_web_config_t;

typedef struct {
  const char content_type[32];
  void *begin;
  void *end;
  bool gzip;
} periph_web_file_mapping_t;

typedef struct {
    char *key;
    char *value;
} http_query_t;

#define J_STR(x) "\""x"\""
#define J_ARR(x) "["x"]"
#define J_OBJ(x) "{"x"}"

/**
 * @brief      Periph web initialize
 *
 * @param      config  The configuration
 *
 * @return     Periph Web handle
 */
esp_periph_handle_t periph_web_init(periph_web_config_t *config);

esp_err_t periph_web_start(esp_periph_handle_t periph);
esp_err_t periph_web_stop(esp_periph_handle_t periph);

/**
 * @brief      Get http_handle_t from internal http server
 *
 * @param[in]  periph  The periph
 *
 * @return     httpd_handle_t
 */
httpd_handle_t periph_web_get_http_handle(esp_periph_handle_t periph);

/**
 * @brief      Register routes
 *
 * @param[in]  periph  The periph
 * @param[in]  routes  The routes
 *
 * @return     ESP_OK or ESP_ERR_*
 */
esp_err_t periph_web_register_routes(esp_periph_handle_t periph, const httpd_uri_t routes[]);

esp_err_t periph_web_unregister_routes(esp_periph_handle_t periph, const httpd_uri_t routes[]);

/**
 * @brief      Server static web with router context by periph_web_file_mapping_t
 *
 * @param      req   The request
 *
 * @return     ESP_OK or ESP_ERR_*
 */
esp_err_t periph_web_static_handler(httpd_req_t *req);

/**
 * @brief      Check basic authentication
 *
 * @param      req   The request
 *
 * @return     true if valid
 */
bool periph_web_check_autheticated(httpd_req_t *req);

/**
 * @brief      Get web buffer
 *
 * @param[in]  periph  The periph
 *
 * @return     Internal web buffer
 */
char *periph_web_get_buffer(esp_periph_handle_t periph);
char *periph_web_get_tx_buffer(esp_periph_handle_t periph);

int periph_web_parse_query(esp_periph_handle_t periph, httpd_req_t *req, http_query_t query_result[], int max_query_result);

char *periph_web_get_query(esp_periph_handle_t periph, const char *key, http_query_t query_result[], int max_query_result);

esp_err_t periph_web_response_json(esp_periph_handle_t periph, httpd_req_t *req, const char *json, int len);

esp_err_t periph_web_response_fail(esp_periph_handle_t periph, httpd_req_t *req, const char *cmd, const char *message);

esp_err_t periph_web_response_success(esp_periph_handle_t periph, httpd_req_t *req, const char *cmd, const char *message);

char *periph_web_url_decode(char *str);

#ifdef __cplusplus
}
#endif

#endif //end of file _ESP_WEB_
