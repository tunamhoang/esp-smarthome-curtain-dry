
#include <stdint.h>
#include <string.h>
#include <stdbool.h>
#include <stdio.h>
#include "nvs.h"
#include "nvs_flash.h"
#include "tcpip_adapter.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_log.h"
#include "esp_peripherals.h"
#include "periph_wifi.h"
#include "periph_led.h"
#include "periph_button.h"
#include "periph_touch.h"
#include "periph_sdcard.h"
#include "periph_ppp.h"
#include "periph_alarm.h"

static const char *TAG = "ESP_PERIPH_APP";

esp_err_t _periph_event_handle_t(audio_event_iface_msg_t *event, void *context)
{
    return ESP_OK;
}

void app_main()
{
    // Initialize NVS.
    esp_log_level_set("*", ESP_LOG_INFO);
    esp_log_level_set("ESP_PERIPH", ESP_LOG_DEBUG);


    esp_err_t ret = nvs_flash_init();
    if (ret == ESP_ERR_NVS_NO_FREE_PAGES) {
        ESP_ERROR_CHECK(nvs_flash_erase());
        ret = nvs_flash_init();
    }
    ESP_ERROR_CHECK(ret);

    tcpip_adapter_init();

    esp_periph_config_t config = {
        .event_handle = _periph_event_handle_t,
    };

    esp_periph_init(&config);

    // WiFi
    periph_wifi_cfg_t wifi_cfg = {
        .ssid = "ssid",
        .password = "password",
    };
    esp_periph_handle_t wifi_handle = periph_wifi_init(&wifi_cfg);
    esp_periph_start(wifi_handle);
    periph_wifi_wait_for_connected(wifi_handle, portMAX_DELAY);

    // LED
    periph_led_cfg_t led_cfg = {
        .led_speed_mode = LEDC_LOW_SPEED_MODE,
        .led_duty_resolution = LEDC_TIMER_10_BIT,
        .led_timer_num = LEDC_TIMER_0,
        .led_freq_hz = 5000,
    };
    esp_periph_handle_t led_handle = periph_led_init(&led_cfg);
    esp_periph_start(led_handle);

    // Button
    periph_button_cfg_t btn_cfg = {
        .gpio_mask = GPIO_SEL_36 | GPIO_SEL_39
    };
    esp_periph_handle_t button_handle = periph_button_init(&btn_cfg);
    esp_periph_start(button_handle);

    // Touch
    periph_touch_cfg_t touch_cfg = {
        .touch_mask = TOUCH_PAD_SEL4 | TOUCH_PAD_SEL7 | TOUCH_PAD_SEL8 | TOUCH_PAD_SEL9,
        .tap_threshold_percent = 70,
    };
    esp_periph_handle_t touch_handle = periph_touch_init(&touch_cfg);
    esp_periph_start(touch_handle);

    // SDCard
    periph_sdcard_cfg_t sdcard_cfg = {
        .root = "/sdcard",
        .card_detect_pin = GPIO_NUM_34, //-1 if disabled, SD_CARD_INTR_GPIO
    };
    esp_periph_handle_t sdcard_handle = periph_sdcard_init(&sdcard_cfg);
    esp_periph_start(sdcard_handle);

    // PPP
    periph_ppp_cfg_t ppp_cfg = {
        .modem_conn = {
            .tx_pin = 17,
            .rx_pin = 16,
            .uart_num = 1,
            .reset_pin = 5,
        }
    };

    esp_periph_handle_t ppp_handle = periph_ppp_init(&ppp_cfg);
    esp_periph_start(ppp_handle);

    // Alarm required for zalopay (time)
    periph_alarm_cfg_t alarm_cfg = {
        .utc_offset = 7
    };

    esp_periph_handle_t alarm_handle = periph_alarm_init(&alarm_cfg);
    esp_periph_start(alarm_handle);
    periph_alarm_wait_for_time(alarm_handle, portMAX_DELAY);
}

