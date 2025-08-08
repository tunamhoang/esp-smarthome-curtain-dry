#include "ac_packet_frame.h"
#include "app_utility.h"

#define TAG     "PACKET_FRAME"

const uint16_t CCITT_CRC16_TABLE[256] = {
    0x0000, 0x1021, 0x2042, 0x3063, 0x4084, 0x50A5, 0x60C6, 0x70E7, 0x8108, 0x9129, 0xA14A, 0xB16B, 0xC18C, 0xD1AD, 0xE1CE, 0xF1EF,
    0x1231, 0x0210, 0x3273, 0x2252, 0x52B5, 0x4294, 0x72F7, 0x62D6, 0x9339, 0x8318, 0xB37B, 0xA35A, 0xD3BD, 0xC39C, 0xF3FF, 0xE3DE,
    0x2462, 0x3443, 0x0420, 0x1401, 0x64E6, 0x74C7, 0x44A4, 0x5485, 0xA56A, 0xB54B, 0x8528, 0x9509, 0xE5EE, 0xF5CF, 0xC5AC, 0xD58D,
    0x3653, 0x2672, 0x1611, 0x0630, 0x76D7, 0x66F6, 0x5695, 0x46B4, 0xB75B, 0xA77A, 0x9719, 0x8738, 0xF7DF, 0xE7FE, 0xD79D, 0xC7BC,
    0x48C4, 0x58E5, 0x6886, 0x78A7, 0x0840, 0x1861, 0x2802, 0x3823, 0xC9CC, 0xD9ED, 0xE98E, 0xF9AF, 0x8948, 0x9969, 0xA90A, 0xB92B,
    0x5AF5, 0x4AD4, 0x7AB7, 0x6A96, 0x1A71, 0x0A50, 0x3A33, 0x2A12, 0xDBFD, 0xCBDC, 0xFBBF, 0xEB9E, 0x9B79, 0x8B58, 0xBB3B, 0xAB1A,
    0x6CA6, 0x7C87, 0x4CE4, 0x5CC5, 0x2C22, 0x3C03, 0x0C60, 0x1C41, 0xEDAE, 0xFD8F, 0xCDEC, 0xDDCD, 0xAD2A, 0xBD0B, 0x8D68, 0x9D49,
    0x7E97, 0x6EB6, 0x5ED5, 0x4EF4, 0x3E13, 0x2E32, 0x1E51, 0x0E70, 0xFF9F, 0xEFBE, 0xDFDD, 0xCFFC, 0xBF1B, 0xAF3A, 0x9F59, 0x8F78,
    0x9188, 0x81A9, 0xB1CA, 0xA1EB, 0xD10C, 0xC12D, 0xF14E, 0xE16F, 0x1080, 0x00A1, 0x30C2, 0x20E3, 0x5004, 0x4025, 0x7046, 0x6067,
    0x83B9, 0x9398, 0xA3FB, 0xB3DA, 0xC33D, 0xD31C, 0xE37F, 0xF35E, 0x02B1, 0x1290, 0x22F3, 0x32D2, 0x4235, 0x5214, 0x6277, 0x7256,
    0xB5EA, 0xA5CB, 0x95A8, 0x8589, 0xF56E, 0xE54F, 0xD52C, 0xC50D, 0x34E2, 0x24C3, 0x14A0, 0x0481, 0x7466, 0x6447, 0x5424, 0x4405,
    0xA7DB, 0xB7FA, 0x8799, 0x97B8, 0xE75F, 0xF77E, 0xC71D, 0xD73C, 0x26D3, 0x36F2, 0x0691, 0x16B0, 0x6657, 0x7676, 0x4615, 0x5634,
    0xD94C, 0xC96D, 0xF90E, 0xE92F, 0x99C8, 0x89E9, 0xB98A, 0xA9AB, 0x5844, 0x4865, 0x7806, 0x6827, 0x18C0, 0x08E1, 0x3882, 0x28A3,
    0xCB7D, 0xDB5C, 0xEB3F, 0xFB1E, 0x8BF9, 0x9BD8, 0xABBB, 0xBB9A, 0x4A75, 0x5A54, 0x6A37, 0x7A16, 0x0AF1, 0x1AD0, 0x2AB3, 0x3A92,
    0xFD2E, 0xED0F, 0xDD6C, 0xCD4D, 0xBDAA, 0xAD8B, 0x9DE8, 0x8DC9, 0x7C26, 0x6C07, 0x5C64, 0x4C45, 0x3CA2, 0x2C83, 0x1CE0, 0x0CC1,
    0xEF1F, 0xFF3E, 0xCF5D, 0xDF7C, 0xAF9B, 0xBFBA, 0x8FD9, 0x9FF8, 0x6E17, 0x7E36, 0x4E55, 0x5E74, 0x2E93, 0x3EB2, 0x0ED1, 0x1EF0
};

uint16_t ac_packet_get_crc(uint8_t* buffer, int size)
{
    CHECK_IF_NULL(buffer, return ESP_FAIL);
    uint16_t crc = 0;
    for (int i = 0; i < size; i++) {
        crc = (crc << 8) ^ CCITT_CRC16_TABLE[((crc >> 8) ^ buffer[i]) & 0xFF];
    }
    return crc;
}

ac_packet_data_t *ac_packet_analyze_buffer(uint8_t* buffer, int size)
{
    CHECK_IF_NULL(buffer, return NULL);
    if (size < HEADER_SIZE) {
        return NULL;
    }
    uint16_t crc = (uint16_t)(buffer[size - 3] << 8) | buffer[size - 2];
    if (crc != ac_packet_get_crc(buffer + 3, size - 6)) {
        return NULL;
    }
    ac_packet_header_t packet_header = { 0 };
    memcpy(&packet_header, buffer, sizeof(ac_packet_header_t));
    ESP_LOGD(TAG, "packet_header");
    ESP_LOGD(TAG, "stx 0x%2x", packet_header.stx);
    ESP_LOGD(TAG, "sa %02x%02x%02x", packet_header.sa[0], packet_header.sa[1], packet_header.sa[2]);
    ESP_LOGD(TAG, "da %02x%02x%02x", packet_header.da[0], packet_header.da[1], packet_header.da[2]);
    ESP_LOGD(TAG, "cmd:");
    ESP_LOGD(TAG, "\tpacket type: %d", packet_header.command.packet_type);
    ESP_LOGD(TAG, "\tdata type: %d", packet_header.command.data_type);
    ESP_LOGD(TAG, "\tpacket number: %2x", packet_header.command.packet_number);
    ESP_LOGD(TAG, "number of message %d", packet_header.num_messages);

    int data_length = (packet_header.length[0] << 8) | packet_header.length[1];
    if (size < data_length + 2) {
        return NULL;
    }
    ac_packet_data_t *packet_data = malloc(sizeof(ac_packet_data_t));
    ERROR_CHECKW(IS_NULL(packet_data), "Error allocate, memory exhausted?", return NULL);
    // if(packet_header.num_messages == 0) {
    //     free(packet_data);
    //     return NULL;
    // }
    if(packet_header.num_messages != 0) {
        packet_data->message = malloc(sizeof(ac_message_data_t) * packet_header.num_messages);
        ERROR_CHECKW(IS_NULL(packet_data->message ), "Error allocate, memory exhausted?", return NULL);
    }
    else {
        packet_data->message = NULL;
    }

    packet_data->length = data_length;
    packet_data->sa = packet_header.sa[0];
    packet_data->sa = (packet_data->sa << 8) | packet_header.sa[1];
    packet_data->sa = (packet_data->sa << 8) | packet_header.sa[2];

    packet_data->da = packet_header.da[0];
    packet_data->da = (packet_data->da << 8) | packet_header.da[1];
    packet_data->da = (packet_data->da << 8) | packet_header.da[2];
    memcpy(&packet_data->command, &packet_header.command, sizeof(ac_packet_command_t));
    packet_data->num_messages = packet_header.num_messages;
    int cur_point = sizeof(ac_packet_header_t);
    for (int i = 0; i < packet_data->num_messages; i++) {
        uint16_t index = *((uint16_t*)(buffer + cur_point));
        uint8_t data[4] = { 0 };
        uint8_t type = (uint8_t)(index >> 1) & 0x03;
        cur_point += 2;
        int data_size = 0;
        switch (type)
        {
        case 0:
            memcpy(data, buffer + cur_point, SIZE_OF_ENUM);
            cur_point += SIZE_OF_ENUM;
            data_size = SIZE_OF_ENUM;
            break;
        case 1:
            memcpy(data, buffer + cur_point, SIZE_OF_VAR);
            cur_point += SIZE_OF_VAR;
            data_size = SIZE_OF_VAR;
            break;
        case 2:
            memcpy(data, buffer + cur_point, SIZE_OF_LONG_VAR);
            cur_point += SIZE_OF_LONG_VAR;
            data_size = SIZE_OF_LONG_VAR;
            break;
        default:
            free(packet_data->message);
            free(packet_data);
            return NULL;
            break;
        }
        memset(packet_data->message[i].data.bytes, 0, MESSAGE_DATA_SIZE);
        for (int j = 0; j < data_size; j++) {
            packet_data->message[i].data.bytes[data_size - j - 1] = data[j];
        }
        // memcpy(packet_data->message[i].data.bytes, data, MESSAGE_DATA_SIZE);
        uint16_t index_field = (index >> 8) | (index << 8);
        packet_data->message[i].index.value = 0;
        packet_data->message[i].index.field.device = (uint8_t)(index_field >> 13) & 0x07;
        packet_data->message[i].index.field.type = (uint8_t)(index_field >> 9) & 0x03;
        packet_data->message[i].index.field.index = (uint16_t)(index_field & 0x1ff);
    }

    return packet_data;
}

esp_err_t ac_packet_data_release(ac_packet_data_t* packet_data)
{
    CHECK_IF_NULL(packet_data, return ESP_FAIL);
    if(packet_data->message) free(packet_data->message);
    if(packet_data) free(packet_data);
    return ESP_OK;
}

int ac_packet_get_buffer(ac_packet_data_t* packet_data, uint8_t* buffer, int max_size)
{
    CHECK_IF_NULL(packet_data, return 0);
    CHECK_IF_NULL(buffer, return 0);
    if (packet_data->length + 2 > max_size) {
        return 0;
    }
    // Header
    ac_packet_header_t header = { 0 };
    header.stx = START_BYTE;
    header.sa[0] = (uint8_t)(packet_data->sa >> 16) & 0xff;
    header.sa[1] = (uint8_t)(packet_data->sa >> 8) & 0xff;
    header.sa[2] = (uint8_t)(packet_data->sa) & 0xff;

    header.da[0] = (uint8_t)(packet_data->da >> 16) & 0xff;
    header.da[1] = (uint8_t)(packet_data->da >> 8) & 0xff;
    header.da[2] = (uint8_t)(packet_data->da) & 0xff;

    header.length[0] = (uint8_t)(packet_data->length >> 8);
    header.length[1] = (uint8_t)(packet_data->length) & 0xff;
    memcpy(&header.command, &packet_data->command, sizeof(ac_packet_command_t));
    header.num_messages = packet_data->num_messages;
    memcpy(buffer, &header, sizeof(ac_packet_header_t));
    int cur_point = sizeof(ac_packet_header_t);
    uint8_t data[4] = { 0 };
    for (int i = 0; i < packet_data->num_messages; i++) {
        uint16_t index = ((uint16_t)packet_data->message[i].index.field.device << 13) & 0xe000;
        index |= (((uint16_t)packet_data->message[i].index.field.type << 9) & 0x0600);
        index |= ((packet_data->message[i].index.field.index) & 0x1ff);
        uint16_t index_field = (index << 8) | (index >> 8);
        memcpy(buffer + cur_point, (uint8_t*)(&index_field), 2);
        cur_point += 2;
        int data_size = 0;
        switch (packet_data->message[i].index.field.type)
        {
        case 0:
            data_size = SIZE_OF_ENUM;
            break;
        case 1:
            data_size = SIZE_OF_VAR;
            break;
        case 2:
            data_size = SIZE_OF_LONG_VAR;
            break;
        default:
            break;
        }
        for (int j = 0; j < data_size; j++) {
            data[j] = packet_data->message[i].data.bytes[data_size - j - 1];
        }
        memcpy(buffer + cur_point, data, data_size);
        cur_point += data_size;
    }
    uint16_t crc = ac_packet_get_crc(buffer + 3, cur_point - 3);
    buffer[cur_point] = (uint8_t)(crc >> 8);
    buffer[cur_point + 1] = (uint8_t)(crc) & 0xff;
    cur_point += 2;
    buffer[cur_point] = END_BYTE;
    cur_point += 1;
    return cur_point;
}

esp_err_t ac_packet_create_message(ac_message_data_t* ret_message, uint8_t device, ac_message_type_t type, uint16_t index, uint8_t* data)
{
    CHECK_IF_NULL(ret_message, return ESP_FAIL);
    CHECK_IF_NULL(data, return ESP_FAIL);
    ret_message->index.field.device = device;
    ret_message->index.field.type = (uint8_t)type;
    ret_message->index.field.index = index;
    if (data == NULL) {
        memset(ret_message->data.bytes, 0, 4);
    } else {
        memcpy(ret_message->data.bytes, data, 4);
    }
    return ESP_OK;
}

esp_err_t ac_packet_create_message_simple(ac_message_data_t* ret_message, uint16_t index, uint32_t data)
{
    CHECK_IF_NULL(ret_message, return ESP_FAIL);
    ret_message->index.value = index;
    uint8_t type = (uint8_t)(index >> 9) & 0x03;
    switch (type)
    {
    case 0:
        ret_message->data.val_1 = data;
        break;
    case 1:
        ret_message->data.val_2 = data;
        break;
    case 2:
        ret_message->data.val_4 = data;
        break;
    default:
        break;
    }
    return ESP_OK;
}

esp_err_t ac_packet_create_packet_data(ac_packet_data_t* ret_data, uint32_t sa, uint32_t da, ac_packet_command_t command, uint8_t num_message, ac_message_data_t* message)
{
    CHECK_IF_NULL(ret_data, return ESP_FAIL);
    ret_data->sa = sa;
    ret_data->da = da;

    memcpy(&ret_data->command, &command, sizeof(ac_packet_command_t));
    ret_data->num_messages = num_message;
    ret_data->message = message;
    ret_data->length = HEADER_SIZE + 1; // exclude message
    for (int i = 0; i < num_message; i++) {
        ret_data->length += 2;
        switch (message[i].index.field.type)
        {
        case MESSAGE_TYPE_ENUM:
            ret_data->length += SIZE_OF_ENUM;
            break;
        case MESSAGE_TYPE_VAR:
            ret_data->length += SIZE_OF_VAR;
            break;
        case MESSAGE_TYPE_LONG_VAR:
            ret_data->length += SIZE_OF_LONG_VAR;
            break;

        default:
            ESP_LOGE(TAG, "Unsupport message type");
            return ESP_FAIL;
            break;
        }
    }
    return ESP_OK;
}

esp_err_t ac_packet_create_command(ac_packet_command_t* ret_command, uint8_t packet_type, uint8_t data_type, uint8_t pn)
{
    CHECK_IF_NULL(ret_command, return ESP_FAIL);
    ret_command->dont_care = 0xc0;
    ret_command->packet_type = packet_type;
    ret_command->data_type = data_type;
    ret_command->packet_number = pn;
    return ESP_FAIL;
}

esp_err_t ac_packet_create_command_simple(ac_packet_command_t* ret_command, uint8_t command, uint8_t pn)
{
    CHECK_IF_NULL(ret_command, return ESP_FAIL);
    ret_command->dont_care = 0xc0;
    ret_command->packet_type = (command >> 4) & 0x0f;
    ret_command->data_type = (command & 0x0f);
    ret_command->packet_number = pn;
    return ESP_OK;
}

