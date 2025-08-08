/*
 * ESPRESSIF MIT License
 *
 * Copyright (c) 2018 <ESPRESSIF SYSTEMS (SHANGHAI) PTE LTD>
 *
 * Permission is hereby granted for use on all ESPRESSIF SYSTEMS products, in which case,
 * it is free of charge, to any person obtaining a copy of this software and associated
 * documentation files (the "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the Software is furnished
 * to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all copies or
 * substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 */

#include <string.h>
#include <sys/time.h>
#include "freertos/FreeRTOS.h"
#include "freertos/semphr.h"
#include "freertos/task.h"
#include "freertos/event_groups.h"
#include "driver/gpio.h"
#include <sys/queue.h>
#include "esp_log.h"
#include "audio_event_iface.h"
#include "esp_peripherals.h"
// #include "tcpip_adapter.h"
#include "esp_netif.h"
#include "nvs.h"
#include "esp_timer.h"
#include "esp_mac.h"
#include "sdkconfig.h"
#include "tct_template.h"
#if CONFIG_PPP_SUPPORT && CONFIG_ENABLE_PERIPH_PPP
#include "periph_ppp.h"
#endif

static const char* TAG = "ESP_PERIPH";


#define mutex_lock(x)       while (xSemaphoreTake(x, portMAX_DELAY) != pdPASS);
#define mutex_unlock(x)     xSemaphoreGive(x)
#define mutex_create()      xSemaphoreCreateMutex()
#define mutex_destroy(x)    vQueueDelete(x)


#define DEFAULT_ESP_PERIPH_STACK_SIZE      (4*1024)
#define DEFAULT_ESP_PERIPH_TASK_PRIO       (5)
#define DEFAULT_ESP_PERIPH_TASK_CORE       (0)
#define DEFAULT_ESP_PERIPH_WAIT_TICK       (10/portTICK_RATE_MS)
#define ESP_PERIPH_NAMESPACE               "PERIPH"

#define CONTROL_QUEUE_SIZE 5

struct esp_periph {
    char*                       tag;
    bool                        disabled;
    esp_periph_id_t             periph_id;
    esp_periph_func             init;
    esp_periph_run_func         run;
    esp_periph_func             destroy;
    esp_periph_state_t          state;
    void*                       user_context;
    void*                       periph_data;
    TimerHandle_t               timer;
    STAILQ_ENTRY(esp_periph)    entries;
};

typedef struct esp_periph_obj {
    EventGroupHandle_t                              state_event_bits;
    xSemaphoreHandle                                lock;
    xSemaphoreHandle                                max_connections;
    bool                                            run;
    void*                                           periph_data;
    void*                                           user_context;
    esp_periph_event_handle_t                       event_handle;
    STAILQ_HEAD(esp_periph_list_item, esp_periph)   periph_list;
    audio_event_iface_handle_t                      event_iface;
    int                                             task_stack;
    int                                             task_prio;
    int                                             task_core;
    int                                             max_parallel_connections;
    esp_storage_handle_t                            storage;
} esp_periph_obj_t;


static esp_periph_obj_t *g_esp_periph_obj = NULL;

static const int STARTED_BIT = BIT0;
static const int STOPPED_BIT = BIT1;

static esp_err_t esp_periph_wait_for_stopped(TickType_t ticks_to_wait);

static esp_err_t process_peripheral_event(audio_event_iface_msg_t *msg, void *context)
{
    esp_periph_handle_t periph_evt = (esp_periph_handle_t) msg->source;
    esp_periph_handle_t periph;
    STAILQ_FOREACH(periph, &g_esp_periph_obj->periph_list, entries) {
        if (periph->periph_id == periph_evt->periph_id
                && periph_evt->state == PERIPH_STATE_RUNNING
                && periph_evt->run
                && !periph_evt->disabled) {
            return periph_evt->run(periph_evt, msg);
        }
    }
    return ESP_OK;
}

esp_err_t esp_periph_init(esp_periph_config_t* config)
{
    if (g_esp_periph_obj != NULL) {
        PERIPH_ERROR(TAG, "Peripherals have been initialized already");
        return ESP_FAIL;
    }
    int _err_step = 1;
    bool _success =
        (
            (g_esp_periph_obj                   = calloc(1, sizeof(esp_periph_obj_t)))  && _err_step ++ &&
            (g_esp_periph_obj->state_event_bits = xEventGroupCreate())                  && _err_step ++ &&
            (g_esp_periph_obj->lock             = mutex_create())                       && _err_step ++
        );

    PERIPH_MEM_CHECK(TAG, _success, {
        goto _periph_init_failed;
    });

    STAILQ_INIT(&g_esp_periph_obj->periph_list);

    //TODO: Should we uninstall gpio isr service??
    //TODO: Because gpio need for sdcard and gpio, then install isr here
    // gpio_uninstall_isr_service();
    gpio_install_isr_service(ESP_INTR_FLAG_LEVEL1);

    g_esp_periph_obj->run = false;
    xEventGroupClearBits(g_esp_periph_obj->state_event_bits, STARTED_BIT);
    xEventGroupSetBits(g_esp_periph_obj->state_event_bits, STOPPED_BIT);
    g_esp_periph_obj->user_context = config->user_context;
    g_esp_periph_obj->event_handle = config->event_handle;

    g_esp_periph_obj->task_stack = config->task_stack ? config->task_stack : DEFAULT_ESP_PERIPH_STACK_SIZE;
    g_esp_periph_obj->task_prio = config->task_prio ? config->task_prio : DEFAULT_ESP_PERIPH_TASK_PRIO;
    g_esp_periph_obj->task_core = config->task_core;
    g_esp_periph_obj->max_parallel_connections = config->max_parallel_connections ? config->max_parallel_connections : 10;

    g_esp_periph_obj->max_connections = xSemaphoreCreateCounting(config->max_parallel_connections, config->max_parallel_connections);
    PERIPH_MEM_CHECK(TAG, g_esp_periph_obj->max_connections, goto _periph_init_failed);
    esp_storage_config_t storage_config = {
        .namespace = "esp_periph",
        .buffer_size = 4*1024,
    };
    g_esp_periph_obj->storage = esp_storage_init(&storage_config);
    PERIPH_MEM_CHECK(TAG, g_esp_periph_obj->storage, goto _periph_init_failed);

    audio_event_iface_cfg_t event_cfg = AUDIO_EVENT_IFACE_DEFAULT_CFG();
    // audio_cfg.internal_queue_size = 0;
    event_cfg.queue_set_size = 0;
    event_cfg.context = g_esp_periph_obj;
    event_cfg.on_cmd = process_peripheral_event;
    g_esp_periph_obj->event_iface = audio_event_iface_init(&event_cfg);

    PERIPH_MEM_CHECK(TAG, g_esp_periph_obj->event_iface, goto _periph_init_failed);
    audio_event_iface_set_cmd_waiting_timeout(g_esp_periph_obj->event_iface, DEFAULT_ESP_PERIPH_WAIT_TICK);
    return ESP_OK;

_periph_init_failed:
    if (g_esp_periph_obj) {
        mutex_destroy(g_esp_periph_obj->lock);
        vEventGroupDelete(g_esp_periph_obj->state_event_bits);
        vSemaphoreDelete(g_esp_periph_obj->max_connections);

        if (g_esp_periph_obj->event_iface) {
            audio_event_iface_destroy(g_esp_periph_obj->event_iface);
        }
        esp_storage_destroy(g_esp_periph_obj->storage);
        free(g_esp_periph_obj);
        g_esp_periph_obj = NULL;
    }
    return ESP_FAIL;
}

esp_err_t esp_periph_start_timer(esp_periph_handle_t periph, TickType_t interval_tick, TimerCallbackFunction_t callback)
{
    if (periph->timer == NULL) {
        periph->timer = xTimerCreate("periph_itmer", interval_tick, pdTRUE, periph, callback);
        if (xTimerStart(periph->timer, 0) != pdTRUE) {
            PERIPH_ERROR(TAG, "Error to start timer");
            return ESP_FAIL;
        }
    }
    return ESP_OK;
}

esp_err_t esp_periph_stop_timer(esp_periph_handle_t periph)
{
    if (periph->timer) {
        xTimerStop(periph->timer, portMAX_DELAY);
        xTimerDelete(periph->timer, portMAX_DELAY);
        periph->timer = NULL;
    }
    return ESP_OK;
}


esp_err_t esp_periph_destroy()
{
    if (g_esp_periph_obj == NULL) {
        PERIPH_ERROR(TAG, "Peripherals have not been initialized");
        return ESP_FAIL;
    }
    g_esp_periph_obj->run = false;
    esp_periph_wait_for_stopped(portMAX_DELAY);

    esp_periph_handle_t item, tmp;
    STAILQ_FOREACH_SAFE(item, &g_esp_periph_obj->periph_list, entries, tmp) {
        STAILQ_REMOVE(&g_esp_periph_obj->periph_list, item, esp_periph, entries);
        free(item->tag);
        free(item);
    }
    mutex_destroy(g_esp_periph_obj->lock);
    vEventGroupDelete(g_esp_periph_obj->state_event_bits);
    // TODO: NEED That?
    gpio_uninstall_isr_service();
    audio_event_iface_destroy(g_esp_periph_obj->event_iface);
    esp_storage_destroy(g_esp_periph_obj->storage);
    free(g_esp_periph_obj);
    g_esp_periph_obj = NULL;
    return ESP_OK;
}


esp_periph_handle_t esp_periph_create(int periph_id, const char *tag)
{
    if (esp_periph_get_by_id(periph_id) != NULL) {
        PERIPH_ERROR(TAG, "This peripheral has been already added");
        return NULL;
    }

    esp_periph_handle_t new_entry = calloc(1, sizeof(struct esp_periph));

    PERIPH_MEM_CHECK(TAG, new_entry, return NULL);

    if (tag) {
        new_entry->tag = strdup(tag);
    } else {
        new_entry->tag = strdup("periph");
    }
    PERIPH_MEM_CHECK(TAG, new_entry->tag, {
        free(new_entry);
        return NULL;
    })
    new_entry->user_context = g_esp_periph_obj->user_context;
    new_entry->state = PERIPH_STATE_INIT;
    new_entry->periph_id = periph_id;
    return new_entry;
}

esp_periph_handle_t esp_periph_get_by_id(int periph_id)
{
    esp_periph_handle_t periph;

    if (g_esp_periph_obj == NULL) {
        PERIPH_ERROR(TAG, "Peripherals have not been initialized");
        return NULL;
    }

    mutex_lock(g_esp_periph_obj->lock);

    STAILQ_FOREACH(periph, &g_esp_periph_obj->periph_list, entries) {
        if (periph->periph_id == periph_id) {
            mutex_unlock(g_esp_periph_obj->lock);
            return periph;
        }
    }
    ESP_LOGD(TAG, "Periph id %d not found", periph_id);
    mutex_unlock(g_esp_periph_obj->lock);
    return NULL;
}

esp_err_t esp_periph_set_function(esp_periph_handle_t periph,
                                  esp_periph_func init,
                                  esp_periph_run_func run,
                                  esp_periph_func destroy)
{
    periph->init = init;
    periph->run = run;
    periph->destroy = destroy;
    return ESP_OK;
}

static void esp_periph_task(void* pv)
{
    esp_periph_handle_t periph;
    ESP_LOGD(TAG, "esp_periph_task is running");
    xEventGroupSetBits(g_esp_periph_obj->state_event_bits, STARTED_BIT);
    xEventGroupClearBits(g_esp_periph_obj->state_event_bits, STOPPED_BIT);

    while (g_esp_periph_obj->run) {
        mutex_lock(g_esp_periph_obj->lock);
        STAILQ_FOREACH(periph, &g_esp_periph_obj->periph_list, entries) {
            if (periph->disabled) {
                continue;
            }
            if (periph->state == PERIPH_STATE_INIT && periph->init) {
                ESP_LOGD(TAG, "PERIPH[%s]->init", periph->tag);
                if (periph->init(periph) == ESP_OK) {
                    periph->state = PERIPH_STATE_RUNNING;
                } else {
                    periph->state = PERIPH_STATE_ERROR;
                }
            }
        }
        mutex_unlock(g_esp_periph_obj->lock);
        audio_event_iface_waiting_cmd_msg(esp_periph_get_event_iface(periph));
    }
    STAILQ_FOREACH(periph, &g_esp_periph_obj->periph_list, entries) {
        esp_periph_stop_timer(periph);
        if (periph->destroy) {
            periph->destroy(periph);
        }
    }
    xEventGroupClearBits(g_esp_periph_obj->state_event_bits, STARTED_BIT);
    xEventGroupSetBits(g_esp_periph_obj->state_event_bits, STOPPED_BIT);

    vTaskDelete(NULL);
}

esp_err_t esp_periph_start(esp_periph_handle_t periph)
{
    if (g_esp_periph_obj == NULL) {
        PERIPH_ERROR(TAG, "Peripherals have not been initialized");
        return ESP_FAIL;
    }
    if (esp_periph_get_by_id(periph->periph_id) != NULL) {
        ESP_LOGI(TAG, "This peripheral has been added");
        periph->disabled = false;
    } else {
        ESP_LOGI(TAG, "Insert peripheral %d", periph->periph_id);
        STAILQ_INSERT_TAIL(&g_esp_periph_obj->periph_list, periph, entries);
    }


    if (g_esp_periph_obj->run == false) {
        g_esp_periph_obj->run = true;
        ESP_LOGI(TAG, "create task at core %d, prio=%d, stack=%d",
            g_esp_periph_obj->task_core, g_esp_periph_obj->task_prio, g_esp_periph_obj->task_stack);
        if (xTaskCreatePinnedToCore(esp_periph_task,
                                    "esp_periph",
                                    g_esp_periph_obj->task_stack,
                                    NULL,
                                    g_esp_periph_obj->task_prio,
                                    NULL,
                                    g_esp_periph_obj->task_core) != pdTRUE) {
            PERIPH_ERROR(TAG, "Error create peripheral task");
            g_esp_periph_obj->run = false;
            return ESP_FAIL;
        }
    }
    return ESP_OK;
}

esp_err_t esp_periph_stop(esp_periph_handle_t periph)
{
    if (periph) {
        periph->disabled = true;
        return ESP_OK;
    }
    return ESP_OK;
}

esp_err_t esp_periph_kill(esp_periph_handle_t periph)
{
    return ESP_OK;
}

esp_err_t esp_periph_stop_all()
{
    if (g_esp_periph_obj == NULL) {
        PERIPH_ERROR(TAG, "Peripherals have not been initialized");
        return ESP_FAIL;
    }
    esp_periph_handle_t periph;
    STAILQ_FOREACH(periph, &g_esp_periph_obj->periph_list, entries) {
        periph->disabled = true;
    }
    return ESP_OK;
}

esp_err_t esp_periph_wait_for_stopped(TickType_t ticks_to_wait)
{
    EventGroupHandle_t ev_bits = g_esp_periph_obj->state_event_bits;

    EventBits_t uxBits = xEventGroupWaitBits(ev_bits, STOPPED_BIT, false, true, ticks_to_wait);
    if (uxBits & STOPPED_BIT) {
        return ESP_OK;
    }
    return ESP_FAIL;
}

esp_err_t esp_periph_send_cmd(esp_periph_handle_t periph, int cmd, void *data, int data_len)
{
    audio_event_iface_msg_t msg;
    msg.cmd = cmd;
    msg.source = periph;
    msg.source_type = periph->periph_id;
    msg.data = (void *)data;
    msg.data_len = data_len;
    return audio_event_iface_cmd(g_esp_periph_obj->event_iface, &msg);
}

esp_err_t esp_periph_send_cmd_from_isr(esp_periph_handle_t periph, int cmd, void *data, int data_len)
{
    audio_event_iface_msg_t msg;
    msg.cmd = cmd;
    msg.source = periph;
    msg.source_type = periph->periph_id;
    msg.data = (void *)data;
    msg.data_len = data_len;
    return audio_event_iface_cmd_from_isr(g_esp_periph_obj->event_iface, &msg);
}

esp_err_t esp_periph_send_event(esp_periph_handle_t periph, int event_id, void *data, int data_len)
{
    audio_event_iface_msg_t msg;
    msg.source_type = periph->periph_id;
    msg.cmd = event_id;
    msg.data = data;
    msg.data_len = data_len;
    msg.need_free_data = false;
    msg.source = periph;

    if (g_esp_periph_obj->event_handle) {
        g_esp_periph_obj->event_handle(&msg, periph->user_context);
    }
    return audio_event_iface_sendout(g_esp_periph_obj->event_iface, &msg);
}


esp_err_t esp_periph_set_data(esp_periph_handle_t periph, void* data)
{
    periph->periph_data = data;
    return ESP_OK;
}

void* esp_periph_get_data(esp_periph_handle_t periph)
{
    return periph->periph_data;
}

esp_periph_state_t esp_periph_get_state(esp_periph_handle_t periph)
{
    return periph->state;
}

QueueHandle_t esp_periph_get_queue()
{
    return audio_event_iface_get_queue_handle(g_esp_periph_obj->event_iface);
}

esp_periph_id_t esp_periph_get_id(esp_periph_handle_t periph)
{
    return periph->periph_id;
}

esp_err_t esp_periph_set_id(esp_periph_handle_t periph, esp_periph_id_t periph_id)
{
    periph->periph_id = periph_id;
    return ESP_OK;
}


audio_event_iface_handle_t esp_periph_get_event_iface()
{
    return g_esp_periph_obj->event_iface;
}

long long esp_periph_tick_get()
{
    return esp_timer_get_time()/1000;
}

bool esp_periph_is_network_available()
{
    //TODO: check ETH ADAPTER Also
    // tcpip_adapter_ip_info_t ip;
    // tcpip_adapter_get_ip_info(TCPIP_ADAPTER_IF_STA, &ip);
    // if (ip.ip.addr) {
    //     return true;
    // }
    // tcpip_adapter_get_ip_info(TCPIP_ADAPTER_IF_ETH, &ip);
    // if (ip.ip.addr) {
    //     return true;
    // }
    esp_netif_t        *netif = esp_netif_get_default_netif();
    esp_netif_ip_info_t ip;
    esp_netif_get_ip_info(netif, &ip);
    if (ip.ip.addr) {
        return true;
    }
#if CONFIG_PPP_SUPPORT && CONFIG_ENABLE_PERIPH_PPP
    if (periph_ppp_is_connected(NULL)) {
        return true;
    }
#endif
    return false;
}

bool esp_periph_is_time_synced()
{
    time_t now;
    struct tm timeinfo = { 0 };
    time(&now);
    localtime_r(&now, &timeinfo);
    if (timeinfo.tm_year < (2016 - 1900)) {
        return true;
    }
    return false;
}

uint64_t esp_periph_get_device_id()
{
    uint64_t ret = 0;
    esp_efuse_mac_get_default((uint8_t*)&ret);
    ret >>= 24;
    return ret;
}

uint64_t esp_periph_get_device_id_full()
{
    uint64_t ret = 0;
    esp_efuse_mac_get_default((uint8_t*)&ret);
    ret >>= 16;
    return ret;
}

bool esp_periph_validate(esp_periph_handle_t periph, esp_periph_id_t id)
{
    if (periph == NULL) {
        return false;
    }
    if (esp_periph_get_id(periph) != id) {
        return false;
    }
    return true;
}

esp_err_t esp_periph_set_config_func(esp_periph_handle_t periph,
                                     storage_unpack_func unpack,
                                     storage_pack_func pack)
{
    if (periph == NULL || g_esp_periph_obj == NULL) {
        return ESP_ERR_INVALID_STATE;
    }
    return esp_storage_add(g_esp_periph_obj->storage, periph->tag, unpack, pack, periph);
}


esp_err_t esp_periph_save_config(esp_periph_handle_t periph)
{
    if (periph == NULL || g_esp_periph_obj == NULL) {
        return ESP_ERR_INVALID_STATE;
    }
    return esp_storage_save(g_esp_periph_obj->storage, periph->tag);
}

static esp_err_t _esp_periph_load_config(esp_periph_handle_t periph)
{
    if (periph == NULL || g_esp_periph_obj == NULL) {
        return ESP_ERR_INVALID_STATE;
    }

    return esp_storage_load(g_esp_periph_obj->storage, periph->tag);
}

esp_err_t esp_periph_load_config(esp_periph_handle_t periph)
{
    if (_esp_periph_load_config(periph) == ESP_ERR_NVS_NOT_FOUND) {
        return esp_periph_save_config(periph);
    }
    return ESP_OK;
}

esp_err_t esp_periph_clear_to_default_config(esp_periph_handle_t periph)
{
    return ESP_OK;
}

esp_err_t esp_periph_acquire_connection(TickType_t timeout)
{
    if (g_esp_periph_obj == NULL) {
        return ESP_ERR_INVALID_STATE;
    }
    if (xSemaphoreTake(g_esp_periph_obj->max_connections, timeout) != pdTRUE) {
        return ESP_FAIL;
    }
    return ESP_OK;
}

esp_err_t esp_periph_release_connection()
{
    if (g_esp_periph_obj == NULL) {
        return ESP_ERR_INVALID_STATE;
    }
    if (xSemaphoreGive(g_esp_periph_obj->max_connections) == pdTRUE) {
        return ESP_OK;
    }
    return ESP_FAIL;
}
int esp_periph_get_total_connections()
{
    if (g_esp_periph_obj == NULL) {
        return -1;
    }
    return (int)uxSemaphoreGetCount(g_esp_periph_obj->max_connections);
}

char *esp_periph_format_data(const char *template, ...)
{
    tct_arguments *args = NULL;
    uint64_t dev_id = esp_periph_get_device_id_full();

    tct_add_argument(args, "id", "%06llX", (dev_id >> 8) & 0xFFFFFF);
    tct_add_argument(args, "xid", "%08llX", dev_id & 0xFFFFFFFF);

    va_list vargs;
    va_start(vargs, template);
    char *tmp_str;
    int idx = 0;
    char arg_id[16];
    while ((tmp_str = va_arg(vargs, char *)) != NULL) {
        snprintf(arg_id, 16, "%d", idx++);
        tct_add_argument(args, arg_id, "%s", tmp_str);
    }
    va_end(vargs);

    char *render = tct_render((char *)template, args);
    tct_free_argument(args);
    return render;
}
