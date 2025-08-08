#ifndef _THERMOSTAT_DISPLAY_H
#define _THERMOSTAT_DISPLAY_H

#include "freertos/FreeRTOS.h"
#include "esp_err.h"

typedef enum {
    DISP_POWER_ON,
    DISP_POWER_OFF,
    DISP_POWER_CONFLICT,
} disp_power_t;

typedef enum {
    DISP_MODE_HEAT,
    DISP_MODE_COOL,
    DISP_MODE_AUTO,
    DISP_MODE_DRY,
    DISP_MODE_FAN,
    DISP_MODE_VANES,
} disp_mode_t;

typedef enum {
    DISP_VANE_POS1_UP,
    DISP_VANE_POS2,
    DISP_VANE_POS3,
    DISP_VANE_POS4_DOWN,
    DISP_VANE_SWING,
} disp_vanes_t;

typedef enum {
    DISP_FANSPEED_AUTO,
    DISP_FANSPEED_1,
    DISP_FANSPEED_2,
    DISP_FANSPEED_3,
    DISP_FANSPEED_4,
} disp_fanspeed_t;

typedef enum {
    DISP_BOOTING,
    DISP_NORMAL,
    DISP_ROOM_TEMP,
    DISP_ROOM_HUMP,
    DISP_SETPOINT,
    DISP_MODE,
    DISP_FAN,
    DISP_VANES,
    DISP_CONFIG_MODE,
} disp_opt_t;

typedef struct {
    disp_power_t power;
    disp_mode_t mode;
    disp_vanes_t vanes;
    disp_fanspeed_t fanspeed;
    int setpoint;
    float temperature;
    float humidity;
    int address;
    bool wifi_connected;
} disp_info_t;

typedef struct {
    uint64_t disp_map;
    disp_info_t *info;
} disp_handle_;

typedef disp_handle_ *disp_handle_t;

disp_handle_t segment_display_init();
uint8_t segment_display_generate_data(disp_handle_t handle, uint8_t *data_out, disp_opt_t disp_opt, bool blink_off);

#endif
