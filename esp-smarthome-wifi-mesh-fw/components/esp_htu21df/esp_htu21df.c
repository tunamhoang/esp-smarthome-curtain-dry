#include "esp_htu21df.h"
#include "freertos/task.h"
#include "esp_log.h"
#include "string.h"
#include "stdlib.h"

#define TAG                     "HTU_SENSOR"

/** Default I2C address for the HTU21D. */
#define HTU21DF_I2CADDR         (0x40)

/** Read temperature register. */
#define HTU21DF_READTEMP        (0xE3)

/** Read humidity register. */
#define HTU21DF_READHUM         (0xE5)

/** Write register command. */
#define HTU21DF_WRITEREG        (0xE6)

/** Read register command. */
#define HTU21DF_READREG         (0xE7)

/** Reset command. */
#define HTU21DF_RESET           (0xFE)

#define I2C_MASTER_FREQ_HZ      100000

#define WRITE_BIT               0       /*!< I2C master write */
#define READ_BIT                1       /*!< I2C master read */
#define ACK_CHECK_EN            0x1     /*!< I2C master will check ack from slave*/
#define ACK_CHECK_DIS           0x0     /*!< I2C master will not check ack from slave */
#define ACK_VAL                 0x0     /*!< I2C ack value */
#define NACK_VAL                0x1     /*!< I2C nack value */

typedef struct esp_htu21df_ {
    gpio_num_t      sda_pin;
    gpio_num_t      scl_pin;
    i2c_port_t      port_num;
} esp_htu21df_t;

esp_htu21df_handle_t esp_htu21df_init(esp_htu21df_config_t* htu_config)
{
    /* Assign default values to internal tracking variables. */
    esp_htu21df_handle_t htu_handle = (esp_htu21df_handle_t)malloc(sizeof(esp_htu21df_t));
    htu_handle->scl_pin = htu_config->scl_pin;
    htu_handle->sda_pin = htu_config->sda_pin;
    htu_handle->port_num = htu_config->port_num;
    return htu_handle;
}

esp_err_t esp_htu21df_deinit(esp_htu21df_handle_t htu_handle)
{
    free(htu_handle);
    return ESP_OK;
}

esp_err_t esp_htu21df_start(esp_htu21df_handle_t htu_handle)
{
    i2c_config_t conf;
    conf.mode = I2C_MODE_MASTER;
    conf.sda_io_num = htu_handle->sda_pin;
    conf.sda_pullup_en = GPIO_PULLUP_ENABLE;
    conf.scl_io_num = htu_handle->scl_pin;
    conf.scl_pullup_en = GPIO_PULLUP_ENABLE;
    conf.master.clk_speed = I2C_MASTER_FREQ_HZ;
    i2c_param_config(htu_handle->port_num, &conf);
    esp_err_t ret = i2c_driver_install(htu_handle->port_num, conf.mode, 0, 0, 0);
    if (ret == ESP_FAIL) {
        return ESP_FAIL;
    }
    ret = esp_htu21df_reset(htu_handle);
    if (ret == ESP_FAIL) {
        return ESP_FAIL;
    }
    uint8_t read_val = 0;
    i2c_cmd_handle_t cmd = i2c_cmd_link_create();
    i2c_master_start(cmd);
    i2c_master_write_byte(cmd, HTU21DF_I2CADDR << 1 | WRITE_BIT, ACK_CHECK_EN);
    i2c_master_write_byte(cmd, HTU21DF_READREG, ACK_CHECK_EN);
    i2c_master_stop(cmd);
    ret = i2c_master_cmd_begin(htu_handle->port_num, cmd, 1000 / portTICK_RATE_MS);
    i2c_cmd_link_delete(cmd);
    if (ret != ESP_OK) {
        return ESP_FAIL;
    }
    cmd = i2c_cmd_link_create();
    i2c_master_start(cmd);
    i2c_master_write_byte(cmd, HTU21DF_I2CADDR << 1 | READ_BIT, ACK_CHECK_EN);
    i2c_master_read_byte(cmd, &read_val, NACK_VAL);
    i2c_master_stop(cmd);
    ret = i2c_master_cmd_begin(htu_handle->port_num, cmd, 1000 / portTICK_RATE_MS);
    i2c_cmd_link_delete(cmd);
    if (ret == ESP_OK && read_val == 0x2) {
        ESP_LOGD(TAG, "Accepted");
    }
    return ret;
}

esp_err_t esp_htu21df_read_temperature(esp_htu21df_handle_t htu_handle, float* value)
{
    if (value == NULL || htu_handle == NULL) {
        return ESP_FAIL;
    }
    int ret;
    i2c_cmd_handle_t cmd = i2c_cmd_link_create();
    i2c_master_start(cmd);
    i2c_master_write_byte(cmd, HTU21DF_I2CADDR << 1 | WRITE_BIT, ACK_CHECK_EN);
    i2c_master_write_byte(cmd, HTU21DF_READTEMP, ACK_CHECK_EN);
    i2c_master_stop(cmd);
    ret = i2c_master_cmd_begin(htu_handle->port_num, cmd, 1000 / portTICK_RATE_MS);
    i2c_cmd_link_delete(cmd);
    if (ret != ESP_OK) {
        return ESP_FAIL;
    }
    vTaskDelay(50 / portTICK_RATE_MS);
    uint8_t temp_read[3] = {0};
    cmd = i2c_cmd_link_create();
    i2c_master_start(cmd);
    i2c_master_write_byte(cmd, HTU21DF_I2CADDR << 1 | READ_BIT, ACK_CHECK_EN);
    i2c_master_read(cmd, temp_read, 3, I2C_MASTER_LAST_NACK);
    i2c_master_stop(cmd);
    ret = i2c_master_cmd_begin(htu_handle->port_num, cmd, 1000 / portTICK_RATE_MS);
    i2c_cmd_link_delete(cmd);
    if (ret != ESP_OK) {
        return ESP_FAIL;
    }

    uint16_t t = temp_read[0];
    t <<= 8;
    t |= temp_read[1] & 0b11111100;

    float temp = t;
    temp *= 175.72f;
    temp /= 65536.0f;
    temp -= 46.85f;

    *value = temp;
    return ESP_OK;
}

esp_err_t esp_htu21df_read_humidity(esp_htu21df_handle_t htu_handle, float* value)
{
    if (value == NULL || htu_handle == NULL) {
        return ESP_FAIL;
    }
    int ret;
    i2c_cmd_handle_t cmd = i2c_cmd_link_create();
    i2c_master_start(cmd);
    i2c_master_write_byte(cmd, HTU21DF_I2CADDR << 1 | WRITE_BIT, ACK_CHECK_EN);
    i2c_master_write_byte(cmd, HTU21DF_READHUM, ACK_CHECK_EN);
    i2c_master_stop(cmd);
    ret = i2c_master_cmd_begin(htu_handle->port_num, cmd, 1000 / portTICK_RATE_MS);
    i2c_cmd_link_delete(cmd);
    if (ret != ESP_OK) {
        return ESP_FAIL;
    }
    vTaskDelay(50 / portTICK_RATE_MS);
    uint8_t hum_read[3] = {0};
    cmd = i2c_cmd_link_create();
    i2c_master_start(cmd);
    i2c_master_write_byte(cmd, HTU21DF_I2CADDR << 1 | READ_BIT, ACK_CHECK_EN);
    i2c_master_read(cmd, hum_read, 3, I2C_MASTER_LAST_NACK);    
    i2c_master_stop(cmd);
    ret = i2c_master_cmd_begin(htu_handle->port_num, cmd, 1000 / portTICK_RATE_MS);
    i2c_cmd_link_delete(cmd);
    if (ret != ESP_OK) {
        return ESP_FAIL;
    }

    /* Read 16 bits of data, dropping the last two status bits. */
    uint16_t h = hum_read[0];
    h <<= 8;
    h |= hum_read[1] & 0b11111100;

    float hum = h;
    hum *= 125.0f;
    hum /= 65536.0f;
    hum -= 6.0f;

    *value = hum;
    return ESP_OK;
}

esp_err_t esp_htu21df_reset(esp_htu21df_handle_t htu_handle)
{
    int ret;
    i2c_cmd_handle_t cmd = i2c_cmd_link_create();
    i2c_master_start(cmd);
    i2c_master_write_byte(cmd, HTU21DF_I2CADDR << 1 | WRITE_BIT, ACK_CHECK_EN);
    i2c_master_write_byte(cmd, HTU21DF_RESET, ACK_CHECK_DIS);
    i2c_master_stop(cmd);
    ret = i2c_master_cmd_begin(htu_handle->port_num, cmd, 1000 / portTICK_RATE_MS);
    i2c_cmd_link_delete(cmd);
    vTaskDelay(30 / portTICK_RATE_MS);
    return ret;
}