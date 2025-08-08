/*
 * This file is subject to the terms of the Nanochip License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *                             ./LICENSE
 */
#include "sdkconfig.h"
#if CONFIG_ENABLE_PERIPH_WEB
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>

#include "soc/soc.h"
#include "soc/rtc_cntl_reg.h"
#include "soc/sens_reg.h"

#include "esp_log.h"
#include "esp_system.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "periph_web.h"
#include "mbedtls/base64.h"


static const char* TAG = "ESP_WEB";

#define VALIDATE_WEB(periph, ret) if (!(periph && esp_periph_get_id(periph) == PERIPH_ID_WEB)) { \
    ESP_LOGE(TAG, "Invalid WEB periph, at line %d", __LINE__);\
    return ret;\
}
static const char *web_response_tpl = "{\"resp\":\"%s\", \"status\": \"%s\", \"data\": %s}";

#define DEFAULT_WEB_PORT (80)
#define MD5_MAX_LEN (33)
#define MAX_AUTH_HEADER_LEN (64)
#define DEFAULT_MAX_URI_HANDLERS (16)

typedef struct periph_web* periph_web_handle_t;

struct periph_web {
    bool disable_auto_start;
    int port;
    int max_uri_handlers;
    char *buffer;
    char *tx_buffer;
    httpd_handle_t http_server;
};


static char g_auth_string[MD5_MAX_LEN + 7] = { 0 };


esp_err_t periph_web_static_handler(httpd_req_t *req)
{
    periph_web_file_mapping_t *file;

    if (!periph_web_check_autheticated(req)) {
        return ESP_OK;
    }
    file = (periph_web_file_mapping_t *)req->user_ctx;
    if (file == NULL) {
        return httpd_resp_send_404(req);
    }
    int file_size = (file->end - file->begin);
    httpd_resp_set_status(req, HTTPD_200);
    httpd_resp_set_type(req, file->content_type);
    if (file->gzip) {
        httpd_resp_set_hdr(req, "Content-Encoding", "gzip");
    }
    httpd_resp_send(req, file->begin, file_size);
    return ESP_OK;
}

httpd_handle_t periph_web_get_http_handle(esp_periph_handle_t periph)
{
    VALIDATE_WEB(periph, NULL);
    periph_web_handle_t periph_web = (periph_web_handle_t)esp_periph_get_data(periph);
    return periph_web->http_server;
}

static esp_err_t _web_run(esp_periph_handle_t self, audio_event_iface_msg_t *msg)
{
    return ESP_OK;
}

static esp_err_t _web_init(esp_periph_handle_t self)
{
    periph_web_handle_t periph_web = (periph_web_handle_t)esp_periph_get_data(self);
    periph_web->buffer = malloc(WEB_SERVER_BUFFER_SIZE);
    PERIPH_MEM_CHECK(TAG, periph_web->buffer, return ESP_ERR_NO_MEM);

    periph_web->tx_buffer = malloc(WEB_SERVER_BUFFER_SIZE);
    PERIPH_MEM_CHECK(TAG, periph_web->tx_buffer, {
        free(periph_web->buffer);
        return ESP_ERR_NO_MEM;
    });

    if (!periph_web->disable_auto_start && periph_web_start(self) != ESP_OK) {
        return ESP_FAIL;
    }
    return ESP_OK;
}

static esp_err_t _web_destroy(esp_periph_handle_t self)
{
    periph_web_handle_t periph_web = (periph_web_handle_t)esp_periph_get_data(self);
    if (periph_web->http_server) {
        httpd_stop(periph_web->http_server);
    }
    free(periph_web->tx_buffer);
    free(periph_web->buffer);
    free(periph_web);
    return ESP_OK;
}

static void http_auth_basic(const char *userinfo)
{
    int out;
    sprintf(g_auth_string, "Basic ");
    mbedtls_base64_encode((unsigned char *)g_auth_string + 6, MD5_MAX_LEN, (size_t *)&out, (const unsigned char *)userinfo, strlen(userinfo));
    g_auth_string[MD5_MAX_LEN + 6] = 0;
}

esp_err_t periph_web_start(esp_periph_handle_t periph)
{
    VALIDATE_WEB(periph, ESP_FAIL);
    periph_web_handle_t periph_web = (periph_web_handle_t)esp_periph_get_data(periph);
    httpd_config_t http_config = HTTPD_DEFAULT_CONFIG();
    http_config.max_uri_handlers = periph_web->max_uri_handlers ? periph_web->max_uri_handlers : DEFAULT_MAX_URI_HANDLERS;
    http_config.server_port = periph_web->port ? periph_web->port : DEFAULT_WEB_PORT;
    esp_err_t err;
    if ((err = httpd_start(&periph_web->http_server, &http_config)) != ESP_OK) {
        ESP_LOGE(TAG, "Error start http server, err = %d", err);
        free(periph_web);
        return ESP_FAIL;
    }
    esp_periph_send_event(periph, PERIPH_WEB_STARTED, (void *)periph, 0);
    return ESP_OK;

}

esp_err_t periph_web_stop(esp_periph_handle_t periph)
{
    VALIDATE_WEB(periph, ESP_FAIL);
    periph_web_handle_t periph_web = (periph_web_handle_t)esp_periph_get_data(periph);
    esp_periph_send_event(periph, PERIPH_WEB_BEFORE_STOP, (void *)periph, 0);
    esp_err_t err = httpd_stop(periph_web->http_server);
    return err;
}

esp_periph_handle_t periph_web_init(periph_web_config_t *config)
{
    periph_web_handle_t periph_web = calloc(1, sizeof(struct periph_web));
    PERIPH_MEM_CHECK(TAG, periph_web, return NULL);

    if (config->basic_auth) {
        http_auth_basic(config->basic_auth);
    } else {
        g_auth_string[0] = 0;
    }
    periph_web->port = config->port;
    periph_web->disable_auto_start = config->disable_auto_start;
    periph_web->max_uri_handlers = config->max_uri_handlers;
    esp_periph_handle_t periph = esp_periph_create(PERIPH_ID_WEB, "periph_web");
    PERIPH_MEM_CHECK(TAG, periph, goto _periph_web_exit);
    esp_periph_set_data(periph, periph_web);
    esp_periph_set_function(periph, _web_init, _web_run, _web_destroy);
    return periph;
_periph_web_exit:
    free(periph_web);
    return NULL;
}

char *periph_web_get_buffer(esp_periph_handle_t periph)
{
    VALIDATE_WEB(periph, NULL);
    periph_web_handle_t periph_web = (periph_web_handle_t)esp_periph_get_data(periph);
    return periph_web->buffer;
}

char *periph_web_get_tx_buffer(esp_periph_handle_t periph)
{
    VALIDATE_WEB(periph, NULL);
    periph_web_handle_t periph_web = (periph_web_handle_t)esp_periph_get_data(periph);
    return periph_web->tx_buffer;
}

bool periph_web_check_autheticated(httpd_req_t *req)
{
    if (g_auth_string[0] == 0) {
        return true;
    }
    char auth_header[MAX_AUTH_HEADER_LEN];
    int auth_header_len = httpd_req_get_hdr_value_len(req, "Authorization");

    if (auth_header_len && httpd_req_get_hdr_value_str(req, "Authorization", auth_header, MAX_AUTH_HEADER_LEN) == ESP_OK) {
        ESP_LOGI(TAG, "Authorization = %s", auth_header);
        if (strcasecmp(g_auth_string, auth_header) == 0) {
            return true;
        }
    }
    httpd_resp_set_status(req, "401 Unauthorized");
    httpd_resp_set_hdr(req, "WWW-Authenticate", "Basic realm=\"Please login to access this site\"");
    httpd_resp_send(req, "UnAuthenticated", sizeof("UnAuthenticated"));
    return false;
}

esp_err_t periph_web_register_routes(esp_periph_handle_t periph, const httpd_uri_t routes[])
{
    esp_err_t err;
    httpd_uri_t route;
    VALIDATE_WEB(periph, ESP_FAIL);
    httpd_handle_t handle = periph_web_get_http_handle(periph);
    if (handle == NULL) {
        return ESP_FAIL;
    }
    int i = 0;
    while (routes[i].uri) {
        memcpy(&route, &routes[i], sizeof(httpd_uri_t));
        route.user_ctx = periph;
        if ((err = httpd_register_uri_handler(handle, &route)) != ESP_OK) {
            ESP_LOGE(TAG, "Error register handle, err = %d", err);
            return err;
        }
        i ++;
    }
    return ESP_OK;
}

esp_err_t periph_web_unregister_routes(esp_periph_handle_t periph, const httpd_uri_t routes[])
{
    esp_err_t err;
    VALIDATE_WEB(periph, ESP_FAIL);
    httpd_handle_t handle = periph_web_get_http_handle(periph);
    if (handle == NULL) {
        return ESP_FAIL;
    }
    int i = 0;
    while (routes[i].uri) {
        if ((err = httpd_unregister_uri_handler(handle, routes[i].uri, routes[i].method)) != ESP_OK) {
            ESP_LOGE(TAG, "Error unregister handle, err = %d", err);
            return err;
        }
        i ++;
    }
    return ESP_OK;
}



#define MX_SPLIT (10)

static int _split(char **result, char *src, const char *delim)
{
    int i;
    char *p = strtok(src, delim);
    for (i = 0; p != NULL && i < (MX_SPLIT - 1); i++, p = strtok(NULL, delim))
    {
        result[i] = p;
        result[i + 1] = NULL; // mark the end of result array
    }
    return i;
}

int periph_web_parse_query(esp_periph_handle_t periph, httpd_req_t *req, http_query_t query_result[], int max_query_result)
{
    VALIDATE_WEB(periph, ESP_FAIL);
    char *buffer = periph_web_get_buffer(periph);

    int idx;
    int query_len = httpd_req_get_url_query_len(req);
    if (query_len == 0) {
        return 0;
    }
    if (httpd_req_get_url_query_str(req, buffer, WEB_SERVER_BUFFER_SIZE) != ESP_OK) {
        return 0;
    }
    buffer[query_len] = 0;
    char *query_part[MX_SPLIT] = {NULL};
    int n_query = _split(query_part, buffer, "&");
    if (n_query == 0) {
        return 0;
    }
    char *query_item[MX_SPLIT];
    int result_no = 0;

    for (idx = 0; idx < n_query; idx ++) {
        int query_item_no = _split(query_item, query_part[idx], "=");
        if (query_item_no) {
            query_result[result_no].key = query_item[0];
            query_result[result_no].value = query_item[1];
        }
        result_no ++;
        if (result_no > max_query_result) {
            return max_query_result;
        }
    }
    return result_no;
}

char *periph_web_get_query(esp_periph_handle_t periph, const char *key, http_query_t query_result[], int max_query_result)
{
    int i;
    for (i = 0; i < max_query_result; i++) {
        if (key && query_result[i].key && strcmp(query_result[i].key, key) == 0) {
            return query_result[i].value;
        }
    }
    return NULL;
}

esp_err_t periph_web_response_json(esp_periph_handle_t periph, httpd_req_t *req, const char *json, int len)
{
    VALIDATE_WEB(periph, ESP_FAIL);
    httpd_resp_set_status(req, HTTPD_200);
    httpd_resp_set_type(req, HTTPD_TYPE_JSON);
    int send_len = len;
    if (send_len < 0) {
        send_len = strlen(json);
    }
    return httpd_resp_send(req, json, send_len);
}

esp_err_t periph_web_response_fail(esp_periph_handle_t periph, httpd_req_t *req, const char *cmd, const char *message)
{
    VALIDATE_WEB(periph, ESP_FAIL);
    char *buffer = periph_web_get_buffer(periph);
    int send_len = snprintf(buffer, WEB_SERVER_BUFFER_SIZE, web_response_tpl, cmd, "fail", message);
    return periph_web_response_json(periph, req, buffer, send_len);
}

esp_err_t periph_web_response_success(esp_periph_handle_t periph, httpd_req_t *req, const char *cmd, const char *data)
{
    VALIDATE_WEB(periph, ESP_FAIL);
    char *buffer = periph_web_get_buffer(periph);
    int send_len = snprintf(buffer, WEB_SERVER_BUFFER_SIZE, web_response_tpl, cmd, "success", data);
    return periph_web_response_json(periph, req, buffer, send_len);
}

static unsigned char from_hex(unsigned char ch)
{
    return isdigit(ch) ? ch - '0' : tolower(ch) - 'a' + 10;
}

char *periph_web_url_decode(char *str)
{
    char *pstr = str, *buf = str, *pbuf = buf;
    if (str == NULL) {
        return NULL;
    }
    while (*pstr) {
        if (*pstr == '%') {
            if (pstr[1] && pstr[2]) {
                *pbuf++ = from_hex(pstr[1]) << 4 | from_hex(pstr[2]);
                pstr += 2;
            }
        } else if (*pstr == '+') {
            *pbuf++ = ' ';
        } else {
            *pbuf++ = *pstr;
        }
        pstr++;
    }
    *pbuf = '\0';
    return buf;
}

#endif
