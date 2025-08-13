#include <assert.h>
#include "periph_motor.h"
#include "driver/gpio.h"

#include <stdbool.h>

esp_periph_handle_t esp_periph_create(int id, const char *name) { return NULL; }
void esp_periph_set_data(esp_periph_handle_t periph, void *data) {}
void *esp_periph_get_data(esp_periph_handle_t periph) { return periph; }
void esp_periph_set_function(esp_periph_handle_t periph, void *init, void *run, void *destroy) {}
bool esp_periph_validate(esp_periph_handle_t periph, int id) { return true; }

typedef struct {
    motor_type_t type;
    motor_physic_t physic;
    motor_uart_handle_t motor_uart_handle;
    motor_drycontact_handle_t motor_drycontact_handle;
} periph_motor_t;

int gpio_in_calls = 0;
int gpio_out_calls = 0;

int gpio_config(const gpio_config_t *cfg) { return 0; }
int gpio_set_level(gpio_num_t pin, int level) {
    if (pin == 1 || pin == 2) gpio_in_calls++;
    if (pin == 3 || pin == 4) gpio_out_calls++;
    return 0;
}

int main() {
    motor_drycontact_t handle = {0};
    handle.hw.drycontact.type = MOTOR_TYPE_DOUBLE;
    handle.hw.drycontact.motor_drycontact_in_conn.a_pin = 1;
    handle.hw.drycontact.motor_drycontact_in_conn.b_pin = 2;
    handle.hw.drycontact.motor_drycontact_out_conn.a_pin = 3;
    handle.hw.drycontact.motor_drycontact_out_conn.b_pin = 4;

    periph_motor_t periph = {0};
    periph.physic = MOTOR_DRYCONTACT;
    periph.motor_drycontact_handle = &handle;

    // Test moving only inner curtain
    handle.position.in_pos = 0; handle.position.out_pos = 0;
    gpio_in_calls = gpio_out_calls = 0;
    periph_motor_drycontact_set_pos(&handle, 100, -1);
    assert(handle.position.in_pos == 100);
    assert(handle.position.out_pos == 0);
    assert(gpio_in_calls > 0);
    assert(gpio_out_calls == 0);

    // Test moving only outer curtain
    handle.position.in_pos = 100; handle.position.out_pos = 0;
    gpio_in_calls = gpio_out_calls = 0;
    periph_motor_drycontact_set_pos(&handle, -1, 100);
    assert(handle.position.in_pos == 100);
    assert(handle.position.out_pos == 100);
    assert(gpio_in_calls == 0);
    assert(gpio_out_calls > 0);

    // Test moving only inner curtain via public API
    handle.position.in_pos = 0; handle.position.out_pos = 0;
    gpio_in_calls = gpio_out_calls = 0;
    periph_motor_set_pos((esp_periph_handle_t)&periph, 100, -1);
    assert(handle.position.in_pos == 100);
    assert(handle.position.out_pos == 0);
    assert(gpio_in_calls > 0);
    assert(gpio_out_calls == 0);

    // Test moving only outer curtain via public API
    handle.position.in_pos = 100; handle.position.out_pos = 0;
    gpio_in_calls = gpio_out_calls = 0;
    periph_motor_set_pos((esp_periph_handle_t)&periph, -1, 100);
    assert(handle.position.in_pos == 100);
    assert(handle.position.out_pos == 100);
    assert(gpio_in_calls == 0);
    assert(gpio_out_calls > 0);

    // Test reversing direction on inner curtain: open then close
    handle.position.in_pos = 0;
    gpio_in_calls = 0;
    handle.last_control = MOTOR_CTRL_NONE;
    periph_motor_drycontact_control(&handle, MOTOR_IN_CTRL_OPEN);
    periph_motor_drycontact_control(&handle, MOTOR_IN_CTRL_CLOSE);
    assert(gpio_in_calls == 12);

    // Test reversing direction on inner curtain: close then open
    handle.position.in_pos = 100;
    gpio_in_calls = 0;
    handle.last_control = MOTOR_CTRL_NONE;
    periph_motor_drycontact_control(&handle, MOTOR_IN_CTRL_CLOSE);
    periph_motor_drycontact_control(&handle, MOTOR_IN_CTRL_OPEN);
    assert(gpio_in_calls == 12);


    // Test pressing same command stops motor: open then open
    handle.position.in_pos = 0;
    gpio_in_calls = 0;
    handle.last_control = MOTOR_CTRL_NONE;
    periph_motor_drycontact_control(&handle, MOTOR_IN_CTRL_OPEN);
    periph_motor_drycontact_control(&handle, MOTOR_IN_CTRL_OPEN);
    assert(gpio_in_calls == 8);
    assert(handle.last_control == MOTOR_IN_CTRL_STOP);

    // Test pressing same command stops motor: close then close
    handle.position.in_pos = 100;
    gpio_in_calls = 0;
    handle.last_control = MOTOR_CTRL_NONE;
    periph_motor_drycontact_control(&handle, MOTOR_IN_CTRL_CLOSE);
    periph_motor_drycontact_control(&handle, MOTOR_IN_CTRL_CLOSE);
    assert(gpio_in_calls == 8);
    assert(handle.last_control == MOTOR_IN_CTRL_STOP);


    return 0;
}
