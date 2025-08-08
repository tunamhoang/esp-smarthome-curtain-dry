#include "segment_display.h"
#include "segment_display_icon.h"
#include "freertos/task.h"
#include "esp_log.h"
#include "string.h"
#include "stdlib.h"

uint8_t seg_number_map[10] = {0x3F, //Number 0
                              0x06, // Number 1
                              0x5B, // Number 2
                              0x4F, // Number 3
                              0x66, // Number 4
                              0x6D, // Number 5
                              0x7D, // Number 6
                              0x07, // Number 7
                              0x7F, // Number 8
                              0x6F}; // Number 9

uint64_t tens_map[8] = {SEG_1A, SEG_1B, SEG_1C, SEG_1D, SEG_1E, SEG_1F, SEG_1G, 0x00};
uint64_t unit_number_map[8] = {SEG_2A, SEG_2B, SEG_2C, SEG_2D, SEG_2E, SEG_2F, SEG_2G, 0x00};
uint64_t decimal_map[8] = {SEG_3A, SEG_3B, SEG_3C, SEG_3D, SEG_3E, SEG_3F, SEG_3G, 0x00};

#define TAG "SEGMENT_DISPLAY"

static esp_err_t _segment_display_set_seg(disp_handle_t handle, uint64_t seg)
{
    handle->disp_map |= seg;
    return ESP_OK;
}

static esp_err_t _segment_display_clear_seg(disp_handle_t handle, uint64_t seg)
{
    handle->disp_map &= ~seg;
    return ESP_OK;
}

// static esp_err_t _print_bit(uint8_t *data)
// {
//     uint8_t byte;
//     uint8_t size = 0;
//     for(int i = 0; i < 4; i++) {
//         for(int q = 0; q < 4; q++) {
//             for (int j = 0; j < 8; j++) {
//                 byte = (data[size] >> j) & 1;
//                 printf("%d ", byte);
//             }
//             size += 1;
//             printf("- ");
//         }
//         printf("\n");
//     }
//     return ESP_OK;
// }

static esp_err_t _segment_display_set_power(disp_handle_t handle)
{
    if (handle == NULL) {
        return ESP_FAIL;
    }
    if (handle->info->power == DISP_POWER_ON) {
        _segment_display_set_seg(handle, S29);
    } else if (handle->info->power == DISP_POWER_OFF) {
        ESP_LOGI(TAG, "DISP_POWER_OFF");
        handle->disp_map = 0;
        _segment_display_set_seg(handle, S29);
    } else if (handle->info->power == DISP_POWER_CONFLICT) {
        handle->disp_map = 0;
        _segment_display_set_seg(handle, S29);
        _segment_display_set_seg(handle, SEG_1G);
        _segment_display_set_seg(handle, SEG_2G);
        _segment_display_set_seg(handle, SEG_3G);
    }
    return ESP_OK;
}

static esp_err_t _segment_display_set_setpoint(disp_handle_t handle)
{
    if (handle == NULL) {
        return ESP_FAIL;
    }
    uint8_t tens, unit_number, decimal;
    tens = handle->info->setpoint / 10;
    unit_number = handle->info->setpoint % 10;
    decimal = 0;

    for (int i = 0; i < 8; i++) {
        if ((seg_number_map[tens] >> i) & 0x01) {
            _segment_display_set_seg(handle, tens_map[i]);
        } else {
            _segment_display_clear_seg(handle, tens_map[i]);
        }

        if ((seg_number_map[unit_number] >> i) & 0x01) {
            _segment_display_set_seg(handle, unit_number_map[i]);
        } else {
            _segment_display_clear_seg(handle, unit_number_map[i]);
        }

        if ((seg_number_map[decimal] >> i) & 0x01) {
            _segment_display_set_seg(handle, decimal_map[i]);
        } else {
            _segment_display_clear_seg(handle, decimal_map[i]);
        }
    }
    _segment_display_set_seg(handle, S14);
    _segment_display_set_seg(handle, S16);
    _segment_display_set_seg(handle, S15);
    _segment_display_clear_seg(handle, S13);
    _segment_display_clear_seg(handle, S17);
    return ESP_OK;
}

static esp_err_t _segment_display_set_temp(disp_handle_t handle)
{
    if (handle == NULL) {
        return ESP_FAIL;
    }
    uint8_t tens, unit_number, decimal;
    tens = (int)handle->info->temperature / 10;
    unit_number = (int)handle->info->temperature % 10;
    decimal = (int)(handle->info->temperature * 10) % 10;

    for (int i = 0; i < 8; i++) {
        if ((seg_number_map[tens] >> i) & 0x01) {
            _segment_display_set_seg(handle, tens_map[i]);
        } else {
            _segment_display_clear_seg(handle, tens_map[i]);
        }

        if ((seg_number_map[unit_number] >> i) & 0x01) {
            _segment_display_set_seg(handle, unit_number_map[i]);
        } else {
            _segment_display_clear_seg(handle, unit_number_map[i]);
        }

        if ((seg_number_map[decimal] >> i) & 0x01) {
            _segment_display_set_seg(handle, decimal_map[i]);
        } else {
            _segment_display_clear_seg(handle, decimal_map[i]);
        }
    }
    _segment_display_set_seg(handle, S13);
    _segment_display_set_seg(handle, S16);
    _segment_display_set_seg(handle, S15);
    _segment_display_clear_seg(handle, S14);
    _segment_display_clear_seg(handle, S17);
    return ESP_OK;
}

static esp_err_t _segment_display_set_hump(disp_handle_t handle)
{
    if (handle == NULL) {
        return ESP_FAIL;
    }
    uint8_t tens, unit_number, decimal;
    tens = (int)handle->info->humidity / 10;
    unit_number = (int)handle->info->humidity % 10;
    decimal = (int)(handle->info->humidity * 10) % 10;

    for (int i = 0; i < 8; i++) {
        if ((seg_number_map[tens] >> i) & 0x01) {
            _segment_display_set_seg(handle, tens_map[i]);
        } else {
            _segment_display_clear_seg(handle, tens_map[i]);
        }

        if ((seg_number_map[unit_number] >> i) & 0x01) {
            _segment_display_set_seg(handle, unit_number_map[i]);
        } else {
            _segment_display_clear_seg(handle, unit_number_map[i]);
        }

        if ((seg_number_map[decimal] >> i) & 0x01) {
            _segment_display_set_seg(handle, decimal_map[i]);
        } else {
            _segment_display_clear_seg(handle, decimal_map[i]);
        }
    }
    _segment_display_set_seg(handle, S13);
    _segment_display_set_seg(handle, S15);
    _segment_display_set_seg(handle, S17);
    _segment_display_clear_seg(handle, S16);
    _segment_display_clear_seg(handle, S14);
    return ESP_OK;
}

static esp_err_t _segment_display_set_address(disp_handle_t handle)
{
    if (handle == NULL) {
        return ESP_FAIL;
    }
    if(handle->info->address == 0xFF) {
        _segment_display_set_seg(handle, SEG_1G);
        _segment_display_set_seg(handle, SEG_2G);
        return ESP_OK;
    }
    uint8_t tens, unit_number;
    tens = (int)handle->info->address / 10;
    unit_number = (int)handle->info->address % 10;

    for (int i = 0; i < 8; i++) {
        if ((seg_number_map[tens] >> i) & 0x01) {
            _segment_display_set_seg(handle, tens_map[i]);
        } else {
            _segment_display_clear_seg(handle, tens_map[i]);
        }

        if ((seg_number_map[unit_number] >> i) & 0x01) {
            _segment_display_set_seg(handle, unit_number_map[i]);
        } else {
            _segment_display_clear_seg(handle, unit_number_map[i]);
        }
    }
    return ESP_OK;
}

// static esp_err_t _segment_display_clear_address(disp_handle_t handle)
// {
//     if (handle == NULL) {
//         return ESP_FAIL;
//     }
//     for (int i = 0; i < 8; i++) {
//         _segment_display_clear_seg(handle, tens_map[i]);
//         _segment_display_clear_seg(handle, unit_number_map[i]);
//     }
//     return ESP_OK;
// }

static esp_err_t _segment_display_clear_setpoint(disp_handle_t handle)
{
    if (handle == NULL) {
        return ESP_FAIL;
    }
    for (int i = 0; i < 8; i++) {
        _segment_display_clear_seg(handle, tens_map[i]);
        _segment_display_clear_seg(handle, unit_number_map[i]);
    }
    _segment_display_set_seg(handle, S14);
    _segment_display_set_seg(handle, S16);
    _segment_display_clear_seg(handle, S15);
    _segment_display_clear_seg(handle, S13);
    _segment_display_clear_seg(handle, S17);
    return ESP_OK;
}

static esp_err_t _segment_display_set_mode(disp_handle_t handle)
{
    if (handle == NULL) {
        return ESP_FAIL;
    }
    _segment_display_set_seg(handle, S19);
    _segment_display_set_seg(handle, S21);
    _segment_display_set_seg(handle, S23);
    _segment_display_set_seg(handle, S25);
    _segment_display_set_seg(handle, S27);
    switch (handle->info->mode) {
        case DISP_MODE_HEAT:
            _segment_display_set_seg(handle, S22);
            _segment_display_clear_seg(handle, S23);
            break;
        case DISP_MODE_COOL:
            _segment_display_set_seg(handle, S20);
            _segment_display_clear_seg(handle, S21);
            break;
        case DISP_MODE_AUTO:
            _segment_display_set_seg(handle, S18);
            _segment_display_clear_seg(handle, S19);
            break;
        case DISP_MODE_DRY:
            _segment_display_set_seg(handle, S24);
            _segment_display_clear_seg(handle, S25);
            break;
        case DISP_MODE_FAN:
        case DISP_MODE_VANES:
            _segment_display_set_seg(handle, S26);
            _segment_display_clear_seg(handle, S27);
            break;
    }
    return ESP_OK;
}

static esp_err_t _segment_display_clear_mode(disp_handle_t handle)
{
    if (handle == NULL) {
        return ESP_FAIL;
    }

    _segment_display_set_seg(handle, S19);
    _segment_display_set_seg(handle, S21);
    _segment_display_set_seg(handle, S23);
    _segment_display_set_seg(handle, S25);
    _segment_display_set_seg(handle, S27);
    switch (handle->info->mode) {
        case DISP_MODE_HEAT:
            _segment_display_clear_seg(handle, S22);
            _segment_display_set_seg(handle, S23);
            break;
        case DISP_MODE_COOL:
            _segment_display_clear_seg(handle, S20);
            _segment_display_set_seg(handle, S21);
            break;
        case DISP_MODE_AUTO:
            _segment_display_clear_seg(handle, S18);
            _segment_display_set_seg(handle, S19);
            break;
        case DISP_MODE_DRY:
            _segment_display_clear_seg(handle, S24);
            _segment_display_set_seg(handle, S25);
            break;
        case DISP_MODE_FAN:
        case DISP_MODE_VANES:
            _segment_display_clear_seg(handle, S26);
            _segment_display_set_seg(handle, S27);
            break;
    }
    return ESP_OK;
}

static esp_err_t _segment_display_set_fan(disp_handle_t handle)
{
    if (handle == NULL) {
        return ESP_FAIL;
    }
    _segment_display_set_seg(handle, S7);
    switch (handle->info->fanspeed) {
        case DISP_FANSPEED_1:
            _segment_display_set_seg(handle, S9);
            break;
        case DISP_FANSPEED_2:
            _segment_display_set_seg(handle, S9);
            _segment_display_set_seg(handle, S10);
            break;
        case DISP_FANSPEED_3:
            _segment_display_set_seg(handle, S9);
            _segment_display_set_seg(handle, S10);
            _segment_display_set_seg(handle, S11);
            break;
        case DISP_FANSPEED_4:
            _segment_display_set_seg(handle, S9);
            _segment_display_set_seg(handle, S10);
            _segment_display_set_seg(handle, S11);
            _segment_display_set_seg(handle, S12);
            break;
        case DISP_FANSPEED_AUTO:
            _segment_display_set_seg(handle, S8);
            break;
    }
    return ESP_OK;
}

static esp_err_t _segment_display_clear_fan(disp_handle_t handle)
{
    if (handle == NULL) {
        return ESP_FAIL;
    }
    _segment_display_clear_seg(handle, S7);
    _segment_display_clear_seg(handle, S8);
    _segment_display_clear_seg(handle, S9);
    _segment_display_clear_seg(handle, S10);
    _segment_display_clear_seg(handle, S11);
    _segment_display_clear_seg(handle, S12);
    return ESP_OK;

}

static esp_err_t _segment_display_set_vane(disp_handle_t handle)
{
    if (handle == NULL) {
        return ESP_FAIL;
    }
    ESP_LOGD(TAG, "handle->info->vane %d", handle->info->vanes);
    _segment_display_set_seg(handle, S2);
    switch (handle->info->vanes) {
        case DISP_VANE_POS1_UP:
            _segment_display_set_seg(handle, S3);
            break;
        case DISP_VANE_POS2:
            _segment_display_set_seg(handle, S3);
            _segment_display_set_seg(handle, S4);
            break;
        case DISP_VANE_POS3:
            _segment_display_set_seg(handle, S3);
            _segment_display_set_seg(handle, S4);
            _segment_display_set_seg(handle, S28);
            break;
        case DISP_VANE_POS4_DOWN:
            _segment_display_set_seg(handle, S3);
            _segment_display_set_seg(handle, S4);
            _segment_display_set_seg(handle, S28);
            _segment_display_set_seg(handle, S5);
            break;
        case DISP_VANE_SWING:
            _segment_display_set_seg(handle, S3);
            _segment_display_set_seg(handle, S4);
            _segment_display_set_seg(handle, S28);
            _segment_display_set_seg(handle, S5);
            _segment_display_set_seg(handle, S6);
            break;
    }
    return ESP_OK;
}

static esp_err_t _segment_display_clear_vane(disp_handle_t handle)
{
     if (handle == NULL) {
         return ESP_FAIL;
     }
     // _segment_display_clear_seg(handle, S2);
     _segment_display_clear_seg(handle, S3);
     _segment_display_clear_seg(handle, S4);
     _segment_display_clear_seg(handle, S28);
     _segment_display_clear_seg(handle, S5);
     _segment_display_clear_seg(handle, S6);
     return ESP_OK;
}

static esp_err_t _segment_display_set_wifi(disp_handle_t handle)
{
    if (handle == NULL) {
        return ESP_FAIL;
    }
    if (handle->info->wifi_connected) {
        _segment_display_set_seg(handle, S1);
    } else {
        _segment_display_clear_seg(handle, S1);
    }
    return ESP_OK;
}

static uint8_t _segment_disp_set_data(disp_handle_t handle, uint8_t *data_out)
{
    if (data_out == NULL) {
        ESP_LOGE(TAG, "Invalid data_out pointer or size pointer");
        return 0;
    }

    int8_t data_sz;
    memset(data_out, 0, 20 * sizeof(uint8_t));
    memset(data_out, (uint8_t)(handle->disp_map >> 0), 1);
    memset(data_out + 1, (uint8_t)(handle->disp_map >> 8), 1);
    memset(data_out + 5, (uint8_t)(handle->disp_map >> 16), 1);
    memset(data_out + 6, (uint8_t)(handle->disp_map >> 24), 1);
    memset(data_out + 10, (uint8_t)(handle->disp_map >> 32), 1);
    memset(data_out + 11, (uint8_t)(handle->disp_map >> 40), 1);
    memset(data_out + 15, (uint8_t)(handle->disp_map >> 48), 1);
    memset(data_out + 16, (uint8_t)(handle->disp_map >> 56), 1);
    data_sz = 16; //Length off data is 16 Byte
    return data_sz;
}

disp_handle_t segment_display_init()
{
    disp_handle_t disp_handle = (disp_handle_t)malloc(sizeof(disp_handle_));
    disp_handle->info = (disp_info_t *)malloc(sizeof(disp_info_t));
    memset(disp_handle->info, 0, sizeof(disp_info_t));
    return disp_handle;
}

uint8_t segment_display_generate_data(disp_handle_t handle, uint8_t *data_out, disp_opt_t disp_opt, bool blink_off)
{
    if (handle == NULL) {
        return 0;
    }

    handle->disp_map = (uint64_t)0;
    _segment_display_set_fan(handle);
    _segment_display_set_mode(handle);
    _segment_display_set_setpoint(handle);
    _segment_display_set_wifi(handle);
    _segment_display_set_vane(handle);
    switch ((int)disp_opt) {
        case DISP_BOOTING:
            handle->disp_map = 0xFFFFFFFFFFFFFFFF;
            ESP_LOGD(TAG, "DISP_BOOTING");
            break;
        case DISP_NORMAL:
            if (handle->info->temperature > 0) {
                _segment_display_set_temp(handle);
                ESP_LOGD(TAG, "DISP_NORMAL (ROOM TEMP)");
            } else {
                _segment_display_set_setpoint(handle);
                ESP_LOGD(TAG, "DISP_NORMAL (SET POINT)");
            }
            break;
        case DISP_ROOM_TEMP:
            _segment_display_set_temp(handle);
            ESP_LOGD(TAG, "DISP_ROOM_TEMP");
            break;
        case DISP_ROOM_HUMP:
            _segment_display_set_hump(handle);
            ESP_LOGD(TAG, "DISP_ROOM_HUMP");
            break;
        case DISP_SETPOINT:
            if (blink_off) {
                _segment_display_clear_setpoint(handle);
            } else {
                _segment_display_set_setpoint(handle);
            }
            ESP_LOGD(TAG, "DISP_SETPOINT. %s", blink_off ? "Blink ON" : "Blink OFF");
            break;
        case DISP_FAN:
            _segment_display_clear_setpoint(handle);
            _segment_display_set_temp(handle);
            if (blink_off) {
                _segment_display_clear_fan(handle);
            }
            ESP_LOGD(TAG, "DISP_BLINK_FAN %s", blink_off ? "Blink ON" : "Blink OFF");
            break;
        case DISP_MODE:
            if ((handle->info->mode == DISP_MODE_FAN)||(handle->info->mode == DISP_MODE_VANES)){
                _segment_display_clear_setpoint(handle);
                _segment_display_set_temp(handle);
            }
            if (blink_off) {
                if(handle->info->mode == DISP_MODE_FAN)
                    _segment_display_clear_fan(handle);
                else if(handle->info->mode == DISP_MODE_VANES)
                    _segment_display_clear_vane(handle);
                _segment_display_clear_mode(handle);
            }
            ESP_LOGD(TAG, "DISP_BLINK_MODE %s", blink_off ? "Blink ON" : "Blink OFF");
            break;
        case DISP_VANES:
            _segment_display_clear_setpoint(handle);
            _segment_display_set_temp(handle);
            if (blink_off) {
                _segment_display_clear_vane(handle);
            }
            ESP_LOGD(TAG, "DISP_BLINK_VANES");
            break;
        case DISP_CONFIG_MODE:
            handle->disp_map = (uint64_t)0;
            _segment_display_set_address(handle);
            ESP_LOGD(TAG, "DISP_CONFIG_MODE: %x", handle->info->address);
            break;
        default:
            ESP_LOGW(TAG, "Param blinking option not matching: %d", (int)disp_opt);
    };
    _segment_display_set_power(handle);
    _segment_disp_set_data(handle, data_out);
    return 20;
}
