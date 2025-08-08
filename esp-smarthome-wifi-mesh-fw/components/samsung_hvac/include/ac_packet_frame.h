#ifndef AC_PACKET_FRAME_H_
#define AC_PACKET_FRAME_H_

#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "freertos/ringbuf.h"
#include "esp_system.h"
#include "esp_log.h"

#define CHECK_IF_NULL(x, action)        do {    \
    if (x == NULL) action;                      \
} while (0)

#define DEVICE_ADDR_LEN     (3)
#define MESSAGE_DATA_SIZE   (4)
#define HEADER_SIZE         (13)
#define SIZE_OF_ENUM        (1)
#define SIZE_OF_VAR         (2)
#define SIZE_OF_LONG_VAR    (4)
#define MAX_DATA_LEN        (46)

#define PREAMBLE_BYTE            0x55
#define PREAMBLE_SIZE            100
#define START_BYTE               0x32
#define END_BYTE                 0x34

#define ADDRESS_REQUEST_INDEX       0x2004

typedef enum {
    MESSAGE_TYPE_ENUM = 0,
    MESSAGE_TYPE_VAR,
    MESSAGE_TYPE_LONG_VAR,
    MESSAGE_TYPE_STRUCT,
} ac_message_type_t;

typedef enum {
    PACKET_TYPE_STANDBY = 0,
    PACKET_TYPE_NORMAL,
    PACKET_TYPE_GATHERING,
    PACKET_TYPE_INSTALL,
    PACKET_TYPE_DOWNLOAD,
} ac_command_packet_type_t;

typedef enum {
    DATA_TYPE_READ = 1,
    DATA_TYPE_WRITE,
    DATA_TYPE_REQUEST,
    DATA_TYPE_NOTIFICATION,
    DATA_TYPE_RESPONSE,
    DATA_TYPE_ACK,
} ac_command_data_type_t;

typedef struct __attribute__((__packed__)) {
    uint8_t     dont_care;
    uint8_t     data_type : 4;
    uint8_t     packet_type : 4;
    uint8_t     packet_number;
} ac_packet_command_t;

typedef struct __attribute__((__packed__)) {
    union {
        struct {
            uint16_t    index : 9;
            uint8_t     type : 2;
            uint8_t     reserved : 2;
            uint8_t     device : 3;
        } field;
        uint16_t        value;
    } index;
    union {
        uint8_t         bytes[4];
        uint8_t         val_1;
        uint16_t        val_2;
        uint32_t        val_4;
    } data;
} ac_message_data_t;


typedef struct __attribute__((__packed__)) {
    uint8_t             stx;
    uint8_t             length[2];
    uint8_t             sa[3];
    uint8_t             da[3];
    ac_packet_command_t command;
    uint8_t             num_messages;
} ac_packet_header_t;

typedef struct {
    uint16_t            length;
    uint32_t            sa;
    uint32_t            da;
    ac_packet_command_t command;
    uint8_t             num_messages;
    ac_message_data_t*  message;
} ac_packet_data_t;

esp_err_t ac_packet_create_message(ac_message_data_t* ret_message, uint8_t device, ac_message_type_t type, uint16_t index, uint8_t* data);

esp_err_t ac_packet_create_message_simple(ac_message_data_t* ret_message, uint16_t index, uint32_t data);

esp_err_t ac_packet_create_command(ac_packet_command_t* ret_command, uint8_t packet_type, uint8_t data_type, uint8_t pn);

esp_err_t ac_packet_create_command_simple(ac_packet_command_t* ret_command, uint8_t command, uint8_t pn);

ac_packet_data_t* ac_packet_analyze_buffer(uint8_t* buffer, int size);

esp_err_t ac_packet_data_release(ac_packet_data_t* packet_data);

int ac_packet_get_buffer(ac_packet_data_t* packet_data, uint8_t* buffer, int max_size);

esp_err_t ac_packet_create_packet_data(ac_packet_data_t* ret_data, uint32_t sa, uint32_t da, ac_packet_command_t command, uint8_t num_message, ac_message_data_t* message);

uint16_t ac_packet_get_crc(uint8_t* buffer, int size);

#endif
