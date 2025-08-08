#ifndef _APP_EVENT_H_
#define _APP_EVENT_H_
#include "freertos/FreeRTOS.h"
#include "periph_monitor.h"
#include "periph_mesh.h"
#include "esp_peripherals.h"
#include "periph_blufi.h"
#include "reboot_timer.h"
#include "esp_err.h"
#include "periph_mesh_ota.h"

typedef struct {
    esp_periph_handle_t monitor_handle;
    esp_periph_handle_t mesh_handle;
    esp_periph_handle_t bluefi_handle;
} app_event_config_t;

typedef struct app_event_* app_event_handle_t;

app_event_handle_t app_event_init(app_event_config_t event_config);
esp_err_t app_event_callback(app_event_handle_t event_handle, audio_event_iface_msg_t *event, void *context);
esp_err_t app_event_process_aircond(esp_periph_handle_t aircond_handle, esp_periph_handle_t mesh_handle, audio_event_iface_msg_t *event, void *context);
#endif
