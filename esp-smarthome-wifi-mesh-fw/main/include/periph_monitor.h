/*
 * This file is subject to the terms of the SunshineTech License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *
 *              ./LICENSE
 */

#ifndef _PERIPH_MONITOR_H_
#define _PERIPH_MONITOR_H_

#include "app_config.h"
#include "periph_motor.h"

#ifdef __cplusplus
extern "C" {
#endif

#define PERIPH_ID_MONITOR (PERIPH_ID_MAX + 2)
#define N_FAST_TAPS_FLAG (5)

typedef struct {
    int                     io_num;
    hw_io_map_t             *io_map;
    hw_io_map_t             *monitor_io;
    int                     num_touch;
    esp_periph_handle_t     led_periph;
    esp_periph_handle_t     led_low_periph;
    esp_periph_handle_t     motor_periph;
    esp_periph_handle_t     remote_periph;
    esp_periph_handle_t     touch_periph;
    esp_periph_handle_t     pir_periph;
    esp_periph_handle_t     btn_periph;
    esp_periph_handle_t     thermostat_periph;
    esp_periph_handle_t     aircond_periph;
    const char              *tag;
    int                     reboot_state;
    motor_control_t         motor_ctrl_cmd[MAX_RELAY_TOUCH_PAD_NUM];
} periph_monitor_cfg_t;

typedef enum {
    TOUCH_STATE_OFF = 0,
    TOUCH_STATE_ON,
    TOUCH_STATE_DOUBLE_TAP,
    TOUCH_STATE_SCENE,
} touch_power_state_t;

typedef enum {
    MONITOR_EVENT_NONE = 0,
    MONITOR_ENTER_CONFIG_MODE = 1,
    MONITOR_EXIT_CONFIG_MODE = 2,
    MONITOR_TOUCH_EVENT = 3,
    MONITOR_TOUCH_DOUBLE_TAP_EVENT,
    MONITOR_TOUCH_SCENE_EVENT,
    MONITOR_TOUCH_UPDATE_CONFIG,
    MONITOR_CURTAIN_EVENT,
    MONITOR_REMOTE_SEND_CMD_COMPLETE,
    MONITOR_EVENT_RESTART,
    MONITOR_TOGGLE_JOINING_GW,
    MONITOR_PIR_EVENT,
} periph_monitor_event_t;

esp_periph_handle_t periph_monitor_init(periph_monitor_cfg_t* monitor_cfg);

esp_err_t periph_monitor_process_events(audio_event_iface_msg_t *event, void *context);
esp_err_t periph_monitor_toggle(esp_periph_handle_t periph, int touch_gpio);
esp_err_t periph_monitor_set_touch_state(esp_periph_handle_t periph, int touch_index, int touch_state, bool event_from_server);
esp_err_t periph_monitor_set_led_state(esp_periph_handle_t periph, int led_index, int led_state, int time_ms);
esp_err_t periph_monitor_toggle_led_state(esp_periph_handle_t periph, int led_index);
esp_err_t periph_monitor_exit_config_mode(esp_periph_handle_t periph);
esp_err_t periph_monitor_blink_status(esp_periph_handle_t periph, int time_ms, int repeat);
esp_err_t periph_monitor_restore_default(esp_periph_handle_t periph);
void periph_monitor_enter_config_mode(esp_periph_handle_t periph);
esp_err_t periph_monitor_set_touch_brightness_mode(esp_periph_handle_t periph);

#ifdef __cplusplus
}
#endif

#endif
