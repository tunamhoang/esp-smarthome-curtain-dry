#include "esp_sx8636.h"
#include "freertos/task.h"
#include "esp_log.h"
#include "string.h"
#include "stdlib.h"
#include "sx8636_reg.h"
#include "driver/gpio.h"

#define CHECK_IF_NULL(x, func) \
    do                         \
    {                          \
        if (x == NULL)         \
        {                      \
            func;              \
        }                      \
    } while (0)

#define CHECK_IF_ERROR(x, func) \
    do                          \
    {                           \
        if (x != ESP_OK)        \
        {                       \
            func;               \
        }                       \
    } while (0)

#define TAG "SX8636_TOUCH"

#define WRITE_BIT 0       /*!< I2C master write */
#define READ_BIT 1        /*!< I2C master read */
#define ACK_CHECK_EN 0x1  /*!< I2C master will check ack from slave*/
#define ACK_CHECK_DIS 0x0 /*!< I2C master will not check ack from slave */
#define ACK_VAL 0x0       /*!< I2C ack value */
#define NACK_VAL 0x1      /*!< I2C nack value */

#define REGISTERS_SIZE      19
#define SPM_SHADOW_SIZE     128
#define I2C_MASTER_FREQ_HZ  400000
#define TIMEOUT_ACCESS_SPM  3000

#define MAP_THRESHOLD(x)        250 - x
#define MAP_SENSITIVE(x)        x * 4 / 101 + 2
typedef enum
{
    OPMODE_ACTIVE = 0,
    OPMODE_DOZE,
    OPMODE_SLEEP,
    OPMODE_RESERVED
} sx8636_opmode;

typedef enum
{
    FSM_NO_INIT = 0,
    FSM_RESETTING,
    FSM_SPM_READ,
    FSM_SPM_WRITE,
    FSM_READY,
    FSM_NVM_BURN,
    FSM_NVM_VERIFY
} sx8636_fsm;

typedef struct {
    long long   last_tap_tick;
    bool        long_tapped;
    bool        touched;
} esp_sx8636_touch_item_t;

typedef struct esp_sx8636_
{
    gpio_num_t                  sda_pin;
    gpio_num_t                  scl_pin;
    gpio_num_t                  int_pin;
    i2c_port_t                  port_num;
    uint8_t                     dev_addr;
    uint16_t                    flags;
    uint16_t                    buttons;
    uint8_t                     registers[REGISTERS_SIZE];   // Register shadows
    uint8_t                     spm_shadow[SPM_SHADOW_SIZE]; // SPM shadow
    sx8636_opmode               opmode;
    sx8636_fsm                  fsm;
    SemaphoreHandle_t           int_flag;
    uint8_t                     touch_enable_mask;
    callback_func_t             on_event;
    void*                       on_event_arg;
    int                         num_touch;
    esp_sx8636_touch_item_t*    touch_list;
    int                         long_tap_time_ms;
    int                         sensitive;
} esp_sx8636_t;

esp_err_t _i2c_init(esp_sx8636_handle_t sx_handle)
{
    i2c_config_t conf;
    conf.mode = I2C_MODE_MASTER;
    conf.sda_io_num = sx_handle->sda_pin;
    conf.sda_pullup_en = GPIO_PULLUP_ENABLE;
    conf.scl_io_num = sx_handle->scl_pin;
    conf.scl_pullup_en = GPIO_PULLUP_ENABLE;
    conf.master.clk_speed = I2C_MASTER_FREQ_HZ;
    conf.clk_flags = 0;
    i2c_param_config(sx_handle->port_num, &conf);
    return i2c_driver_install(sx_handle->port_num, conf.mode, 0, 0, 0);
}

esp_err_t _sx8636_read_device(esp_sx8636_handle_t sx_handle, uint8_t addr, uint8_t *data, uint32_t size)
{
    if (sx_handle == NULL)
    {
        return ESP_FAIL;
    }
    i2c_cmd_handle_t cmd = i2c_cmd_link_create();

    i2c_master_start(cmd);
    i2c_master_write_byte(cmd, (sx_handle->dev_addr << 1) | WRITE_BIT, ACK_CHECK_EN);
    i2c_master_write_byte(cmd, addr, ACK_CHECK_EN);
    i2c_master_start(cmd);
    i2c_master_write_byte(cmd, (sx_handle->dev_addr << 1) | READ_BIT, ACK_CHECK_EN);
    i2c_master_read(cmd, data, size, I2C_MASTER_LAST_NACK);
    i2c_master_stop(cmd);
    esp_err_t err = i2c_master_cmd_begin(sx_handle->port_num, cmd, 1000 / portTICK_PERIOD_MS);
    i2c_cmd_link_delete(cmd);
    return err;
}

esp_err_t _sx8636_write_device(esp_sx8636_handle_t sx_handle, uint8_t addr, uint8_t *data, uint32_t size)
{
    if (sx_handle == NULL)
    {
        return ESP_FAIL;
    }
    i2c_cmd_handle_t cmd = i2c_cmd_link_create();

    i2c_master_start(cmd);
    i2c_master_write_byte(cmd, (sx_handle->dev_addr << 1) | WRITE_BIT, ACK_CHECK_EN);
    i2c_master_write_byte(cmd, addr, ACK_CHECK_EN);
    i2c_master_write(cmd, data, size, ACK_CHECK_EN);
    i2c_master_stop(cmd);

    esp_err_t ret = i2c_master_cmd_begin(sx_handle->port_num, cmd, 1000 / portTICK_PERIOD_MS);

    i2c_cmd_link_delete(cmd);

    return ret;
}

/*******************************************************************************
* Shadow register access functions
*******************************************************************************/

int8_t _sx8636_get_shadow_reg_mem_addr(uint8_t addr)
{
    uint8_t maximum_idx = 18;
    switch (addr)
    {
    case SX8636_REG_IRQ_SRC:
        maximum_idx--;
    case SX8636_REG_CAP_STAT_MSB:
        maximum_idx--;
    case SX8636_REG_CAP_STAT_LSB:
        maximum_idx--;
    case SX8636_REG_SLIDER_POS_MSB:
        maximum_idx--;
    case SX8636_REG_SLIDER_POS_LSB:
        maximum_idx--;
    case SX8636_REG_RESERVED_0:
        maximum_idx--;
    case SX8636_REG_RESERVED_1:
        maximum_idx--;
    case SX8636_REG_GPI_STAT:
        maximum_idx--;
    case SX8636_REG_SPM_STAT:
        maximum_idx--;
    case SX8636_REG_COMP_OP_MODE:
        maximum_idx--;
    case SX8636_REG_GPO_CTRL:
        maximum_idx--;
    case SX8636_REG_GPP_PIN_ID:
        maximum_idx--;
    case SX8636_REG_GPP_INTENSITY:
        maximum_idx--;
    case SX8636_REG_SPM_CONFIG:
        maximum_idx--;
    case SX8636_REG_SPM_BASE_ADDR:
        maximum_idx--;
    case SX8636_REG_RESERVED_2:
        maximum_idx--;
    case SX8636_REG_SPM_KEY_MSB:
        maximum_idx--;
    case SX8636_REG_SPM_KEY_LSB:
        maximum_idx--;
    case SX8636_REG_SOFT_RESET:
        return (maximum_idx & 0x0F);
    default:
        break;
    }
    return -1;
}

void _sx8636_set_shadow_reg_val(esp_sx8636_handle_t sx_handle, uint8_t addr, uint8_t val)
{
    int idx = _sx8636_get_shadow_reg_mem_addr(addr);
    if (idx >= 0)
    {
        sx_handle->registers[idx] = val;
    }
}

uint8_t _sx8636_get_shadow_reg_val(esp_sx8636_handle_t sx_handle, uint8_t addr)
{
    int idx = _sx8636_get_shadow_reg_mem_addr(addr);
    return (idx >= 0) ? sx_handle->registers[idx] : 0;
}

/*
* Read 8-bytes of SPM into shadow from the device.
* This should only be called when the SPM if open. Otherwise, it will read ISR
*   registers and there is no way to discover the mistake.
*/
esp_err_t _sx8636_read_block8(esp_sx8636_handle_t sx_handle, uint8_t idx)
{
    esp_err_t ret = _sx8636_read_device(sx_handle, 0, (sx_handle->spm_shadow + idx), 8);
    ESP_LOGD(TAG, "read block8[%d] = %d", idx, ret);
    // ESP_LOG_BUFFER_HEX(TAG, sx_handle->spm_shadow + idx, 8);
    return ret;
}

/*
* Write 8-bytes of SPM shadow back to the device.
* This should only be called when the SPM if open. Otherwise, it will read ISR
*   registers and there is no way to discover the mistake.
*/
esp_err_t _sx8636_write_block8(esp_sx8636_handle_t sx_handle, uint8_t idx)
{
    esp_err_t ret = _sx8636_write_device(sx_handle, 0, (sx_handle->spm_shadow + idx), 8);
    ESP_LOGD(TAG, "write block8[%d] = %d", idx, ret);
    // ESP_LOG_BUFFER_HEX(TAG, sx_handle->spm_shadow + idx, 8);
    return ret;
}

void _sx8636_set_fsm_position(esp_sx8636_handle_t sx_handle, sx8636_fsm x)
{
    sx_handle->fsm = x;
}

void _sx8636_clear_flag(esp_sx8636_handle_t sx_handle, uint16_t _flag)
{
    sx_handle->flags &= ~_flag;
};

void _sx8636_set_flag(esp_sx8636_handle_t sx_handle, uint16_t _flag, bool nu)
{
    if (nu)
    {
        sx_handle->flags |= _flag;
    }
    else
    {
        sx_handle->flags &= ~_flag;
    }
}

bool _sx8636_flag(esp_sx8636_handle_t sx_handle, uint16_t _flag)
{
    return (sx_handle->flags & _flag);
}

esp_err_t _sx8636_write_register(esp_sx8636_handle_t sx_handle, uint8_t addr, uint8_t val)
{
    int idx = _sx8636_get_shadow_reg_mem_addr(addr);
    if (idx >= 0)
    {
        sx_handle->registers[idx] = val;
        return _sx8636_write_device(sx_handle, addr, &sx_handle->registers[idx], 1);
    }
    return ESP_FAIL;
}

esp_err_t _sx8636_set_mode(esp_sx8636_handle_t sx_handle, sx8636_opmode m)
{
    uint8_t cur_mode = 0;
    _sx8636_read_device(sx_handle, SX8636_REG_COMP_OP_MODE, &cur_mode, 1);
    ESP_LOGE(TAG, "Current mode: %d", cur_mode);
    if (m == OPMODE_ACTIVE) {
        ESP_LOGI(TAG, "Set mode active");
    } else if (m == OPMODE_SLEEP) {
        ESP_LOGI(TAG, "Set mode sleep");
    } else if (m == OPMODE_DOZE) {
        ESP_LOGI(TAG, "Set mode sleep");
    } else if (m == OPMODE_RESERVED) {
        ESP_LOGI(TAG, "Set mode sleep");
    } else {
        ESP_LOGI(TAG, "Set mode else");
    }
    if (cur_mode != m) {
        _sx8636_write_register(sx_handle, SX8636_REG_COMP_OP_MODE, (uint8_t)m);
        // vTaskDelay(300 / portTICK_PERIOD_MS);
        // _sx8636_read_device(sx_handle, SX8636_REG_COMP_OP_MODE, &cur_mode, 1);
    }
    return ESP_OK;
}

esp_err_t _sx8636_close_spm_access(esp_sx8636_handle_t sx_handle)
{
    ESP_LOGD(TAG, "_sx8636_close_spm_access");
    esp_err_t ret = ESP_FAIL;
    _sx8636_clear_flag(sx_handle, SX8636_FLAG_IRQ_INHIBIT);
    _sx8636_set_mode(sx_handle, OPMODE_ACTIVE);
    if (_sx8636_write_register(sx_handle, SX8636_REG_SPM_CONFIG, 0x08) == ESP_OK)
    {
        _sx8636_set_flag(sx_handle, SX8636_FLAG_SPM_WRITABLE, false);
        _sx8636_set_flag(sx_handle, SX8636_FLAG_SPM_OPEN, false);
        ret = ESP_OK;
    }
    return ret;
}

esp_err_t _sx8636_incremenet_spm_window(esp_sx8636_handle_t sx_handle)
{
    esp_err_t ret = ESP_FAIL;
    int spm_base_addr = _sx8636_get_shadow_reg_val(sx_handle, SX8636_REG_SPM_BASE_ADDR);
    if (spm_base_addr < 0x78)
    {
        // We're writing our shadow of the SPM. Write the next base address.
        vTaskDelay(30 / portTICK_RATE_MS);
        ret = _sx8636_write_register(sx_handle, SX8636_REG_SPM_BASE_ADDR, spm_base_addr + 8);
    }
    else
    {
        _sx8636_clear_flag(sx_handle, SX8636_FLAG_SPM_DIRTY);
        // _sx8636_close_spm_access(sx_handle);
        ret = ESP_FAIL;
    }
    return ret;
}

/*
* Inhibits interrupt service.
* Opens the SPM for reading.
*/
esp_err_t _sx8636_open_spm_access_r(esp_sx8636_handle_t sx_handle)
{
    ESP_LOGW(TAG, "_sx8636_open_spm_access_r");
    esp_err_t ret = ESP_FAIL;
    _sx8636_set_flag(sx_handle, SX8636_FLAG_IRQ_INHIBIT, true);
    if (OPMODE_SLEEP != sx_handle->opmode)
    {
        _sx8636_set_mode(sx_handle, OPMODE_SLEEP);
    }
    if (_sx8636_write_register(sx_handle, SX8636_REG_SPM_CONFIG, 0x18) == ESP_OK)
    {
        _sx8636_set_flag(sx_handle, SX8636_FLAG_SPM_WRITABLE, false);
        _sx8636_set_flag(sx_handle, SX8636_FLAG_SPM_OPEN, true);
        ret = ESP_OK;
    }
    return ret;
}

/*
* Clears all stateful data in the class.
*/
void _sx8636_clear_registers(esp_sx8636_handle_t sx_handle)
{
    _sx8636_clear_flag(sx_handle,
                       SX8636_FLAG_PING_IN_FLIGHT | SX8636_FLAG_DEV_FOUND |
                           SX8636_FLAG_SPM_DIRTY | SX8636_FLAG_COMPENSATING |
                           SX8636_FLAG_CONF_IS_NVM | SX8636_FLAG_GOT_SPM |
                           SX8636_FLAG_SLIDER_MOVE_DOWN | SX8636_FLAG_SLIDER_MOVE_UP |
                           SX8636_FLAG_SPM_WRITABLE | SX8636_FLAG_SPM_OPEN |
                           SX8636_FLAG_SPM_SHADOWED | SX8636_FLAG_PWM_CHANGE_IN_FLIGHT);
    sx_handle->buttons = 0;
    memset(sx_handle->registers, 0, REGISTERS_SIZE);
    memset(sx_handle->spm_shadow, 0, SPM_SHADOW_SIZE);
}

/*******************************************************************************
* SPM related functions.
*******************************************************************************/

/*
* Calling this function sets off a long chain of bus operations that
*   ought to end up with the SPM fully read, and the state machine back to
*   READY.
*/
esp_err_t _sx8636_read_full_spm(esp_sx8636_handle_t sx_handle)
{
    ESP_LOGD(TAG, "_sx8636_read_full_spm");
    esp_err_t ret = ESP_FAIL;
    _sx8636_set_fsm_position(sx_handle, FSM_SPM_READ);
    if (!(_sx8636_flag(sx_handle, SX8636_FLAG_SPM_OPEN) & !_sx8636_flag(sx_handle, SX8636_FLAG_SPM_WRITABLE)))
    {
        if (_sx8636_open_spm_access_r(sx_handle) == ESP_OK)
        {
            _sx8636_set_shadow_reg_val(sx_handle, SX8636_REG_SPM_BASE_ADDR, 0);
            ret = _sx8636_write_register(sx_handle, SX8636_REG_SPM_BASE_ADDR, 0x00);
            unsigned long long tick = xTaskGetTickCount();
            while (ret == ESP_OK && xTaskGetTickCount() - tick < TIMEOUT_ACCESS_SPM * portTICK_RATE_MS )
            {
                ret = _sx8636_read_block8(sx_handle, _sx8636_get_shadow_reg_val(sx_handle, SX8636_REG_SPM_BASE_ADDR));
                if (ret == ESP_OK)
                {
                    ret = _sx8636_incremenet_spm_window(sx_handle);
                }
                vTaskDelay(10 / portTICK_PERIOD_MS);
            }
            _sx8636_set_fsm_position(sx_handle, FSM_READY);
            _sx8636_set_flag(sx_handle, SX8636_FLAG_SPM_SHADOWED, true);
            _sx8636_close_spm_access(sx_handle);
            ret = ESP_OK;
        }
    }
    return ret;
}

esp_err_t _sx8636_open_spm_access_w(esp_sx8636_handle_t sx_handle)
{
    ESP_LOGD(TAG, "_sx8636_open_spm_access_w");
    esp_err_t ret = ESP_FAIL;
    _sx8636_set_flag(sx_handle, SX8636_FLAG_IRQ_INHIBIT, true);
    if (OPMODE_SLEEP != sx_handle->opmode)
    {
        _sx8636_set_mode(sx_handle, OPMODE_SLEEP);
    }
    if (_sx8636_write_register(sx_handle, SX8636_REG_SPM_CONFIG, 0x10) == ESP_OK)
    {
        _sx8636_set_flag(sx_handle, SX8636_FLAG_SPM_WRITABLE, true);
        _sx8636_set_flag(sx_handle, SX8636_FLAG_SPM_OPEN, true);
        ret = ESP_OK;
    }
    return ret;
}

/*
* Calling this function sets off a long chain of bus operations that
*   ought to end up with the SPM fully written, and the state machine back to
*   READY.
*/
esp_err_t _sx8636_write_full_spm(esp_sx8636_handle_t sx_handle)
{
    ESP_LOGD(TAG, "_sx8636_write_full_spm");
    esp_err_t ret = ESP_FAIL;
    _sx8636_set_fsm_position(sx_handle, FSM_SPM_WRITE);
    if (!(_sx8636_flag(sx_handle, SX8636_FLAG_SPM_OPEN) & _sx8636_flag(sx_handle, SX8636_FLAG_SPM_WRITABLE)))
    {
        if (_sx8636_open_spm_access_w(sx_handle) == ESP_OK)
        {
            _sx8636_set_shadow_reg_val(sx_handle, SX8636_REG_SPM_BASE_ADDR, 0);
            ret = _sx8636_write_register(sx_handle, SX8636_REG_SPM_BASE_ADDR, 0x00);
            unsigned long long tick = xTaskGetTickCount();
            while (ret == ESP_OK && xTaskGetTickCount() - tick < TIMEOUT_ACCESS_SPM * portTICK_RATE_MS)
            {
                ret = _sx8636_write_block8(sx_handle, _sx8636_get_shadow_reg_val(sx_handle, SX8636_REG_SPM_BASE_ADDR));
                if (ret == ESP_OK)
                {
                    ret = _sx8636_incremenet_spm_window(sx_handle);
                }
                vTaskDelay(10 / portTICK_PERIOD_MS);
            }
            if (ret != ESP_OK)
            {
                _sx8636_set_fsm_position(sx_handle, FSM_READY);
                ret = ESP_OK;
            }
            _sx8636_set_fsm_position(sx_handle, FSM_READY);
            _sx8636_set_flag(sx_handle, SX8636_FLAG_SPM_SHADOWED, true);
            _sx8636_close_spm_access(sx_handle);
        }
    }
    return ret;
}

/*
* Pings the device.
*/
esp_err_t _sx8636_ping(esp_sx8636_handle_t sx_handle)
{
    esp_err_t ret = ESP_FAIL;
    if (!_sx8636_flag(sx_handle, SX8636_FLAG_PING_IN_FLIGHT))
    {
        _sx8636_set_flag(sx_handle, SX8636_FLAG_PING_IN_FLIGHT, true);
        i2c_cmd_handle_t cmd = i2c_cmd_link_create();
        i2c_master_start(cmd);
        i2c_master_write_byte(cmd, (sx_handle->dev_addr << 1) | I2C_MASTER_WRITE, 1 /* expect ack */);
        i2c_master_stop(cmd);
        esp_err_t check = i2c_master_cmd_begin(sx_handle->port_num, cmd, 10 / portTICK_PERIOD_MS);
        //ESP_LOGD(tag, "i=%d, rc=%d (0x%x)", i, espRc, espRc);
        i2c_cmd_link_delete(cmd);
        if (check == ESP_OK)
        {
            ESP_LOGD(TAG, "Found sx8636");
            // SX8636 found
            _sx8636_clear_flag(sx_handle, SX8636_FLAG_PING_IN_FLIGHT);
            _sx8636_set_flag(sx_handle, SX8636_FLAG_DEV_FOUND, true);
            // We have no option but to configure the class from the real SPM.
            ret = _sx8636_read_full_spm(sx_handle);
            if (ret == ESP_OK) {
                _sx8636_set_flag(sx_handle, SX8636_FLAG_GOT_SPM, true);
            }
        }
        else
        {
            ESP_LOGE(TAG, "sx8636 not found");
        }
    }
    return ret;
}

/*
* We split this apart from the reset function so that it could be called from
*   either the pin-case or the software-case.
*/
int8_t _sx8636_reset_callback(esp_sx8636_handle_t sx_handle)
{
    vTaskDelay(310 / portTICK_RATE_MS);
    _sx8636_clear_flag(sx_handle, SX8636_FLAG_IRQ_INHIBIT);
    return _sx8636_ping(sx_handle);
}

/*
* Reset the chip. By hardware pin (if possible) or by software command.
*/
esp_err_t esp_sx8636_reset(esp_sx8636_handle_t sx_handle)
{
    ESP_LOGD(TAG, "esp_sx8636_reset");
    esp_err_t ret = ESP_FAIL;
    sx_handle->flags = 0;
    _sx8636_clear_registers(sx_handle);
    ret = _sx8636_write_register(sx_handle, SX8636_REG_SOFT_RESET, 0xDE);
    if (ret == ESP_OK)
    {
        ret = _sx8636_write_register(sx_handle, SX8636_REG_SOFT_RESET, 0x00);
        if (ret == ESP_OK)
        {
            ret = _sx8636_reset_callback(sx_handle);
        }
    }
    return ret;
}

unsigned long long get_tick_ms()
{
    return xTaskGetTickCount() * portTICK_RATE_MS;
}

/*******************************************************************************
* Event pitching functions
*******************************************************************************/

/*
* When the main program sees IRQ assertion, this function should be called, but
*   probably not from the ISR directly. Dispatches additional I/O.
*/
uint16_t _sx8636_read_irq_registers(esp_sx8636_handle_t sx_handle)
{
    uint16_t ret = 0;
    if (!_sx8636_flag(sx_handle, SX8636_FLAG_DEV_FOUND))
    {
        return 0;
    }

    if (_sx8636_read_device(sx_handle, 0x00, sx_handle->registers, 10) == ESP_OK)
    {
        if (0x04 & sx_handle->registers[0])
        { // Button interrupt
            ret = (((uint16_t)(sx_handle->registers[1] & 0x0F)) << 8) | ((uint16_t)sx_handle->registers[2]);
            ESP_LOGD(TAG, "Button interrupt %04x", ret);
        }
    }
    return ret;
}

esp_sx8636_handle_t esp_sx8636_init(esp_sx8636_config_t *sx8636_config)
{
    esp_sx8636_handle_t sx8636 = (esp_sx8636_handle_t)malloc(sizeof(esp_sx8636_t));
    sx8636->scl_pin = sx8636_config->scl_pin;
    sx8636->sda_pin = sx8636_config->sda_pin;
    sx8636->int_pin = sx8636_config->int_pin;
    sx8636->port_num = sx8636_config->port_num;
    sx8636->long_tap_time_ms = sx8636_config->long_tap_time_ms;
    sx8636->touch_enable_mask = sx8636_config->touch_enable_mask;
    sx8636->on_event = sx8636_config->on_event;
    sx8636->on_event_arg = sx8636_config->on_event_arg;
    sx8636->sensitive = sx8636_config->sensitive;
    sx8636->num_touch = 0;
    sx8636->opmode = OPMODE_ACTIVE;
    uint8_t mask = sx8636->touch_enable_mask;
    while (mask)
    {
        if (mask & 0x01) {
            sx8636->num_touch++;
        }
        mask = mask >> 1;
    }
    sx8636->touch_list = malloc(sizeof(esp_sx8636_touch_item_t) * sx8636->num_touch);
    for (int i = 0; i < sx8636->num_touch; i++) {
        sx8636->touch_list[i].last_tap_tick = 0;
        sx8636->touch_list[i].long_tapped = false;
        sx8636->touch_list[i].touched = false;
    }
    sx8636->dev_addr = SX8636_DEFAULT_I2C_ADDR;
    sx8636->flags = 0;
    sx8636->buttons = 0;
    memset(sx8636->registers, 0, REGISTERS_SIZE);
    memset(sx8636->spm_shadow, 0, SPM_SHADOW_SIZE);
    sx8636->int_flag = xSemaphoreCreateBinary();
    return sx8636;
}

esp_err_t esp_sx8636_deinit(esp_sx8636_handle_t sx8636)
{
    free(sx8636);
    return ESP_OK;
}

esp_err_t _sx8636_enable_button(esp_sx8636_handle_t sx_handle)
{
    CHECK_IF_NULL(sx_handle, return ESP_FAIL);
    uint8_t cap7_4 = 0;
    if (sx_handle->touch_enable_mask & 0x80) {
        cap7_4 |= ((uint8_t)1 << 6);
    }
    if (sx_handle->touch_enable_mask & 0x40) {
        cap7_4 |= ((uint8_t)1 << 4);
    }
    if (sx_handle->touch_enable_mask & 0x20) {
        cap7_4 |= ((uint8_t)1 << 2);
    }
    if (sx_handle->touch_enable_mask & 0x10) {
        cap7_4 |= (uint8_t)1;
    }

    uint8_t cap3_0 = 0;
    if (sx_handle->touch_enable_mask & 0x08) {
        cap3_0 |= ((uint8_t)1 << 6);
    }
    if (sx_handle->touch_enable_mask & 0x04) {
        cap3_0 |= ((uint8_t)1 << 4);
    }
    if (sx_handle->touch_enable_mask & 0x02) {
        cap3_0 |= ((uint8_t)1 << 2);
    }
    if (sx_handle->touch_enable_mask & 0x01) {
        cap3_0 |= (uint8_t)1;
    }

    sx_handle->spm_shadow[SX8636_SPM_CAP_MODE_7_4] = cap7_4;
    sx_handle->spm_shadow[SX8636_SPM_CAP_MODE_3_0] = cap3_0;
    _sx8636_set_flag(sx_handle, SX8636_FLAG_SPM_DIRTY, true);
    return _sx8636_write_full_spm(sx_handle);
}

void _sx8636_task(void *pv)
{
    esp_sx8636_handle_t sx_handle = pv;
    uint16_t state = 0;
    bool is_triggered = false;
    bool new_changed = false;
    esp_sx8636_touch_result_t result = { 0 };
    while (1)
    {
        new_changed = false;
        is_triggered = false;
        memset(&result, 0, sizeof(esp_sx8636_touch_result_t));
        state = 0;
        if (xSemaphoreTake(sx_handle->int_flag, 50 / portTICK_RATE_MS) == pdTRUE) {
            ESP_LOGD(TAG, "Take irq success");
            state = _sx8636_read_irq_registers(sx_handle);
            is_triggered = true;
        }

        int index = 0;
        int item = 0;
        uint8_t mask = sx_handle->touch_enable_mask;

        while (mask > 0) {
            if ((mask & 0x01) == 0) {
                mask = mask >> 1;
                state = state >> 1;
                continue;
            }
            index++;
            mask = mask >> 1;
            esp_sx8636_touch_item_t* touch_item = &sx_handle->touch_list[item++];

            if (is_triggered) {
                touch_item->touched = state & 0x01;
            }
            state = state >> 1;

            // touch_item->touched = state & 0x01;
            // ESP_LOGE(TAG, "tick %lld", touch_item->last_tap_tick);
            if (touch_item->last_tap_tick == 0 && touch_item->touched) {
                touch_item->last_tap_tick = get_tick_ms();
                touch_item->long_tapped = false;
                ESP_LOGD(TAG, "TOUCH_TAPPED idx: %d", index);
                result.tap_mask |= (0x01 << index);
                new_changed = true;
                continue;
            }

            if (!touch_item->touched && touch_item->last_tap_tick && get_tick_ms() - touch_item->last_tap_tick > sx_handle->long_tap_time_ms) {
                touch_item->last_tap_tick = 0;
                touch_item->long_tapped = false;
                ESP_LOGD(TAG, "TOUCH_LONG_RELEASE");
                result.long_release_mask |= (0x01 << index);
                new_changed = true;
                continue;
            }

            if (!touch_item->touched && touch_item->last_tap_tick) {
                touch_item->last_tap_tick = 0;
                touch_item->long_tapped = false;
                ESP_LOGD(TAG, "TOUCH_RELEASE");
                result.release_mask |= (0x01 << index);
                new_changed = true;
                continue;
            }

            if (touch_item->long_tapped == false && touch_item->touched && get_tick_ms() - touch_item->last_tap_tick > sx_handle->long_tap_time_ms) {
                touch_item->long_tapped = true;
                ESP_LOGD(TAG, "TOUCH_LONG_TAP");
                result.long_tap_mask |= (0x01 << index);
                new_changed = true;
            }
        }
        if (new_changed && sx_handle->on_event) {
            sx_handle->on_event(sx_handle->on_event_arg, &result);
        }
    }
}

static void IRAM_ATTR _isr_handler(void *arg)
{
    esp_sx8636_handle_t sx_handle = arg;
    BaseType_t higher_woken;
    xSemaphoreGiveFromISR(sx_handle->int_flag, &higher_woken);
    if (higher_woken)
    {
        portYIELD_FROM_ISR();
    }
}

esp_err_t esp_sx8636_start(esp_sx8636_handle_t sx_handle)
{
    CHECK_IF_NULL(sx_handle, return ESP_FAIL);

    xTaskCreate(_sx8636_task, "_sx8636_task", 2 * 1024, sx_handle, 5, NULL);

    CHECK_IF_ERROR(_i2c_init(sx_handle), return ESP_FAIL);
    gpio_config_t io_conf;
    //disable interrupt
    io_conf.intr_type = GPIO_INTR_NEGEDGE;
    //set as output mode
    io_conf.mode = GPIO_MODE_INPUT;
    //bit mask of the pins that you want to set,e.g.GPIO18/19
    io_conf.pin_bit_mask = (1ULL << sx_handle->int_pin);
    //disable pull-down mode
    io_conf.pull_down_en = 0;
    //disable pull-up mode
    io_conf.pull_up_en = 0;
    //configure GPIO with the given settings
    gpio_config(&io_conf);
    //install gpio isr service
    gpio_install_isr_service(0);
    //hook isr handler for specific gpio pin
    gpio_isr_handler_add(sx_handle->int_pin, _isr_handler, (void *)sx_handle);
    CHECK_IF_ERROR(esp_sx8636_reset(sx_handle), return ESP_FAIL);
    CHECK_IF_ERROR(_sx8636_enable_button(sx_handle), return ESP_FAIL);
    // CHECK_IF_ERROR(_sx8636_set_mode(sx_handle, OPMODE_ACTIVE), return ESP_FAIL);
    CHECK_IF_ERROR(esp_sx8636_set_full_sensitivity(sx_handle, sx_handle->sensitive), return ESP_FAIL);
    CHECK_IF_ERROR(esp_sx8636_set_full_threshold(sx_handle, sx_handle->sensitive), return ESP_FAIL);
    return ESP_OK;
}

esp_err_t esp_sx8636_set_full_threshold(esp_sx8636_handle_t sx8636_handle, int sensitive_percent)
{
    CHECK_IF_NULL(sx8636_handle, return ESP_FAIL);
    if (sensitive_percent < 0 || sensitive_percent > 100) {
        return ESP_FAIL;
    }
    //uint8_t threshold = MAP_THRESHOLD(sensitive_percent);
    uint8_t threshold = 30;
    ESP_LOGI(TAG, "esp_sx8636_set_full_threshold: percent %d, threshold: %d", sensitive_percent, threshold);

    sx8636_handle->spm_shadow[SX8636_SPM_CAP_THRESH_0] = threshold;
    sx8636_handle->spm_shadow[SX8636_SPM_CAP_THRESH_1] = threshold;
    sx8636_handle->spm_shadow[SX8636_SPM_CAP_THRESH_2] = threshold;
    sx8636_handle->spm_shadow[SX8636_SPM_CAP_THRESH_3] = threshold;
    sx8636_handle->spm_shadow[SX8636_SPM_CAP_THRESH_4] = threshold;
    sx8636_handle->spm_shadow[SX8636_SPM_CAP_THRESH_5] = threshold;
    sx8636_handle->spm_shadow[SX8636_SPM_CAP_THRESH_6] = threshold;
    sx8636_handle->spm_shadow[SX8636_SPM_CAP_THRESH_7] = threshold;
    _sx8636_set_flag(sx8636_handle, SX8636_FLAG_SPM_DIRTY, true);
    CHECK_IF_ERROR(_sx8636_write_full_spm(sx8636_handle), return ESP_FAIL);
    vTaskDelay(500 / portTICK_RATE_MS);
    CHECK_IF_ERROR(_sx8636_set_mode(sx8636_handle, OPMODE_ACTIVE), return ESP_FAIL);
    return ESP_OK;
}

esp_err_t esp_sx8636_set_full_sensitivity(esp_sx8636_handle_t sx8636_handle, int sensitive_percent)
{
    if (sensitive_percent < 0 || sensitive_percent > 100) {
        return ESP_FAIL;
    }
    uint8_t sensi = MAP_SENSITIVE(sensitive_percent);
    ESP_LOGI(TAG, "esp_sx8636_set_full_sensitivity: percent %d, sen_val: %d", sensitive_percent, sensi);
    uint8_t sen_val = (uint8_t)(sensi << 4) | (uint8_t)sensi;
    sx8636_handle->spm_shadow[SX8636_SPM_CAP_SNSITIVTY_0_1] = sen_val;
    sx8636_handle->spm_shadow[SX8636_SPM_CAP_SNSITIVTY_2_3] = sen_val;
    sx8636_handle->spm_shadow[SX8636_SPM_CAP_SNSITIVTY_4_5] = sen_val;
    sx8636_handle->spm_shadow[SX8636_SPM_CAP_SNSITIVTY_6_7] = sen_val;
    _sx8636_set_flag(sx8636_handle, SX8636_FLAG_SPM_DIRTY, true);
    CHECK_IF_ERROR(_sx8636_write_full_spm(sx8636_handle), return ESP_FAIL);
    vTaskDelay(500 / portTICK_RATE_MS);
    CHECK_IF_ERROR(_sx8636_set_mode(sx8636_handle, OPMODE_ACTIVE), return ESP_FAIL);
    return ESP_OK;
}
