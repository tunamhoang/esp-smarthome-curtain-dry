/*
 * This file is subject to the terms of the SunshineTech License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *                             ./LICENSE
 */
#ifndef _PERIPH_REMOTE_H_
#define _PERIPH_REMOTE_H_

#include "sys/queue.h"
#include "esp_err.h"
#include "esp_peripherals.h"
#include "esp_cc1101.h"

#ifdef __cplusplus
extern "C" {
#endif

#define PERIPH_ID_REMOTE (PERIPH_ID_MAX + 7)

#define DEFAULT_REMOTE_BUFFER (1024 * 2)

typedef enum {
    REMOTE_TYPE_IR = 0,
    REMOTE_TYPE_RF,
} periph_remote_type_t;

typedef struct {
    uint8_t data[DEFAULT_REMOTE_BUFFER];
    int data_len;
    periph_remote_type_t type;
    bool is_compressed;
} periph_remote_data_t;

/**
 * Peripheral Remote configuration
 */
typedef struct {
    int tx_pin;
    int rmt_tx_ch;
    int rx_pin;
    int rmt_rx_ch;
    int rf_tx_pin;
    int rf_tx_ch;
    int rf_rx_pin;
    int rf_rx_ch;
    esp_cc1101_cfg_t rf_conf;
    const char *tag;
    bool enable_compress;
} periph_remote_cfg_t;

/**
 * Peripheral Remote events
 */
typedef enum  {
    REMOTE_EVENT_UNKNOWN,
    REMOTE_EVENT_RECEIVED,
    REMOTE_EVENT_ENTER_LEARN_MODE,
    REMOTE_EVENT_LEARN_FINISH,
    REMOTE_EVENT_SEND_DATA,
} periph_remote_event_id_t;


typedef enum {
    SAMSUNGAC,
    DAIKIN,
    DAIKIN2,
    DAIKIN216,
    DAIKIN160,
    DAIKIN176,
    DAIKIN128,
    DAIKIN64,
    DAIKIN200,
    DAIKIN312,
    REMOTE_UNKNOWN,
} remote_type_t;

typedef struct {
    char*   modelid;
    remote_type_t remote_type;
} mapping_model_t;

#define MAPPING_MODEL_ID_LIST                       \
    {                                               \
        {"AR09FSSDAWKNFA A/C", SAMSUNGAC},          \
        {"AR09HSFSBWKN A/C", SAMSUNGAC},            \
        {"AR12KSFPEWQNET A/C", SAMSUNGAC},          \
        {"AR12HSSDBWKNEU A/C", SAMSUNGAC},          \
        {"AR12NXCXAWKXEU A/C", SAMSUNGAC},          \
        {"AR12TXEAAWKNEU A/C", SAMSUNGAC},          \
        {"FTXZ25NV1B A/C", DAIKIN2},                \
        {"FTXZ35NV1B A/C", DAIKIN2},                \
        {"FTXZ50NV1B A/C", DAIKIN2},                \
        {"FTE12HV2S A/C", DAIKIN160},               \
        {"FFQ35B8V1B A/C", DAIKIN176},              \
        {"17 Series FTXB09AXVJU A/C", DAIKIN128},   \
        {"17 Series FTXB12AXVJU A/C", DAIKIN128},   \
        {"17 Series FTXB24AXVJU A/C", DAIKIN128},   \
        {"FFN-C/FCN-F Series A/C", DAIKIN64},       \
        {"M Series A/C", DAIKIN},                   \
        {"FTXM-M A/C", DAIKIN},                     \
        {"FTWX35AXV1 A/C", DAIKIN64},               \
        {"FTQ60TV16U2 A/C", DAIKIN216},             \
        {"FTXM20R5V1B A/C", DAIKIN312},             \
    };

esp_periph_handle_t periph_remote_init(periph_remote_cfg_t *config);
esp_err_t periph_remote_send(esp_periph_handle_t periph, const char *data, int len, bool is_compressed);
esp_err_t periph_remote_receive(esp_periph_handle_t periph);
esp_err_t periph_remote_send_rf(esp_periph_handle_t periph, const char *data, int len, bool is_compressed);
esp_err_t periph_remote_receive_rf(esp_periph_handle_t periph);
esp_err_t periph_remote_require_compress(esp_periph_handle_t periph, bool is_once_time);
esp_err_t periph_remote_disable_compress(esp_periph_handle_t periph);
esp_err_t periph_remote_ac_send(esp_periph_handle_t periph, char* modelid, bool power, int temp, int mode, int fan, bool swingH, bool swingV);

#ifdef __cplusplus
}
#endif

#endif
