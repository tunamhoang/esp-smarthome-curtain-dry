#
# Main component makefile.
#
# This Makefile can be left empty. By default, it will take the sources in the
# src/ directory, compile them and link them into lib(subdirectory_name).a
# in the build directory. This behaviour is entirely configurable,
# please read the ESP-IDF documents if you need to do this.
#
COMPONENT_SRCDIRS :=  . ./lib/cc1101 ./lib/pcf8551a ./lib/vl6180 ./lib/segment_display ./lib/ir/
COMPONENT_PRIV_INCLUDEDIRS := ./include . ./lib/cc1101 ./lib/pcf8551a ./lib/vl6180 ./lib/segment_display ./lib/ir/
