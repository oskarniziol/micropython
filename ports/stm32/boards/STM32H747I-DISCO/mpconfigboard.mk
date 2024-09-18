# For dual core HAL drivers.
CFLAGS += -DCORE_CM7

USE_MBOOT ?= 0

# MCU settings
MCU_SERIES = h7
CMSIS_MCU = STM32H747xx
MICROPY_FLOAT_IMPL = double
AF_FILE = boards/stm32h743_af.csv

ifeq ($(USE_MBOOT),1)
# When using Mboot all the text goes together after the filesystem
LD_FILES = boards/STM32H747I-DISCO/stm32h747.ld boards/common_blifs.ld
TEXT0_ADDR = 0x08020000
else
# When not using Mboot the ISR text goes first, then the rest after the filesystem
LD_FILES = boards/STM32H747I-DISCO/stm32h747.ld boards/common_ifs.ld
TEXT0_ADDR = 0x08000000
endif

# MicroPython settings
MICROPY_PY_LWIP = 1
MICROPY_PY_SSL = 1
MICROPY_SSL_MBEDTLS = 1
#MICROPY_PY_OPENAMP = 1
#MICROPY_PY_OPENAMP_REMOTEPROC = 1

FROZEN_MANIFEST = $(BOARD_DIR)/manifest.py
# MBEDTLS_CONFIG_FILE = '"$(BOARD_DIR)/mbedtls_config_board.h"'
