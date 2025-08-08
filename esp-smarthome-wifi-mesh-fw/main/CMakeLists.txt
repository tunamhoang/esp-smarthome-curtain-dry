idf_build_get_property(target IDF_TARGET)


file(GLOB MAIN_SOURCES *.c lib/pcf8551a/pcf8551a.c lib/segment_display/segment_display.c lib/vl6180/vl6180.c lib/ir websocket_client/websocket_client.c)
set(MAIN_INCLUDE_DIRS . include lib/pcf8551a lib/segment_display lib/vl6180 lib/ir websocket_client/include)

idf_component_register(SRCS ${MAIN_SOURCES}
                      INCLUDE_DIRS ${MAIN_INCLUDE_DIRS}
                      REQUIRES driver
                           nvs_flash
                           spi_flash
                           app_update
                           protobuf-c
                           protobuf
                           tcp_transport
                           esp_hw_support
                           esp_htu21df
                           esp_lz4
                           homebus
                           samsung_hvac
                           esp_peripherals
                           spiffs
                           json
                       )
