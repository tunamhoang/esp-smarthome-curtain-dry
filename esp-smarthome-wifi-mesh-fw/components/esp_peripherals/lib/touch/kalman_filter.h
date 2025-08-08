#ifndef _KALMAN_FILTER_H_
#define _KALMAN_FILTER_H_

#include "freertos/FreeRTOS.h"
#include <stdio.h>
#include <string.h>

typedef struct kalman_filter_* kalman_filter_handle_t;

kalman_filter_handle_t kalman_filter_init(double mea_e, double est_e, double q);
double update_estimate(kalman_filter_handle_t kf_handle, double mea);
void set_measurement_error(kalman_filter_handle_t kf_handle, double mea_e);
void set_estimate_error(kalman_filter_handle_t kf_handle, double est_e);
void set_process_noise(kalman_filter_handle_t kf_handle, double q);
double get_kalman_gain(kalman_filter_handle_t kf_handle);
double get_estimate_error(kalman_filter_handle_t kf_handle);

#endif
