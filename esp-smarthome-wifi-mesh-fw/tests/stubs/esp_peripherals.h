#ifndef ESP_PERIPHERALS_H
#define ESP_PERIPHERALS_H

#include <stdbool.h>

typedef void* esp_periph_handle_t;
typedef struct { int dummy; } audio_event_iface_msg_t;

#define PERIPH_MEM_CHECK(TAG, a, action) if (!(a)) { action; }
#define PERIPH_ID_MAX 0

esp_periph_handle_t esp_periph_create(int id, const char *name);
void esp_periph_set_data(esp_periph_handle_t periph, void *data);
void *esp_periph_get_data(esp_periph_handle_t periph);
void esp_periph_set_function(esp_periph_handle_t periph, void *init, void *run, void *destroy);
bool esp_periph_validate(esp_periph_handle_t periph, int id);

#endif
