/*
 * This file is subject to the terms of the SunshineTech License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *
 *              ./LICENSE
 */

#ifndef _APP_DEFV2_H_
#define _APP_DEFV2_H_

#include "sdkconfig.h"
#define HW_REV                              (2)
#define HARDWARE_VERSION_TOUCH              "ST4.6-%d" //ST4.6-1E => ST4.6-2M, ST4.6-3M
#define HARDWARE_VERSION_HTOUCH             "STH4.6-%dH"
#define HARDWARE_VERSION_CTOUCH             "STC4.6-%dC"
#define HARDWARE_VERSION_REMOTE             "SGW3.7"
#define MODEL_PREFIX_TOUCH                  "WT2-%d"  //normal touch
#define MODEL_PREFIX_HTOUCH                 "WH2-%d" //heater touch
#define MODEL_PREFIX_CTOUCH                 "WC2-%d" //curtain touch
#define MODEL_PREFIX_REMOTE                 "GW%d%s" //remote
#define HARDWARE_DESCRIPTION                "Device hardware version 2, with DAC"

#define TOUCH_1PAD_IO_MAP\
    { .touch_pad = 3, .touch_gpio = 15, .led_on_gpio = 26, .led_off_gpio = 25, .relay_gpio = 5, .state = 0, .mtch_dac = 0 }

// Touch using MTCH 2 PAD
#define TOUCH_2PAD_IO_MAP\
    { .touch_pad = 9, .touch_gpio = 32, .led_on_gpio = 13, .led_off_gpio = 15, .relay_gpio = 5,  .state = 0, .mtch_dac = 0 },\
    { .touch_pad = 7, .touch_gpio = 27, .led_on_gpio = 22, .led_off_gpio = 21, .relay_gpio = 23, .state = 0, .mtch_dac = 0 }

// Touch using MTCH 3 PAD
#define TOUCH_3PAD_IO_MAP\
    { .touch_pad = 9, .touch_gpio = 32, .led_on_gpio = 13, .led_off_gpio = 15, .relay_gpio = 5,  .state = 0, .mtch_dac = 130 },\
    { .touch_pad = 8, .touch_gpio = 33, .led_on_gpio = 4,  .led_off_gpio = 2,  .relay_gpio = 23, .state = 0, .mtch_dac = 130 },\
    { .touch_pad = 7, .touch_gpio = 27, .led_on_gpio = 22, .led_off_gpio = 21, .relay_gpio = 9,  .state = 0, .mtch_dac = 130 }

// Touch using MTCH 4 PAD
#define TOUCH_4PAD_IO_MAP\
    { .touch_pad = 9, .touch_gpio = 32, .led_on_gpio = 13, .led_off_gpio = 15, .relay_gpio = 5,  .state = 0, .mtch_dac = 130 },\
    { .touch_pad = 8, .touch_gpio = 33, .led_on_gpio = 4,  .led_off_gpio = 2,  .relay_gpio = 23, .state = 0, .mtch_dac = 130 },\
    { .touch_pad = 7, .touch_gpio = 27, .led_on_gpio = 22, .led_off_gpio = 21, .relay_gpio = 9,  .state = 0, .mtch_dac = 130 },\
    { .touch_pad = 6, .touch_gpio = 14, .led_on_gpio = 12, .led_off_gpio = 26, .relay_gpio = 10, .state = 0, .mtch_dac = 130 }
#endif

#define REMOTE_GW_STATUS_IO   { .touch_gpio = 0, .led_on_gpio = 15, .led_off_gpio = 12, .relay_gpio = -1, .state = 0 }

#ifdef CONFIG_DEVICE_TYPE_TOUCH
    #define HW_MAP\
        { 0, 0, 0, HW_REV, DEVICE_FEATURE_TOUCH_HEATER, DEVICE_ATTR_TOUCH1, HARDWARE_VERSION_HTOUCH, MODEL_PREFIX_HTOUCH, MODEL_GROUP_TOUCH },\
        { 0, 0, 1, HW_REV, DEVICE_FEATURE_TOUCH_NORMAL, DEVICE_ATTR_TOUCH1, HARDWARE_VERSION_TOUCH, MODEL_PREFIX_TOUCH, MODEL_GROUP_TOUCH },\
        { 0, 1, 1, HW_REV, DEVICE_FEATURE_TOUCH_NORMAL, DEVICE_ATTR_TOUCH2, HARDWARE_VERSION_TOUCH, MODEL_PREFIX_TOUCH, MODEL_GROUP_TOUCH },\
        { 1, 0, 1, HW_REV, DEVICE_FEATURE_TOUCH_NORMAL, DEVICE_ATTR_TOUCH3, HARDWARE_VERSION_TOUCH, MODEL_PREFIX_TOUCH, MODEL_GROUP_TOUCH },\
        { 1, 1, 1, HW_REV, DEVICE_FEATURE_TOUCH_NORMAL, DEVICE_ATTR_TOUCH4, HARDWARE_VERSION_TOUCH, MODEL_PREFIX_TOUCH, MODEL_GROUP_TOUCH }
#elif CONFIG_DEVICE_TYPE_TOUCH_CURTAIN
    #define HW_MAP\
        { 0, 1, 0, HW_REV, DEVICE_FEATURE_CURTAIN_UART, DEVICE_ATTR_TOUCH2, HARDWARE_VERSION_CTOUCH, MODEL_PREFIX_CTOUCH, MODEL_GROUP_CTOUCH },\
        { 1, 1, 0, HW_REV, DEVICE_FEATURE_CURTAIN_DRYC, DEVICE_ATTR_TOUCH4, HARDWARE_VERSION_CTOUCH, MODEL_PREFIX_CTOUCH, MODEL_GROUP_CTOUCH },\
        { 1, 1, 1, HW_REV, DEVICE_FEATURE_CURTAIN_UART, DEVICE_ATTR_TOUCH4, HARDWARE_VERSION_CTOUCH, MODEL_PREFIX_CTOUCH, MODEL_GROUP_CTOUCH },\
        { 1, 0, 0, HW_REV, DEVICE_FEATURE_CURTAIN_DRYC, DEVICE_ATTR_TOUCH4, HARDWARE_VERSION_CTOUCH, MODEL_PREFIX_CTOUCH, MODEL_GROUP_CTOUCH }
#elif defined(CONFIG_DEVICE_TYPE_REMOTE_GATEWAY)
    #define HW_MAP\
        { 0, 0, 1, HW_REV, DEVICE_FEATURE_GW_IR | DEVICE_FEATURE_GW_RF,     DEVICE_ATTR_GW_RS485, HARDWARE_VERSION_REMOTE, MODEL_PREFIX_REMOTE, MODEL_GROUP_REMOTE_GW },
#endif
 
