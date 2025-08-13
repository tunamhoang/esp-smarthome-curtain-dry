#ifndef FREERTOS_TIMERS_H
#define FREERTOS_TIMERS_H
#include <stdint.h>
#include "freertos/FreeRTOS.h"

typedef void* TimerHandle_t;
typedef void (*TimerCallbackFunction_t)(TimerHandle_t xTimer);

static inline TimerHandle_t xTimerCreate(const char *name, uint32_t period, int auto_reload,
                                         void *id, TimerCallbackFunction_t callback) {
    (void)name; (void)period; (void)auto_reload; (void)callback;
    return id;
}

static inline void *pvTimerGetTimerID(TimerHandle_t timer) { return timer; }

static inline BaseType_t xTimerReset(TimerHandle_t timer, uint32_t ticks) {
    (void)timer; (void)ticks; return 0;
}

static inline BaseType_t xTimerStop(TimerHandle_t timer, uint32_t ticks) {
    (void)timer; (void)ticks; return 0;
}

static inline BaseType_t xTimerDelete(TimerHandle_t timer, uint32_t ticks) {
    (void)timer; (void)ticks; return 0;
}

#endif
