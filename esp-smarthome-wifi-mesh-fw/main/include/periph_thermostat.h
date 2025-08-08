#ifndef _PERIPH_THERMOSTAT_H_
#define _PERIPH_THERMOSTAT_H_

#include "sys/queue.h"
#include "esp_err.h"
#include "time.h"
#include <sys/time.h>
#include "esp_peripherals.h"

#ifdef __cplusplus
extern "C" {
#endif

#define PERIPH_ID_THERMOSTAT           (PERIPH_ID_MAX + 10)

typedef enum {
    THERMOSTAT_BTN_POWER,
    THERMOSTAT_BTN_UP,
    THERMOSTAT_BTN_DOWN,
    THERMOSTAT_BTN_MODE,
} thermostat_btn_t;

typedef enum {
    THERMOSTAT_STATE_CONFLICT,
    THERMOSTAT_STATE_ON,
    THERMOSTAT_STATE_OFF,
    THERMOSTAT_STATE_ADDR_CONFIG,
    THERMOSTAT_STATE_MAX,
} thermostat_state_t;

typedef enum {
    THERMOSTAT_MODE_MIN,
    THERMOSTAT_MODE_AUTO,
    THERMOSTAT_MODE_COOL,
    THERMOSTAT_MODE_HEAT,
    THERMOSTAT_MODE_DRY,
    THERMOSTAT_MODE_FAN,
    THERMOSTAT_MODE_VANES,
    THERMOSTAT_MODE_MAX,
} thermostat_mode_t;

typedef enum {
    THERMOSTAT_VANE_MIN,
    THERMOSTAT_VANE_POS1_UP,
    THERMOSTAT_VANE_POS2,
    THERMOSTAT_VANE_POS3,
    THERMOSTAT_VANE_POS4_DOWN,
    THERMOSTAT_VANE_SWING,
    THERMOSTAT_VANE_MAX,
} thermostat_vanes_t;

typedef enum {
    THERMOSTAT_FANSPEED_MIN,
    THERMOSTAT_FANSPEED_AUTO,
    THERMOSTAT_FANSPEED_1,
    THERMOSTAT_FANSPEED_2,
    THERMOSTAT_FANSPEED_3,
    THERMOSTAT_FANSPEED_4,
    THERMOSTAT_FANSPEED_MAX,
} thermostat_fanspeed_t;

typedef struct {
    thermostat_state_t state;
    thermostat_mode_t mode;
    thermostat_vanes_t vanes;
    thermostat_fanspeed_t fanspeed;
    int setpoint;
    float temperature;
    float humidity;
    bool is_online;
    uint8_t address;
    uint8_t address_list[12];
    uint8_t address_num;
    bool wifi_connected;
} thermostat_info_t;

typedef enum {
    THERMOSTAT_EVENT_UPDATE_INFOR = 0,
    THERMOSTAT_EVENT_UPDATE_PROXIMITY,
    THERMOSTAT_EVENT_UPDATE_LUX,
    THERMOSTAT_EVENT_UPDATE_ADDRESS,
} periph_thermostat_event_t;

typedef struct {
    uint8_t scl_pin;
    uint8_t sda_pin;
    uint8_t i2c_port;
    uint8_t backlight_pin;
} periph_thermostat_cfg_t;

esp_periph_handle_t periph_thermostat_init(periph_thermostat_cfg_t* thermostat_cfg);
esp_err_t periph_thermostat_destroy(esp_periph_handle_t handle);
esp_err_t periph_thermostat_proccess_btn(esp_periph_handle_t handle, thermostat_btn_t btn);
esp_err_t periph_thermostat_update(esp_periph_handle_t handle, void *aircond_info);
esp_err_t periph_thermostat_enter_address_config(esp_periph_handle_t handle, uint8_t *addr_list, uint8_t addr_num);
esp_err_t periph_thermostat_exit_address_config(esp_periph_handle_t handle);
uint8_t periph_thermostat_get_address(esp_periph_handle_t handle);
esp_err_t periph_thermostat_set_address(esp_periph_handle_t handle, uint8_t addr);
bool periph_thermostat_get_wifi(esp_periph_handle_t handle);
esp_err_t periph_thermostat_set_wifi(esp_periph_handle_t handle, bool is_connected);
esp_err_t periph_thermostat_set_state(esp_periph_handle_t handle, thermostat_state_t state);
thermostat_state_t periph_thermostat_get_state(esp_periph_handle_t handle);
esp_err_t periph_thermostat_request_control(esp_periph_handle_t self, void *aircond_info);
#ifdef __cplusplus
}
#endif

#endif
