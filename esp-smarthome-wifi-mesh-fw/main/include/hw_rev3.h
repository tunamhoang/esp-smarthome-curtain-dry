/*
 * This file is subject to the terms of the SunshineTech License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *
 *              ./LICENSE
 */

#ifndef _APP_DEFV3_H_
#define _APP_DEFV3_H_

#include "sdkconfig.h"
#define HW_REV                              (3)
#define HARDWARE_VERSION_TOUCH              "ST5.0-%d" //ST5.0-1E => ST5.0-2M, ST5.0-3M
#define HARDWARE_VERSION_HTOUCH             "STH5.0-%dH"
#define HARDWARE_VERSION_CTOUCH             "STC5.0-%dC"
#define HARDWARE_VERSION_REMOTE             "SGW3.7"
#define MODEL_PREFIX_TOUCH                  "WT3-%d"  //normal touch
#define MODEL_PREFIX_HTOUCH                 "WH3-%d" //heater touch
#define MODEL_PREFIX_CTOUCH                 "WC3-%d" //curtain touch
#define MODEL_PREFIX_REMOTE                 "GW3-%d" //remote
#define HARDWARE_DESCRIPTION                "Device hardware version 3, with Mesh, without MTCH"

#define TOUCH_1PAD_IO_MAP\
    { .touch_pad = 8, .touch_gpio = 33, .led_on_gpio = 15, .led_off_gpio = 13, .relay_gpio = 5, .state = 0, .mtch_dac = 0 }

// Touch using ESP 2 PAD
#define TOUCH_2PAD_IO_MAP\
    { .touch_pad = 8, .touch_gpio = 33, .led_on_gpio = 15, .led_off_gpio = 13, .relay_gpio = 5,  .state = 0, .mtch_dac = 0 },\
    { .touch_pad = 7, .touch_gpio = 27, .led_on_gpio = 2,  .led_off_gpio = 4, .relay_gpio = 23, .state = 0, .mtch_dac = 0 }

// Touch using ESP 3 PAD
#define TOUCH_3PAD_IO_MAP\
    { .touch_pad = 8, .touch_gpio = 33, .led_on_gpio = 15, .led_off_gpio = 13, .relay_gpio = 5,  .state = 0, .mtch_dac = 0 },\
    { .touch_pad = 7, .touch_gpio = 27, .led_on_gpio = 2,  .led_off_gpio = 4,  .relay_gpio = 23, .state = 0, .mtch_dac = 0 },\
    { .touch_pad = 6, .touch_gpio = 14, .led_on_gpio = 21, .led_off_gpio = 22, .relay_gpio = 9,  .state = 0, .mtch_dac = 0 }

// Touch using ESP 4 PAD
#define TOUCH_4PAD_IO_MAP\
    { .touch_pad = 8, .touch_gpio = 33, .led_on_gpio = 15, .led_off_gpio = 13, .relay_gpio = 5,  .state = 0, .mtch_dac = 0 },\
    { .touch_pad = 7, .touch_gpio = 27, .led_on_gpio = 2,  .led_off_gpio = 4,  .relay_gpio = 23, .state = 0, .mtch_dac = 0 },\
    { .touch_pad = 6, .touch_gpio = 14, .led_on_gpio = 21, .led_off_gpio = 22, .relay_gpio = 9,  .state = 0, .mtch_dac = 0 },\
    { .touch_pad = 9, .touch_gpio = 32, .led_on_gpio = 25, .led_off_gpio = 26, .relay_gpio = 10, .state = 0, .mtch_dac = 0 }

// Touch using SX8636 5 PAD
#define TOUCH_5PAD_IO_MAP\
    { .touch_pad = 0, .touch_gpio = -1, .led_on_gpio = 32, .led_off_gpio = 33, .relay_gpio = 5,  .state = 0, .mtch_dac = 1 },\
    { .touch_pad = 1, .touch_gpio = -1, .led_on_gpio = 27, .led_off_gpio = 14, .relay_gpio = 23, .state = 0, .mtch_dac = 1 },\
    { .touch_pad = 2, .touch_gpio = -1, .led_on_gpio = 26, .led_off_gpio = 25, .relay_gpio = 4,  .state = 0, .mtch_dac = 1 },\
    { .touch_pad = 3, .touch_gpio = -1, .led_on_gpio = 15, .led_off_gpio = 2,  .relay_gpio = 21, .state = 0, .mtch_dac = 1 },\
    { .touch_pad = 4, .touch_gpio = -1, .led_on_gpio = 13, .led_off_gpio = 12, .relay_gpio = -1, .state = 0, .mtch_dac = 1 }

// Touch using SX8636 6 PAD
#define TOUCH_6PAD_IO_MAP\
    { .touch_pad = 2, .touch_gpio = -1, .led_on_gpio = 25, .led_off_gpio = 26, .relay_gpio = 4,  .state = 0, .mtch_dac = 1 },\
    { .touch_pad = 3, .touch_gpio = -1, .led_on_gpio = 15, .led_off_gpio =  2, .relay_gpio = 21, .state = 0, .mtch_dac = 1 },\
    { .touch_pad = 1, .touch_gpio = -1, .led_on_gpio = 14, .led_off_gpio = 27, .relay_gpio = 23, .state = 0, .mtch_dac = 1 },\
    { .touch_pad = 4, .touch_gpio = -1, .led_on_gpio = 12, .led_off_gpio = 13, .relay_gpio = 5,  .state = 0, .mtch_dac = 1 },\
    { .touch_pad = 0, .touch_gpio = -1, .led_on_gpio = 32, .led_off_gpio = 33, .relay_gpio = -1, .state = 0, .mtch_dac = 1 },\
    { .touch_pad = 5, .touch_gpio = -1, .led_on_gpio = 19, .led_off_gpio = 22, .relay_gpio = -1, .state = 0, .mtch_dac = 1 }


#define REMOTE_GW_STATUS_IO   { .touch_gpio = 0, .led_on_gpio = 15, .led_off_gpio = 12, .relay_gpio = -1, .state = 0 }

#ifdef CONFIG_DEVICE_TYPE_TOUCH
    #define HW_MAP\
        { 0, 0, 0, HW_REV, DEVICE_FEATURE_TOUCH_HEATER, DEVICE_ATTR_TOUCH1, HARDWARE_VERSION_HTOUCH, MODEL_PREFIX_HTOUCH, 0 },\
        { 0, 0, 1, HW_REV, DEVICE_FEATURE_TOUCH_NORMAL, DEVICE_ATTR_TOUCH1, HARDWARE_VERSION_TOUCH, MODEL_PREFIX_TOUCH, 0 },\
        { 0, 1, 1, HW_REV, DEVICE_FEATURE_TOUCH_NORMAL, DEVICE_ATTR_TOUCH2, HARDWARE_VERSION_TOUCH, MODEL_PREFIX_TOUCH, 0 },\
        { 1, 0, 1, HW_REV, DEVICE_FEATURE_TOUCH_NORMAL, DEVICE_ATTR_TOUCH3, HARDWARE_VERSION_TOUCH, MODEL_PREFIX_TOUCH, 0 },\
        { 1, 1, 1, HW_REV, DEVICE_FEATURE_TOUCH_NORMAL, DEVICE_ATTR_TOUCH4, HARDWARE_VERSION_TOUCH, MODEL_PREFIX_TOUCH, 0 },\
        { 0, 1, 0, HW_REV, DEVICE_FEATURE_TOUCH_NORMAL, DEVICE_ATTR_TOUCH5, HARDWARE_VERSION_TOUCH, MODEL_PREFIX_TOUCH, 0 },\
        { 1, 0, 0, HW_REV, DEVICE_FEATURE_TOUCH_NORMAL, DEVICE_ATTR_TOUCH6, HARDWARE_VERSION_TOUCH, MODEL_PREFIX_TOUCH, 0 }
#elif defined(CONFIG_DEVICE_TYPE_REMOTE_GATEWAY)
    #define HW_MAP\
        { 0, 0, 0, HW_REV, DEVICE_FEATURE_GW_IR | DEVICE_FEATURE_GW_RF | DEVICE_FEATURE_GW_SENSOR, DEVICE_ATTR_GW_UART, HARDWARE_VERSION_REMOTE, MODEL_PREFIX_REMOTE, , MODEL_GROUP_RETMOTE_GATEWAY }
#elif defined(CONFIG_DEVICE_TYPE_TOUCH_CURTAIN)
    #define HW_MAP\
        { 0, 1, 0, HW_REV, DEVICE_FEATURE_CURTAIN_UART, DEVICE_ATTR_TOUCH2, HARDWARE_VERSION_CTOUCH, MODEL_PREFIX_CTOUCH, 0 },\
        { 1, 1, 0, HW_REV, DEVICE_FEATURE_CURTAIN_UART, DEVICE_ATTR_TOUCH4, HARDWARE_VERSION_CTOUCH, MODEL_PREFIX_CTOUCH, 0 },\
        { 1, 1, 1, HW_REV, DEVICE_FEATURE_CURTAIN_UART, DEVICE_ATTR_TOUCH4, HARDWARE_VERSION_CTOUCH, MODEL_PREFIX_CTOUCH, 0 },\
        { 1, 0, 0, HW_REV, DEVICE_FEATURE_CURTAIN_DRYC, DEVICE_ATTR_TOUCH4, HARDWARE_VERSION_CTOUCH, MODEL_PREFIX_CTOUCH, 0 },\
        { 0, 0, 1, HW_REV, DEVICE_FEATURE_CURTAIN_DRYC, DEVICE_ATTR_TOUCH2, HARDWARE_VERSION_CTOUCH, MODEL_PREFIX_CTOUCH, 0 }
#endif
#endif
