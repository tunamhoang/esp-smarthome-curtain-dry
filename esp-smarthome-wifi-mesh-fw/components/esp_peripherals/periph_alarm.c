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

#include "soc/soc.h"
#include "soc/rtc_cntl_reg.h"
#include "soc/sens_reg.h"

#include "esp_log.h"
#include "esp_system.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "periph_alarm.h"
#include "periph_wifi.h"
#if __has_include("lwip/apps/sntp.h")
#include "lwip/apps/sntp.h"
#else
#include "apps/sntp/sntp.h"
#endif

static const char* TAG = "PERIPH_ALARM";

#define VALIDATE_ALARM(periph, ret) if (!esp_periph_validate(periph, PERIPH_ID_ALARM)) { \
    ESP_LOGE(TAG, "Invalid ALARM periph, at line %d", __LINE__);\
    return ret;\
}

static const int TIME_AVAILABLE_BIT = BIT0;

typedef struct alarm_item {
    alarm_schedule_t schedule;
    schedule_callback callback;
    bool enabled;
    bool called;
    int tick_seconds;
    STAILQ_ENTRY(alarm_item) next;
} alarm_item_t;

typedef STAILQ_HEAD(alarm_list, alarm_item) alarm_list_t;

typedef struct {
    long long sync_tick;
    int utc_offset;
    alarm_list_t alarms;
    EventGroupHandle_t state_event;
    SemaphoreHandle_t lock;
    bool is_sntp_enabled;
    bool auto_request_time;
    bool is_network_available;
} periph_alarm_t;

static esp_periph_handle_t g_alarm_periph = NULL;

static void alarm_timer_handler(xTimerHandle tmr)
{
    esp_periph_handle_t periph = (esp_periph_handle_t) pvTimerGetTimerID(tmr);
    esp_periph_send_cmd(periph, 0, NULL, 0);
}

static void set_timezone_by_utc(int utc_offset)
{
    char tz[16];
    sprintf(tz, "GMT%c%d", utc_offset < 0 ? '+' : '-', abs(utc_offset));
    setenv("TZ", tz, 1);
    tzset();
}

static void cleanup_alarm(alarm_list_t *alarms)
{
    alarm_item_t *item = STAILQ_FIRST(alarms), *tmp;
    while (item != NULL) {
        tmp = STAILQ_NEXT(item, next);
        free(item);
        item = tmp;
    }
    STAILQ_INIT(alarms);
}

void _alarm_callback(void *self)
{
    ESP_LOGE(TAG, ".......... Alarm Callback ........");
}

static esp_err_t _alarm_run(esp_periph_handle_t self, audio_event_iface_msg_t *msg)
{
    periph_alarm_t *periph_alarm = esp_periph_get_data(self);
    alarm_item_t *item;

    if (!periph_alarm->is_sntp_enabled && periph_alarm->is_network_available && periph_alarm->auto_request_time) {
        periph_alarm->is_sntp_enabled = true;
        sntp_setoperatingmode(SNTP_OPMODE_POLL);
        sntp_setservername(0, "pool.ntp.org");
        sntp_init();
        sntp_enabled();
    }
    time_t now;
    struct tm timeinfo = { 0 };
    time(&now);
    localtime_r(&now, &timeinfo);

    if (timeinfo.tm_year < (2016 - 1900)) {
        xEventGroupClearBits(periph_alarm->state_event, TIME_AVAILABLE_BIT);
        return ESP_OK;
    } else {
        xEventGroupSetBits(periph_alarm->state_event, TIME_AVAILABLE_BIT);
    }

    char strftime_buf[64];
    strftime(strftime_buf, sizeof(strftime_buf), "%c", &timeinfo);
    ESP_LOGD(TAG, "The current date/time in Vietnam is: %s", strftime_buf);

    STAILQ_FOREACH(item, &periph_alarm->alarms, next) {
        if (!item->enabled) {
            continue;
        }
        if (item->callback == NULL) {
            continue;
        }

        int tick = esp_periph_tick_get()/1000;
        int diff = tick - item->tick_seconds;
        if (item->schedule.interval_seconds && diff >= item->schedule.interval_seconds) {
            item->tick_seconds = tick;
            item->callback(self);
            continue;
        }

        if (timeinfo.tm_year < (2016 - 1900)) {
            continue;
        }

        bool alarmed = (timeinfo.tm_hour == item->schedule.time.tm_hour &&
                        timeinfo.tm_min == item->schedule.time.tm_min &&
                        timeinfo.tm_sec == item->schedule.time.tm_sec);
        if (!alarmed) {
            continue;
        }

        if (timeinfo.tm_mday == item->schedule.time.tm_mday &&
                timeinfo.tm_mon == item->schedule.time.tm_mon &&
                timeinfo.tm_year == item->schedule.time.tm_year) {
            //exactly time
            item->callback(self);
            continue;
        }

        //repeat

        if (item->schedule.repeat & ALARM_DAY) {
            item->callback(self);
            continue;
        }

        if ((timeinfo.tm_wday == 0 && (item->schedule.repeat & ALARM_SUN)) ||
                (timeinfo.tm_wday == 1 && (item->schedule.repeat & ALARM_MON)) ||
                (timeinfo.tm_wday == 2 && (item->schedule.repeat & ALARM_TUE)) ||
                (timeinfo.tm_wday == 3 && (item->schedule.repeat & ALARM_WED)) ||
                (timeinfo.tm_wday == 4 && (item->schedule.repeat & ALARM_THU)) ||
                (timeinfo.tm_wday == 5 && (item->schedule.repeat & ALARM_FRI)) ||
                (timeinfo.tm_wday == 6 && (item->schedule.repeat & ALARM_SAT))) {
            item->callback(self);
        }

        if (timeinfo.tm_hour == 0 &&
                        timeinfo.tm_min == 0 &&
                        timeinfo.tm_sec == 0 &&
                        timeinfo.tm_mday == 1 &&
                        item->schedule.repeat & ALARM_MONTH) {
            item->callback(self);
        }
        if (timeinfo.tm_hour == 0 &&
                        timeinfo.tm_min == 0 &&
                        timeinfo.tm_sec == 0 &&
                        timeinfo.tm_mday == 1 &&
                        timeinfo.tm_mon == 1 &&
                        item->schedule.repeat & ALARM_YEAR) {
            item->callback(self);
        }
    }
    return ESP_OK;
}

static esp_err_t _alarm_destroy(esp_periph_handle_t self)
{
    periph_alarm_t *periph_alarm = esp_periph_get_data(self);

    sntp_stop();
    cleanup_alarm(&periph_alarm->alarms);
    vSemaphoreDelete(periph_alarm->lock);
    vEventGroupDelete(periph_alarm->state_event);
    free(periph_alarm);
    return ESP_OK;
}

static esp_err_t _alarm_init(esp_periph_handle_t self)
{
    VALIDATE_ALARM(self, ESP_FAIL);
    periph_alarm_t *periph_alarm = esp_periph_get_data(self);


    set_timezone_by_utc(periph_alarm->utc_offset);
    periph_alarm->sync_tick = esp_periph_tick_get();


    periph_alarm->lock = xSemaphoreCreateBinary();

    xEventGroupClearBits(periph_alarm->state_event, TIME_AVAILABLE_BIT);
    PERIPH_MEM_CHECK(TAG, periph_alarm->lock, {
        return ESP_ERR_NO_MEM;
    });

    esp_periph_start_timer(self, 1000 / portTICK_RATE_MS, alarm_timer_handler);
    ESP_LOGI(TAG, "Alarm initialize");
    return ESP_OK;
}

esp_periph_handle_t periph_alarm_init(periph_alarm_cfg_t* alarm_cfg)
{
    esp_periph_handle_t periph = esp_periph_create(PERIPH_ID_ALARM, alarm_cfg->tag ? alarm_cfg->tag : "periph_alarm");

    periph_alarm_t *periph_alarm = calloc(1, sizeof(periph_alarm_t));

    PERIPH_MEM_CHECK(TAG, periph_alarm, {
        free(periph);
        return NULL;
    });
    STAILQ_INIT(&periph_alarm->alarms);
    periph_alarm->utc_offset = alarm_cfg->utc_offset;
    periph_alarm->auto_request_time = alarm_cfg->auto_request_time;
    periph_alarm->state_event = xEventGroupCreate();
    periph_alarm->is_network_available = false;
    esp_periph_set_data(periph, periph_alarm);
    esp_periph_set_function(periph, _alarm_init, _alarm_run, _alarm_destroy);

    g_alarm_periph = periph;
    return periph;
}

esp_err_t periph_alarm_set(alarm_schedule_t *schedule, schedule_callback callback)
{
    if (g_alarm_periph == NULL) {
        ESP_LOGE(TAG, "Please initialize alarm periph before call this function");
        return ESP_ERR_INVALID_STATE;
    }
    periph_alarm_t *periph_alarm = esp_periph_get_data(g_alarm_periph);

    alarm_item_t *item = calloc(1, sizeof(alarm_item_t));
    PERIPH_MEM_CHECK(TAG, item, {
        return ESP_ERR_NO_MEM;
    });
    memcpy(&item->schedule, schedule, sizeof(alarm_schedule_t));
    item->callback = callback;
    item->enabled = true;
    STAILQ_INSERT_TAIL(&periph_alarm->alarms, item, next);
    return ESP_OK;
}

esp_err_t periph_alarm_wait_for_time(esp_periph_handle_t periph, TickType_t tick_to_wait)
{
    VALIDATE_ALARM(periph, ESP_FAIL);
    periph_alarm_t *periph_alarm = (periph_alarm_t *)esp_periph_get_data(periph);
    EventBits_t available_bit = xEventGroupWaitBits(periph_alarm->state_event, TIME_AVAILABLE_BIT, false, true, tick_to_wait);
    if (available_bit & TIME_AVAILABLE_BIT) {
        return ESP_OK;
    }
    return ESP_FAIL;
}

esp_err_t periph_alarm_set_network_available(esp_periph_handle_t periph, bool is_network_available) {
    VALIDATE_ALARM(periph, ESP_FAIL);
    periph_alarm_t *periph_alarm = (periph_alarm_t *)esp_periph_get_data(periph);
    periph_alarm->is_network_available = is_network_available;
    return ESP_FAIL;
}
