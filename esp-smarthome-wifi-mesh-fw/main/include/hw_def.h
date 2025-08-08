/*
 * This file is subject to the terms of the SunshineTech License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *
 *              ./LICENSE
 */

#ifndef _APP_DEF_H_
#define _APP_DEF_H_

#include "sdkconfig.h"

#define STR_HELPER(x) #x
#define STR(x) STR_HELPER(x)

#define MAX_TOUCH_PAD_NUM           (6)
#define MAX_RELAY_TOUCH_PAD_NUM     (4)
#define DEVICE_TYPE_TOUCH           0x1000
#define DEVICE_TYPE_REMOTE_GW       0x2000
#define DEVICE_TYPE_PIR             0x4000
#define DEVICE_TYPE_TOUCH_CURTAIN   0x8000
#define DEVICE_TYPE_THERMOSTAT      0x9000

#define DEVICE_FEATURE_TOUCH_NORMAL  0x0010
#define DEVICE_FEATURE_TOUCH_CURTAIN 0x0020
#define DEVICE_FEATURE_TOUCH_HEATER  0x0040
#define DEVICE_FEATURE_TOUCH_SCENE   0x0080

#define DEVICE_FEATURE_GW_IR        0x0100
#define DEVICE_FEATURE_GW_RF        0x0200
#define DEVICE_FEATURE_GW_SENSOR    0x0400

#define DEVICE_FEATURE_PIR_NORMAL   0x0100

#define DEVICE_FEATURE_CURTAIN_DRYC 0x0100
#define DEVICE_FEATURE_CURTAIN_UART 0x0200

#define DEVICE_FEATURE_NONE         0x0000

#define DEVICE_ATTR_TOUCH1          0x01
#define DEVICE_ATTR_TOUCH2          0x02
#define DEVICE_ATTR_TOUCH3          0x03
#define DEVICE_ATTR_TOUCH4          0x04
#define DEVICE_ATTR_TOUCH5          0x05
#define DEVICE_ATTR_TOUCH6          0x06

#define DEVICE_CURTAIN_DRYCONTACT   0x0100
#define DEVICE_CURTAIN_UART         0x0200

#define DEVICE_ATTR_GW_UART         0x010
#define DEVICE_ATTR_GW_SPI          0x020
#define DEVICE_ATTR_GW_HOMEBUS      0x040
#define DEVICE_ATTR_GW_RS485        0x080

#define DEVICE_FEATURE_THERMOSTAT_UART    0x0100
#define DEVICE_FEATURE_THERMOSTAT_SPI     0x0200
#define DEVICE_FEATURE_THERMOSTAT_HOMEBUS 0x0400
#define DEVICE_FEATURE_THERMOSTAT_RS485   0x0800

#define DEVICE_ATTR_PIR_NORMAL      0x01

#define HARDWARE_DETECT_PIN0        (34)
#define HARDWARE_DETECT_PIN1        (35)
#define HARDWARE_DETECT_PIN2        (36)

#define MODEL_GROUP_TOUCH           (0)
#define MODEL_GROUP_CTOUCH          (1)
#define MODEL_GROUP_REMOTE_GW       (3)
#define MODEL_GROUP_PIR             (5)
#define MODEL_GROUP_THERMOSTAT      (3)

typedef struct {
    int touch_pad;
    int touch_gpio;
    int led_on_gpio;
    int led_off_gpio;
    int relay_gpio;
    int state;
    int mtch_dac;
    int touch_idx;
} hw_io_map_t;

#if defined(CONFIG_DEVICE_HARDWARE_REVERSION1)
    #include "hw_rev1.h"
#elif defined(CONFIG_DEVICE_HARDWARE_REVERSION2)
    #include "hw_rev2.h"
#elif defined(CONFIG_DEVICE_HARDWARE_REVERSION3)
    #include "hw_rev3.h"
#else
    #error "Invalid hardware"
#endif

#endif
