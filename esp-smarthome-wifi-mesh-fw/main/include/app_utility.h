/*
 * This file is subject to the terms of the SunshineTech License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *
 *              ./LICENSE
 */
#ifndef __APP_UTILITY_H__
#define __APP_UTILITY_H__

#include <stdio.h>
#include <stdint.h>
#include <stddef.h>
#include <string.h>
#include "esp_err.h"
#include "esp_log.h"

#ifdef __cplusplus
extern "C" {
#endif

#define APP_LOG_FORMAT(letter, format)  LOG_COLOR_ ## letter #letter "(%-8lu)[%-15s,%-4d]: " format LOG_RESET_COLOR "\n"
#define APP_LOG_HEX_FORMAT(letter, format)  LOG_COLOR_ ## letter #letter "(%-8lu)[%-15s,%-4d]: " format " -> %s" LOG_RESET_COLOR "\n"

#define LOGE(tag, format, ... ) ({                                                                                              \
    if ( LOG_LOCAL_LEVEL >= ESP_LOG_ERROR ) {                                                                               \
        esp_log_write(ESP_LOG_ERROR, tag, APP_LOG_FORMAT(E, format), esp_log_timestamp(), TAG, __LINE__, ##__VA_ARGS__);    \
}})
#define LOGW(tag, format, ... ) ({                                                                                              \
    if ( LOG_LOCAL_LEVEL >= ESP_LOG_WARN ) {                                                                                \
        esp_log_write(ESP_LOG_WARN, tag, APP_LOG_FORMAT(W, format), esp_log_timestamp(), TAG, __LINE__, ##__VA_ARGS__);     \
}})
#define LOGI(tag, format, ... ) ({                                                                                              \
    if ( LOG_LOCAL_LEVEL >= ESP_LOG_INFO ) {                                                                                \
        esp_log_write(ESP_LOG_INFO, tag, APP_LOG_FORMAT(I, format), esp_log_timestamp(), TAG, __LINE__, ##__VA_ARGS__);     \
}})
#define LOGD(tag, format, ... ) ({                                                                                              \
    if ( LOG_LOCAL_LEVEL >= ESP_LOG_DEBUG ) {                                                                               \
        esp_log_write(ESP_LOG_DEBUG, tag, APP_LOG_FORMAT(D, format), esp_log_timestamp(), TAG, __LINE__, ##__VA_ARGS__);    \
}})
#define LOGV(tag, format, ... ) ({                                                                                              \
    if ( LOG_LOCAL_LEVEL >= ESP_LOG_VERBOSE ) {                                                                             \
        esp_log_write(ESP_LOG_VERBOSE, tag, APP_LOG_FORMAT(V, format), esp_log_timestamp(), TAG, __LINE__, ##__VA_ARGS__);  \
}})
#define LOGI_HEX(buf, size, format, ... ) ({                                                                                \
    char *hex = log_buffer_hex(buf, size);                                                                                  \
    esp_log_write(ESP_LOG_INFO, TAG, APP_LOG_HEX_FORMAT(I, format), esp_log_timestamp(), TAG, __LINE__, ##__VA_ARGS__, hex);\
    free(hex);                                                                                                              \
})
#define LOGW_HEX(buf, size, format, ... ) ({                                                                                \
    char *hex = log_buffer_hex(buf, size);                                                                                  \
    esp_log_write(ESP_LOG_INFO, TAG, APP_LOG_HEX_FORMAT(W, format), esp_log_timestamp(), TAG, __LINE__, ##__VA_ARGS__, hex);\
    free(hex);                                                                                                              \
})
#define NEXT()
#define SKIP_NEXT_STEP                  ESP_FAIL
#define PROCESS_NEXT_STEP               ESP_OK

#define IS_NULL(x)                      (x == NULL)
#define IS_NOT_STR(x)                   (x == NULL || (x && strlen(x) == 0))
#define IS_STR(x)                       (!IS_NOT_STR(x))

#define TASK_DELAY_CHECK(sys_tick, tick, action)  if ((sys_tick - tick) < 100) {                                    \
    action;                                                                                                         \
}

#define ERROR_CHECKW(con, str, action)   if (con) {                                                                 \
    if(*str != '\0')                                                                                                \
        LOGW(TAG, "%s:%d (%s):%s", __FILE__, __LINE__, __FUNCTION__, str);                                          \
    action;                                                                                                         \
}

#define CHECK_GOTO(con, lable, action) if (con) {                               \
    action;                                                                     \
    goto lable;                                                                 \
}

#define CHECK_RETURN(con, ret, action) if (con) {                               \
    action;                                                                     \
    return ret;                                                                 \
}

#define LOGI_CHECK(con, format, ...)   if (con) {                                                                   \
    esp_log_write(ESP_LOG_INFO, TAG, APP_LOG_FORMAT(I, format), esp_log_timestamp(), TAG, __LINE__, ##__VA_ARGS__); \
}

#define EVEN_CHECK(event, bit, tick_to_wait, action, format, ...)  if ((xEventGroupWaitBits(event, bit, false, true, tick_to_wait) & bit) == 0) {           \
    if(*format != '\0')                                                                                                                                     \
        LOGW(TAG, format, ##__VA_ARGS__);                                                                                                                        \
    action;                                                                                                                                                 \
}

#define mutex_lock(x)               while (xSemaphoreTake(x, 20/portTICK_RATE_MS) != pdPASS) {      \
    vTaskDelay(20/ portTICK_RATE_MS);                                                               \
}
#define mutex_lock_ret(x, delay, action)               if (xSemaphoreTake(x, delay) != pdPASS) {    \
    action;                                                                                         \
}
#define mutex_unlock(x)                             xSemaphoreGive(x)
#define mutex_create()                              xSemaphoreCreateMutex()
#define mutex_destroy(x)                            vSemaphoreDelete(x)
#define mutex_get(x)                                xSemaphoreGetMutexHolder(x)

#define event_clear(event, bit)                     xEventGroupClearBits(event, bit)
#define event_set(event, bit)                       xEventGroupSetBits(event, bit)
#define event_wait_done(event, bit, tick_to_wait)   (xEventGroupWaitBits(event, bit, false, true, tick_to_wait) & bit)
#define event_create()                              xEventGroupCreate()

char *log_buffer_hex(uint8_t *buff, uint16_t size);
#ifdef __cplusplus
}
#endif

#endif /**< _APP_UTILITY_H_ */
