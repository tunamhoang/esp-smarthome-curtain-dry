/*
 * This file is subject to the terms of the SunshineTech License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *                             ./LICENSE
 */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/queue.h>
#include "esp_log.h"
#include "esp_system.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "periph_aircond.h"
#include "tct_template.h"

#include "driver/spi_slave.h"
#include "driver/uart.h"
#include "driver/gpio.h"
#include "freertos/semphr.h"
#include "math.h"
#include "app_utility.h"

#define AIRCOND_REGISTER_TIMEOUT_MS                          (10*1000)
#define DEFAULT_AIRCOND_TASK_STACK                           (2*1024)
#define ENABLE_REG_ALL                                       true

static const char *TAG = "PERIPH_AIRCOND";

#define VALIDATE_AIRCOND(periph, ret) if (!esp_periph_validate(periph, PERIPH_ID_AIRCOND)) { \
        ESP_LOGE(TAG, "Invalid AIRCOND periph, at line %d", __LINE__);\
        return ret;\
    }

#define _mutex_lock(x)       while (xSemaphoreTake(x, portMAX_DELAY) != pdPASS);
#define _mutex_unlock(x)     xSemaphoreGive(x)
#define _mutex_create()      xSemaphoreCreateMutex()
#define _mutex_destroy(x)    vSemaphoreDelete(x)

typedef aircond_info_t *(*process_callback)(void *, aircond_info_t *);
typedef esp_err_t (*init_callback)(void *);

static esp_periph_handle_t g_periph = NULL;

typedef struct info_device_t {
    STAILQ_ENTRY(info_device_t) next;
    aircond_info_t          info;
    bool                    is_reg;
    int64_t                 reg_tick;
} info_device_t;

typedef struct {
    bool run;
    aircond_hardware_t      hw;
    aircond_physic_t        physic;
    STAILQ_HEAD(info_device_list, info_device_t) info_device_list;
    int                     n_indoor_unit;
    QueueHandle_t           new_info_queue;
    SemaphoreHandle_t       command_lock;
    SemaphoreHandle_t       info_lock;
    bool                    enable_htu_sensor;
    long long               last_get_sensor;
    int                     get_sensor_interval;
    esp_htu21df_config_t    htu_config;
    esp_htu21df_handle_t    htu_handle;
    uint8_t                 tms_addr;
    init_callback           aircond_init;
    process_callback        aircond_process;
    void                    *aircond_handle;
    bool                    is_ws_connected;
} periph_aircond_t;

info_device_t *_info_device_get(periph_aircond_t *periph_aircond, info_device_t *dev_next) {
    static bool is_next = false;
    info_device_t *unit_device = NULL;
    STAILQ_FOREACH(unit_device, &periph_aircond->info_device_list, next) {
        if((dev_next == NULL) || (unit_device == dev_next)) is_next = false;
        if(is_next) continue;
        if((dev_next == NULL) || (dev_next != NULL && unit_device != dev_next)) {
            is_next = true;
            return unit_device;
        }
    }
    return NULL;
}

info_device_t *_info_device_find(periph_aircond_t *periph_aircond, uint8_t address) {
    info_device_t *unit_device = NULL;
    STAILQ_FOREACH(unit_device, &periph_aircond->info_device_list, next) {
        if (unit_device->info.address == address) {
            return unit_device;
        }
    }
    return NULL;
}

info_device_t *_info_device_add(periph_aircond_t *periph_aircond, uint8_t address) {
    info_device_t *unit = _info_device_find(periph_aircond, address);
    ERROR_CHECKW(unit != NULL, "error unit addr is exist", return unit);
    if(periph_aircond->n_indoor_unit >= MAX_INDOOR_UNIT) LOGE(TAG,"Indoor unit limit...");
    unit = (info_device_t *)calloc(1, sizeof(info_device_t));
    ERROR_CHECKW(unit == NULL, "error allocate unit", return NULL);
    unit->info.address = address;
    unit->info.temperature = DEFAULT_AIRCOND_SETPOINT;
    unit->info.is_online = true;
    unit->is_reg = false;
    unit->reg_tick = esp_periph_tick_get();
    periph_aircond->n_indoor_unit++;
    STAILQ_INSERT_TAIL(&periph_aircond->info_device_list, unit, next);
    return unit;
}

esp_err_t _print_info(const char *st, int line, aircond_info_t *info) {
    const char *mode_str[] = {"NO_CHANGE", "OFF", "HEAT", "COOL", "AUTO","DRY", "FAN", "ON_LAST_MODE"};
    const char *speed_str[] = {"AUTO", "1", "2", "3", "4"};
    const char *vanes_str[] = {"SWING", "POS1", "POS2", "POS3", "POS4"};
    LOGI(TAG, "(%-10s,%-4d) Aircond Address: %x\tMode: %s\tSetpoint: %d\tTemp: %3.1f\tHump: %3.1f\tFanspeed: %s\tVanes: %s", st, line,
         info->address, mode_str[info->mode]
         , info->setpoint, info->temperature, info->humidity, speed_str[info->fanspeed], vanes_str[info->vanes]);
    return ESP_OK;
}

bool _check_if_aircond_info_changed(aircond_info_t* pre_info, aircond_info_t *current_info) {
    if (current_info->setpoint < 0 ||
            current_info->setpoint > 40 ||
            current_info->temperature < 0 ||
            current_info->temperature > 100 ||
            current_info->humidity < 0 ||
            current_info->humidity > 100) {
        return false;
    }
    uint16_t check = 0;
    check += pre_info->mode ^ current_info->mode;
    check += pre_info->setpoint ^ current_info->setpoint;
    check += pre_info->fanspeed ^ current_info->fanspeed;
    check += pre_info->is_online ^ pre_info->is_online;
    check += pre_info->vanes ^ pre_info->vanes;
    check += fabs(pre_info->temperature - current_info->temperature) > 1.0f ? 1 : 0;
    check += fabs(pre_info->humidity - current_info->humidity) > 1.0f ? 1 : 0;
    return (bool)check;
}

aircond_info_t *_aircond_process(periph_aircond_t *periph_aircond, aircond_info_t *control_info, bool *control_flag) {
    if(IS_NULL(periph_aircond) || IS_NULL(control_info) || IS_NULL(control_flag) || IS_NULL(periph_aircond->aircond_process)) return NULL;
    if (*control_flag) {
        *control_flag = false;
        return periph_aircond->aircond_process(periph_aircond->aircond_handle, control_info);
    } else {
        return periph_aircond->aircond_process(periph_aircond->aircond_handle, NULL);
    }
    return NULL;
}

static esp_err_t _aircond_login_process(esp_periph_handle_t self) {
    periph_aircond_t *periph_aircond = esp_periph_get_data(self);
    if(!periph_aircond->is_ws_connected) return ESP_OK;
    info_device_t *unit_device = NULL;
    STAILQ_FOREACH(unit_device, &periph_aircond->info_device_list, next) {
        if((unit_device->info.address != AIRCOND_BROADCAST_ADDR) && (!unit_device->is_reg)) {
            if(unit_device->reg_tick > esp_periph_tick_get()) unit_device->reg_tick = esp_periph_tick_get();
            if(esp_periph_tick_get() - unit_device->reg_tick < AIRCOND_REGISTER_TIMEOUT_MS) continue;
            unit_device->reg_tick = esp_periph_tick_get();
#ifdef ENABLE_REG_ALL
            esp_periph_send_event(self, AIRCOND_EVENT_ADD_NEW_INDOOR, &unit_device->info.address, sizeof(uint8_t));
#else
            if(unit_device->info.address == periph_aircond->tms_addr)
                esp_periph_send_event(self, AIRCOND_EVENT_ADD_NEW_INDOOR, &unit_device->info.address, sizeof(uint8_t));
#endif
        }
    }
    return ESP_OK;
}

static void _aircond_task(void *pv) {
    esp_periph_handle_t self = pv;
    periph_aircond_t *periph_aircond = esp_periph_get_data(self);
    aircond_info_t *current_info = NULL;
    aircond_info_t control_info;
    aircond_info_t update_info;
    bool new_control_flag = false;
    bool update_flag = false;

    while (periph_aircond->run) {
        _aircond_login_process(self);
        _mutex_lock(periph_aircond->command_lock);
        if (xQueueReceive(periph_aircond->new_info_queue, &control_info, 200 / portTICK_PERIOD_MS) == pdTRUE) {
            LOGE(TAG, "Receive new request control addr %x", control_info.address);
            control_info.is_online = true;
            _print_info("Control", __LINE__, &control_info);
            new_control_flag = true;
        } else {
            new_control_flag = false;
        }
        _mutex_unlock(periph_aircond->command_lock);
        current_info = _aircond_process(periph_aircond, &control_info, &new_control_flag);
        if (current_info) {
            if (periph_aircond->htu_handle != NULL) {
                float sensor_temp = 0;
                float sensor_humidity = 0;
                if (esp_periph_tick_get() - periph_aircond->last_get_sensor > periph_aircond->get_sensor_interval) {
                    periph_aircond->last_get_sensor = esp_periph_tick_get();
                    esp_err_t check_sensor = ESP_OK;
                    check_sensor += esp_htu21df_read_temperature(periph_aircond->htu_handle, &sensor_temp);
                    check_sensor += esp_htu21df_read_humidity(periph_aircond->htu_handle, &sensor_humidity);
                    ESP_LOGE(TAG, "get sensor data: temperature: %f, humidity: %f", sensor_temp, sensor_humidity);
                }
                for (int i = 0; i < periph_aircond->n_indoor_unit; i++) {
                    current_info[i].temperature = current_info[i].temperature > 10 ? current_info[i].temperature : sensor_temp;
                    current_info[i].humidity = current_info[i].humidity > 10 ? current_info[i].humidity : sensor_humidity;
                }
            }
            if (periph_aircond->physic == AIRCOND_RS485) {
                int n_indoor_unit = periph_ac_rs485_get_num_unit((rs485_handle_t)periph_aircond->aircond_handle);
                if(n_indoor_unit >= MAX_INDOOR_UNIT) {
                    LOGE(TAG,"Indoor unit limit...");
                    continue;
                }
                _mutex_lock(periph_aircond->info_lock);
                for (int i = 0; i < n_indoor_unit; i++) {
                    if(current_info[i].address == AIRCOND_BROADCAST_ADDR) continue;
                    //if(current_info[i].address == periph_aircond->tms_addr) _print_info("read", __LINE__, &current_info[i]);
                    info_device_t *dev = _info_device_find(periph_aircond, current_info[i].address);
                    if(dev) {
                        /* if((dev->info.setpoint == 0) && (dev->info.temperature == 0) && (dev->info.address == periph_aircond->tms_addr)) {
                            LOGE(TAG, "Fail addr %x", dev->info.address);
                            continue;
                        } */
                        if (_check_if_aircond_info_changed(&dev->info, &current_info[i])) {
                            memcpy(&update_info, &current_info[i], sizeof(aircond_info_t));
                            memcpy(&dev->info, &current_info[i], sizeof(aircond_info_t));
#if defined (DEVICE_TYPE_REMOTE_GATEWAY) || defined (CONFIG_DEVICE_TYPE_THERMOSTAT)
#ifdef ENABLE_REG_ALL
                            esp_periph_send_event(self, AIRCOND_EVENT_UPDATE, (void *)&update_info, sizeof(aircond_info_t));
#else
                            if (current_info[i].address == periph_aircond->tms_addr) {
                                _print_info("Onchange", __LINE__, &update_info);
                                esp_periph_send_event(self, AIRCOND_EVENT_UPDATE, (void *)&update_info, sizeof(aircond_info_t));
                            }
#endif
#endif
                        }
                    }
                    else {
                        LOGI(TAG, "Add new aircond [%d] address %02x", i, current_info[i].address);
                        dev = _info_device_add(periph_aircond, current_info[i].address);
#if defined (DEVICE_TYPE_REMOTE_GATEWAY) || defined (CONFIG_DEVICE_TYPE_THERMOSTAT)
#ifdef ENABLE_REG_ALL
                        esp_periph_send_event(self, AIRCOND_EVENT_ADD_NEW_INDOOR, &current_info[i].address, sizeof(uint8_t));
#else
                        if (current_info[i].address == periph_aircond->tms_addr)
                            esp_periph_send_event(self, AIRCOND_EVENT_ADD_NEW_INDOOR, &current_info[i].address, sizeof(uint8_t));
#endif
#endif
                    }
                }
                _mutex_unlock(periph_aircond->info_lock);
            }

            if (periph_aircond->physic != AIRCOND_RS485 && current_info != NULL) {
                _mutex_lock(periph_aircond->info_lock);
                info_device_t *unit = _info_device_find(periph_aircond, 0);
                if(unit) {
                    if(_check_if_aircond_info_changed(&unit->info, current_info)) {
                        ESP_LOGW(TAG, "Check current infor with infor[0]");
                        unit->info.setpoint = current_info->setpoint;
                        unit->info.fanspeed = current_info->fanspeed;
                        unit->info.is_online = current_info->is_online;
                        unit->info.mode = current_info->mode;
                        unit->info.vanes = current_info->vanes;
                        unit->info.humidity = current_info->humidity;
                        unit->info.temperature = current_info->temperature;
                        memcpy(&update_info, &unit->info, sizeof(aircond_info_t));
                        ESP_LOGD(TAG, "update second setpoint=%d, fanspeed = %d, vanes=%d, temperature=%f, humidity=%f, mode=%d",
                                 update_info.setpoint,
                                 update_info.fanspeed,
                                 update_info.vanes,
                                 update_info.temperature,
                                 update_info.humidity,
                                 update_info.mode);
                        esp_periph_send_event(self, AIRCOND_EVENT_UPDATE, (void *)&update_info, sizeof(aircond_info_t));
                    }
                }
                _mutex_unlock(periph_aircond->info_lock);
            }
        }
        vTaskDelay(500 / portTICK_PERIOD_MS);
    }
    vTaskDelete(NULL);
}

static esp_err_t _aircond_init(esp_periph_handle_t self) {
    VALIDATE_AIRCOND(self, ESP_FAIL);
    LOGI(TAG, "Memory free: %d", heap_caps_get_free_size(MALLOC_CAP_INTERNAL));
    periph_aircond_t *periph_aircond = esp_periph_get_data(self);
    ERROR_CHECKW(IS_NULL(periph_aircond->aircond_init), "aircond_init doest not exist", return ESP_FAIL);
    periph_aircond->aircond_init(periph_aircond->aircond_handle);
    if (periph_aircond->enable_htu_sensor) {
        esp_htu21df_config_t htu_config = {
            .sda_pin = periph_aircond->htu_config.sda_pin,
            .scl_pin = periph_aircond->htu_config.scl_pin,
            .port_num = periph_aircond->htu_config.port_num,
        };
        periph_aircond->htu_handle = esp_htu21df_init(&htu_config);
        if (esp_htu21df_start(periph_aircond->htu_handle) == ESP_OK) {
            ESP_LOGD(TAG, "Init temperature and humidity sensor complete");
        }
    }
    if (!periph_aircond->run) {
        periph_aircond->run = true;
        BaseType_t xReturned = pdPASS;
        xReturned = xTaskCreate(_aircond_task, "aircond_task", 3 * 1024, self, 5, NULL);
        ERROR_CHECKW(xReturned != pdPASS, "Error create aircond_task, memory exhausted?", return ESP_FAIL);
    }
    LOGI(TAG, "Memory free: %d", heap_caps_get_free_size(MALLOC_CAP_INTERNAL));
    return ESP_OK;
}

static esp_err_t _aircond_run(esp_periph_handle_t self, audio_event_iface_msg_t *msg) {
    return ESP_OK;
}

static esp_err_t _aircond_destroy(esp_periph_handle_t self) {
    periph_aircond_t *periph_aircond = esp_periph_get_data(self);
    info_device_t *item, *tmp;
    STAILQ_FOREACH_SAFE(item, &periph_aircond->info_device_list, next, tmp) {
        STAILQ_REMOVE(&periph_aircond->info_device_list, item, info_device_t, next);
        free(item);
    }
    free(periph_aircond);
    return ESP_OK;
}

esp_periph_handle_t periph_aircond_init(periph_aircond_cfg_t *config) {
    esp_periph_handle_t periph = esp_periph_create(PERIPH_ID_AIRCOND, "periph_aircond");
    PERIPH_MEM_CHECK(TAG, periph, return NULL);

    periph_aircond_t *periph_aircond = calloc(1, sizeof(periph_aircond_t));
    PERIPH_MEM_CHECK(TAG, periph_aircond, goto _aircond_init_fail);
    periph_aircond->enable_htu_sensor = config->enable_htu_sensor;
    memcpy(&periph_aircond->htu_config, &config->htu_config, sizeof(esp_htu21df_config_t));
    periph_aircond->get_sensor_interval = config->get_sensor_interval == 0 ? DEFAULT_GET_SENSOR_INTERVAL : config->get_sensor_interval;
    periph_aircond->htu_handle = NULL;
    periph_aircond->last_get_sensor = -periph_aircond->get_sensor_interval;

    periph_aircond->physic = config->physic;
    memcpy(&periph_aircond->hw, &config->hw, sizeof(aircond_hardware_t));
    periph_aircond->new_info_queue = xQueueCreate(MAX_INDOOR_UNIT, sizeof(aircond_info_t));
    periph_aircond->command_lock = mutex_create();
    periph_aircond->info_lock = mutex_create();

    periph_aircond->n_indoor_unit = 0;
    periph_aircond->tms_addr = AIRCOND_BROADCAST_ADDR;
    periph_aircond->is_ws_connected = false;

    STAILQ_INIT(&periph_aircond->info_device_list);
    if (periph_aircond->physic == AIRCOND_RS485) {
        periph_aircond->aircond_handle = periph_ac_rs485_init(&periph_aircond->hw);
        periph_aircond->aircond_process = periph_ac_rs485_process;
        periph_aircond->aircond_init = _rs485_init;
    } else {
        if (periph_aircond->physic == AIRCOND_HOMEBUS) {
            periph_aircond->aircond_handle = periph_ac_homebus_init(&periph_aircond->hw);
            periph_aircond->aircond_process = periph_ac_homebus_process;
            periph_aircond->aircond_init = _homebus_init;
        } else if (periph_aircond->physic == AIRCOND_SPI) {
            periph_aircond->aircond_handle = periph_ac_spi_init(&periph_aircond->hw);
            periph_aircond->aircond_process = periph_ac_spi_process;
            periph_aircond->aircond_init = _spi_init;
        } else if (periph_aircond->physic == AIRCOND_UART) {
            periph_aircond->aircond_handle = periph_ac_uart_init(&periph_aircond->hw);
            periph_aircond->aircond_process = periph_ac_uart_process;
            periph_aircond->aircond_init = _uart_init;
        }
    }

    esp_periph_set_data(periph, periph_aircond);
    esp_periph_set_function(periph, _aircond_init, _aircond_run, _aircond_destroy);
    g_periph = periph;
    return periph;
_aircond_init_fail:
    LOGE(TAG, "Failed to initial AIRCOND");
    if (periph_aircond) {
        vQueueDelete(periph_aircond->new_info_queue);
        mutex_destroy(periph_aircond->command_lock);
        mutex_destroy(periph_aircond->info_lock);
        free(periph_aircond);
    }
    free(periph);
    return NULL;
}

esp_err_t periph_aircond_set_info(esp_periph_handle_t self, aircond_info_t *info) {
    if (g_periph != NULL) {
        self = g_periph;
    }
    VALIDATE_AIRCOND(self, ESP_FAIL);
    LOGW(TAG, "periph_aircond_set_info, addr: %d", info->address);
    periph_aircond_t *periph_aircond = esp_periph_get_data(self);
#ifndef ENABLE_REG_ALL
    if(info->address != periph_aircond->tms_addr) {
        LOGW(TAG, "Receive control address %x not mine...", info->address);
        return ESP_FAIL;
    }
#endif
    _mutex_lock(periph_aircond->command_lock);
    xQueueSend(periph_aircond->new_info_queue, info, 100 / portTICK_PERIOD_MS);
    _mutex_unlock(periph_aircond->command_lock);
    return ESP_OK;
}

esp_err_t periph_aircond_set_info_default(esp_periph_handle_t self, aircond_info_t *info) {
    if (g_periph != NULL) {
        self = g_periph;
    }
    VALIDATE_AIRCOND(self, ESP_FAIL);
    periph_aircond_t *periph_aircond = esp_periph_get_data(self);
    periph_ac_rs485_set_info_default(periph_aircond->aircond_handle, info);
    return ESP_OK;
}

esp_err_t periph_aircond_get_info(esp_periph_handle_t self, aircond_info_t *info, int index) {
    if (g_periph != NULL) self = g_periph;
    if (info == NULL) return ESP_FAIL;
    VALIDATE_AIRCOND(self, ESP_FAIL);
    periph_aircond_t *periph_aircond = esp_periph_get_data(self);
    _mutex_lock(periph_aircond->info_lock);
    info_device_t *unit = _info_device_find(periph_aircond, index);
    if(unit) {
        memcpy(info, &unit->info, sizeof(aircond_info_t));
        _mutex_unlock(periph_aircond->info_lock);
        return ESP_OK;
    }
    _mutex_unlock(periph_aircond->info_lock);
    return ESP_OK;
}

esp_err_t periph_aircond_check_reg(uint32_t *indoor_address, int n_indoor) {
    periph_aircond_t *periph_aircond = esp_periph_get_data(g_periph);
    if (periph_aircond->physic == AIRCOND_RS485) {
        for(int i = 0; i < n_indoor; i++) {
            _mutex_lock(periph_aircond->info_lock);
            info_device_t *unit = _info_device_find(periph_aircond, (uint8_t)indoor_address[i]);
            if(unit) {
                unit->is_reg = true;
                LOGW(TAG, "Confirm indoor address %d, is_online %d", unit->info.address, unit->info.is_online);
                unit->info.is_online = true;
                esp_periph_send_event(g_periph, AIRCOND_EVENT_UPDATE, (void *)&unit->info, sizeof(aircond_info_t));
            }
            _mutex_unlock(periph_aircond->info_lock);
        }
    }
    return ESP_OK;
}

esp_err_t periph_aircond_update_state(esp_periph_handle_t handle, aircond_info_t *info) {
    VALIDATE_AIRCOND(handle, ESP_FAIL);
    if (info == NULL) {
        return ESP_FAIL;
    }
    LOGW(TAG, "periph_aircond_update_state, addr: %d", info->address);
    _print_info("update", __LINE__, info);
    periph_aircond_t *periph_aircond = esp_periph_get_data(handle);
    _mutex_lock(periph_aircond->command_lock);
    xQueueSend(periph_aircond->new_info_queue, info, 100 / portTICK_PERIOD_MS);
    _mutex_unlock(periph_aircond->command_lock);
    return ESP_OK;
}

uint8_t periph_aircond_get_address(esp_periph_handle_t handle, uint8_t *addr_list) {
    VALIDATE_AIRCOND(handle, ESP_FAIL);
    if (addr_list == NULL) {
        LOGE(TAG, "Addr_list is null");
        return 0;
    }
    periph_aircond_t *periph_aircond = esp_periph_get_data(handle);
    LOGI(TAG, "periph_aircond_get_address %d", periph_aircond->n_indoor_unit);
    int idx = 0;
    info_device_t *dev, *tmp = NULL;
    _mutex_lock(periph_aircond->info_lock);
    do {
        dev = _info_device_get(periph_aircond, tmp);
        if(dev) {
            tmp = dev;
            addr_list[idx++] = dev->info.address;
        }
    } while (dev != NULL);
    _mutex_unlock(periph_aircond->info_lock);
    return periph_aircond->n_indoor_unit;
}

esp_err_t periph_aircond_set_address(esp_periph_handle_t handle, uint8_t tms_addr) {
    VALIDATE_AIRCOND(handle, ESP_FAIL);
    periph_aircond_t *periph_aircond = esp_periph_get_data(handle);
    if(tms_addr == AIRCOND_BROADCAST_ADDR) return ESP_FAIL;
    periph_aircond->tms_addr = tms_addr;
    LOGW(TAG, "periph_aircond_set_address to %x", periph_aircond->tms_addr);
    _info_device_add(periph_aircond, tms_addr);
    return ESP_OK;
}

esp_err_t periph_aircond_request_stop(esp_periph_handle_t handle) {
    VALIDATE_AIRCOND(handle, ESP_FAIL);
    periph_aircond_t *periph_aircond = esp_periph_get_data(handle);
    periph_ac_rs485_destroy(periph_aircond->aircond_handle);
    return ESP_OK;
}

esp_err_t periph_aircond_set_ws_status(esp_periph_handle_t handle, bool ws_status) {
    VALIDATE_AIRCOND(handle, ESP_FAIL);
    periph_aircond_t *periph_aircond = esp_periph_get_data(handle);
    periph_aircond->is_ws_connected = ws_status;
    info_device_t *unit_device = NULL;
    STAILQ_FOREACH(unit_device, &periph_aircond->info_device_list, next) {
        if(!ws_status) unit_device->is_reg = false;
        else unit_device->reg_tick = esp_periph_tick_get() - AIRCOND_REGISTER_TIMEOUT_MS;
    }
    return ESP_OK;
}
