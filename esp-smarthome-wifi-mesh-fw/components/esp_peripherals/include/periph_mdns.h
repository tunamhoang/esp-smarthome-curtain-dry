/*
 * This file is subject to the terms of the Nanochip License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *                             ./LICENSE
 */
#ifndef _PERIPH_MDNS_H_
#define _PERIPH_MDNS_H_

#include "esp_err.h"
#include "esp_peripherals.h"
#include "mdns.h"
#ifdef __cplusplus
extern "C" {
#endif

/**
 * @brief   The Button peripheral configuration
 */
typedef struct {
    const char *hostname;
    const char *instance;
    const char *service;
    const char *tag;
} periph_mdns_cfg_t;

/**
 * @brief      Peripheral mdns event id
 */
typedef enum {
    PERIPH_MDNS_UNCHANGE = 0, /*!< No event */
} periph_mdns_event_id_t;

#define MAX_MDNS_HOST_SIZE (32)

typedef struct {
    char hostname[MAX_MDNS_HOST_SIZE];
    char instance[MAX_MDNS_HOST_SIZE];
} periph_mdns_storage_t;

esp_periph_handle_t periph_mdns_init(periph_mdns_cfg_t* config);

esp_err_t periph_mdns_set_config(esp_periph_handle_t periph, periph_mdns_storage_t *storage);
esp_err_t periph_mdns_get_config(esp_periph_handle_t periph, periph_mdns_storage_t *storage);
esp_err_t periph_mdns_stop(esp_periph_handle_t periph);
esp_err_t periph_mdns_start(esp_periph_handle_t periph);
esp_err_t periph_mdns_restart(esp_periph_handle_t periph);
bool periph_mdns_is_started(esp_periph_handle_t periph);
esp_err_t periph_mdns_query_hostname(esp_periph_handle_t periph, const char *host_name, struct ip4_addr *addr);
esp_err_t periph_mdns_query_service(esp_periph_handle_t periph, const char *service_name, const char *proto, mdns_result_t **results);

#ifdef __cplusplus
}
#endif

#endif
