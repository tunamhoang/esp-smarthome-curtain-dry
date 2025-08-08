idf_build_get_property(target IDF_TARGET)
set(srcs    audio_event_iface.c
            esp_peripherals.c
            esp_storage.c
            json_utils.c
            periph_blufi.c
            periph_button.c
            periph_console.c
            periph_led.c
            periph_ppp.c
            periph_touch.c
            periph_web.c
            periph_ota.c
            tct_template.c
            lib/blufi/blufi.c
            lib/button/button.c
            lib/touch/touch.c
            lib/touch/kalman_filter.c
            lib/esp_sx8636/esp_sx8636.c
        )

idf_component_register(SRCS     ${srcs}
                       INCLUDE_DIRS include
                       PRIV_INCLUDE_DIRS lib/touch lib/blufi lib/button lib/esp_sx8636
                       PRIV_REQUIRES esp-tls mbedtls lwip tcp_transport app_update nvs_flash vfs jsmn fatfs console mdns
                       REQUIRES esp_http_client esp_http_server esp_timer bt main)
