#include "kalman_filter.h"
#include "math.h"

typedef struct kalman_filter_ {
    double   _err_measure;
    double   _err_estimate;
    double   _q;
    double   _current_estimate;
    double   _last_estimate;
    double   _kalman_gain;
} kalman_filter_t;

kalman_filter_handle_t kalman_filter_init(double mea_e, double est_e, double q)
{
    kalman_filter_handle_t handle = calloc(1, sizeof(kalman_filter_t));
    handle->_err_measure = mea_e;
    handle->_err_estimate = est_e;
    handle->_q = q;
    return handle;
}

double update_estimate(kalman_filter_handle_t kf_handle, double mea)
{
    kf_handle->_kalman_gain = kf_handle->_err_estimate/(kf_handle->_err_estimate + kf_handle->_err_measure);
    kf_handle->_current_estimate = kf_handle->_last_estimate + kf_handle->_kalman_gain * (mea - kf_handle->_last_estimate);
    kf_handle->_err_estimate =  (1.0 - kf_handle->_kalman_gain)*kf_handle->_err_estimate + fabs(kf_handle->_last_estimate-kf_handle->_current_estimate) * kf_handle->_q;
    kf_handle->_last_estimate = kf_handle->_current_estimate;

    return kf_handle->_current_estimate;
}

void set_measurement_error(kalman_filter_handle_t kf_handle, double mea_e)
{
    kf_handle->_err_measure = mea_e;
}

void set_estimate_error(kalman_filter_handle_t kf_handle, double est_e)
{
    kf_handle->_err_estimate = est_e;
}

void set_process_noise(kalman_filter_handle_t kf_handle, double q)
{
    kf_handle->_q=q;
}

double get_kalman_gain(kalman_filter_handle_t kf_handle)
{
    return kf_handle->_kalman_gain;
}

double get_estimate_error(kalman_filter_handle_t kf_handle)
{
    return kf_handle->_err_estimate;
}
