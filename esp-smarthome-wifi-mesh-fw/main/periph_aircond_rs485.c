/*
 * This file is subject to the terms of the SunshineTech License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *                             ./LICENSE
 */
#include <stdlib.h>
#include <stdio.h>
#include <stddef.h>
#include <string.h>
#include "esp_err.h"
#include "esp_log.h"
#include "esp_system.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "periph_aircond.h"
#include "freertos/portmacro.h"

#include "driver/uart.h"
#include "driver/gpio.h"
#include "app_config.h"
#include "app_utility.h"
#include "ac_packet_frame.h"

static const char *TAG = "AIRCOND_RS485";

#include "driver/uart.h"
#include "freertos/event_groups.h"
#include "freertos/semphr.h"

#define DEFAULT_AIRCOND_TASK_STACK      (3*1024)
#define ADDRESS_DEBUG                   (0x0A)
#define DEFAULT_RINGBUFFER_SIZE         (512)
#define MAX_RX_BUF_SIZE                 (512)
#define MAX_TX_BUF_SIZE                 (255)
#define MAX_FRAME_SIZE                  (255)

#define AIRCOND_TIMEOUT_MS              (180*1000)
#define AIRCOND_CONTROL_TIMEOUT_MS      (3*1000)

#define N_TIMES_GET_ADDRESS_INFO        (10)
#define MAX_MESSAGE_SIZE                (20)

#define DEFAULT_UART_BAUDRATE           (9600)

#define ERV_ADDRESS_MASK                (0x300000)
#define INDOOR_ADDRESS_MASK             (0x200000)
#define OUTDOOR_ADDRESS_MASK            (0x100000)
#define OWN_ADDRESS                     (0x6AEEFF)
#define BROADCAST_CL_DEVICES_ADDRESS    (0xB0FFFF)
#define BROADCAST_CL_OUTDOOR_ADDRESS    (0xB0FF10)
#define BROADCAST_CL_OUTDOOR_CONNECTED  (0xB000FF)
#define BROADCAST_CL_SL_OUTDOOR_CONNECTED  (0xB300FF)
#define DATA_FILL_1                     (0xFF)
#define DATA_FILL_2                     (0xFFFF)
#define DATA_FILL_4                     (0xFFFFFFFF)
#define ADDRESS_FILL                    (0xFF0000)
#define BROADCAST_FILL                  (0xFF00FF)

#define MESSAGE_IDX_GET_ADDRESS         (0x0408)
#define MESSAGE_IDX_CHECKING_OUTDOOR    (0x2004)
#define MESSAGE_IDX_RES_RANDOM_ADDR     (0x0418)
#define MESSAGE_IDX_RES_NETWORK_ADDR    (0x0217)
#define MESSAGE_IDX_RES_ORIGIN_ADDR     (0x0417)
#define MESSAGE_IDX_RES_SETTING_ADDR    (0x0419)
#define MESSAGE_IDX_CHECKING_INDOOR     (0x4229)
#define MESSAGE_IDX_CHECK_COMMUNICATION (0x2010)

#define MESSAGE_IDX_BEEP                (0x4050)
#define MESSAGE_IDX_ONOFF               (0x4000)
#define MESSAGE_IDX_MODE                (0x4001)
#define MESSAGE_IDX_AIR_FLOW            (0x4006)
#define MESSAGE_IDX_SWING_UD            (0x4011)
#define MESSAGE_IDX_SWING_LR            (0x407E)
#define MESSAGE_IDX_FT_ALARM            (0x4025)
#define MESSAGE_IDX_TEMPERATURE         (0x4201)
#define MESSAGE_IDX_ROOM_TEMPERATURE    (0x4203)
#define MESSAGE_IDX_DISCHARGE_COOL      (0x422A)
#define MESSAGE_IDX_DISCHARGE_HEAT      (0x422B)
#define MESSAGE_IDX_WIRED_CONTROL_RT    (0x0409)
#define MESSAGE_IDX_AIR_CLEAN           (0x4043)
#define MESSAGE_IDX_WIND_FREE           (0x4060)
#define MESSAGE_IDX_360_AIR_FLOW        (0x4012)

#define COMMNAND_IDX_CONTROL            (0x13)

#define SAMSUNG_AC_POWER_ON             (0x01)
#define SAMSUNG_AC_POWER_OFF            (0x00)

#define SAMSUNG_AC_MODE_AUTO            (0x00)
#define SAMSUNG_AC_MODE_COOL            (0x01)
#define SAMSUNG_AC_MODE_DRY             (0x02)
#define SAMSUNG_AC_MODE_FAN             (0x03)
#define SAMSUNG_AC_MODE_HEAT            (0x04)

#define SAMSUNG_AC_FAN_AUTO             (0x00)
#define SAMSUNG_AC_FAN_LOW              (0x01)
#define SAMSUNG_AC_FAN_MED              (0x02)
#define SAMSUNG_AC_FAN_HIGH             (0x03)

#define SAMSUNG_AC_SWING_OFF            (0x00)
#define SAMSUNG_AC_SWING_ON             (0x01)

#define MAX_RESEND_NUM                  (3)

#define ADDR_STR "addr %02X[%02d] addr %02X[%02d] addr %02X[%02d] addr %02X[%02d] addr %02X[%02d] addr %02X[%02d] addr %02X[%02d] addr %02X[%02d]"
#define ADDR_HEX(addr, val) addr[0], val[0], addr[1], val[1], addr[2], val[2], addr[3], val[3], addr[4], val[4], addr[5], val[5], addr[6], val[6], addr[7], val[7]

typedef enum {
    HYDRO_HE,
    HYDRO_HT,
    OUTDOOR_ERV,
    AHU_10HP,
    AHU_40HP,
    ERV,
    ERV_P,
    EHS,
    TDM,
    DVM,
    FCU,
    RAC_AR9500T,
    INDOOR,
} samsung_model_t;

#define AWAIT(a)                        \
    if (a != ESP_OK)                    \
    continue

#define AIRCOND_MAP_IDX             0
#define SAMSUNG_MAP_IDX             1

const uint8_t rs485_samsung_mode_map[2][5] = {
    {AIRCOND_MODE_AUTO,     AIRCOND_MODE_COOL,      AIRCOND_MODE_DRY,       AIRCOND_MODE_FAN,       AIRCOND_MODE_HEAT},
    {SAMSUNG_AC_MODE_AUTO,  SAMSUNG_AC_MODE_COOL,   SAMSUNG_AC_MODE_DRY,    SAMSUNG_AC_MODE_FAN,    SAMSUNG_AC_MODE_HEAT}
};
const uint8_t rs485_samsung_speed_map[2][5] = {
    {AIRCOND_FANSPEED_AUTO, AIRCOND_FANSPEED_1,     AIRCOND_FANSPEED_2,     AIRCOND_FANSPEED_3,     AIRCOND_FANSPEED_4},
    {SAMSUNG_AC_FAN_AUTO,   SAMSUNG_AC_FAN_LOW,     SAMSUNG_AC_FAN_MED,     SAMSUNG_AC_FAN_HIGH,    SAMSUNG_AC_FAN_HIGH}
};
const uint8_t rs485_samsung_model_map[2][12] = {
    {0x6E,      0x78,       0xFF,           0x5B,       0x5C,       0x64,   0x6C,   0x73,   0x75,   0x8C,   0x10,           0x19},
    {HYDRO_HE,  HYDRO_HT,   OUTDOOR_ERV,    AHU_10HP,   AHU_40HP,   ERV,    ERV_P,  EHS,    TDM,    DVM,    RAC_AR9500T,    RAC_AR9500T}
};

static const int SEND_STOP_BIT       = BIT0;
static const int RECEIVE_STOP_BIT    = BIT1;

typedef struct outdoor_unit_device_t {
    STAILQ_ENTRY(outdoor_unit_device_t) next;
    uint8_t                 address;
    samsung_model_t         model;
    bool                    is_online;
} outdoor_unit_device_t;

typedef struct indoor_unit_device_t {
    STAILQ_ENTRY(indoor_unit_device_t) next;
    aircond_info_t          indoor_monitor_info;
    aircond_info_t          indoor_control_info;
    bool                    control_flag;
    uint8_t                 control_num;
    samsung_model_t         model;
    uint8_t                 outdoor_address;
    int64_t                 check_online_tick;
} indoor_unit_device_t;

typedef struct {
    uint32_t                random;
    uint32_t                network;
    uint32_t                origin;
    uint32_t                setting;
} address_t;

typedef struct ac_rs485_ {
    address_t               *address;
    int                     max_unit_devices;
    int                     num_indoor_unit_devices;
    int                     num_outdoor_unit_devices;
    aircond_info_t          info[MAX_INDOOR_UNIT];
    aircond_info_t          info_default;
    STAILQ_HEAD(indoor_unit_device_list, indoor_unit_device_t) indoor_unit_device_list;
    STAILQ_HEAD(outdoor_unit_device_list, outdoor_unit_device_t) outdoor_unit_device_list;
    aircond_hardware_t      hw;
    bool                    is_run;
    bool                    request_addressing;
    bool                    request_installation_check;
    SemaphoreHandle_t       unit_lock;
    EventGroupHandle_t      evt_group;
    SemaphoreHandle_t       rx_lock;
    SemaphoreHandle_t       tx_lock;
    SemaphoreHandle_t       frame_lock;

    int                     send_number;
    int                     step_number;
    int                     packet_number;
    ac_message_data_t       *message_list;
    ac_packet_data_t        *packet_data;
    ac_packet_command_t     *packet_command;
    uint8_t                 *tx_buffer;
    uint8_t                 *rx_buffer;
    uint8_t                 *pre_amble;
    int64_t                 tick;
    int64_t                 receive_tick;
    int64_t                 control_tick;

    RingbufHandle_t         frame_rb;
    RingbufHandle_t         tx_rb;
} ac_rs485_t;

void _print_buffer(const char *tag, int line, uint8_t *buffer, int size) {
    printf("(%-8lu)[%-15s,%-4d]: %s length %d data ", esp_log_timestamp(), TAG, line, tag, size);
    for (int i = 0; i < size; i++) {
        printf("%02x ", buffer[i]);
    }
    printf("\n");
}

void _printf_message_pack(const char *tag, int line, ac_packet_data_t *pack) {
    printf("(%-8lu)[%-16s,%-4d]: %s \n", esp_log_timestamp(), TAG, line, tag);
    printf("sa \t%06lx\n", pack->sa);
    printf("da \t%06lx\n", pack->da);
    printf("cmd:\n");
    printf("\tpacket type: %d\n", pack->command.packet_type);
    printf("\tdata type: %d\n", pack->command.data_type);
    printf("\tpacket number: %2x\n", pack->command.packet_number);
    printf("number of message %d\n", pack->num_messages);
    for (int i = 0; i < pack->num_messages; i++) {
        printf("\tmessage %d ", i);
        printf("message index %04x ", pack->message[i].index.value);
        uint8_t type = (uint8_t)(pack->message[i].index.value >> 9) & 0x03;
        if(type == 0)
            printf("message %02x \n", pack->message[i].data.val_1);
        else if(type == 1)
            printf("message %04x \n", pack->message[i].data.val_2);
        else
            printf("message %08lx \n", pack->message[i].data.val_4);
    }
}

esp_err_t _aircond_print_info(const char *st, int line, aircond_info_t *info, samsung_model_t model) {
    const char *model_str[] = {"HYDRO_HE","HYDRO_HT","OUTDOOR_ERV","AHU_10HP","AHU_40HP","ERV","ERV_P","EHS","TDM","DVM","FCU","RAC_AR9500T","INDOOR"};
    const char *mode_str[] = {"NO_CHANGE", "OFF", "HEAT", "COOL", "AUTO","DRY", "FAN", "ON_LAST_MODE"};
    const char *speed_str[] = {"AUTO", "1", "2", "3", "4"};
    const char *vanes_str[] = {"SWING", "POS1", "POS2", "POS3", "POS4"};
    LOGI(TAG, "(%-10s,%-4d) Aircond Address: %x\tMode: %s\tSetpoint: %d\tTemp: %3.1f\tHump: %3.1f\tFanspeed: %s\tVanes: %s\tModel: %s", st, line,
         info->address, mode_str[info->mode]
         , info->setpoint, info->temperature, info->humidity, speed_str[info->fanspeed], vanes_str[info->vanes], model_str[model]);
    return ESP_OK;
}

esp_err_t _samsung_print_info(const char *st, int line, int power, aircond_info_t *info) {
    const char *power_str[] = {"OFF", "ON"};
    const char *mode_str[] = {"AUTO", "COOL","DRY", "FAN", "HEAT"};
    const char *speed_str[] = {"AUTO", "LOW", "MED", "HIGH"};
    const char *vanes_str[] = {"OFF", "SWING"};
    LOGI(TAG, "(%-10s,%-4d) SAMSUNG Address: %x\tMode: %s\tSetpoint: %d\tTemp: %3.1f\tHump: %3.1f\tFanspeed: %s\tVanes: %s\tPower: %s", st, line,
         info->address, mode_str[info->mode]
         , info->setpoint, info->temperature/10, info->humidity, speed_str[info->fanspeed], vanes_str[info->vanes], power_str[power]);
    return ESP_OK;
}

esp_err_t _get_samsung_record(int *power, aircond_info_t *info, aircond_info_t *ss_record) {
    if(IS_NULL(info) || IS_NULL(ss_record)) return ESP_FAIL;
    *power = info->mode == AIRCOND_MODE_OFF ? SAMSUNG_AC_POWER_OFF : SAMSUNG_AC_POWER_ON;
    ss_record->mode = SAMSUNG_AC_MODE_AUTO;
    for(int mode_idx = 0; mode_idx < sizeof(rs485_samsung_mode_map)/2; mode_idx++) {
        if(info->mode == rs485_samsung_mode_map[AIRCOND_MAP_IDX][mode_idx])
            ss_record->mode = rs485_samsung_mode_map[SAMSUNG_MAP_IDX][mode_idx];
    }
    for(int speed_idx = 0; speed_idx < sizeof(rs485_samsung_speed_map)/2; speed_idx++) {
        if(info->fanspeed == rs485_samsung_speed_map[AIRCOND_MAP_IDX][speed_idx])
            ss_record->fanspeed = rs485_samsung_speed_map[SAMSUNG_MAP_IDX][speed_idx];
    }
    ss_record->address = info->address;
    ss_record->vanes = info->vanes == AIRCOND_VANE_SWING ? SAMSUNG_AC_SWING_ON : SAMSUNG_AC_SWING_OFF;
    ss_record->setpoint = info->setpoint * 10;
    ss_record->temperature = info->temperature * 10;
    return ESP_OK;
}

esp_err_t _get_aircond_info(int power, aircond_info_t *record, aircond_info_t *ac_info) {
    if(IS_NULL(record) || IS_NULL(ac_info)) return ESP_FAIL;
    if(power == SAMSUNG_AC_POWER_OFF)
        ac_info->mode = AIRCOND_MODE_OFF;
    else {
        for(int mode_idx = 0; mode_idx < sizeof(rs485_samsung_mode_map)/2; mode_idx++) {
            if(record->mode == rs485_samsung_mode_map[SAMSUNG_MAP_IDX][mode_idx])
                ac_info->mode = rs485_samsung_mode_map[AIRCOND_MAP_IDX][mode_idx];
        }
    }
    for(int speed_idx = 0; speed_idx < sizeof(rs485_samsung_speed_map)/2; speed_idx++) {
        if(record->fanspeed == rs485_samsung_speed_map[SAMSUNG_MAP_IDX][speed_idx])
            ac_info->fanspeed = rs485_samsung_speed_map[AIRCOND_MAP_IDX][speed_idx];
    }
    ac_info->vanes = record->vanes == SAMSUNG_AC_SWING_ON ? AIRCOND_VANE_SWING : AIRCOND_VANE_POS3;
    ac_info->setpoint = record->setpoint / 10;
    ac_info->temperature = (float)record->temperature / 10;
    return ESP_OK;
}

samsung_model_t _get_samsung_model(rs485_handle_t rs485_handle, uint16_t data) {
    if(IS_NULL(rs485_handle)) return ESP_FAIL;
    samsung_model_t model = INDOOR;
    if((data&0xFF00) == 0x0A00)
        model = FCU;
    else {
        for(int model_idx = 0; model_idx < sizeof(rs485_samsung_model_map)/2; model_idx++) {
            if((data&0x00FF) == rs485_samsung_model_map[0][model_idx])
                model = rs485_samsung_model_map[1][model_idx];
        }
    }
    return model;
}

esp_err_t _ac_bus_send(rs485_handle_t rs485_handle, uint8_t *buffer, int size) {
    if(IS_NULL(rs485_handle) || IS_NULL(buffer) || size <= 0) return ESP_FAIL;
    uart_write_bytes(rs485_handle->hw.rs485.uart_no, (const char *)rs485_handle->pre_amble, PREAMBLE_SIZE);
    vTaskDelay(3 / portTICK_RATE_MS);
    return uart_write_bytes(rs485_handle->hw.rs485.uart_no, (char *)buffer, size);
}

void _ac_increase_packet_number(rs485_handle_t rs485_handle) {
    rs485_handle->packet_number++;
    rs485_handle->packet_number = rs485_handle->packet_number > 255 ? 0 : rs485_handle->packet_number;
}

esp_err_t _ac_tx_ringbuf_add(rs485_handle_t rs485_handle, uint8_t *buff, int length) {
    mutex_lock(rs485_handle->tx_lock);
    while (xRingbufferSend(rs485_handle->tx_rb, buff, length, 20 / portTICK_RATE_MS) != pdTRUE) {
        size_t item_sz;
        void *item = xRingbufferReceive(rs485_handle->tx_rb, &item_sz, 20 / portTICK_RATE_MS);
        if (item)
            vRingbufferReturnItem(rs485_handle->tx_rb, item);
    }
    mutex_unlock(rs485_handle->tx_lock);
    return ESP_OK;
}

int _ac_create_getting_address_info_msg(rs485_handle_t rs485_handle) {
    ac_packet_create_message_simple(rs485_handle->message_list, MESSAGE_IDX_GET_ADDRESS, DATA_FILL_4);
    ac_packet_create_command(rs485_handle->packet_command, PACKET_TYPE_STANDBY, DATA_TYPE_READ, rs485_handle->packet_number);
    ac_packet_create_packet_data(rs485_handle->packet_data, OWN_ADDRESS, BROADCAST_CL_DEVICES_ADDRESS, *rs485_handle->packet_command, 1, rs485_handle->message_list);
    int len = ac_packet_get_buffer(rs485_handle->packet_data, rs485_handle->tx_buffer, MAX_TX_BUF_SIZE);
    _ac_tx_ringbuf_add(rs485_handle, rs485_handle->tx_buffer, len);
    _ac_increase_packet_number(rs485_handle);
    return len;
}

int _ac_create_checking_outdoor(rs485_handle_t rs485_handle) {
    ac_packet_create_message_simple(rs485_handle->message_list, MESSAGE_IDX_CHECKING_OUTDOOR, 0);
    ac_packet_create_command(rs485_handle->packet_command, PACKET_TYPE_NORMAL, DATA_TYPE_NOTIFICATION, rs485_handle->packet_number);
    ac_packet_create_packet_data(rs485_handle->packet_data, OWN_ADDRESS, BROADCAST_CL_DEVICES_ADDRESS, *rs485_handle->packet_command, 1, rs485_handle->message_list);
    int len = ac_packet_get_buffer(rs485_handle->packet_data, rs485_handle->tx_buffer, MAX_TX_BUF_SIZE);
    _ac_tx_ringbuf_add(rs485_handle, rs485_handle->tx_buffer, len);
    _ac_increase_packet_number(rs485_handle);
    return len;
}

int _ac_create_response_addressing_request(rs485_handle_t rs485_handle, uint32_t random_addr, uint16_t netword_addr, uint32_t setting_addr) {
    ac_packet_create_message_simple(rs485_handle->message_list, MESSAGE_IDX_CHECKING_OUTDOOR, 0x03);
    ac_packet_create_message_simple(rs485_handle->message_list + 1, MESSAGE_IDX_RES_RANDOM_ADDR, random_addr);
    ac_packet_create_message_simple(rs485_handle->message_list + 2, MESSAGE_IDX_RES_NETWORK_ADDR, netword_addr);
    ac_packet_create_message_simple(rs485_handle->message_list + 3, MESSAGE_IDX_RES_ORIGIN_ADDR, setting_addr);
    ac_packet_create_message_simple(rs485_handle->message_list + 4, MESSAGE_IDX_RES_SETTING_ADDR, setting_addr);
    ac_packet_create_command_simple(rs485_handle->packet_command, 0x12, rs485_handle->packet_number);
    ac_packet_create_packet_data(rs485_handle->packet_data, OWN_ADDRESS, random_addr, *rs485_handle->packet_command, 5, rs485_handle->message_list);
    int len = ac_packet_get_buffer(rs485_handle->packet_data, rs485_handle->tx_buffer, MAX_TX_BUF_SIZE);
    _ac_tx_ringbuf_add(rs485_handle, rs485_handle->tx_buffer, len);
    _ac_increase_packet_number(rs485_handle);
    return len;
}

int _ac_create_check_communication_status(rs485_handle_t rs485_handle) {
    ac_packet_create_message_simple(rs485_handle->message_list, MESSAGE_IDX_CHECK_COMMUNICATION, DATA_FILL_1);
    ac_packet_create_command_simple(rs485_handle->packet_command, 0x11, rs485_handle->packet_number);
    ac_packet_create_packet_data(rs485_handle->packet_data, OWN_ADDRESS, BROADCAST_CL_OUTDOOR_ADDRESS, *rs485_handle->packet_command, 1, rs485_handle->message_list);
    int len = ac_packet_get_buffer(rs485_handle->packet_data, rs485_handle->tx_buffer, MAX_TX_BUF_SIZE);
    _ac_tx_ringbuf_add(rs485_handle, rs485_handle->tx_buffer, len);
    _ac_increase_packet_number(rs485_handle);
    return len;
}

int _ac_create_checking_indoor(rs485_handle_t rs485_handle, uint8_t outdoor_addr) {
    ac_packet_create_message_simple(rs485_handle->message_list, MESSAGE_IDX_CHECKING_INDOOR, DATA_FILL_2);
    ac_packet_create_command_simple(rs485_handle->packet_command, 0x11, rs485_handle->packet_number);
    uint32_t da = 0x00B200FF | ((uint32_t)outdoor_addr << 8);
    ac_packet_create_packet_data(rs485_handle->packet_data, OWN_ADDRESS, da, *rs485_handle->packet_command, 1, rs485_handle->message_list);
    int len = ac_packet_get_buffer(rs485_handle->packet_data, rs485_handle->tx_buffer, MAX_TX_BUF_SIZE);
    _ac_tx_ringbuf_add(rs485_handle, rs485_handle->tx_buffer, len);
    _ac_increase_packet_number(rs485_handle);
    return len;
}

int _ac_create_controling(rs485_handle_t rs485_handle, uint32_t addr, aircond_info_t *command) {
    if(IS_NULL(rs485_handle) || IS_NULL(command)) return 0;
    aircond_info_t new_info;
    int power;
    _get_samsung_record(&power, command, &new_info);
    //_aircond_print_info("Control->", __LINE__, command, INDOOR);
    //_samsung_print_info("Control->", __LINE__, power, &new_info);
    ac_packet_create_message_simple(rs485_handle->message_list, MESSAGE_IDX_BEEP, 0x00);
    ac_packet_create_message_simple(rs485_handle->message_list + 1, MESSAGE_IDX_ONOFF, power); // Control on/off
    ac_packet_create_message_simple(rs485_handle->message_list + 2, MESSAGE_IDX_MODE, new_info.mode);
    ac_packet_create_message_simple(rs485_handle->message_list + 3, MESSAGE_IDX_AIR_FLOW, new_info.fanspeed);
    ac_packet_create_message_simple(rs485_handle->message_list + 4, MESSAGE_IDX_SWING_UD, new_info.vanes);
    ac_packet_create_message_simple(rs485_handle->message_list + 5, MESSAGE_IDX_SWING_LR, new_info.vanes);
    ac_packet_create_message_simple(rs485_handle->message_list + 6, MESSAGE_IDX_FT_ALARM, 0x00);
    ac_packet_create_message_simple(rs485_handle->message_list + 7, MESSAGE_IDX_TEMPERATURE, new_info.setpoint);
    ac_packet_create_message_simple(rs485_handle->message_list + 8, MESSAGE_IDX_DISCHARGE_COOL, 0x00A0); // Note
    ac_packet_create_message_simple(rs485_handle->message_list + 9, MESSAGE_IDX_DISCHARGE_HEAT, 0x012C);
    ac_packet_create_message_simple(rs485_handle->message_list + 10, MESSAGE_IDX_WIRED_CONTROL_RT, 0xFFFF0000); // Note
    ac_packet_create_message_simple(rs485_handle->message_list + 11, MESSAGE_IDX_AIR_CLEAN, 0x00);
    //ac_packet_create_message_simple(rs485_handle->message_list + 12, MESSAGE_IDX_WIND_FREE, 0x00);
    ac_packet_create_message_simple(rs485_handle->message_list + 12, MESSAGE_IDX_WIND_FREE, 0x09);
    ac_packet_create_message_simple(rs485_handle->message_list + 13, MESSAGE_IDX_360_AIR_FLOW, 0x0F);
    ac_packet_create_command_simple(rs485_handle->packet_command, COMMNAND_IDX_CONTROL, rs485_handle->packet_number);
    ac_packet_create_packet_data(rs485_handle->packet_data, OWN_ADDRESS, addr, *rs485_handle->packet_command, 14, rs485_handle->message_list);
    int len = ac_packet_get_buffer(rs485_handle->packet_data, rs485_handle->tx_buffer, MAX_TX_BUF_SIZE);
    _ac_tx_ringbuf_add(rs485_handle, rs485_handle->tx_buffer, len);
    _ac_increase_packet_number(rs485_handle);
    //_printf_message_pack("pack send", __LINE__, rs485_handle->packet_data);
    //_print_buffer("Send controling", __LINE__, rs485_handle->tx_buffer, len);
    return len;
}

indoor_unit_device_t *_indoor_unit_device_get(rs485_handle_t rs485_handle, indoor_unit_device_t *dev_next) {
    bool is_next = false;
    if(dev_next != NULL) is_next = true;
    indoor_unit_device_t *unit_device = NULL;
    STAILQ_FOREACH(unit_device, &rs485_handle->indoor_unit_device_list, next) {
        if((dev_next == NULL) || (unit_device == dev_next)) is_next = false;
        if(is_next) continue;
        if((dev_next == NULL) || (dev_next != NULL && unit_device != dev_next)) {
            if((unit_device->indoor_monitor_info.setpoint != 0) && (unit_device->indoor_monitor_info.temperature != 0)) {
                is_next = true;
                return unit_device;
            }
        }
    }
    return NULL;
}

indoor_unit_device_t *_indoor_unit_device_find(rs485_handle_t rs485_handle, uint8_t address) {
    indoor_unit_device_t *unit_device = NULL;
    STAILQ_FOREACH(unit_device, &rs485_handle->indoor_unit_device_list, next) {
        if (unit_device->indoor_monitor_info.address == address) {
            return unit_device;
        }
    }
    return NULL;
}

indoor_unit_device_t *_indoor_unit_device_add(rs485_handle_t rs485_handle, uint8_t address) {
    indoor_unit_device_t *unit = _indoor_unit_device_find(rs485_handle, address);
    ERROR_CHECKW(unit != NULL, "error unit addr is exist", return unit);
    if(rs485_handle->num_indoor_unit_devices >= MAX_INDOOR_UNIT) LOGE(TAG,"Indoor unit limit...");
    unit = (indoor_unit_device_t *)calloc(1, sizeof(indoor_unit_device_t));
    ERROR_CHECKW(unit == NULL, "error allocate unit", return NULL);
    memcpy(&unit->indoor_monitor_info, &rs485_handle->info_default, sizeof(aircond_info_t));
    unit->indoor_monitor_info.address = address;
    unit->indoor_control_info.address = address;
    unit->indoor_monitor_info.setpoint = DEFAULT_AIRCOND_SETPOINT;
    unit->indoor_monitor_info.is_online = true;
    unit->control_flag = false;
    unit->control_num = 0;
    unit->outdoor_address = 0;
    rs485_handle->num_indoor_unit_devices++;
    LOGW(TAG, "add new indoor %02x unit num %d", address, rs485_handle->num_indoor_unit_devices);
    STAILQ_INSERT_TAIL(&rs485_handle->indoor_unit_device_list, unit, next);
    return unit;
}

outdoor_unit_device_t *_outdoor_unit_device_find(rs485_handle_t rs485_handle, uint8_t address) {
    outdoor_unit_device_t *unit_device = NULL;
    STAILQ_FOREACH(unit_device, &rs485_handle->outdoor_unit_device_list, next) {
        if (unit_device->address == address) {
            return unit_device;
        }
    }
    return NULL;
}

outdoor_unit_device_t *_outdoor_unit_device_add(rs485_handle_t rs485_handle, uint8_t address) {
    outdoor_unit_device_t *unit = _outdoor_unit_device_find(rs485_handle, address);
    ERROR_CHECKW(unit != NULL, "error unit addr is exist", return unit);
    if(rs485_handle->num_outdoor_unit_devices >= MAX_INDOOR_UNIT) LOGE(TAG,"Outdoor unit limit...");
    unit = (outdoor_unit_device_t *)calloc(1, sizeof(outdoor_unit_device_t));
    ERROR_CHECKW(unit == NULL, "error allocate unit", return NULL);
    unit->address = address;
    rs485_handle->num_outdoor_unit_devices++;
    LOGW(TAG, "add new outdoor %02x unit num %d", address, rs485_handle->num_outdoor_unit_devices);
    STAILQ_INSERT_TAIL(&rs485_handle->outdoor_unit_device_list, unit, next);
    return unit;
}

esp_err_t _unit_device_monitor_update(rs485_handle_t rs485_handle, uint8_t address, aircond_info_t *info) {
    indoor_unit_device_t *unit = _indoor_unit_device_find(rs485_handle, address);
    ERROR_CHECKW(unit == NULL, "error unit addr doest not exist", return ESP_FAIL);
    memcpy(&unit->indoor_monitor_info, info, sizeof(aircond_info_t));
    LOGI(TAG, "Update unit addr %02x", address);
    return ESP_OK;
}

esp_err_t _ac_process_tx_ringbuf(rs485_handle_t rs485_handle) {
    if(esp_periph_tick_get() - rs485_handle->receive_tick < 100) {
        vTaskDelay(50 / portTICK_RATE_MS);
        //LOGD(TAG, "Wait rx pack...");
        return SKIP_NEXT_STEP;
    }
    size_t item_sz = 0;
    uint8_t *item = (uint8_t *)xRingbufferReceive(rs485_handle->tx_rb, &item_sz, 20 / portTICK_RATE_MS);
    if ((item == NULL) || (item_sz == 0))
        return PROCESS_NEXT_STEP;
    //_print_buffer("send", __LINE__, item, item_sz);
    _ac_bus_send(rs485_handle, item, item_sz);
    vRingbufferReturnItem(rs485_handle->tx_rb, item);
    return SKIP_NEXT_STEP;
}

esp_err_t _ac_addressing(rs485_handle_t rs485_handle) {
    if((IS_NULL(rs485_handle)) || (!rs485_handle->request_addressing)) return PROCESS_NEXT_STEP;
    if(IS_NULL(rs485_handle->address)) {
        rs485_handle->address = (address_t *)calloc(sizeof(address_t), 1);
        ERROR_CHECKW(IS_NULL(rs485_handle->address), "error allocate address", {
            rs485_handle->request_addressing = false;
            return PROCESS_NEXT_STEP;
        });
    }
    int len = 0;
    switch(rs485_handle->step_number) {
    case 0:
        if (esp_periph_tick_get() - rs485_handle->tick < (3*1000)) {
            goto _skip_next_step;
        }
        rs485_handle->tick = esp_periph_tick_get();
        if(rs485_handle->send_number++ >= MAX_RESEND_NUM) {
            rs485_handle->send_number = 0;
            rs485_handle->packet_number = 0;
            rs485_handle->step_number = 1;
            goto _skip_next_step;
        }
        for(int i = 0; i < N_TIMES_GET_ADDRESS_INFO; i++) {
            _ac_create_getting_address_info_msg(rs485_handle);
            LOGI(TAG, "Addressing step 1 -> frame : %d", rs485_handle->packet_number);
            //_print_buffer("Addressing step 1 ->", __LINE__, rs485_handle->tx_buffer, len);
            //rs485_handle->step_number = 1;
        }
        break;
    case 1:
        if (esp_periph_tick_get() - rs485_handle->tick > (3*1000)) {
            LOGI(TAG, "complete the addressing...");
            rs485_handle->send_number = 0;
            rs485_handle->packet_number = 0;
            rs485_handle->step_number = 0;
            if(rs485_handle->address) {
                free(rs485_handle->address);
                rs485_handle->address = NULL;
            }
            rs485_handle->request_addressing = false;
            return SKIP_NEXT_STEP;
        }
        rs485_handle->tick = esp_periph_tick_get();
        _ac_create_checking_outdoor(rs485_handle);
        LOGI(TAG, "Addressing step 3 -> frame : %d", rs485_handle->packet_number);
        //_print_buffer("Addressing step 3 ->", __LINE__, rs485_handle->tx_buffer, len);
        break;
    case 2:
        if (esp_periph_tick_get() - rs485_handle->tick > (3*1000)) {
            LOGI(TAG, "complete the addressing...");
            rs485_handle->send_number = 0;
            rs485_handle->packet_number = 0;
            rs485_handle->step_number = 0;
            if(rs485_handle->address) {
                free(rs485_handle->address);
                rs485_handle->address = NULL;
            }
            rs485_handle->request_addressing = false;
            return SKIP_NEXT_STEP;
        }
        rs485_handle->tick = esp_periph_tick_get();
        if(rs485_handle->address) {
            len = _ac_create_response_addressing_request(rs485_handle, rs485_handle->address->random, rs485_handle->address->network, rs485_handle->address->setting);
            _print_buffer("Addressing step 5 ->", __LINE__, rs485_handle->tx_buffer, len);
        }
        break;
    }
_skip_next_step:
    vTaskDelay(100 / portTICK_RATE_MS);
    return SKIP_NEXT_STEP;
}

esp_err_t _ac_system_installation_check(rs485_handle_t rs485_handle) {
    int len = 0;
    CHECK_IF_NULL(rs485_handle, return ESP_FAIL);
    if (!rs485_handle->request_installation_check)
        return PROCESS_NEXT_STEP;
    switch(rs485_handle->step_number) {
    case 0:
        if (esp_periph_tick_get() - rs485_handle->tick < (10 * 1000)) {
            goto _skip_next_step;
        }
        rs485_handle->tick = esp_periph_tick_get();
        if(++rs485_handle->send_number >= MAX_RESEND_NUM) {
            rs485_handle->send_number = 0;
            rs485_handle->packet_number = 0;
            rs485_handle->step_number = 1;
            goto _skip_next_step;
        }
        len = _ac_create_check_communication_status(rs485_handle);
        //_print_buffer("Installation Step1 ->", __LINE__, rs485_handle->tx_buffer, len);
        break;
    case 1:
        if (esp_periph_tick_get() - rs485_handle->tick < (5 * 1000)) {
            goto _skip_next_step;
        }
        rs485_handle->tick = esp_periph_tick_get();
        for (uint8_t i = 0; i < 0x0f; i++) {
            len = _ac_create_checking_indoor(rs485_handle, i);
            //_print_buffer("Installation Step3 ->", __LINE__, rs485_handle->tx_buffer, len);
        }
        if(++rs485_handle->send_number >= MAX_RESEND_NUM) {
            rs485_handle->send_number = 0;
            rs485_handle->packet_number = 0;
            rs485_handle->step_number = 0;
            rs485_handle->request_installation_check = false;
            return SKIP_NEXT_STEP;
        }
        break;
    }
_skip_next_step:
    vTaskDelay(100 / portTICK_RATE_MS);
    return SKIP_NEXT_STEP;
}

esp_err_t _ac_control(rs485_handle_t rs485_handle) {
    if(IS_NULL(rs485_handle)) return ESP_FAIL;
    if (esp_periph_tick_get() - rs485_handle->control_tick < AIRCOND_CONTROL_TIMEOUT_MS) {
        return PROCESS_NEXT_STEP;
    }
    rs485_handle->control_tick = esp_periph_tick_get();
    mutex_lock(rs485_handle->unit_lock);
    indoor_unit_device_t *unit_device = NULL;
    STAILQ_FOREACH(unit_device, &rs485_handle->indoor_unit_device_list, next) {
        if((!unit_device->control_flag) || (unit_device->control_num >= MAX_RESEND_NUM)) continue;
        uint32_t target_addr = INDOOR_ADDRESS_MASK | ((uint16_t)unit_device->outdoor_address<<8) | (unit_device->indoor_control_info.address);
        _ac_create_controling(rs485_handle, target_addr, &unit_device->indoor_control_info);
        unit_device->control_num++;
        break;
    }
    mutex_unlock(rs485_handle->unit_lock);
    return PROCESS_NEXT_STEP;
}

esp_err_t _ac_uint_log(rs485_handle_t rs485_handle) {
    static int64_t log_tick = 0;
    bool is_unit_exist = false;
    uint8_t unit_idx = 0;
    uint8_t unit_address[MAX_INDOOR_UNIT];
    uint8_t unit_setpoint[MAX_INDOOR_UNIT];
    if(IS_NULL(rs485_handle)) return PROCESS_NEXT_STEP;
    if (esp_periph_tick_get() - log_tick < (5 * 1000)) {
        return PROCESS_NEXT_STEP;
    }
    log_tick = esp_periph_tick_get();
    mutex_lock(rs485_handle->unit_lock);
    indoor_unit_device_t *unit_device = NULL;
    STAILQ_FOREACH(unit_device, &rs485_handle->indoor_unit_device_list, next) {
        //_aircond_print_info("Log", __LINE__, &unit_device->indoor_monitor_info, unit_device->model);
        unit_address[unit_idx] = unit_device->indoor_monitor_info.address;
        unit_setpoint[unit_idx] = unit_device->indoor_monitor_info.setpoint;
        unit_idx++;
        if(unit_idx >= MAX_INDOOR_UNIT) LOGE(TAG, "indoor limit...");
        is_unit_exist = true;
    }
    while(unit_idx < MAX_INDOOR_UNIT) {
        unit_address[unit_idx] = 0xFF;
        unit_setpoint[unit_idx] = 99;
        unit_idx++;
    }
    if(is_unit_exist) {
        uint8_t *addr, *setpoint;
        addr = &unit_address[0];
        setpoint = &unit_setpoint[0];
        LOGI(TAG, ADDR_STR, ADDR_HEX(addr, setpoint));
        addr = &unit_address[8];
        setpoint = &unit_setpoint[8];
        LOGI(TAG, ADDR_STR, ADDR_HEX(addr, setpoint));
        LOGW(TAG, "Number unit %d\n", rs485_handle->num_indoor_unit_devices);
    }
    mutex_unlock(rs485_handle->unit_lock);
    return PROCESS_NEXT_STEP;
}

void ac_rs485_task(void *pv) {
    rs485_handle_t rs485_handle = pv;
    while (rs485_handle->is_run) {
        AWAIT(_ac_process_tx_ringbuf(rs485_handle));
        AWAIT(_ac_addressing(rs485_handle));
        AWAIT(_ac_system_installation_check(rs485_handle));
        AWAIT(_ac_control(rs485_handle));
        //AWAIT(_ac_uint_log(rs485_handle));
        vTaskDelay(100 / portTICK_RATE_MS);
    }
    xEventGroupSetBits(rs485_handle->evt_group, SEND_STOP_BIT);
    vTaskDelete(NULL);
}

bool _check_if_valid_frame(uint8_t *buffer, uint8_t len) {
    if (len == 0 || len < HEADER_SIZE)
        return false;
    uint16_t lenght_in_frame = (uint16_t)(buffer[1] << 8) | buffer[2];
    ERROR_CHECKW(lenght_in_frame != len - 2, "lenght fail!", {
        LOGE(TAG, "lenght %d:%d", lenght_in_frame, len - 2);
        return false;
    });
    uint16_t crc = ac_packet_get_crc(buffer + 3, len - 6);
    uint16_t crc_in_frame = (uint16_t)(buffer[len - 3] << 8) | buffer[len - 2];
    ERROR_CHECKW(crc_in_frame != crc, "CRC fail!", {
        LOGE(TAG, "CRC %04x:%04x", crc, crc_in_frame);
        return false;
    });
    return true;
}

esp_err_t _process_addressing_received_message(rs485_handle_t rs485_handle, ac_packet_data_t *packet_data) {
    if ((IS_NULL(rs485_handle) || IS_NULL(packet_data)) || (!rs485_handle->request_addressing))
        return PROCESS_NEXT_STEP;
    if(rs485_handle->step_number)
        _printf_message_pack("pack", __LINE__, packet_data);
    uint32_t source_addr = packet_data->sa & ADDRESS_FILL;
    if (((source_addr != OUTDOOR_ADDRESS_MASK) &&
            (source_addr != ERV_ADDRESS_MASK) &&
            (source_addr != INDOOR_ADDRESS_MASK)) ||
            ((packet_data->da != OWN_ADDRESS) && (packet_data->da != BROADCAST_CL_DEVICES_ADDRESS))) {
        return SKIP_NEXT_STEP;
    }
    LOGI(TAG, "Has a checking outdoor response frame from address %06lx", packet_data->sa);
    switch(rs485_handle->step_number) {
    case 0:
        if (packet_data->command.packet_type == 0 && packet_data->command.data_type == 5) {
            for (int i = 0; i < packet_data->num_messages; i++) {
                switch (packet_data->message[i].index.value) {
                case MESSAGE_IDX_GET_ADDRESS:
                    LOGI(TAG, "Get address: %06lx", packet_data->message[i].data.val_4);
                    rs485_handle->address->setting = packet_data->message[i].data.val_4;
                    rs485_handle->step_number = 1;
                    rs485_handle->tick = esp_periph_tick_get();
                    break;
                }
            }
        }
        break;
    case 1:
        if (packet_data->command.packet_type == 1 && packet_data->command.data_type == 4) {
            for (int i = 0; i < packet_data->num_messages; i++) {
                switch (packet_data->message[i].index.value) {
                case ADDRESS_REQUEST_INDEX:
                    LOGI(TAG, "Get address request: %02x", packet_data->message[i].data.val_1);
                    break;
                case MESSAGE_IDX_RES_RANDOM_ADDR:
                    LOGI(TAG, "Get address random: %04lx", packet_data->message[i].data.val_4);
                    rs485_handle->address->random = packet_data->message[i].data.val_4;
                    break;
                case MESSAGE_IDX_RES_NETWORK_ADDR:
                    LOGI(TAG, "Get address network: %02x", packet_data->message[i].data.val_2);
                    rs485_handle->address->network = packet_data->message[i].data.val_2;
                    break;
                case MESSAGE_IDX_RES_ORIGIN_ADDR:
                    LOGI(TAG, "Get address origin: %04lx", packet_data->message[i].data.val_4);
                    rs485_handle->address->origin = packet_data->message[i].data.val_4;
                    break;
                case MESSAGE_IDX_RES_SETTING_ADDR:
                    LOGI(TAG, "Get address setting: %04lx", packet_data->message[i].data.val_4);
                    rs485_handle->address->setting = packet_data->message[i].data.val_4;
                    break;
                }
                rs485_handle->step_number = 2;
                rs485_handle->tick = esp_periph_tick_get();
            }
        }
        break;
    case 2:
        if (packet_data->command.packet_type == 1 && packet_data->command.data_type == 4) {
            for (int i = 0; i < packet_data->num_messages; i++) {
                switch (packet_data->message[i].index.value) {
                case ADDRESS_REQUEST_INDEX:
                    LOGI(TAG, "Get address request: %02x", packet_data->message[i].data.val_1);
                    if(packet_data->message[i].data.val_1 == 0x04) {
                        LOGI(TAG, "Complete...");
                        rs485_handle->send_number = 0;
                        rs485_handle->packet_number = 0;
                        rs485_handle->step_number = 0;
                        if(rs485_handle->address) {
                            free(rs485_handle->address);
                            rs485_handle->address = NULL;
                        }
                        rs485_handle->request_addressing = false;
                        rs485_handle->tick = esp_periph_tick_get();
                    }
                    break;
                }
            }
        }
        break;
    }
    return SKIP_NEXT_STEP;
}

esp_err_t _process_installation_received_message(rs485_handle_t rs485_handle, ac_packet_data_t *packet_data) {
    if (IS_NULL(rs485_handle) || IS_NULL(packet_data) || (packet_data->da != OWN_ADDRESS) ||
            (!rs485_handle->request_installation_check)) {
        return PROCESS_NEXT_STEP;
    }
    switch(rs485_handle->step_number) {
    case 0:
        if ((packet_data->num_messages == 1) &&
                (packet_data->message[0].index.value == MESSAGE_IDX_CHECK_COMMUNICATION) &&
                ((packet_data->sa&ADDRESS_FILL) == OUTDOOR_ADDRESS_MASK)) {
            uint8_t outdoor_address = (uint8_t)((packet_data->sa>>8) & 0xFF);
            uint8_t data_value = packet_data->message[0].data.val_1;
            mutex_lock(rs485_handle->unit_lock);
            outdoor_unit_device_t *unit = _outdoor_unit_device_find(rs485_handle, outdoor_address);
            if(IS_NULL(unit)) {
                unit = _outdoor_unit_device_add(rs485_handle, outdoor_address);
                LOGD(TAG, "add new outdoor %02x value %02x", unit->address, data_value);
            }
            if(data_value&0x80) {
                unit->is_online = true;
                LOGD(TAG, "outdoor %02x is online", unit->address);
            }
            mutex_unlock(rs485_handle->unit_lock);
            if(packet_data->command.packet_number >= MAX_INDOOR_UNIT) rs485_handle->step_number = 1;
        }
        break;
    case 1:
        if ((packet_data->num_messages == 1) &&
                (packet_data->message[0].index.value == MESSAGE_IDX_CHECKING_INDOOR)) {
            uint16_t data_value = packet_data->message[0].data.val_2;
            if((packet_data->sa&ADDRESS_FILL) == INDOOR_ADDRESS_MASK) {
                uint8_t indoor_address = (uint8_t)(packet_data->sa & 0xFF);
                mutex_lock(rs485_handle->unit_lock);
                indoor_unit_device_t *unit = _indoor_unit_device_find(rs485_handle, indoor_address);
                if(IS_NULL(unit)) {
                    unit = _indoor_unit_device_add(rs485_handle, indoor_address);
                    LOGD(TAG, "add new indoor %02x value %04x", indoor_address, data_value);
                }
                else {
                    LOGD(TAG, "update indoor %02x value %04x", indoor_address, data_value);
                }
                unit->model = _get_samsung_model(rs485_handle, data_value);
                mutex_unlock(rs485_handle->unit_lock);
            }
            else if((packet_data->sa&ADDRESS_FILL) == OUTDOOR_ADDRESS_MASK) {
                uint8_t outdoor_address = (uint8_t)((packet_data->sa>>8) & 0xFF);
                mutex_lock(rs485_handle->unit_lock);
                outdoor_unit_device_t *unit = _outdoor_unit_device_find(rs485_handle, outdoor_address);
                if(IS_NULL(unit)) {
                    unit = _outdoor_unit_device_add(rs485_handle, outdoor_address);
                    LOGD(TAG, "add new outdoor %02x value %04x", outdoor_address, data_value);
                }
                else {
                    LOGD(TAG, "update outdoor %02x value %04x", outdoor_address, data_value);
                }
                unit->model = _get_samsung_model(rs485_handle, data_value);
                mutex_unlock(rs485_handle->unit_lock);
            }
        }
        break;
    default:
        break;
    }
    return SKIP_NEXT_STEP;
}

esp_err_t _process_monitor_received_message(rs485_handle_t rs485_handle, ac_packet_data_t *packet_data) {
    if (IS_NULL(rs485_handle) || IS_NULL(packet_data))
        return PROCESS_NEXT_STEP;
    if (((packet_data->da & BROADCAST_FILL) != BROADCAST_CL_SL_OUTDOOR_CONNECTED) ||
            ((packet_data->sa & ADDRESS_FILL) != INDOOR_ADDRESS_MASK )) {
        //LOGD(TAG, "check monitor fail src addr %06x, des %06x", packet_data->sa, packet_data->da);
        //_printf_message_pack("Receive pack ", __LINE__, packet_data);
        return PROCESS_NEXT_STEP;
    }
    if (packet_data->command.packet_type == 1 && packet_data->command.data_type == 4) {
        uint8_t indoor_address = (uint8_t)(packet_data->sa & 0xFF);
        mutex_lock(rs485_handle->unit_lock);
        indoor_unit_device_t *unit = _indoor_unit_device_find(rs485_handle, indoor_address);
        if(unit == NULL) {
            unit = _indoor_unit_device_add(rs485_handle, indoor_address);
        }
        if(unit) {
            //_printf_message_pack("Receive pack ", __LINE__, packet_data);
            aircond_info_t new_record;
            int power;
            bool is_update = false;
            _get_samsung_record(&power, &unit->indoor_monitor_info, &new_record);
            for (int i = 0; i < packet_data->num_messages; i++) {
                switch (packet_data->message[i].index.value) {
                case MESSAGE_IDX_ONOFF:
                    if(indoor_address == ADDRESS_DEBUG)
                        LOGD(TAG, "Address: %02x On/off: %d", indoor_address, packet_data->message[i].data.val_1);
                    power = packet_data->message[i].data.val_1;
                    is_update = true;
                    break;
                case MESSAGE_IDX_MODE:
                    if(indoor_address == ADDRESS_DEBUG)
                        LOGD(TAG, "Address: %02x Mode: %d", indoor_address, packet_data->message[i].data.val_1);
                    new_record.mode = packet_data->message[i].data.val_1;
                    is_update = true;
                    break;
                case MESSAGE_IDX_SWING_LR:
                    LOGD(TAG, "Left/right swing not support");
                    // if(indoor_address == ADDRESS_DEBUG)
                    //     LOGW(TAG, "Left/right swing: %d", packet_data->message[i].data.val_1);
                    //new_record.vanes = packet_data->message[i].data.val_1;
                    //is_update = true;
                    break;
                case MESSAGE_IDX_SWING_UD:
                    if(indoor_address == ADDRESS_DEBUG)
                        LOGD(TAG, "Up/down swing: %d", packet_data->message[i].data.val_1);
                    new_record.vanes = packet_data->message[i].data.val_1;
                    is_update = true;
                    break;
                case MESSAGE_IDX_TEMPERATURE:
                    if(indoor_address == ADDRESS_DEBUG)
                        LOGD(TAG, "Desired temp: %f", (float)packet_data->message[i].data.val_2 / 10);
                    new_record.setpoint = packet_data->message[i].data.val_2;
                    is_update = true;
                    break;
                case MESSAGE_IDX_AIR_FLOW:
                    if(indoor_address == ADDRESS_DEBUG)
                        LOGD(TAG, "Airflow %d", packet_data->message[i].data.val_1);
                    new_record.fanspeed = packet_data->message[i].data.val_1;
                    is_update = true;
                    break;
                case MESSAGE_IDX_ROOM_TEMPERATURE:
                    if(indoor_address == ADDRESS_DEBUG)
                        LOGD(TAG, "Room temp: %f", (float)packet_data->message[i].data.val_2 / 10);
                    new_record.temperature = (float)packet_data->message[i].data.val_2;
                    is_update = true;
                    break;
                default:
                    //LOGD(TAG, "Message: %04x, data: %04x", packet_data->message[i].index.value, packet_data->message[i].data.val_4);
                    //_printf_message_pack("pack", __LINE__, packet_data);
                    break;
                }
            }
            _get_aircond_info(power, &new_record, &unit->indoor_monitor_info);
            if(is_update) {
                if(indoor_address == ADDRESS_DEBUG) _samsung_print_info("update", __LINE__, power, &new_record);
                if(unit->indoor_control_info.mode == 2) unit->indoor_monitor_info.mode = unit->indoor_control_info.mode; //Update heat mode
                unit->indoor_monitor_info.is_online = true;
                unit->check_online_tick = esp_periph_tick_get();
            }
        }
        mutex_unlock(rs485_handle->unit_lock);
    }
    return SKIP_NEXT_STEP;
}

esp_err_t _process_control_response_message(rs485_handle_t rs485_handle, ac_packet_data_t *packet_data) {
    if(IS_NULL(rs485_handle) || IS_NULL(packet_data)) return ESP_FAIL;
    if (packet_data->da == BROADCAST_CL_OUTDOOR_CONNECTED) return PROCESS_NEXT_STEP;
    if ((packet_data->da != OWN_ADDRESS) ||
            ((packet_data->sa & ADDRESS_FILL) != INDOOR_ADDRESS_MASK)) {
        return PROCESS_NEXT_STEP;
    }
    if (packet_data->command.packet_type == 1 && packet_data->command.data_type == 6) {
        //_printf_message_pack("received", __LINE__, packet_data);
        uint8_t indoor_address = (uint8_t)(packet_data->sa & 0xFF);
        LOGD(TAG, "Receive response control. Addr: %02x", indoor_address);
        mutex_lock(rs485_handle->unit_lock);
        indoor_unit_device_t *unit = _indoor_unit_device_find(rs485_handle, indoor_address);
        if(unit) {
            unit->indoor_monitor_info.is_online = true;
            unit->check_online_tick = esp_periph_tick_get();
            if(indoor_address == ADDRESS_DEBUG) _aircond_print_info("Receive", __LINE__, &unit->indoor_monitor_info, unit->model);
            unit->control_flag = false;
        }
        mutex_unlock(rs485_handle->unit_lock);
    }
    return SKIP_NEXT_STEP;
}

esp_err_t _process_received_buffer(rs485_handle_t rs485_handle, uint8_t *buffer, int size) {
    esp_err_t ret = PROCESS_NEXT_STEP;
    if (IS_NULL(rs485_handle) || IS_NULL(buffer) || (size <= 0))
        return PROCESS_NEXT_STEP;
    ac_packet_data_t *packet_data = ac_packet_analyze_buffer(buffer, size);
    if (packet_data) {
        //_print_buffer("received", __LINE__, buffer, size);
        //if((packet_data->sa == 0x100000) && (packet_data->da == 0xB000FF))
        //    _printf_message_pack("Receive pack ", __LINE__, packet_data);
        ret = _process_addressing_received_message(rs485_handle, packet_data);
        CHECK_GOTO(ret != PROCESS_NEXT_STEP, _skip_next_step, NEXT());
        ret = _process_installation_received_message(rs485_handle, packet_data);
        CHECK_GOTO(ret != PROCESS_NEXT_STEP, _skip_next_step, NEXT());
        ret = _process_monitor_received_message(rs485_handle, packet_data);
        CHECK_GOTO(ret != PROCESS_NEXT_STEP, _skip_next_step, NEXT());
        ret = _process_control_response_message(rs485_handle, packet_data);
        CHECK_GOTO(ret != PROCESS_NEXT_STEP, _skip_next_step, NEXT());
        ac_packet_data_release(packet_data);
    }
    return PROCESS_NEXT_STEP;
_skip_next_step:
    ac_packet_data_release(packet_data);
    return SKIP_NEXT_STEP;
}

esp_err_t _receive_frame(rs485_handle_t rs485_handle) {
    int len = uart_read_bytes(rs485_handle->hw.rs485.uart_no, rs485_handle->rx_buffer, MAX_RX_BUF_SIZE, 100 / portTICK_RATE_MS);
    if (len <= 0) return PROCESS_NEXT_STEP;
    if(len > MAX_RX_BUF_SIZE) LOGW(TAG, "Limit rx buff %d byte...", len);
    uint8_t *item = rs485_handle->rx_buffer;
    int frame_length = 0;
    int frame_idx = 0;
    int header_length = 0;
    uint8_t *frame = NULL;
    do {
        if ((item[frame_idx] == START_BYTE) && (frame == NULL)) {
            frame = &item[frame_idx];
            header_length = ((uint16_t)item[frame_idx + 1] << 8) + item[frame_idx + 2];
        }
        if ((item[frame_idx] == END_BYTE) && (&item[frame_idx] - frame >= header_length + 1) && (frame_length == 0)) {
            frame_length = &item[frame_idx] - frame + 1;
        }
        if (frame != NULL && frame_length > 0 && frame_length < MAX_FRAME_SIZE) {
            if (_check_if_valid_frame(frame, frame_length)) {
                mutex_lock(rs485_handle->frame_lock);
                while (xRingbufferSend(rs485_handle->frame_rb, frame, frame_length, 20 / portTICK_RATE_MS) != pdTRUE) {
                    size_t item_sz;
                    item = xRingbufferReceive(rs485_handle->frame_rb, &item_sz, 20 / portTICK_RATE_MS);
                    if (item)
                        vRingbufferReturnItem(rs485_handle->frame_rb, item);
                }
                mutex_unlock(rs485_handle->frame_lock);
            }
            else {
                LOGE(TAG, "Invalid frame");
                _print_buffer("Frame receive", __LINE__, item, len);
                _print_buffer("Invalid", __LINE__, frame, frame_length);
            }
            frame = NULL;
            frame_length = 0;
        }
        frame_idx++;
    } while (frame_idx < len);
    return PROCESS_NEXT_STEP;
}

esp_err_t _process_frame(rs485_handle_t rs485_handle) {
    size_t item_sz = 0;
    mutex_lock(rs485_handle->frame_lock);
    uint8_t *item = (uint8_t *)xRingbufferReceive(rs485_handle->frame_rb, &item_sz, 20 / portTICK_RATE_MS);
    if ((item == NULL) || (item_sz == 0)) {
        mutex_unlock(rs485_handle->frame_lock);
        return PROCESS_NEXT_STEP;
    }
    //_print_buffer("received", __LINE__, item, item_sz);
    esp_err_t ret = _process_received_buffer(rs485_handle, item, item_sz);
    vRingbufferReturnItem(rs485_handle->frame_rb, item);
    mutex_unlock(rs485_handle->frame_lock);
    return ret;
}

void receive_task(void *pv) {
    rs485_handle_t rs485_handle = pv;
    while (rs485_handle->is_run) {
        AWAIT(_process_frame(rs485_handle));
        AWAIT(_receive_frame(rs485_handle));
        vTaskDelay(100 / portTICK_RATE_MS);
    }
    xEventGroupSetBits(rs485_handle->evt_group, RECEIVE_STOP_BIT);
    vTaskDelete(NULL);
}

esp_err_t periph_ac_rs485_destroy(rs485_handle_t handle) {
    CHECK_IF_NULL(handle, return ESP_FAIL);
    return ESP_OK;
    size_t ram = heap_caps_get_free_size(MALLOC_CAP_8BIT);
    handle->is_run = false;
    if((xEventGroupWaitBits(handle->evt_group, RECEIVE_STOP_BIT, false, true, 500 / portTICK_RATE_MS) & RECEIVE_STOP_BIT)
      && (xEventGroupWaitBits(handle->evt_group, SEND_STOP_BIT, false, true, 500 / portTICK_RATE_MS) & SEND_STOP_BIT)) {
        LOGW(TAG, "Destroy...");
    }
    LOGW(TAG, "Free mem %d", heap_caps_get_free_size(MALLOC_CAP_8BIT) - ram);
    return ESP_OK;
}

rs485_handle_t periph_ac_rs485_init(aircond_hardware_t *rs485_config) {
    LOGI(TAG, "Memory free: %d", heap_caps_get_free_size(MALLOC_CAP_INTERNAL));
    rs485_handle_t rs485_handle = malloc(sizeof(ac_rs485_t));
    ERROR_CHECKW(IS_NULL(rs485_handle), "Error allocate, memory exhausted?", return NULL);
    memcpy(&rs485_handle->hw, rs485_config, sizeof(aircond_hardware_t));
    uart_config_t uart_config = {
        .baud_rate = DEFAULT_UART_BAUDRATE,
        .data_bits = UART_DATA_8_BITS,
        .parity = UART_PARITY_EVEN,
        .stop_bits = UART_STOP_BITS_1,
        .flow_ctrl = UART_HW_FLOWCTRL_DISABLE,
        .rx_flow_ctrl_thresh = 122,
    };

    ESP_LOGD(TAG, "Configure RS485");
    uart_param_config(rs485_handle->hw.rs485.uart_no, &uart_config);
    uart_set_pin(rs485_handle->hw.rs485.uart_no, rs485_handle->hw.rs485.tx, rs485_handle->hw.rs485.rx, -1, -1);
    uart_driver_install(rs485_handle->hw.rs485.uart_no, MAX_RX_BUF_SIZE, 0, 0, NULL, 0);
    uart_set_mode(rs485_handle->hw.rs485.uart_no, UART_MODE_RS485_HALF_DUPLEX);

    // rs485_handle->info = (aircond_info_t *)calloc(sizeof(aircond_info_t), MAX_INDOOR_UNIT);
    // PERIPH_MEM_CHECK(TAG, rs485_handle->info, goto _rs485_init_fail);

    rs485_handle->message_list = malloc(sizeof(ac_message_data_t) * MAX_MESSAGE_SIZE);
    PERIPH_MEM_CHECK(TAG, rs485_handle->message_list, goto _rs485_init_fail);

    rs485_handle->packet_data = malloc(sizeof(ac_packet_data_t));
    PERIPH_MEM_CHECK(TAG, rs485_handle->packet_data, goto _rs485_init_fail);

    rs485_handle->packet_command = malloc(sizeof(ac_packet_command_t));
    PERIPH_MEM_CHECK(TAG, rs485_handle->packet_command, goto _rs485_init_fail);

    rs485_handle->tx_buffer = malloc(MAX_TX_BUF_SIZE);
    PERIPH_MEM_CHECK(TAG, rs485_handle->tx_buffer, goto _rs485_init_fail);

    rs485_handle->rx_buffer = malloc(MAX_RX_BUF_SIZE);
    PERIPH_MEM_CHECK(TAG, rs485_handle->rx_buffer, goto _rs485_init_fail);

    rs485_handle->pre_amble = malloc(PREAMBLE_SIZE);
    PERIPH_MEM_CHECK(TAG, rs485_handle->pre_amble, goto _rs485_init_fail);

    memset(rs485_handle->pre_amble, PREAMBLE_BYTE, PREAMBLE_SIZE);

    rs485_handle->send_number = 0;
    rs485_handle->step_number = 0;
    rs485_handle->packet_number = 0;
    rs485_handle->tick = esp_periph_tick_get();
    rs485_handle->receive_tick = esp_periph_tick_get();
    rs485_handle->control_tick = esp_periph_tick_get();
    rs485_handle->unit_lock = mutex_create();
    rs485_handle->rx_lock = mutex_create();
    rs485_handle->tx_lock = mutex_create();
    rs485_handle->frame_lock = mutex_create();
    rs485_handle->evt_group = xEventGroupCreate();
    xEventGroupClearBits(rs485_handle->evt_group, SEND_STOP_BIT);
    xEventGroupClearBits(rs485_handle->evt_group, RECEIVE_STOP_BIT);

    rs485_handle->num_indoor_unit_devices = 0;
    rs485_handle->num_outdoor_unit_devices = 0;
    rs485_handle->max_unit_devices = 0;
    STAILQ_INIT(&rs485_handle->indoor_unit_device_list);
    STAILQ_INIT(&rs485_handle->outdoor_unit_device_list);
    memset(&rs485_handle->info_default, 0, sizeof(aircond_info_t));

    rs485_handle->frame_rb = xRingbufferCreate(DEFAULT_RINGBUFFER_SIZE, RINGBUF_TYPE_NOSPLIT);
    PERIPH_MEM_CHECK(TAG, rs485_handle->frame_rb, goto _rs485_init_fail);

    rs485_handle->tx_rb = xRingbufferCreate(DEFAULT_RINGBUFFER_SIZE, RINGBUF_TYPE_NOSPLIT);
    PERIPH_MEM_CHECK(TAG, rs485_handle->tx_rb, goto _rs485_init_fail);

    rs485_handle->address = NULL;
    rs485_handle->request_addressing = false;
    rs485_handle->request_installation_check = true;
    rs485_handle->is_run = false;
    return rs485_handle;

_rs485_init_fail:
    LOGE(TAG, "Failed to initial AIRCOND 485");
    if (rs485_handle) {
        free(rs485_handle->message_list);
        free(rs485_handle->packet_data);
        free(rs485_handle->packet_command);
        free(rs485_handle->tx_buffer);
        free(rs485_handle->rx_buffer);
        free(rs485_handle->pre_amble);
        if (rs485_handle->frame_rb) vRingbufferDelete(rs485_handle->frame_rb);
        if (rs485_handle->tx_rb) vRingbufferDelete(rs485_handle->tx_rb);
        mutex_destroy(rs485_handle->tx_lock);
        mutex_destroy(rs485_handle->frame_lock);
        mutex_destroy(rs485_handle->unit_lock);
        mutex_destroy(rs485_handle->rx_lock);
        if (rs485_handle->evt_group) vEventGroupDelete(rs485_handle->evt_group);
        free(rs485_handle);
    }
    return NULL;
}

esp_err_t _rs485_init(void *ctx) {
    rs485_handle_t handle = (rs485_handle_t)ctx;
    CHECK_IF_NULL(handle, return ESP_FAIL);
    if(!handle->is_run) {
        handle->is_run = true;
        LOGI(TAG, "init...");
        BaseType_t xReturned = pdPASS;
        xReturned = xTaskCreate(ac_rs485_task, "ac_rs485_task", DEFAULT_AIRCOND_TASK_STACK, handle, 5, NULL);
        ERROR_CHECKW(xReturned != pdPASS, "Error create ac_rs485_task, memory exhausted?", return ESP_FAIL);
        xReturned = xTaskCreate(receive_task, "receive_task", DEFAULT_AIRCOND_TASK_STACK, handle, 5, NULL);
        ERROR_CHECKW(xReturned != pdPASS, "Error create receive_task, memory exhausted?", return ESP_FAIL);
    }
    LOGI(TAG, "Memory free: %d", heap_caps_get_free_size(MALLOC_CAP_INTERNAL));
    return ESP_OK;
}

aircond_info_t *periph_ac_rs485_process(void *ctx, aircond_info_t *control_info) {
    rs485_handle_t handle = (rs485_handle_t)ctx;
    static bool is_fail = false;
#ifdef CONFIG_DEVICE_SIMULATOR
    static int64_t simulator_tick = 0;
    bool is_update = false;
    static bool is_add = false;
    if(!is_add) {
        is_add = true;
        //for(uint8_t dev_idx = 0; dev_idx < MAX_INDOOR_UNIT; dev_idx++) {
        for(uint8_t dev_idx = 0; dev_idx < 3; dev_idx++) {
            _indoor_unit_device_add(handle, dev_idx);
            indoor_unit_device_t *unit = _indoor_unit_device_find(handle, dev_idx);
            unit->indoor_monitor_info.temperature = 16;
            unit->indoor_monitor_info.setpoint = 16;
        }
    }
    if(esp_periph_tick_get() - simulator_tick > (10*1000)) {
        is_update = true;
        simulator_tick = esp_periph_tick_get();
    }
#endif
    if (IS_NULL(handle)) return NULL;
    if (control_info != NULL) {
        mutex_lock(handle->unit_lock);
        indoor_unit_device_t *unit = _indoor_unit_device_find(handle, control_info->address);
        if(unit) {
            _aircond_print_info("Control", __LINE__, control_info, unit->model);
            control_info->temperature = unit->indoor_monitor_info.temperature;
            control_info->humidity = unit->indoor_monitor_info.humidity;
            memcpy((void *)&unit->indoor_control_info, control_info, sizeof(aircond_info_t));
            memcpy((void *)&unit->indoor_monitor_info, control_info, sizeof(aircond_info_t));
            unit->control_flag = true;
            unit->control_num = 0;
        }
        else {
            LOGE(TAG, "Aircond address %x doest not exist", control_info->address);
        }
        mutex_unlock(handle->unit_lock);
        handle->control_tick = esp_periph_tick_get() - AIRCOND_CONTROL_TIMEOUT_MS;
    }
    int idx = 0;
    if (handle->num_indoor_unit_devices > 0) {
        for(uint8_t unit_idx = 0; unit_idx < MAX_INDOOR_UNIT; unit_idx++) {
            aircond_info_t *info = &handle->info[unit_idx];
            info->address = AIRCOND_BROADCAST_ADDR;
        }
        indoor_unit_device_t *dev, *tmp = NULL;
        do {
            mutex_lock(handle->unit_lock);
            dev = _indoor_unit_device_get(handle, tmp);
            if(dev) {
#ifdef CONFIG_DEVICE_SIMULATOR
                if(is_update) {
                    //dev->indoor_monitor_info.fanspeed = AIRCOND_FANSPEED_2;
                    dev->indoor_monitor_info.humidity = (float)(esp_random() % 10 + 16);
                    dev->indoor_monitor_info.is_online = true;
                    //dev->indoor_monitor_info.mode = AIRCOND_MODE_AUTO;
                    if((dev->indoor_monitor_info.setpoint < 16) || (dev->indoor_monitor_info.setpoint > 35))
                        dev->indoor_monitor_info.setpoint = handle->info_default.setpoint;
                    else
                        dev->indoor_monitor_info.setpoint = dev->indoor_monitor_info.setpoint;
                    dev->indoor_monitor_info.temperature = (float)(esp_random() % 10 + 16);
                    //dev->indoor_monitor_info.vanes = AIRCOND_VANE_POS2;
                    //_aircond_print_info("Simulator", __LINE__, &dev->indoor_monitor_info, dev->model);
                }
#endif
                tmp = dev;
                aircond_info_t *des = (aircond_info_t *)&handle->info[idx];
                memcpy(des, &dev->indoor_monitor_info, sizeof(aircond_info_t));
                if(is_fail) _aircond_print_info("copy", __LINE__, des, dev->model);
                if(dev->indoor_monitor_info.address == ADDRESS_DEBUG) {
                    if(heap_caps_get_free_size(MALLOC_CAP_8BIT) < (10*1024))
                        LOGW(TAG, "Low mem %d", heap_caps_get_free_size(MALLOC_CAP_8BIT));
                }
                if((esp_periph_tick_get() - dev->check_online_tick) > AIRCOND_TIMEOUT_MS) {
                    LOGW(TAG, "Device %d is offline", dev->indoor_monitor_info.address);
                    dev->check_online_tick = esp_periph_tick_get();
                    dev->indoor_monitor_info.is_online = false;
                }
                idx++;
                if(idx >= MAX_INDOOR_UNIT) {
                    is_fail = true;
                    LOGE(TAG, "Limit dev unit ...");
                    mutex_unlock(handle->unit_lock);
                    return NULL;
                }
            }
            mutex_unlock(handle->unit_lock);
        } while (dev != NULL);
        return handle->info;
    }
    return NULL;
}

int periph_ac_rs485_get_num_unit(rs485_handle_t handle) {
    return handle->num_indoor_unit_devices;
}

void periph_ac_rs485_set_info_default(rs485_handle_t handle, aircond_info_t *info) {
    memcpy(&handle->info_default, info, sizeof(aircond_info_t));
    _aircond_print_info("info def", __LINE__, &handle->info_default, 0);
}
