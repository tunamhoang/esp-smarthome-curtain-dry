/*
 * This file is subject to the terms of the Nanochip License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *                             ./LICENSE
 */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "soc/soc.h"
#include "soc/rtc_cntl_reg.h"
#include "soc/sens_reg.h"

#include "esp_log.h"
#include "esp_system.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "periph_mdns.h"
#include "tct_template.h"

static const char *TAG = "PERIPH_MDNS";

#define VALIDATE_MDNS(periph, ret) if (!esp_periph_validate(periph, PERIPH_ID_MDNS)) { \
        ESP_LOGE(TAG, "Invalid MDNS periph, at line %d", __LINE__);\
        return ret;\
    }

#define MDNS_CHECK(err) if (err != ESP_OK) return ESP_FAIL

typedef struct {
    char *hostname;
    char *instance;
    char *service;
    bool run;
} periph_mdns_t;


static esp_err_t _mdns_run(esp_periph_handle_t self, audio_event_iface_msg_t *msg)
{

    return ESP_OK;
}

static esp_err_t _mdns_destroy(esp_periph_handle_t self)
{
    periph_mdns_t *periph_mdns = esp_periph_get_data(self);
    mdns_free();
    free(periph_mdns->hostname);
    free(periph_mdns->instance);
    free(periph_mdns);
    return ESP_OK;
}

esp_err_t periph_mdns_start(esp_periph_handle_t periph)
{
    VALIDATE_MDNS(periph, ESP_FAIL);
    periph_mdns_t *periph_mdns = esp_periph_get_data(periph);
    if (periph_mdns->run) {
        ESP_LOGE(TAG, "mDNS service was running");
        return ESP_FAIL;
    }
    periph_mdns->run = true;
    ESP_LOGI(TAG, "hostname = %s, instance=%s, service=%s", periph_mdns->hostname, periph_mdns->instance, periph_mdns->service);
    //initialize mDNS
    MDNS_CHECK(mdns_init());
    MDNS_CHECK(mdns_hostname_set(periph_mdns->hostname));
    MDNS_CHECK(mdns_instance_name_set(periph_mdns->instance));

    ESP_LOGD(TAG, "MDNS start, hostname=%s, instance=%s", periph_mdns->hostname, periph_mdns->instance);
    mdns_txt_item_t serviceTxtData[1] = {
        {"http", "/"},
    };
    MDNS_CHECK(mdns_service_add(periph_mdns->instance, periph_mdns->service, "_tcp", 80, serviceTxtData, 1));

    return ESP_OK;
}

esp_err_t periph_mdns_restart(esp_periph_handle_t periph)
{
    esp_err_t err = ESP_OK;
    err += periph_mdns_stop(periph);
    err += periph_mdns_start(periph);
    return err;
}

esp_err_t periph_mdns_stop(esp_periph_handle_t periph)
{
    periph_mdns_t *periph_mdns = esp_periph_get_data(periph);
    if (!periph_mdns->run) {
        ESP_LOGE(TAG, "mDNS service was NOT running");
        return ESP_FAIL;
    }
    periph_mdns->run = false;
    mdns_free();
    return ESP_OK;
}

esp_err_t periph_mdns_query_hostname(esp_periph_handle_t periph, const char *host_name, struct ip4_addr *addr)
{
    ESP_LOGD(TAG, "Query A: %s.local", host_name);

    periph_mdns_t *periph_mdns = esp_periph_get_data(periph);
    if (!periph_mdns->run) {
        ESP_LOGE(TAG, "mDNS service was NOT running");
        return ESP_FAIL;
    }

    addr->addr = 0;

    esp_err_t err = mdns_query_a(host_name, 2000,  addr);
    if (err) {
        if (err == ESP_ERR_NOT_FOUND) {
            ESP_LOGW(TAG, "%s: Host was not found!", esp_err_to_name(err));
            return ESP_FAIL;
        }
        ESP_LOGE(TAG, "Query Failed: %s", esp_err_to_name(err));
        return ESP_FAIL;
    }

    ESP_LOGI(TAG, "Query A: %s.local resolved to: " IPSTR, host_name, IP2STR(addr));
    return ESP_OK;
}

static const char *if_str[] = {"STA", "AP", "ETH", "MAX"};
static const char *ip_protocol_str[] = {"V4", "V6", "MAX"};

static void mdns_print_results(mdns_result_t *results)
{
    mdns_result_t *r = results;
    mdns_ip_addr_t *a = NULL;
    int i = 1, t;
    while (r) {
        printf("%d: Interface: %s, Type: %s\n", i++, if_str[r->tcpip_if], ip_protocol_str[r->ip_protocol]);
        if (r->instance_name) {
            printf("  PTR : %s\n", r->instance_name);
        }
        if (r->hostname) {
            printf("  SRV : %s.local:%u\n", r->hostname, r->port);
        }
        if (r->txt_count) {
            printf("  TXT : [%u] ", r->txt_count);
            for (t = 0; t < r->txt_count; t++) {
                printf("%s=%s; ", r->txt[t].key, r->txt[t].value ? r->txt[t].value : "NULL");
            }
            printf("\n");
        }
        a = r->addr;
        while (a) {
            if (a->addr.type == IPADDR_TYPE_V6) {
                printf("  AAAA: " IPV6STR "\n", IPV62STR(a->addr.u_addr.ip6));
            } else {
                printf("  A   : " IPSTR "\n", IP2STR(&(a->addr.u_addr.ip4)));
            }
            a = a->next;
        }
        r = r->next;
    }
}

esp_err_t periph_mdns_query_service(esp_periph_handle_t periph, const char *service_name, const char *proto, mdns_result_t **results)
{
    periph_mdns_t *periph_mdns = esp_periph_get_data(periph);
    if (!periph_mdns->run) {
        ESP_LOGE(TAG, "mDNS service was NOT running");
        return ESP_FAIL;
    }
    ESP_LOGI(TAG, "Query PTR: %s.%s.local", service_name, proto);
    esp_err_t err = mdns_query_ptr(service_name, proto, 3000, 20, results);
    if (err) {
        ESP_LOGE(TAG, "Query Failed: %s", esp_err_to_name(err));
        return ESP_FAIL;
    }
    if (!*results) {
        ESP_LOGW(TAG, "No results found!");
        return ESP_FAIL;
    }
    mdns_print_results(*results);
    return ESP_OK;
}

bool periph_mdns_is_started(esp_periph_handle_t periph)
{
    VALIDATE_MDNS(periph, false);
    periph_mdns_t *periph_mdns = esp_periph_get_data(periph);
    return periph_mdns->run;
}

static esp_err_t _mdns_init(esp_periph_handle_t self)
{
    return ESP_OK;
}

esp_periph_handle_t periph_mdns_init(periph_mdns_cfg_t *config)
{
    esp_periph_handle_t periph = esp_periph_create(PERIPH_ID_MDNS, config->tag ? config->tag : "periph_mdns");
    PERIPH_MEM_CHECK(TAG, periph, return NULL);
    periph_mdns_t *periph_mdns = calloc(1, sizeof(periph_mdns_t));

    PERIPH_MEM_CHECK(TAG, periph_mdns, {
        free(periph);
        return NULL;
    });
    uint64_t dev_id = esp_periph_get_device_id_full();

    if (config->hostname) {
        periph_mdns->hostname = tct_render_id(config->hostname, dev_id);
    } else {
        asprintf(&periph_mdns->hostname, "ESP-%llX", dev_id);
    }

    PERIPH_MEM_CHECK(TAG, periph_mdns->hostname, {
        free(periph);
        free(periph_mdns);
        return NULL;
    });

    if (config->instance) {
        periph_mdns->instance = tct_render_id(config->instance, dev_id);
    } else {
        asprintf(&periph_mdns->instance, "ESP-%llX", dev_id);
    }

    PERIPH_MEM_CHECK(TAG, periph_mdns->instance, {
        free(periph);
        free(periph_mdns);
        return NULL;
    });

    if (config->service) {
        periph_mdns->service = strdup(config->service);
    } else {
        asprintf(&periph_mdns->service, "_http");
    }

    esp_periph_set_data(periph, periph_mdns);
    esp_periph_set_function(periph, _mdns_init, _mdns_run, _mdns_destroy);
    return periph;
}

esp_err_t periph_mdns_set_config(esp_periph_handle_t periph, periph_mdns_storage_t *storage)
{
    VALIDATE_MDNS(periph, ESP_FAIL);
    periph_mdns_t *periph_mdns = esp_periph_get_data(periph);
    uint64_t dev_id = esp_periph_get_device_id_full();

    if (periph_mdns->hostname && storage->hostname) {
        free(periph_mdns->hostname);
        periph_mdns->hostname = tct_render_id(storage->hostname, dev_id);
        PERIPH_MEM_CHECK(TAG, periph_mdns->hostname, return ESP_ERR_NO_MEM);
    }

    if (periph_mdns->instance && storage->instance) {
        free(periph_mdns->instance);
        periph_mdns->instance = tct_render_id(storage->instance, dev_id);
        PERIPH_MEM_CHECK(TAG, periph_mdns->instance, return ESP_ERR_NO_MEM);
    }
    return ESP_OK;
}

esp_err_t periph_mdns_get_config(esp_periph_handle_t periph, periph_mdns_storage_t *storage)
{
    VALIDATE_MDNS(periph, ESP_FAIL);
    periph_mdns_t *periph_mdns = esp_periph_get_data(periph);

    if (periph_mdns->hostname && storage->hostname) {
        strcpy(storage->hostname, periph_mdns->hostname);
        PERIPH_MEM_CHECK(TAG, storage->hostname, return ESP_ERR_NO_MEM);
    }
    if (periph_mdns->instance && storage->instance) {
        strcpy(storage->instance, periph_mdns->instance);
        PERIPH_MEM_CHECK(TAG, storage->instance, return ESP_ERR_NO_MEM);
    }
    return ESP_OK;
}
