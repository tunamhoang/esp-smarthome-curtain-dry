/*
 * This file is subject to the terms of the Nanochip License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *                             ./LICENSE
 */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <sys/time.h>
#include <sys/queue.h>

#include "esp_log.h"
#include "esp_system.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "periph_ppp.h"
#include "sdkconfig.h"

#if CONFIG_ENABLE_PERIPH_PPP

#include "driver/uart.h"
#include "netif/ppp/pppos.h"
#include "lwip/err.h"
#include "lwip/sockets.h"
#include "lwip/sys.h"
#include "lwip/netdb.h"
#include "lwip/dns.h"
#include "netif/ppp/pppapi.h"
#include "driver/gpio.h"

static const char* TAG = "PERIPH_PPP";
static esp_periph_handle_t g_ppp = NULL;

#define VALIDATE_PPP(periph, ret) if (!esp_periph_validate(periph, PERIPH_ID_PPP)) { \
    ESP_LOGE(TAG, "Invalid PPP periph, at line %d", __LINE__);\
    return ret;\
}

#define PPP_ERROR_CHECK(err, action) if (err) action

#define PPP_BUF_SIZE (3*1024)
#define PPP_DEFAULT_TIMEOUT_MS (3000)
#define PPP_DEFAULT_UART UART_NUM_1
#define PPP_DEFAULT_TX_PIN 16
#define PPP_DEFAULT_RX_PIN 17
#define PPP_DEFAULT_CMD_RETRY 5
#define PPP_DEFAULT_CMD_TIMEOUT (200/portTICK_RATE_MS)
#define PPP_DEFAULT_TASK_STACK (4*1024)
#define PPP_DEFAULT_TASK_PRIO (5)

typedef enum {
    PPP_STATE_UNINIT = 0,
    PPP_STATE_INIT,
    PPP_STATE_CONNECT,
    PPP_STATE_WAIT_CONNECT,
    PPP_STATE_IP,
    PPP_STATE_WAIT_TIMEOUT,
    PPP_STATE_PAUSE,
} ppp_state_t;

typedef struct {
    periph_ppp_modem_conn_t modem_conn;
    periph_ppp_modem_type_t modem_type;
    /* The PPP control block */
    ppp_pcb *ppp;

    /* The PPP IP interface */
    struct netif ppp_netif;
    int rx_timeout_tick;
    int wait_timeout_tick;
    char *buffer;
    ppp_state_t state;
    EventGroupHandle_t state_event;
    bool run;
    bool connected;
    bool is_ppp_opened;
    int task_stack;
    int task_prio;
    bool wait_send;
} periph_ppp_t;

static const int STARTED_BIT = BIT0;
static const int STOPPED_BIT = BIT1;
static const int PPP_STOPPED_BIT = BIT2;

typedef struct {
    const char *name;
    const char *number;
    const char *apn;
    const char *user;
    const char *pass;
} apn_map_t;

//http://www.numberportabilitylookup.com/networks?s=
const apn_map_t apn_map[] = {
    { "Viettel", "45204", "e-internet", "", ""},
    { "Mobifone", "45201", "m-wap", "mms", "mms"},
    { "Mobifone", "45202", "m-wap", "mms", "mms"},
    { NULL, NULL, NULL, NULL, NULL },
};

static u32_t ppp_output_callback(ppp_pcb *pcb, u8_t *data, u32_t len, void *ctx)
{
    esp_periph_handle_t periph = (esp_periph_handle_t)ctx;
    periph_ppp_t *periph_ppp = esp_periph_get_data(periph);
    ESP_LOGD(TAG, "==> PPP tx len %d", len);
    periph_ppp->rx_timeout_tick = esp_periph_tick_get();
    periph_ppp->wait_send = true;
    return uart_write_bytes(periph_ppp->modem_conn.uart_num, (const char *)data, len);
}


/* PPP status callback example */
static void ppp_status_cb(ppp_pcb *pcb, int err_code, void *ctx)
{
    esp_periph_handle_t periph = (esp_periph_handle_t)ctx;
    periph_ppp_t *periph_ppp = esp_periph_get_data(periph);

    struct netif *pppif = ppp_netif(pcb);

    if (err_code) {
        periph_ppp_reset_connection(periph);
        periph_ppp->connected = false;
    }
    ESP_LOGI(TAG, "status_cb: err_code = %d", err_code);
    switch (err_code) {
        case PPPERR_NONE: {
                ESP_LOGI(TAG, "status_cb: Connected");
#if PPP_IPV4_SUPPORT
                ESP_LOGI(TAG, "   our_ipaddr  = %s", ipaddr_ntoa(&pppif->ip_addr));
                ESP_LOGI(TAG, "   his_ipaddr  = %s", ipaddr_ntoa(&pppif->gw));
                ESP_LOGI(TAG, "   netmask     = %s", ipaddr_ntoa(&pppif->netmask));
#endif /* PPP_IPV4_SUPPORT */
#if PPP_IPV6_SUPPORT
                ESP_LOGI(TAG, "   our6_ipaddr = %s", ip6addr_ntoa(netif_ip6_addr(pppif, 0)));
#endif /* PPP_IPV6_SUPPORT */
                periph_ppp->connected = true;
                periph_ppp->rx_timeout_tick = esp_periph_tick_get();
#ifdef ENABLE_GOOGLE_DNS
                ip_addr_t dnsserver;
                inet_pton(AF_INET, "8.8.8.8", &dnsserver);
                dns_setserver(0, &dnsserver);
                inet_pton(AF_INET, "8.8.4.4", &dnsserver);
                dns_setserver(1, &dnsserver);
#endif
                break;
            }
        case PPPERR_PARAM:
            ESP_LOGE(TAG, "status_cb: Invalid parameter");
            break;
        case PPPERR_OPEN:
            ESP_LOGE(TAG, "status_cb: Unable to open PPP session");
            break;
        case PPPERR_DEVICE:
            ESP_LOGE(TAG, "status_cb: Invalid I/O device for PPP");
            break;
        case PPPERR_ALLOC:
            ESP_LOGE(TAG, "status_cb: Unable to allocate resources");
            break;
        case PPPERR_USER:
            ESP_LOGE(TAG, "status_cb: User interrupt");
            xEventGroupSetBits(periph_ppp->state_event, PPP_STOPPED_BIT);
            break;
        case PPPERR_CONNECT:
            ESP_LOGE(TAG, "status_cb: Connection lost");
            break;

        case PPPERR_AUTHFAIL:
            ESP_LOGE(TAG, "status_cb: Failed authentication challenge");
            break;

        case PPPERR_PROTOCOL:
            ESP_LOGE(TAG, "status_cb: Failed to meet protocol");
            break;

        case PPPERR_PEERDEAD:
            ESP_LOGE(TAG, "status_cb: Connection timeout");
            break;

        case PPPERR_IDLETIMEOUT:
            ESP_LOGE(TAG, "status_cb: Idle Timeout");
            break;

        case PPPERR_CONNECTTIME:
            ESP_LOGE(TAG, "status_cb: Max connect time reached");
            break;

        case PPPERR_LOOPBACK:
            ESP_LOGE(TAG, "status_cb: Loopback detected");
            break;

        default:
            ESP_LOGE(TAG, "status_cb: Unknown error code %d", err_code);
            break;

    }

    /*
     * This should be in the switch case, this is put outside of the switch
     * case for example readability.
     */

    if (err_code == PPPERR_NONE) {
        return;
    }

    /* ppp_close() was previously called, don't reconnect */
    if (err_code == PPPERR_USER) {
        /* ppp_free(); -- can be called here */
        return;
    }


    /*
     * Try to reconnect in 30 seconds, if you need a modem chatscript you have
     * to do a much better signaling here ;-)
     */
    //ppp_connect(pcb, 30);
    /* OR ppp_listen(pcb); */
}

// static void ppp_timer_handler(xTimerHandle tmr)
// {
//     esp_periph_handle_t periph = (esp_periph_handle_t) pvTimerGetTimerID(tmr);
//     periph_ppp_t *periph_ppp = esp_periph_get_data(periph);
// }

static esp_err_t _at_and_get_response(periph_ppp_t *periph_ppp, const char *cmd, TickType_t timeout, int retry)
{
    do {
        ESP_LOGD(TAG, "Write cmd: %s", cmd);
        uart_write_bytes(periph_ppp->modem_conn.uart_num, cmd, strlen(cmd));
        int len = uart_read_bytes(periph_ppp->modem_conn.uart_num, (uint8_t *)periph_ppp->buffer, PPP_BUF_SIZE, timeout);
        if (len > 0) {
            periph_ppp->buffer[len] = 0;
            ESP_LOGD(TAG, "Recv: %s", periph_ppp->buffer);
            return ESP_OK;
        }

        if (retry > 0) {
            retry --;
        }
    } while (retry);
    return ESP_FAIL;
}

static esp_err_t _at_and_expect(periph_ppp_t *periph_ppp, const char *cmd, const char *expect, TickType_t timeout, int retry)
{
    int _retry = retry;
    do {
        if (_at_and_get_response(periph_ppp, cmd, timeout, _retry) == ESP_OK) {
            if (strstr(periph_ppp->buffer, expect) != NULL) {
                return ESP_OK;
            }
        }

        if (retry > 0) {
            retry --;
        }
    } while (retry);
    return ESP_FAIL;
}

static void _modem_reset(periph_ppp_t *periph_ppp)
{
    if (periph_ppp->modem_conn.reset_pin) {
        gpio_set_level(periph_ppp->modem_conn.reset_pin, 0);
        vTaskDelay(1500 / portTICK_RATE_MS);
        gpio_set_level(periph_ppp->modem_conn.reset_pin, 1);
        vTaskDelay(1200 / portTICK_RATE_MS);
    }
}

static esp_err_t _detect_apn(periph_ppp_t *periph_ppp, char *output)
{
    int i = 0;
    while (apn_map[i].number != NULL) {
        if (strstr(periph_ppp->buffer, apn_map[i].number) != NULL) {
            sprintf(output, "AT+CSTT=\"%s\",\"%s\",\"%s\"\r\n", apn_map[i].apn, apn_map[i].user, apn_map[i].pass);
            return ESP_OK;
        }
        i++;
    }
    return ESP_FAIL;
}

static void _ppp_stop_task(periph_ppp_t *periph_ppp)
{
    if (periph_ppp->run) {
        periph_ppp->run = false;
        xEventGroupWaitBits(periph_ppp->state_event, STOPPED_BIT, false, true, portMAX_DELAY);
    }
}


static void _ppp_task(void *args)
{
    esp_periph_handle_t self = (esp_periph_handle_t) args;

    periph_ppp_t *periph_ppp = esp_periph_get_data(self);

    xEventGroupClearBits(periph_ppp->state_event, STOPPED_BIT);
    xEventGroupSetBits(periph_ppp->state_event, STARTED_BIT);

    while (periph_ppp->run) {

        if (periph_ppp->state == PPP_STATE_UNINIT) {
            esp_err_t err = ESP_OK;
            _modem_reset(periph_ppp);
            uart_set_baudrate(periph_ppp->modem_conn.uart_num, 115200);
            err |= _at_and_expect(periph_ppp, "AT\r\n", "OK", PPP_DEFAULT_CMD_TIMEOUT, PPP_DEFAULT_CMD_RETRY);
            PPP_ERROR_CHECK(err, continue);
            err |= _at_and_expect(periph_ppp, "AT+IPR=460800\r\n", "OK", PPP_DEFAULT_CMD_TIMEOUT, PPP_DEFAULT_CMD_RETRY);
            PPP_ERROR_CHECK(err, continue);
            uart_set_baudrate(periph_ppp->modem_conn.uart_num, 460800);
            err |= _at_and_expect(periph_ppp, "AT\r\n", "OK", PPP_DEFAULT_CMD_TIMEOUT, PPP_DEFAULT_CMD_RETRY);
            PPP_ERROR_CHECK(err, continue);
            err |= _at_and_expect(periph_ppp, "ATZ\r\n", "OK", PPP_DEFAULT_CMD_TIMEOUT, PPP_DEFAULT_CMD_RETRY);
            PPP_ERROR_CHECK(err, continue);
            err |= _at_and_expect(periph_ppp, "ATE0\r\n", "OK", PPP_DEFAULT_CMD_TIMEOUT, PPP_DEFAULT_CMD_RETRY);
            PPP_ERROR_CHECK(err, continue);
            err |= _at_and_expect(periph_ppp, "AT+CPIN?\r\n", "CPIN: READY", PPP_DEFAULT_CMD_TIMEOUT, PPP_DEFAULT_CMD_RETRY);
            PPP_ERROR_CHECK(err, continue);
            // err |= _at_and_expect(periph_ppp, "AT+CGREG?\r\n", "+CGREG: 0,1", PPP_DEFAULT_CMD_TIMEOUT*10, PPP_DEFAULT_CMD_RETRY*5);
            // PPP_ERROR_CHECK(err, continue);
            err |= _at_and_expect(periph_ppp, "AT+COPS=0,2\r\n", "OK", PPP_DEFAULT_CMD_TIMEOUT, PPP_DEFAULT_CMD_RETRY);
            PPP_ERROR_CHECK(err, continue);
            int retry_network = 60;
            while(retry_network--) {
                if (_at_and_get_response(periph_ppp, "AT+COPS?\r\n", PPP_DEFAULT_CMD_TIMEOUT, PPP_DEFAULT_CMD_RETRY) == ESP_OK) {
                    char set_apn_cmd[32];
                    if (_detect_apn(periph_ppp, set_apn_cmd) == ESP_OK) {
                        ESP_LOGI(TAG, "APN=%s", set_apn_cmd);
                        err = _at_and_expect(periph_ppp, set_apn_cmd, "OK", PPP_DEFAULT_CMD_TIMEOUT, PPP_DEFAULT_CMD_RETRY);
                        PPP_ERROR_CHECK(err, continue);
                        break;
                    }
                }
                ESP_LOGD(TAG, "Waiting for mobile network registered");
                vTaskDelay(1000/portTICK_RATE_MS);
            }

            err |= _at_and_expect(periph_ppp, "ATDT*99***1#\r\n", "CONNECT", PPP_DEFAULT_CMD_TIMEOUT, PPP_DEFAULT_CMD_RETRY);
            if (err != ESP_OK) {
                ESP_LOGE(TAG, "Error init gms");
                periph_ppp_reset_connection(self);

            } else {
                periph_ppp->state = PPP_STATE_INIT;
            }

        }

        if (periph_ppp->state == PPP_STATE_INIT) {
            if (periph_ppp->ppp == NULL) {
                periph_ppp->ppp = pppapi_pppos_create(&periph_ppp->ppp_netif, ppp_output_callback, ppp_status_cb, self);
            }
            if (periph_ppp->ppp == NULL) {
                ESP_LOGE(TAG, "Error init pppos");
                periph_ppp_reset_connection(self);
            } else {
                periph_ppp->state = PPP_STATE_CONNECT;
            }
        }

        if (periph_ppp->state == PPP_STATE_CONNECT) {
            pppapi_set_default(periph_ppp->ppp);
            ppp_set_usepeerdns(periph_ppp->ppp, 1);

            ESP_LOGI(TAG, "After pppapi_set_default");

            pppapi_set_auth(periph_ppp->ppp, PPPAUTHTYPE_PAP, "mms", "mms");

            ESP_LOGI(TAG, "After pppapi_set_auth");

            pppapi_connect(periph_ppp->ppp, 0);
            periph_ppp->is_ppp_opened = true;
            ESP_LOGI(TAG, "After pppapi_connect");
            periph_ppp->state = PPP_STATE_IP;
            periph_ppp->rx_timeout_tick = esp_periph_tick_get();
            periph_ppp->wait_send = false;
            // continue;

        }

        if (periph_ppp->state == PPP_STATE_IP) {
            // memset(periph_ppp->buffer, 0, PPP_BUF_SIZE);
            int len = uart_read_bytes(periph_ppp->modem_conn.uart_num, (uint8_t *)periph_ppp->buffer, PPP_BUF_SIZE, 100/portTICK_RATE_MS);
            if (len > 0) {
                ESP_LOGD(TAG, "<== PPP rx len %d", len);
                pppos_input_tcpip(periph_ppp->ppp, (u8_t *)periph_ppp->buffer, len);

                periph_ppp->rx_timeout_tick = 0;
                // Timeout if send and did not received after 10seconds

            }
            else if ( (periph_ppp->rx_timeout_tick && (esp_periph_tick_get() - periph_ppp->rx_timeout_tick) > 5*60*1000)) {
                ESP_LOGW(TAG, "Send data without receive in %d seconds, reset modem, %x", 5*60, periph_ppp->buffer[0]);
                periph_ppp_reset_connection(self);
            }
            // Timeout if not connected after 30seconds
            if (!periph_ppp->connected && (periph_ppp->rx_timeout_tick && esp_periph_tick_get() - periph_ppp->rx_timeout_tick > 30000)) {
                ESP_LOGW(TAG, "PPP connection timeout");
                periph_ppp_reset_connection(self);
            }
        }

        if (periph_ppp->state == PPP_STATE_WAIT_TIMEOUT) {
            ESP_LOGD(TAG, "Waiting for timeout 10secs");
            periph_ppp->connected = false;
            if (periph_ppp->ppp) {

                if (periph_ppp->is_ppp_opened) {
                    ESP_LOGI(TAG, "Closing ppp");
                    periph_ppp->is_ppp_opened = false;
                    pppapi_close(periph_ppp->ppp, 0);
                    // pppapi_free(periph_ppp->ppp);
                    // periph_ppp->ppp = NULL;
                    xEventGroupWaitBits(periph_ppp->state_event, PPP_STOPPED_BIT, false, true, 10000 / portTICK_RATE_MS);
                }
            }
            if (periph_ppp->wait_timeout_tick
                && esp_periph_tick_get() - periph_ppp->wait_timeout_tick > 10*1000) {
                periph_ppp->state = PPP_STATE_UNINIT;
                periph_ppp->wait_timeout_tick = 0;
            }
            vTaskDelay(500 / portTICK_RATE_MS);

        }
    }
    xEventGroupSetBits(periph_ppp->state_event, STOPPED_BIT);
    xEventGroupClearBits(periph_ppp->state_event, STARTED_BIT);
    vTaskDelete(NULL);
}

static esp_err_t _ppp_init(esp_periph_handle_t self)
{
    // int ret = 0;
    VALIDATE_PPP(self, ESP_FAIL);
    periph_ppp_t *periph_ppp = esp_periph_get_data(self);


    periph_ppp->buffer = (char *) malloc(PPP_BUF_SIZE);
    PERIPH_MEM_CHECK(TAG, periph_ppp->buffer, return ESP_ERR_NO_MEM);

    uart_config_t uart_config = {
        .baud_rate = 115200,
        .data_bits = UART_DATA_8_BITS,
        .parity = UART_PARITY_DISABLE,
        .stop_bits = UART_STOP_BITS_1,
        .flow_ctrl = UART_HW_FLOWCTRL_DISABLE
    };
    //Configure UART1 parameters
    uart_param_config(periph_ppp->modem_conn.uart_num, &uart_config);

    ESP_LOGI(TAG, "Configuring UART%d GPIOs: TX:%d RX:%d RTS:%d CTS: %d",
             periph_ppp->modem_conn.uart_num,
             periph_ppp->modem_conn.tx_pin, periph_ppp->modem_conn.rx_pin, -1, -1);
    uart_set_pin(periph_ppp->modem_conn.uart_num, periph_ppp->modem_conn.tx_pin, periph_ppp->modem_conn.rx_pin, -1, -1);
    uart_driver_install(periph_ppp->modem_conn.uart_num, PPP_BUF_SIZE, PPP_BUF_SIZE, 0, NULL, 0);

    // uart_isr_register(periph_ppp->modem_conn.uart_num, uart_int_handler, self, int intr_alloc_flags,  uart_isr_handle_t *handle);

    if (periph_ppp->modem_conn.reset_pin) {
        gpio_config_t io_conf;
        //disable interrupt
        io_conf.intr_type = GPIO_PIN_INTR_DISABLE;
        //set as output mode
        io_conf.mode = GPIO_MODE_OUTPUT;
        //bit mask of the pins that you want to set,e.g.GPIO18/19
        io_conf.pin_bit_mask = (1ULL << periph_ppp->modem_conn.reset_pin);
        //disable pull-down mode
        io_conf.pull_down_en = 0;
        //disable pull-up mode
        io_conf.pull_up_en = 0;
        //configure GPIO with the given settings
        gpio_config(&io_conf);
    }

    _ppp_stop_task(periph_ppp);

    periph_ppp->run = true;

    if (xTaskCreate(_ppp_task, "ppp_task", periph_ppp->task_stack, self, periph_ppp->task_prio, NULL) != pdTRUE) {
        ESP_LOGE(TAG, "Error create console task, memory exhausted?");
        return ESP_FAIL;
    }
    // esp_periph_start_timer(self, 1000 / portTICK_RATE_MS, ppp_timer_handler);
    // esp_periph_send_cmd(self, 0, NULL, 0); //init
    return ESP_OK;
}



static esp_err_t _ppp_run(esp_periph_handle_t self, audio_event_iface_msg_t *msg)
{

    return ESP_OK;
}

static esp_err_t _ppp_destroy(esp_periph_handle_t self)
{
    periph_ppp_t *periph_ppp = esp_periph_get_data(self);

    _ppp_stop_task(periph_ppp);

    if (periph_ppp->ppp) {
        pppapi_close(periph_ppp->ppp, 0);
        pppapi_free(periph_ppp->ppp);
        periph_ppp->ppp = NULL;
    }

    uart_driver_delete(periph_ppp->modem_conn.uart_num);
    vEventGroupDelete(periph_ppp->state_event);
    free(periph_ppp->buffer);
    free(periph_ppp);
    return ESP_OK;
}

esp_periph_handle_t periph_ppp_init(periph_ppp_cfg_t* ppp_cfg)
{
    esp_periph_handle_t periph = esp_periph_create(PERIPH_ID_PPP, ppp_cfg->tag ? ppp_cfg->tag : "periph_ppp");
    PERIPH_MEM_CHECK(TAG, periph, return NULL);
    periph_ppp_t *periph_ppp = calloc(1, sizeof(periph_ppp_t));
    PERIPH_MEM_CHECK(TAG, periph_ppp, {
        free(periph);
        return NULL;
    });

    memcpy(&periph_ppp->modem_conn, &ppp_cfg->modem_conn, sizeof(periph_ppp_modem_conn_t));
    if (periph_ppp->modem_conn.uart_num < 0) {
        periph_ppp->modem_conn.uart_num = PPP_DEFAULT_UART;
    }

    if (periph_ppp->modem_conn.tx_pin < 0) {
        periph_ppp->modem_conn.tx_pin = PPP_DEFAULT_TX_PIN;
    }

    if (periph_ppp->modem_conn.rx_pin < 0) {
        periph_ppp->modem_conn.rx_pin = PPP_DEFAULT_RX_PIN;
    }
    periph_ppp->task_stack = ppp_cfg->task_stack;
    if (periph_ppp->task_stack <= 0) {
        periph_ppp->task_stack = PPP_DEFAULT_TASK_STACK;
    }
    periph_ppp->task_prio = ppp_cfg->task_prio;
    if (periph_ppp->task_prio <= 0) {
        periph_ppp->task_prio = PPP_DEFAULT_TASK_PRIO;
    }
    periph_ppp->state_event = xEventGroupCreate();
    periph_ppp->connected = false;
    xEventGroupClearBits(periph_ppp->state_event, STARTED_BIT);
    xEventGroupSetBits(periph_ppp->state_event, STOPPED_BIT);
    esp_periph_set_data(periph, periph_ppp);
    esp_periph_set_function(periph, _ppp_init, _ppp_run, _ppp_destroy);
    g_ppp = periph;
    return periph;
}

bool periph_ppp_is_connected(esp_periph_handle_t periph)
{
    if (periph == NULL) {
        periph = g_ppp;
    }
    VALIDATE_PPP(periph, false);
    periph_ppp_t *periph_ppp = esp_periph_get_data(periph);
    return periph_ppp->connected;
}

esp_err_t periph_ppp_reset_connection(esp_periph_handle_t periph)
{
    if (periph == NULL) {
        periph = g_ppp;
    }
    VALIDATE_PPP(periph, ESP_FAIL);
    periph_ppp_t *periph_ppp = esp_periph_get_data(periph);
    periph_ppp->wait_timeout_tick = esp_periph_tick_get();
    periph_ppp->rx_timeout_tick = 0;
    periph_ppp->state = PPP_STATE_WAIT_TIMEOUT;
    return ESP_OK;
}
#endif
