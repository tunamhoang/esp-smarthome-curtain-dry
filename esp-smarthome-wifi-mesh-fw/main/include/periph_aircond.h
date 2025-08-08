/*
 * This file is subject to the terms of the SunshineTech License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *                             ./LICENSE
 */
#ifndef _PERIPH_AIRCOND_H_
#define _PERIPH_AIRCOND_H_

#include "sys/queue.h"
#include "esp_err.h"
#include "esp_peripherals.h"
#include "app_config.h"
#include "esp_htu21df.h"
// #include "samsung_aircond.h"

#ifdef __cplusplus
extern "C" {
#endif

#define PERIPH_ID_AIRCOND               (PERIPH_ID_MAX + 8)
#define DEFAULT_GET_SENSOR_INTERVAL     60 * 1000
#define MAX_INDOOR_UNIT                 (16)
#define AIRCOND_BROADCAST_ADDR          (0xFF)
#define DEFAULT_AIRCOND_SETPOINT        (25)

typedef enum {
    AIRCOND_SPI = 0,
    AIRCOND_UART,
    AIRCOND_HOMEBUS,
    AIRCOND_RS485,
} aircond_physic_t;

typedef union {
    struct {
        int miso;
        int mosi;
        int sck;
        int fake_cs;
        int cs;
        int spi_no;
    } spi;
    struct {
        int tx;
        int rx;
        int uart_no;
        int dum[3];
    } uart;
    struct {
        int tx;
        int rx;
        int uart_no;
        int dum[3];
    } homebus;
    struct {
        int tx;
        int rx;
        int uart_no;
        int dum[3];
    } rs485;
} aircond_hardware_t;

typedef enum {
    AIRCOND_MODE_NO_CHANGE,
    AIRCOND_MODE_OFF,
    AIRCOND_MODE_HEAT,
    AIRCOND_MODE_COOL,
    AIRCOND_MODE_AUTO,
    AIRCOND_MODE_DRY,
    AIRCOND_MODE_FAN,
    AIRCOND_MODE_ON_LAST_MODE,
} aircond_mode_t;

typedef enum {
    AIRCOND_VANE_SWING = 0,
    AIRCOND_VANE_POS1_UP,
    AIRCOND_VANE_POS2,
    AIRCOND_VANE_POS3,
    AIRCOND_VANE_POS4_DOWN,
} aircond_vanes_t;

typedef enum {
    AIRCOND_FANSPEED_AUTO = 0,
    AIRCOND_FANSPEED_1,
    AIRCOND_FANSPEED_2,
    AIRCOND_FANSPEED_3,
    AIRCOND_FANSPEED_4,
} aircond_fanspeed_t;

typedef struct {
    aircond_mode_t mode;
    aircond_vanes_t vanes;
    aircond_fanspeed_t fanspeed;
    int setpoint;
    float temperature;
    float humidity;
    bool is_online;
    uint8_t address;
} aircond_info_t;

typedef struct {
    aircond_physic_t physic;
    aircond_hardware_t hw;
    bool enable_htu_sensor;
    esp_htu21df_config_t htu_config;
    int get_sensor_interval;
    const char *tag;
} periph_aircond_cfg_t;

typedef enum  {
    AIRCOND_EVENT_UNCHANGE = 0,
    AIRCOND_EVENT_ONLINE,
    AIRCOND_EVENT_OFFLINE,
    AIRCOND_EVENT_UPDATE,
    AIRCOND_EVENT_ADD_NEW_INDOOR,
} periph_aircond_event_id_t;

typedef struct ac_homebus_*   homebus_handle_t;
typedef struct ac_spi_*       spi_handle_t;
typedef struct ac_uart_*      uart_handle_t;
typedef struct ac_rs485_*     rs485_handle_t;

esp_periph_handle_t periph_aircond_init(periph_aircond_cfg_t *config);
esp_err_t periph_aircond_set_info(esp_periph_handle_t self, aircond_info_t *info);
esp_err_t periph_aircond_get_info(esp_periph_handle_t self, aircond_info_t *info, int index);
esp_err_t periph_aircond_check_reg(uint32_t* indoor_address, int n_indoor);

esp_err_t periph_aircond_update_state(esp_periph_handle_t handle, aircond_info_t *info);
esp_err_t periph_aircond_request_stop(esp_periph_handle_t handle);
esp_err_t periph_aircond_set_ws_status(esp_periph_handle_t handle, bool ws_status);

homebus_handle_t periph_ac_homebus_init(aircond_hardware_t *homebus_config);
esp_err_t _homebus_init(void *ctx);
aircond_info_t* periph_ac_homebus_process(void *ctx, aircond_info_t* control_info);

spi_handle_t periph_ac_spi_init(aircond_hardware_t *spi_config);
esp_err_t _spi_init(void *ctx);
aircond_info_t* periph_ac_spi_process(void *ctx, aircond_info_t* control_info);

uart_handle_t periph_ac_uart_init(aircond_hardware_t *uart_config);
esp_err_t _uart_init(void *ctx);
aircond_info_t* periph_ac_uart_process(void *ctx, aircond_info_t* control_info);

rs485_handle_t periph_ac_rs485_init(aircond_hardware_t *rs485_config);
esp_err_t _rs485_init(void *ctx);
aircond_info_t* periph_ac_rs485_process(void *ctx, aircond_info_t* control_info);
int periph_ac_rs485_get_num_unit(rs485_handle_t handle);

uint8_t periph_aircond_get_address(esp_periph_handle_t handle, uint8_t *addr_list);
esp_err_t periph_aircond_set_address(esp_periph_handle_t handle, uint8_t tms_addr);
esp_err_t periph_aircond_set_info_default(esp_periph_handle_t self, aircond_info_t *info);
void periph_ac_rs485_set_info_default(rs485_handle_t handle, aircond_info_t *info);
esp_err_t periph_ac_rs485_destroy(rs485_handle_t handle);
#ifdef __cplusplus
}
#endif

#endif
