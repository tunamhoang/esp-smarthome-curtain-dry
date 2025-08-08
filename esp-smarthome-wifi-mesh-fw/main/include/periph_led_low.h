/*
 * This file is subject to the terms of the SunshineTech License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *
 *              ./LICENSE
 */

#ifndef _PERIPH_LED_LOW_H_
#define _PERIPH_LED_LOW_H_

#include "driver/ledc.h"
#include "esp_err.h"
#include "esp_peripherals.h"

#ifdef __cplusplus
extern "C" {
#endif

#define PERIPH_ID_LED_LOW (PERIPH_ID_MAX + 11)

typedef struct {
    ledc_mode_t         led_speed_mode;
    ledc_timer_bit_t    led_duty_resolution;
    ledc_timer_t        led_timer_num;
    uint32_t            led_freq_hz;
    const char          *tag;
    int                 max_duty_percent;
} periph_led_low_cfg_t;

esp_periph_handle_t periph_led_low_init(periph_led_low_cfg_t* config);
esp_err_t periph_led_low_blink(esp_periph_handle_t periph, int gpio_num, int time_on_ms, int time_off_ms, bool fade, int loop);
esp_err_t periph_led_low_falling(esp_periph_handle_t periph, int gpio_num, int time_ms);
esp_err_t periph_led_low_rising(esp_periph_handle_t periph, int gpio_num, int time_ms);
esp_err_t periph_led_low_set_max_duty(esp_periph_handle_t periph, int max_duty_percent);
esp_err_t periph_led_low_set_state(esp_periph_handle_t periph, int gpio_num, int state);
#ifdef __cplusplus
}
#endif

#endif
