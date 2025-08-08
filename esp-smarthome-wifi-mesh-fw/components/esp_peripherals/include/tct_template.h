/*
 * This file is subject to the terms of the Nanochip License. If a copy of
 * the license was not distributed with this file, you can obtain one at:
 *                             ./LICENSE
 */
#ifndef _TCT_TEMPLATE_H_
#define _TCT_TEMPLATE_H_

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct _tct_arguments {
    struct _tct_arguments *next;
    char data[0];
} tct_arguments;

char* tct_render(char *template, tct_arguments *argument);
char *tct_render_uint64(const char *template, const char *key, const char *format, uint64_t value);
char *tct_render_id(const char *template, uint64_t value);

void tct_free_argument(tct_arguments* arguments);
tct_arguments* tct_add_argument_(tct_arguments *next_argument, const char *name, const char *format, ...);

#define tct_add_argument(a, ...) {a = tct_add_argument_(a, __VA_ARGS__);}

#define PERIPH_MEM_CHECK(TAG, a, action) if (!(a)) {                                       \
        ESP_LOGE(TAG,"%s:%d (%s): %s", __FILE__, __LINE__, __FUNCTION__, "Memory exhausted");       \
        action;                                                                   \
        }


#ifdef __cplusplus
}
#endif

#endif
