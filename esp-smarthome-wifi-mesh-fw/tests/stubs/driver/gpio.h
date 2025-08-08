#ifndef DRIVER_GPIO_H
#define DRIVER_GPIO_H
#include <stdint.h>
typedef int gpio_num_t;
typedef struct {
    int intr_type;
    int mode;
    uint64_t pin_bit_mask;
    int pull_down_en;
    int pull_up_en;
} gpio_config_t;
#define GPIO_INTR_DISABLE 0
#define GPIO_MODE_OUTPUT 0
int gpio_config(const gpio_config_t *cfg);
int gpio_set_level(gpio_num_t pin, int level);
#endif
