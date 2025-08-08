#include "pcf8551a.h"
#include "freertos/task.h"
#include "esp_log.h"
#include "string.h"
#include "stdlib.h"
#include "pcf8551a_reg.h"
#include "driver/i2c.h"

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

#define TAG "PCF8551A"

#define WRITE_BIT I2C_MASTER_WRITE              /*!< I2C master write */
#define READ_BIT I2C_MASTER_READ                /*!< I2C master read */
#define ACK_CHECK_EN 0x1  /*!< I2C master will check ack from slave*/
#define ACK_CHECK_DIS 0x0 /*!< I2C master will not check ack from slave */
#define ACK_VAL 0x0       /*!< I2C ack value */
#define NACK_VAL 0x1      /*!< I2C nack value */
#define I2C_MASTER_FREQ_HZ 400000

#define REGISTERS_SIZE 23

#define DEVICE_ADDR_DEFAULT 0x38

typedef struct pcf8551a_
{
    uint8_t scl_pin;
    uint8_t sda_pin;
    uint8_t i2c_port;
    uint8_t device_addr;
} pcf8551a_t;

static esp_err_t _i2c_init(pcf8551a_handle_t pcf8551a_handle)
{
    i2c_config_t conf;
    conf.mode = I2C_MODE_MASTER;
    conf.sda_io_num = pcf8551a_handle->sda_pin;
    conf.sda_pullup_en = GPIO_PULLUP_ENABLE;
    conf.scl_io_num = pcf8551a_handle->scl_pin;
    conf.scl_pullup_en = GPIO_PULLUP_ENABLE;
    conf.master.clk_speed = I2C_MASTER_FREQ_HZ;
    esp_err_t err = i2c_param_config(pcf8551a_handle->i2c_port, &conf);
    if (err != ESP_OK) {
        ESP_LOGE(TAG, "Error set i2c params");
        return err;
    }
    return i2c_driver_install(pcf8551a_handle->i2c_port, conf.mode, 0, 0, 0);
}

static esp_err_t _pcf8551a_read_byte(pcf8551a_handle_t pcf_handle, uint8_t addr, uint8_t* data)
{
    if (pcf_handle == NULL) {
        return ESP_FAIL;
    }

    esp_err_t ret;
    i2c_cmd_handle_t cmd = i2c_cmd_link_create();

    i2c_master_start(cmd);
    i2c_master_write_byte(cmd, (pcf_handle->device_addr << 1) | WRITE_BIT, ACK_CHECK_EN);
    i2c_master_write_byte(cmd, addr, ACK_CHECK_EN);
    i2c_master_stop(cmd);
    ret = i2c_master_cmd_begin(pcf_handle->i2c_port, cmd, 1000 / portTICK_RATE_MS);
    i2c_cmd_link_delete(cmd);
    if (ret != ESP_OK) {
        ESP_LOGE(TAG, "Error");
        return ret;
    }

    vTaskDelay(30 / portTICK_RATE_MS);
    cmd = i2c_cmd_link_create();
    i2c_master_start(cmd);
    i2c_master_write_byte(cmd, (pcf_handle->device_addr << 1) | READ_BIT, ACK_CHECK_EN);
    i2c_master_read_byte(cmd, data, NACK_VAL);
    i2c_master_stop(cmd);
    ret = i2c_master_cmd_begin(pcf_handle->i2c_port, cmd, 1000 / portTICK_PERIOD_MS);
    i2c_cmd_link_delete(cmd);
    return ret;
}

// static esp_err_t _pcf8551a_read_data(pcf8551a_handle_t pcf_handle, uint8_t addr, uint8_t *data, uint32_t size)
// {
//     return ESP_OK;
// }

static esp_err_t _pcf8551a_write_data(pcf8551a_handle_t pcf_handle, uint8_t addr, uint8_t *data, uint32_t size)
{
    if (pcf_handle == NULL) {
        return ESP_FAIL;
    }
    i2c_cmd_handle_t cmd = i2c_cmd_link_create();

    i2c_master_start(cmd);
    i2c_master_write_byte(cmd, (pcf_handle->device_addr << 1) | WRITE_BIT, ACK_CHECK_EN);
    i2c_master_write_byte(cmd, addr, ACK_CHECK_EN);
    i2c_master_write(cmd, data, size, ACK_CHECK_EN);
    i2c_master_stop(cmd);

    esp_err_t ret = i2c_master_cmd_begin(pcf_handle->i2c_port, cmd, 1000 / portTICK_PERIOD_MS);

    i2c_cmd_link_delete(cmd);
    if (ret != ESP_OK) {
        ESP_LOGE(TAG, "Error");
        return ret;
    }

    return ret;
}

static esp_err_t _pcf8551a_write_byte(pcf8551a_handle_t pcf_handle, uint8_t addr, uint8_t data)
{
    if (pcf_handle == NULL) {
        return ESP_FAIL;
    }

    esp_err_t ret;
    i2c_cmd_handle_t cmd = i2c_cmd_link_create();

    i2c_master_start(cmd);
    i2c_master_write_byte(cmd, (pcf_handle->device_addr << 1) | WRITE_BIT, ACK_CHECK_EN);
    i2c_master_write_byte(cmd, addr, ACK_CHECK_EN);
    i2c_master_write_byte(cmd, data, ACK_CHECK_EN);
    i2c_master_stop(cmd);

    ret = i2c_master_cmd_begin(pcf_handle->i2c_port, cmd, 1000 / portTICK_PERIOD_MS);

    i2c_cmd_link_delete(cmd);
    if (ret != ESP_OK) {
        ESP_LOGE(TAG, "Error");
        return ret;
    }

    return ret;
}

esp_err_t pcf8551a_display(pcf8551a_handle_t pcf_handle, uint8_t* data, uint8_t data_sz)
{
    CHECK_IF_NULL(pcf_handle, return ESP_FAIL);

    return _pcf8551a_write_data(pcf_handle, PCF8551A_REG_DISP, data, data_sz);
}

esp_err_t pcf8551a_display_on(pcf8551a_handle_t pcf_handle)
{
    CHECK_IF_NULL(pcf_handle, return ESP_FAIL);
    esp_err_t err = ESP_OK;
    uint8_t cmd;
    err |= _pcf8551a_read_byte(pcf_handle, PCF8551A_REG_DISP_CTRL_1, &cmd);
    cmd |= (uint8_t)PCF8551A_DISPLAY_ENABLE;
    err |= _pcf8551a_write_byte(pcf_handle, PCF8551A_REG_DISP_CTRL_1, cmd);
    return err;
}

esp_err_t pcf8551a_display_off(pcf8551a_handle_t pcf_handle)
{
    CHECK_IF_NULL(pcf_handle, return ESP_FAIL);
    esp_err_t err = ESP_OK;
    uint8_t cmd;
    err |= _pcf8551a_read_byte(pcf_handle, PCF8551A_REG_DISP_CTRL_1, &cmd);
    cmd |= (uint8_t)PCF8551A_DISPLAY_DISABLE;
    err |= _pcf8551a_write_byte(pcf_handle, PCF8551A_REG_DISP_CTRL_1, cmd);
    return err;
}

esp_err_t pcf8551a_software_rst(pcf8551a_handle_t pcf_handle)
{
    CHECK_IF_NULL(pcf_handle, return ESP_FAIL);
    uint8_t cmd = (uint8_t)PCF8551A_SOFTWARE_RST_CMD;
    return _pcf8551a_write_byte(pcf_handle, PCF8551A_REG_SOFTWARE_RST, cmd);
}

esp_err_t pcf8551a_start(pcf8551a_handle_t pcf_handle)
{
    CHECK_IF_NULL(pcf_handle, return ESP_FAIL);
    // CHECK_IF_ERROR(_i2c_init(pcf_handle), return ESP_FAIL);

    esp_err_t err = ESP_OK;

    uint8_t device_ctrl_reg = 0x00;
    device_ctrl_reg |= (uint8_t)PCF8551A_FRAME_FREQ_64Hz;
    err |= _pcf8551a_write_byte(pcf_handle, PCF8551A_REG_DEVICE_CTRL, device_ctrl_reg);

    uint8_t disp_ctrl_reg = 0x00;
    disp_ctrl_reg |= (uint8_t)PCF8551A_DRIVE_MODE_COM0_COM3;
    err |= _pcf8551a_write_byte(pcf_handle, PCF8551A_REG_DISP_CTRL_1, disp_ctrl_reg);

    disp_ctrl_reg = 0x00;
    disp_ctrl_reg |= (uint8_t)PCF8551A_BLINK_OFF;
    err |= _pcf8551a_write_byte(pcf_handle, PCF8551A_REG_DISP_CTRL_2, disp_ctrl_reg);

    return err;
}

pcf8551a_handle_t pcf8551a_init(pcf8551a_cfg_t* pcf_cfg)
{
    pcf8551a_handle_t pcf_handle = (pcf8551a_handle_t)malloc(sizeof(pcf8551a_t));
    pcf_handle->sda_pin = pcf_cfg->sda_pin;
    pcf_handle->scl_pin = pcf_cfg->scl_pin;
    pcf_handle->i2c_port = pcf_cfg->i2c_port;
    pcf_handle->device_addr = pcf_cfg->device_addr ? pcf_cfg->device_addr : DEVICE_ADDR_DEFAULT;
    return pcf_handle;
}

esp_err_t pcf8551a_deinit(pcf8551a_handle_t pcf_handle)
{
    CHECK_IF_NULL(pcf_handle, return ESP_FAIL);
    free(pcf_handle);
    return ESP_OK;
}
