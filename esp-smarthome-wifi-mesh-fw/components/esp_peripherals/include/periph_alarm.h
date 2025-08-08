/*
 * This file is subject to the terms of the Nanochip License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *                             ./LICENSE
 */
#ifndef _PERIPH_ALARM_H_
#define _PERIPH_ALARM_H_


#include "esp_err.h"
#include "esp_peripherals.h"
#include <time.h>
#include <sys/time.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef enum {
    ALARM_SUN = 0x01,
    ALARM_MON = 0x02,
    ALARM_TUE = 0x04,
    ALARM_WED = 0x08,
    ALARM_THU = 0x10,
    ALARM_FRI = 0x20,
    ALARM_SAT = 0x40,
    ALARM_DAY = 0x80,
    ALARM_MONTH = 0x100,
    ALARM_YEAR = 0x200
} alarm_repeat_t;

typedef struct {
    int         utc_offset;
    const char *tag;
    bool        auto_request_time;
} periph_alarm_cfg_t;


typedef enum {
    PERIPH_ALARM_UNCHANGE = 0, /*!< No event */
    PERIPH_ALARM_TICK = 0, /*!< No event */
    PERIPH_ALARM_LOAD,
    PERIPH_ALARM_SAVE,
} periph_alarm_event_id_t;


typedef struct {
    struct tm time;
    int interval_seconds;
    alarm_repeat_t repeat;
} alarm_schedule_t;

typedef void (*schedule_callback)(void *);

esp_periph_handle_t periph_alarm_init(periph_alarm_cfg_t* alarm_cfg);

esp_err_t periph_alarm_set(alarm_schedule_t *schedule, schedule_callback callback);
esp_err_t periph_alarm_remove(int index);
esp_err_t periph_alarm_enable(int index);
esp_err_t periph_alarm_disable(int index);
esp_err_t periph_alarm_list(alarm_schedule_t *schedule);
esp_err_t periph_alarm_wait_for_time(esp_periph_handle_t periph, TickType_t tick_to_wait);
esp_err_t periph_alarm_set_network_available(esp_periph_handle_t periph, bool is_network_available);
#ifdef __cplusplus
}
#endif

#endif
