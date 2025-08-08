#ifndef _PERIPH_PIR_H_
#define _PERIPH_PIR_H_

#include "sys/queue.h"
#include "esp_err.h"
#include "time.h"
#include <sys/time.h>
#include "esp_peripherals.h"

#ifdef __cplusplus
extern "C" {
#endif

#define PERIPH_ID_PIR           (PERIPH_ID_MAX + 9)

typedef enum {
    PIR_EVENT_UPDATE_STATUS = 0,
} periph_pir_event_t;

typedef struct {
    uint8_t sensor_pin;
    uint8_t led_pin;
    int time_delay;
    bool enable_led;
    bool active_high;
} periph_pir_cfg_t;

esp_periph_handle_t periph_pir_init(periph_pir_cfg_t* pir_cfg);
int periph_pir_get_sensor_state(esp_periph_handle_t handle);
esp_err_t periph_pir_destroy(esp_periph_handle_t handle);
esp_err_t periph_pir_set_touch_handle_state(esp_periph_handle_t handle, int state, int disable_time_ms);
esp_err_t periph_pir_set_time_delay(esp_periph_handle_t handle, int time_ms);

#ifdef __cplusplus
}
#endif

#endif
