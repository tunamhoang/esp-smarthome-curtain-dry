#include "reboot_timer.h"
#include "periph_alarm.h"

static TimerHandle_t _reboot_timer = NULL;

static void _reboot_timeout(TimerHandle_t xTimer)
{
    if (_reboot_timer == NULL) {
        return;
    }
    xTimerStop(_reboot_timer, portMAX_DELAY);
    xTimerDelete(_reboot_timer, portMAX_DELAY);
    _reboot_timer = NULL;
    esp_restart();
}

esp_err_t set_reboot_timer(uint16_t time_ms) {
    if (_reboot_timer == NULL) {
        _reboot_timer = xTimerCreate("reboot_timer", time_ms / portTICK_RATE_MS, pdTRUE, NULL, _reboot_timeout);
        xTimerStart(_reboot_timer, portMAX_DELAY);
    } else {
        return ESP_FAIL;
    }
    return ESP_OK;
}
