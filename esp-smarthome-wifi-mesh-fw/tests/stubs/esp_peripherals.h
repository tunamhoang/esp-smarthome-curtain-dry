#ifndef ESP_PERIPHERALS_H
#define ESP_PERIPHERALS_H
typedef void* esp_periph_handle_t;
#define PERIPH_MEM_CHECK(TAG, a, action) if (!(a)) { action; }
#endif
