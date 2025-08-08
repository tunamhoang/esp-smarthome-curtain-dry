#ifndef _REBOOT_TIMER_H_
#define _REBOOT_TIMER_H_
#include "freertos/FreeRTOS.h"
#include "esp_err.h"

esp_err_t set_reboot_timer(uint16_t time_ms);

#endif