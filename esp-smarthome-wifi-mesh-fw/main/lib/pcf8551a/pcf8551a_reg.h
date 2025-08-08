#ifndef _PCF8551A_REG_H_
#define _PCF8551A_REG_H_

/* Command register */
#define PCF8551A_REG_SOFTWARE_RST       (0x00)
#define PCF8551A_REG_DEVICE_CTRL        (0x01)
#define PCF8551A_REG_DISP_CTRL_1        (0x02)
#define PCF8551A_REG_DISP_CTRL_2        (0x03)
#define PCF8551A_REG_DISP               (0x04)

/* Operation command*/
#define PCF8551A_DISPLAY_ENABLE         (1 << 0)
#define PCF8551A_DISPLAY_DISABLE        (~(1 << 0))
#define PCF8551A_SOFTWARE_RST_CMD       (0x2C)

#define PCF8551A_FRAME_FREQ_32Hz        (0 << 2)
#define PCF8551A_FRAME_FREQ_64Hz        (1 << 2)
#define PCF8551A_FRAME_FREQ_96Hz        (2 << 2)
#define PCF8551A_FRAME_FREQ_128Hz       (3 << 2)

#define PCF8551A_DRIVE_MODE_COM0_COM3   (0 << 2)
#define PCF8551A_DRIVE_MODE_COM0_COM2   (1 << 2)
#define PCF8551A_DRIVE_MODE_COM0_COM1   (2 << 2)
#define PCF8551A_DRIVE_MODE_COM0        (3 << 2)

#define PCF8551A_BLINK_OFF              (0 << 1)
#define PCF8551A_BLINK_HALF             (1 << 1)
#define PCF8551A_BLINK_1HZ              (2 << 1)
#define PCF8551A_BLINK_2HZ              (3 << 1)

#endif
