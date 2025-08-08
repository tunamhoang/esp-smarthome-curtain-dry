#
# Component Makefile
#
# (Uses default behaviour of compiling all source files in directory, adding 'include' to include path.)
COMPONENT_ADD_INCLUDEDIRS := ./lz4/lib
COMPONENT_SRCDIRS :=  ./lz4/lib
COMPONENT_OBJS := ./lz4/lib/lz4.o
CPPFLAGS += -DLZ4_HEAPMODE
# COMPONENT_PRIV_INCLUDEDIRS := ./lib
