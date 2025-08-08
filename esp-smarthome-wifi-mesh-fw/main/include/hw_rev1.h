/*
 * This file is subject to the terms of the SunshineTech License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *
 *              ./LICENSE
 */

#ifndef _APP_DEFV1_H_
#define _APP_DEFV1_H_

#include "sdkconfig.h"
#define HW_REV                              (1)
#define HARDWARE_VERSION_TOUCH              "ST4.4-%d"      //ST4.4-1E => ST4.4-2M, ST4.4-3M
#define HARDWARE_VERSION_HTOUCH             "ST4.4-%dH"
#define HARDWARE_VERSION_CTOUCH             "STC4.4-%dC"
#define HARDWARE_VERSION_REMOTE             "SGW3.7-%d%s"
#define HARDWARE_VERSION_PIR                "SMD1.0"
#define HARDWARE_VERSION_TMS                "TMS01"
#define MODEL_PREFIX_TOUCH                  "WT1-%d"        //normal touch
#define MODEL_PREFIX_HTOUCH                 "WH1-%d"        //heater touch
#define MODEL_PREFIX_CTOUCH                 "WC1-%d"        //curtain touch
#define MODEL_PREFIX_REMOTE                 "GW%d%s"       //remote
#define MODEL_PREFIX_PIR                    "MD1"        //normal PIR
#define MODEL_PREFIX_TMS                    "GW3%s"
#define HARDWARE_DESCRIPTION                "Device hardware version 1"

#define TOUCH_1PAD_IO_MAP\
    { .touch_pad = 3, .touch_gpio = 15, .led_on_gpio = 26, .led_off_gpio = 25, .relay_gpio = 5, .state = 0, .mtch_dac = 0 }

// Touch using MTCH 2 PAD
#define TOUCH_2PAD_IO_MAP\
    { .touch_pad = 9, .touch_gpio = 32, .led_on_gpio = 13, .led_off_gpio = 15, .relay_gpio = 5,  .state = 0, .mtch_dac = 2 },\
    { .touch_pad = 7, .touch_gpio = 27, .led_on_gpio = 22, .led_off_gpio = 21, .relay_gpio = 23, .state = 0, .mtch_dac = 2 }

// Touch using MTCH 3 PAD
#define TOUCH_3PAD_IO_MAP\
    { .touch_pad = 9, .touch_gpio = 32, .led_on_gpio = 13, .led_off_gpio = 15, .relay_gpio = 5,  .state = 0, .mtch_dac = 2 },\
    { .touch_pad = 8, .touch_gpio = 33, .led_on_gpio = 4,  .led_off_gpio = 2,  .relay_gpio = 23, .state = 0, .mtch_dac = 2 },\
    { .touch_pad = 7, .touch_gpio = 27, .led_on_gpio = 22, .led_off_gpio = 21, .relay_gpio = 9,  .state = 0, .mtch_dac = 2 }

// Touch using MTCH 4 PAD
#define TOUCH_4PAD_IO_MAP\
    { .touch_pad = 9, .touch_gpio = 32, .led_on_gpio = 13, .led_off_gpio = 15, .relay_gpio = 5,  .state = 0, .mtch_dac = 2 },\
    { .touch_pad = 8, .touch_gpio = 33, .led_on_gpio = 4,  .led_off_gpio = 2,  .relay_gpio = 23, .state = 0, .mtch_dac = 2 },\
    { .touch_pad = 7, .touch_gpio = 27, .led_on_gpio = 22, .led_off_gpio = 21, .relay_gpio = 9,  .state = 0, .mtch_dac = 2 },\
    { .touch_pad = 6, .touch_gpio = 14, .led_on_gpio = 25, .led_off_gpio = 26, .relay_gpio = 10, .state = 0, .mtch_dac = 2 }
#endif

#define REMOTE_GW_STATUS_IO   { .touch_gpio = 0, .led_on_gpio = 15, .led_off_gpio = 12, .relay_gpio = -1, .state = 0 }
#define PIR_STATUS_IO   { .touch_gpio = 21, .led_on_gpio = 4, .led_off_gpio = -1, .relay_gpio = -1, .state = 0 }
#define THERMOSTAT_STATUS_IO   { .touch_pad = 4, .touch_gpio = -1, .led_on_gpio = 5,  .led_off_gpio = 20, .relay_gpio = -1, .state = 0, .mtch_dac = 1 }

#define THERMOSTAT_IO_MAP\
    { .touch_pad = 4, .touch_gpio = -1, .led_on_gpio = 5,  .led_off_gpio = 20, .relay_gpio = -1, .state = 0, .mtch_dac = 1 },\
    { .touch_pad = 3, .touch_gpio = -1, .led_on_gpio = 21, .led_off_gpio = 12, .relay_gpio = -1, .state = 0, .mtch_dac = 1 },\
    { .touch_pad = 2, .touch_gpio = -1, .led_on_gpio = 19, .led_off_gpio = 22, .relay_gpio = -1, .state = 0, .mtch_dac = 1 },\
    { .touch_pad = 1, .touch_gpio = -1, .led_on_gpio = 7,  .led_off_gpio = 0,  .relay_gpio = -1, .state = 0, .mtch_dac = 1 }

#ifdef CONFIG_DEVICE_TYPE_TOUCH
    #define HW_MAP\
        { 0, 0, 0, HW_REV, DEVICE_FEATURE_TOUCH_NORMAL, DEVICE_ATTR_TOUCH1, HARDWARE_VERSION_TOUCH, MODEL_PREFIX_TOUCH, MODEL_GROUP_TOUCH },\
        { 0, 1, 0, HW_REV, DEVICE_FEATURE_TOUCH_NORMAL, DEVICE_ATTR_TOUCH2, HARDWARE_VERSION_TOUCH, MODEL_PREFIX_TOUCH, MODEL_GROUP_TOUCH },\
        { 1, 0, 0, HW_REV, DEVICE_FEATURE_TOUCH_NORMAL, DEVICE_ATTR_TOUCH3, HARDWARE_VERSION_TOUCH, MODEL_PREFIX_TOUCH, MODEL_GROUP_TOUCH },\
        { 1, 1, 0, HW_REV, DEVICE_FEATURE_TOUCH_NORMAL, DEVICE_ATTR_TOUCH4, HARDWARE_VERSION_TOUCH, MODEL_PREFIX_TOUCH, MODEL_GROUP_TOUCH },\
        { 0, 0, 0, HW_REV, DEVICE_FEATURE_TOUCH_HEATER, DEVICE_ATTR_TOUCH1, HARDWARE_VERSION_HTOUCH, MODEL_PREFIX_HTOUCH, MODEL_GROUP_TOUCH }

#elif defined(CONFIG_DEVICE_TYPE_REMOTE_GATEWAY)
    #define HW_MAP\
        { 0, 0, 0, HW_REV, DEVICE_FEATURE_GW_IR,                                                    DEVICE_ATTR_GW_UART, HARDWARE_VERSION_REMOTE, MODEL_PREFIX_REMOTE, MODEL_GROUP_REMOTE_GW },\
        { 0, 0, 1, HW_REV, DEVICE_FEATURE_GW_IR | DEVICE_FEATURE_GW_RF,                             DEVICE_ATTR_GW_UART, HARDWARE_VERSION_REMOTE, MODEL_PREFIX_REMOTE, MODEL_GROUP_REMOTE_GW },\
        { 0, 1, 0, HW_REV, DEVICE_FEATURE_GW_IR | DEVICE_FEATURE_GW_SENSOR,                         DEVICE_ATTR_GW_HOMEBUS, HARDWARE_VERSION_REMOTE, MODEL_PREFIX_REMOTE , MODEL_GROUP_REMOTE_GW },\
        { 0, 1, 1, HW_REV, DEVICE_FEATURE_GW_IR | DEVICE_FEATURE_GW_RF | DEVICE_FEATURE_GW_SENSOR,  DEVICE_ATTR_GW_HOMEBUS, HARDWARE_VERSION_REMOTE, MODEL_PREFIX_REMOTE, MODEL_GROUP_REMOTE_GW },\
        { 1, 0, 0, HW_REV, DEVICE_FEATURE_GW_IR,                                                    DEVICE_ATTR_GW_SPI, HARDWARE_VERSION_REMOTE, MODEL_PREFIX_REMOTE, MODEL_GROUP_REMOTE_GW },\
        { 1, 0, 1, HW_REV, DEVICE_FEATURE_GW_IR | DEVICE_FEATURE_GW_RF,                             DEVICE_ATTR_GW_SPI, HARDWARE_VERSION_REMOTE, MODEL_PREFIX_REMOTE, MODEL_GROUP_REMOTE_GW },\
        { 1, 1, 0, HW_REV, DEVICE_FEATURE_GW_IR,                                                    DEVICE_ATTR_GW_HOMEBUS, HARDWARE_VERSION_REMOTE, MODEL_PREFIX_REMOTE , MODEL_GROUP_REMOTE_GW },\
        { 1, 1, 1, HW_REV, DEVICE_FEATURE_GW_IR | DEVICE_FEATURE_GW_RF,                             DEVICE_ATTR_GW_HOMEBUS, HARDWARE_VERSION_REMOTE, MODEL_PREFIX_REMOTE, MODEL_GROUP_REMOTE_GW }
#elif defined(CONFIG_DEVICE_TYPE_PIR)
    #define HW_MAP\
        { 0, 0, 0, HW_REV, DEVICE_FEATURE_PIR_NORMAL, DEVICE_ATTR_PIR_NORMAL, HARDWARE_VERSION_PIR, MODEL_PREFIX_PIR, MODEL_GROUP_PIR }
#elif defined(CONFIG_DEVICE_TYPE_TOUCH_CURTAIN)
    #define HW_MAP\
        { 1, 1, 0, HW_REV, DEVICE_FEATURE_CURTAIN_UART, DEVICE_ATTR_TOUCH4, HARDWARE_VERSION_CTOUCH, MODEL_PREFIX_CTOUCH, MODEL_GROUP_CTOUCH }
#elif defined(CONFIG_DEVICE_TYPE_THERMOSTAT)
    #define HW_MAP\
        { 0, 0, 0, HW_REV, DEVICE_FEATURE_THERMOSTAT_RS485,    DEVICE_ATTR_TOUCH4, HARDWARE_VERSION_TMS, MODEL_PREFIX_TMS, MODEL_GROUP_THERMOSTAT },\
        { 0, 0, 1, HW_REV, DEVICE_FEATURE_THERMOSTAT_SPI,     DEVICE_ATTR_TOUCH4, HARDWARE_VERSION_TMS, MODEL_PREFIX_TMS, MODEL_GROUP_THERMOSTAT },\
        { 0, 1, 0, HW_REV, DEVICE_FEATURE_THERMOSTAT_HOMEBUS, DEVICE_ATTR_TOUCH4, HARDWARE_VERSION_TMS, MODEL_PREFIX_TMS, MODEL_GROUP_THERMOSTAT },\
        { 1, 1, 1, HW_REV, DEVICE_FEATURE_THERMOSTAT_UART,   DEVICE_ATTR_TOUCH4, HARDWARE_VERSION_TMS, MODEL_PREFIX_TMS, MODEL_GROUP_THERMOSTAT }
#endif
