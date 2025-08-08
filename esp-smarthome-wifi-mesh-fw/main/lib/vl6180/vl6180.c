#include "vl6180.h"
#include "vl6180_reg.h"
#include "freertos/task.h"
#include "esp_log.h"
#include "string.h"
#include "stdlib.h"
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

#define TAG "VL6180"

#define WRITE_BIT 0       /*!< I2C master write */
#define READ_BIT 1        /*!< I2C master read */
#define ACK_CHECK_EN 0x1  /*!< I2C master will check ack from slave*/
#define ACK_CHECK_DIS 0x0 /*!< I2C master will not check ack from slave */
#define ACK_VAL 0x0       /*!< I2C ack value */
#define NACK_VAL 0x1      /*!< I2C nack value */
#define I2C_MASTER_FREQ_HZ 400000

#define REGISTERS_SIZE 23

#define VL6180_DEFAULT_ADDR 0x29
#define SYSRANGE__INTERMEASUREMENT_PERIOD 0x001b // P19 application notes

typedef struct vl6180_
{
    uint8_t scl_pin;
    uint8_t sda_pin;
    uint8_t i2c_port;
    uint8_t device_addr;
} vl6180_t;

static esp_err_t _i2c_init(vl6180_handle_t handle) {
    i2c_config_t conf;
    conf.mode = I2C_MODE_MASTER;
    conf.sda_io_num = handle->sda_pin;
    conf.sda_pullup_en = GPIO_PULLUP_ENABLE;
    conf.scl_io_num = handle->scl_pin;
    conf.scl_pullup_en = GPIO_PULLUP_ENABLE;
    conf.master.clk_speed = I2C_MASTER_FREQ_HZ;
    esp_err_t err = i2c_param_config(handle->i2c_port, &conf);
    if (err != ESP_OK) {
        ESP_LOGE(TAG, "Error set i2c params");
        return err;
    }
    return i2c_driver_install(handle->i2c_port, conf.mode, 0, 0, 0);
}

static esp_err_t _vl6180_read_byte(vl6180_handle_t handle, uint16_t addr, uint8_t *data) {
    if (handle == NULL || data == NULL) {
        return ESP_FAIL;
    }

    esp_err_t ret;
    i2c_cmd_handle_t cmd = i2c_cmd_link_create();

    i2c_master_start(cmd);
    i2c_master_write_byte(cmd, (handle->device_addr << 1) | WRITE_BIT, ACK_CHECK_EN);
    i2c_master_write_byte(cmd, addr >> 8, ACK_CHECK_EN);
    i2c_master_write_byte(cmd, addr, ACK_CHECK_EN);
    i2c_master_stop(cmd);
    ret = i2c_master_cmd_begin(handle->i2c_port, cmd, 1000 / portTICK_RATE_MS);
    i2c_cmd_link_delete(cmd);
    if (ret != ESP_OK) {
        return ret;
    }

    vTaskDelay(30 / portTICK_RATE_MS);
    cmd = i2c_cmd_link_create();
    i2c_master_start(cmd);
    i2c_master_write_byte(cmd, (handle->device_addr << 1) | READ_BIT, ACK_CHECK_EN);
    i2c_master_read_byte(cmd, data, NACK_VAL);
    i2c_master_stop(cmd);
    ret = i2c_master_cmd_begin(handle->i2c_port, cmd, 1000 / portTICK_PERIOD_MS);
    i2c_cmd_link_delete(cmd);
    return ret;
}

// static esp_err_t _vl6180_read_two_byte(vl6180_handle_t handle, uint16_t addr, uint8_t* data)
// {
//     if (handle == NULL || data == NULL) {
//         return ESP_FAIL;
//     }

//     esp_err_t ret;
//     i2c_cmd_handle_t cmd = i2c_cmd_link_create();

//     i2c_master_start(cmd);
//     i2c_master_write_byte(cmd, (handle->device_addr << 1) | WRITE_BIT, ACK_CHECK_EN);
//     i2c_master_write_byte(cmd, (addr >> 8) & 0xFF, ACK_CHECK_EN);
//     i2c_master_write_byte(cmd, addr & 0xFF, ACK_CHECK_EN);
//     i2c_master_stop(cmd);
//     ret = i2c_master_cmd_begin(handle->i2c_port, cmd, 1000 / portTICK_RATE_MS);
//     i2c_cmd_link_delete(cmd);
//     if (ret != ESP_OK) {
//         return ret;
//     }

//     vTaskDelay(30 / portTICK_RATE_MS);
//     cmd = i2c_cmd_link_create();
//     i2c_master_start(cmd);
//     i2c_master_write_byte(cmd, (handle->device_addr << 1) | READ_BIT, ACK_CHECK_EN);
//     i2c_master_read_byte(cmd, data, ACK_VAL);
//     i2c_master_read_byte(cmd, data + 1, NACK_VAL);
//     i2c_master_stop(cmd);
//     ret = i2c_master_cmd_begin(handle->i2c_port, cmd, 1000 / portTICK_PERIOD_MS);
//     i2c_cmd_link_delete(cmd);
//     return ret;
// }

static esp_err_t _vl6180_write_byte(vl6180_handle_t handle, uint16_t addr, uint8_t data) {
    if (handle == NULL) return ESP_FAIL;

    esp_err_t ret;
    i2c_cmd_handle_t cmd = i2c_cmd_link_create();

    i2c_master_start(cmd);
    i2c_master_write_byte(cmd, (handle->device_addr << 1) | WRITE_BIT, ACK_CHECK_EN);
    i2c_master_write_byte(cmd, (addr >> 8) & 0xFF, ACK_CHECK_EN);
    i2c_master_write_byte(cmd, addr & 0xFF, ACK_CHECK_EN);
    i2c_master_write_byte(cmd, data, ACK_CHECK_EN);
    i2c_master_stop(cmd);

    ret = i2c_master_cmd_begin(handle->i2c_port, cmd, 1000 / portTICK_PERIOD_MS);

    i2c_cmd_link_delete(cmd);

    return ret;
}

// static esp_err_t _vl6180_write_two_byte(vl6180_handle_t handle, uint16_t addr, uint8_t data)
// {
//     if (handle == NULL) {
//         return ESP_FAIL;
//     }

//     esp_err_t ret;
//     i2c_cmd_handle_t cmd = i2c_cmd_link_create();

//     i2c_master_start(cmd);
//     i2c_master_write_byte(cmd, (handle->device_addr << 1) | WRITE_BIT, ACK_CHECK_EN);
//     i2c_master_write_byte(cmd, (addr >> 8) & 0xFF, ACK_CHECK_EN);
//     i2c_master_write_byte(cmd, addr & 0xFF, ACK_CHECK_EN);
//     i2c_master_write_byte(cmd, data & 0xFF, ACK_CHECK_EN);
//     i2c_master_write_byte(cmd, (data >> 8) & 0xFF, ACK_CHECK_EN);
//     i2c_master_stop(cmd);

//     ret = i2c_master_cmd_begin(handle->i2c_port, cmd, 1000 / portTICK_PERIOD_MS);
//     i2c_cmd_link_delete(cmd);

//     return ret;
// }

static esp_err_t _vl6180_load_setting(vl6180_handle_t handle) {
    if (handle == NULL) return ESP_FAIL;
    // private settings from page 24 of app note
    _vl6180_write_byte(handle, 0x0207, 0x01);
    _vl6180_write_byte(handle, 0x0208, 0x01);
    _vl6180_write_byte(handle, 0x0096, 0x00);
    _vl6180_write_byte(handle, 0x0097, 0xfd);
    _vl6180_write_byte(handle, 0x00e3, 0x00);
    _vl6180_write_byte(handle, 0x00e4, 0x04);
    _vl6180_write_byte(handle, 0x00e5, 0x02);
    _vl6180_write_byte(handle, 0x00e6, 0x01);
    _vl6180_write_byte(handle, 0x00e7, 0x03);
    _vl6180_write_byte(handle, 0x00f5, 0x02);
    _vl6180_write_byte(handle, 0x00d9, 0x05);
    _vl6180_write_byte(handle, 0x00db, 0xce);
    _vl6180_write_byte(handle, 0x00dc, 0x03);
    _vl6180_write_byte(handle, 0x00dd, 0xf8);
    _vl6180_write_byte(handle, 0x009f, 0x00);
    _vl6180_write_byte(handle, 0x00a3, 0x3c);
    _vl6180_write_byte(handle, 0x00b7, 0x00);
    _vl6180_write_byte(handle, 0x00bb, 0x3c);
    _vl6180_write_byte(handle, 0x00b2, 0x09);
    _vl6180_write_byte(handle, 0x00ca, 0x09);
    _vl6180_write_byte(handle, 0x0198, 0x01);
    _vl6180_write_byte(handle, 0x01b0, 0x17);
    _vl6180_write_byte(handle, 0x01ad, 0x00);
    _vl6180_write_byte(handle, 0x00ff, 0x05);
    _vl6180_write_byte(handle, 0x0100, 0x05);
    _vl6180_write_byte(handle, 0x0199, 0x05);
    _vl6180_write_byte(handle, 0x01a6, 0x1b);
    _vl6180_write_byte(handle, 0x01ac, 0x3e);
    _vl6180_write_byte(handle, 0x01a7, 0x1f);
    _vl6180_write_byte(handle, 0x0030, 0x00);

    /* // Recommended : Public registers - See data sheet for more detail
    _vl6180_write_byte(handle, 0x0011, 0x10); // Enables polling for 'New Sample ready'
                        // when measurement completes
    _vl6180_write_byte(handle, 0x010a, 0x30); // Set the averaging sample period
                        // (compromise between lower noise and
                        // increased execution time)
    _vl6180_write_byte(handle, 0x003f, 0x46); // Sets the light and dark gain (upper
                        // nibble). Dark gain should not be
                        // changed.
    _vl6180_write_byte(handle, 0x0031, 0xFF); // sets the # of range measurements after
                        // which auto calibration of system is
                        // performed
    _vl6180_write_byte(handle, 0x0040, 0x63); // Set ALS integration time to 100ms
    _vl6180_write_byte(handle, 0x002e, 0x01); // perform a single temperature calibration
                        // of the ranging sensor

    // Optional: Public registers - See data sheet for more detail
    _vl6180_write_byte(handle, SYSRANGE__INTERMEASUREMENT_PERIOD,
            0x09);         // Set default ranging inter-measurement
                        // period to 100ms
    _vl6180_write_byte(handle, 0x003e, 0x31); // Set default ALS inter-measurement period
                        // to 500ms
    _vl6180_write_byte(handle, 0x0014, 0x24); // Configures interrupt on 'New Sample
                        // Ready threshold event'

    // vl6180_offset_calib(handle, 0);
    // vl6180_cross_talk_calib(handle, 0x03); */
    // configure range measurement for low power
    // Specify range measurement interval in units of 10 ms from 0 (= 10 ms) - 254 (= 2.55 s)

    _vl6180_write_byte(handle, VL6180X_REG_SYSRANGE_INTERMEASUREMENT_PERIOD, 0x0A); // 100 ms interval in steps of 10 ms
    _vl6180_write_byte(handle, VL6180X_REG_SYSRANGE_VHV_REPEAT_RATE, 0xFF); // sets number of range measurements after which autocalibrate is performed
    _vl6180_write_byte(handle, VL6180X_REG_SYSRANGE_VHV_RECALIBRATE, 0x01); // perform temperature calibration of the ranging sensor

    // Set Early Convergence Estimate for lower power consumption
    _vl6180_write_byte(handle, VL6180X_REG_SYSRANGE_MAX_CONVERGENCE_TIME, 0x32); // set max convergence time to 50 ms (steps of 1 ms)
    _vl6180_write_byte(handle, VL6180X_REG_SYSRANGE_RANGE_CHECK_ENABLES, 0x10 | 0x01);  // enable (0x01) early convergence estimate
    // This ECE is calculated as follows:
    // [(1 - % below threshold) x 0.5 x 15630]/ range max convergence time
    // This is ~123 ms for 50 ms max convergence time and 80% below threshold
    // This is a sixteen bit (2 byte) register with the first byte MSByte and the second LSByte
    _vl6180_write_byte(handle, VL6180X_REG_SYSRANGE_EARLY_CONVERGENCE_ESTIMATE, 0x00); // set early convergence estimate to 5%
    _vl6180_write_byte(handle, VL6180X_REG_SYSRANGE_EARLY_CONVERGENCE_ESTIMATE + 1, 0x7B); // set early convergence estimate to 5%

    // Configure ALS
    _vl6180_write_byte(handle, VL6180X_REG_SYSALS_INTERMEASUREMENT_PERIOD, 0x0A);   // set to 100 ms
    uint8_t data_reg = 0;
    _vl6180_read_byte(handle, VL6180X_REG_SYSALS_INTERMEASUREMENT_PERIOD, &data_reg);

    // Following is a 16-bit register with the first MSByte reserved

    _vl6180_write_byte(handle, VL6180X_REG_SYSALS_INTEGRATION_PERIOD, 0x00);
    _vl6180_write_byte(handle, VL6180X_REG_SYSALS_INTEGRATION_PERIOD+1, 0x63);        // set ALS integration time to 100 ms in steps of 1 ms

    // The internal readout averaging sample period can be adjusted from 0 to 255. Increasing the sampling
    // period decreases noise but also reduces the effective max convergence time and increases power consumption:
    // Effective max convergence time = max convergence time - readout averaging period (see
    // Section 2.5: Range timing). Each unit sample period corresponds to around 64.5 ?s additional
    // processing time. The recommended setting is 48 which equates to around 4.3 ms
    _vl6180_write_byte(handle, VL6180X_REG_READOUT_AVERAGING_SAMPLE_PERIOD, 0x30);  // compromise between low noise and increased execution time
    // Gain can be 0 = 20, 1 = 10, 2 = 5, 3 = 2.5, 4 = 1.67, 5 = 1.25, 6 = 1.0 and 7 = 40
    // These are value possible for the lower nibble. The upper nibble must be 4
    _vl6180_write_byte(handle, VL6180X_REG_SYSALS_ANALOGUE_GAIN, 0x40 | 7);   // Sets light and dark gain (don't change upper nibble)
    _vl6180_read_byte(handle, VL6180X_REG_SYSALS_ANALOGUE_GAIN, &data_reg);

    // Scalar (1 - 32, bits 4:0) to multiply raw ALS count for additonal gain, if necessary
    _vl6180_write_byte(handle, VL6180X_REG_FIRMWARE_RESULT_SCALER, 0x01);

    // Configure the interrupts
    _vl6180_write_byte(handle, VL6180X_REG_SYSTEM_MODE_GPIO0, 0x00);                // set up GPIO 0 (set to high impedence for now)
    _vl6180_write_byte(handle, VL6180X_REG_SYSTEM_MODE_GPIO1, 0x00);                // set up GPIO 1 (set to high impedence for now)
    _vl6180_write_byte(handle, VL6180X_REG_SYSTEM_INTERRUPT_CONFIG_GPIO, 0x24);     // enable sample ready interrupt

    _vl6180_write_byte(handle, VL6180X_REG_SYSRANGE_START, 0x00);  // start auto range mode
    // Configure ALS
    _vl6180_write_byte(handle, VL6180X_REG_SYSALS_INTERMEASUREMENT_PERIOD, 0x32);   // set to 100 ms
    // Following is a 16-bit register with the first MSByte reserved
    _vl6180_write_byte(handle, VL6180X_REG_SYSALS_INTEGRATION_PERIOD+1, 0x32);      // set ALS integration time to 50 ms in steps of 1 ms
    _vl6180_write_byte(handle, VL6180X_REG_SYSALS_START, 0x03);                     // start auto range mode
    // Clear reset bit
    _vl6180_write_byte(handle, VL6180X_REG_SYSTEM_FRESH_OUT_OF_RESET, 0x00);
    return ESP_OK;
}

esp_err_t vl6180_start(vl6180_handle_t handle) {
    CHECK_IF_NULL(handle, return ESP_FAIL);

    // CHECK_IF_ERROR(_i2c_init(handle), return ESP_FAIL);

    uint8_t cmd = 2;
    _vl6180_read_byte(handle, VL6180X_REG_IDENTIFICATION_MODEL_ID, &cmd);
    if (cmd != 0xB4) {
        ESP_LOGE(TAG, "VL6180X_REG_IDENTIFICATION_MODEL_ID error");
        return ESP_FAIL;
    }

    _vl6180_load_setting(handle);
    _vl6180_write_byte(handle, VL6180X_REG_SYSTEM_FRESH_OUT_OF_RESET, 0x00);
    return ESP_OK;
}

uint8_t vl6180_get_addr(vl6180_handle_t handle) {
    if (handle == NULL) return ESP_FAIL;

    return handle->device_addr;
}

esp_err_t vl6180_set_addr(vl6180_handle_t handle, uint8_t new_addr) {
    if (handle == NULL) return ESP_FAIL;

    _vl6180_write_byte(handle, VL6180X_REG_I2C_SLAVE_DEVICE_ADDRESS, new_addr & 0x7F);
    handle->device_addr = new_addr;
    return ESP_OK;
}

esp_err_t vl6180_get_range(vl6180_handle_t handle, uint8_t* range) {
    if (handle == NULL) return ESP_FAIL;

    uint8_t data;
    _vl6180_read_byte(handle, VL6180X_REG_RESULT_RANGE_STATUS, &data);
    if (!(data & 0x01)) {
        return ESP_OK;
    }

    _vl6180_write_byte(handle, VL6180X_REG_SYSRANGE_START, 0x01);

    _vl6180_read_byte(handle, VL6180X_REG_RESULT_INTERRUPT_STATUS_GPIO, &data);
    if (!(data & 0x04)) {
        return ESP_OK;
    }

    _vl6180_read_byte(handle, VL6180X_REG_RESULT_RANGE_VAL, range);

    _vl6180_write_byte(handle, VL6180X_REG_SYSTEM_INTERRUPT_CLEAR, 0x07);

    return ESP_OK;
}

bool vl6180_start_range(vl6180_handle_t handle) {
    if (handle == NULL) {
        return false;
    }

    uint8_t data;
    do {
        _vl6180_read_byte(handle, VL6180X_REG_RESULT_RANGE_STATUS, &data);
    } while (!(data & 0x01));

    _vl6180_write_byte(handle, VL6180X_REG_SYSRANGE_START, 0x01);

    return true;
}

bool vl6180_is_range_complete(vl6180_handle_t handle) {
    if (handle == NULL) {
        return false;
    }

    uint8_t data;
    _vl6180_read_byte(handle, VL6180X_REG_RESULT_INTERRUPT_STATUS_GPIO, &data);
    if (data & 0x04) {
        return true;
    }
    return false;
}

bool vl6180_waiting_range_complete(vl6180_handle_t handle) {
    if (handle == NULL) {
        return false;
    }

    uint8_t data;
    do {
        _vl6180_read_byte(handle, VL6180X_REG_RESULT_INTERRUPT_STATUS_GPIO, &data);
    } while (!(data & 0x04));
    return true;
}

esp_err_t vl6180_start_range_continuous(vl6180_handle_t handle, uint16_t period_ms) {
    if (handle == NULL) return ESP_FAIL;

    uint8_t period_reg = 0;
    if (period_ms > 10) {
        if (period_ms < 2500) {
            period_reg = (period_ms / 10) -1;
        } else {
            period_reg = 254;
        }
    }

    _vl6180_write_byte(handle, SYSRANGE__INTERMEASUREMENT_PERIOD, period_reg);
    _vl6180_write_byte(handle, VL6180X_REG_SYSRANGE_START, 0x03);
    return ESP_OK;
}

esp_err_t vl6180_stop_range_continuous(vl6180_handle_t handle) {
    if (handle == NULL) return ESP_FAIL;

    _vl6180_write_byte(handle, VL6180X_REG_SYSRANGE_START, 0x01);
    return ESP_OK;
}

uint8_t vl6180_read_range_status(vl6180_handle_t handle) {
    if (handle == NULL) return ESP_FAIL;

    uint8_t cmd = 0;
    _vl6180_read_byte(handle, VL6180X_REG_RESULT_RANGE_STATUS, &cmd);
    return cmd >> 4;
}

esp_err_t vl6180_get_lux(vl6180_handle_t handle, uint8_t gain, float* lux) {
    if (handle == NULL) return ESP_FAIL;

    uint8_t reg;
    _vl6180_read_byte(handle, VL6180X_REG_SYSTEM_INTERRUPT_CONFIG_GPIO, &reg);
    reg &= ~0x38;
    reg |= (0x4 << 3); // IRQ on ALS ready
    _vl6180_write_byte(handle, VL6180X_REG_SYSTEM_INTERRUPT_CONFIG_GPIO, reg);
    // 100 ms integration period
    _vl6180_write_byte(handle, VL6180X_REG_SYSALS_INTEGRATION_PERIOD, 0);
    _vl6180_write_byte(handle, VL6180X_REG_SYSALS_INTEGRATION_PERIOD+1, 100);

    // analog gain
    if (gain > VL6180X_ALS_GAIN_40) {
        gain = VL6180X_ALS_GAIN_40;
    }
    _vl6180_write_byte(handle, VL6180X_REG_SYSALS_ANALOGUE_GAIN, 0x04 | gain);

    // start ALS
    _vl6180_write_byte(handle, VL6180X_REG_SYSALS_START, 0x1);

    // Poll until "New Sample Ready threshold event" is set
    uint8_t data;
    do {
        _vl6180_read_byte(handle, VL6180X_REG_RESULT_INTERRUPT_STATUS_GPIO, &data);
    } while (4 != ((data >> 3) & 0x7));

    uint8_t value[4];
    value[0] = 0;
    value[1] = 0;
    _vl6180_read_byte(handle, VL6180X_REG_RESULT_ALS_VAL, &value[2]);
    _vl6180_write_byte(handle, VL6180X_REG_SYSTEM_INTERRUPT_CLEAR, 0x07);

    memcpy(lux, value, 4);
    *lux *= 0.32; // calibrated count/lux

    switch (gain) {
    case VL6180X_ALS_GAIN_1:
        break;
    case VL6180X_ALS_GAIN_1_25:
        *lux /= 1.25;
        break;
    case VL6180X_ALS_GAIN_1_67:
        *lux /= 1.67;
        break;
    case VL6180X_ALS_GAIN_2_5:
        *lux /= 2.5;
        break;
    case VL6180X_ALS_GAIN_5:
        *lux /= 5;
        break;
    case VL6180X_ALS_GAIN_10:
        *lux /= 10;
        break;
    case VL6180X_ALS_GAIN_20:
        *lux /= 20;
        break;
    case VL6180X_ALS_GAIN_40:
        *lux /= 40;
        break;
    }
    *lux *= 100;
    *lux /= 100; // integration time in ms

    return ESP_OK;
}

vl6180_handle_t vl6180_init(vl6180_cfg_t* pcf_cfg) {
    vl6180_handle_t vl6180_handle = (vl6180_handle_t)malloc(sizeof(vl6180_t));
    vl6180_handle->sda_pin = pcf_cfg->sda_pin;
    vl6180_handle->scl_pin = pcf_cfg->scl_pin;
    vl6180_handle->i2c_port = pcf_cfg->i2c_port;
    vl6180_handle->device_addr = pcf_cfg->device_addr ? pcf_cfg->device_addr : VL6180_DEFAULT_ADDR;
    return vl6180_handle;
}

esp_err_t vl6180_deinit(vl6180_handle_t vl6180_handle) {
    CHECK_IF_NULL(vl6180_handle, return ESP_FAIL);
    free(vl6180_handle);
    return ESP_OK;
}

esp_err_t vl6180_offset_calib(vl6180_handle_t handle, int8_t offset) {
    CHECK_IF_NULL(handle, return ESP_FAIL);
    ESP_LOGW(TAG, "VL6180 calib offset to %d", offset);
    _vl6180_write_byte(handle, VL6180X_REG_SYSRANGE_PART_TO_PART_RANGE_OFFSET, offset);
    return ESP_OK;
}

esp_err_t vl6180_cross_talk_set(vl6180_handle_t handle, uint16_t crosstalk) {
    CHECK_IF_NULL(handle, return ESP_FAIL);
    // ESP_LOGI(TAG, "VL6180 calib cross talk to %d", crosstalk);
    _vl6180_write_byte(handle, VL6180X_REG_SYSRANGE_CROSSTALK_COMPENSATION_RATE, (uint8_t)((crosstalk>>8)&0xFF));
    _vl6180_write_byte(handle, VL6180X_REG_SYSRANGE_CROSSTALK_COMPENSATION_RATE+1, (uint8_t)((crosstalk)&0xFF));
    return ESP_OK;
}

esp_err_t vl6180_cross_talk_calib(vl6180_handle_t handle) {
    CHECK_IF_NULL(handle, return ESP_FAIL);
    // ESP_LOGI(TAG, "VL6180 calib cross talk to %d", crosstalk);
    uint8_t raw_range;
    uint8_t rtn_sig_rate_l;
    uint8_t rtn_sig_rate_h;
    float ave_raw_range = 0;
    float ave_rtn_sig_rate = 0;
    _vl6180_write_byte(handle, VL6180X_REG_SYSRANGE_CROSSTALK_COMPENSATION_RATE, 0);
    _vl6180_write_byte(handle, VL6180X_REG_SYSRANGE_CROSSTALK_COMPENSATION_RATE+1, 0);
    for(uint8_t idx = 0; idx < 10; idx++) {
        _vl6180_read_byte(handle, VL6180X_REG_RESULT_RANGE_RAW, &raw_range);
        _vl6180_read_byte(handle, VL6180X_REG_RESULT_RANGE_RETURN_RATE, &rtn_sig_rate_h);
        _vl6180_read_byte(handle, VL6180X_REG_RESULT_RANGE_RETURN_RATE+1, &rtn_sig_rate_l);
        ESP_LOGD(TAG, "VL6180 cross_talk raw %d, rtn %x %x", raw_range, rtn_sig_rate_h, rtn_sig_rate_l);
        ave_raw_range += (float)raw_range;
        ave_rtn_sig_rate += (float)(((uint16_t)rtn_sig_rate_h<<8)|rtn_sig_rate_l);
        vTaskDelay(100/portTICK_PERIOD_MS);
    }
    ave_raw_range /= 10;
    ave_rtn_sig_rate /= 10*128;
    int crosst = (int)(ave_rtn_sig_rate * (1-(ave_raw_range/100)) * 128);
    ESP_LOGW(TAG, "VL6180 cross_talk %d", crosst);
    if(crosst > 2000) crosst = 2000;
    _vl6180_write_byte(handle, VL6180X_REG_SYSRANGE_CROSSTALK_COMPENSATION_RATE, (uint8_t)((crosst>>8)&0xFF));
    _vl6180_write_byte(handle, VL6180X_REG_SYSRANGE_CROSSTALK_COMPENSATION_RATE+1, (uint8_t)((crosst)&0xFF));
    return ESP_OK;
}

esp_err_t vl6180_range_ignore(vl6180_handle_t handle, uint8_t ignore) {
    CHECK_IF_NULL(handle, return ESP_FAIL);
    // ESP_LOGE(TAG, "VL6180 ignore range: %d", ignore);
    _vl6180_write_byte(handle, VL6180X_REG_SYSRANGE_RANGE_CHECK_ENABLES, 1);
    _vl6180_write_byte(handle, VL6180X_REG_SYSRANGE_RANGE_IGNORE_THRESHOLD, ignore);
    return ESP_OK;
}
