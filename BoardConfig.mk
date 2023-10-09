#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Include the common OEM chipset BoardConfig.
include device/samsung/sm8550-common/BoardConfigCommon.mk

DEVICE_PATH := device/samsung/dm3q

# Assert
TARGET_OTA_ASSERT_DEVICE := dm3q

# Display
TARGET_SCREEN_DENSITY := 450

# Prebuilt kernel
TARGET_KERNEL_DIR := $(DEVICE_PATH)-kernel
KERNEL_MODULE_DIR := $(TARGET_KERNEL_DIR)/modules

BOARD_PREBUILT_DTBIMAGE_DIR := $(TARGET_KERNEL_DIR)
BOARD_PREBUILT_DTBOIMAGE := $(TARGET_KERNEL_DIR)/dtbo.img
TARGET_PREBUILT_KERNEL := $(TARGET_KERNEL_DIR)/kernel

# Kernel modules
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(TARGET_KERNEL_DIR)/modules/vendor/modules.load))
BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE :=  $(TARGET_KERNEL_DIR)/modules/vendor/modules.blocklist
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat  $(TARGET_KERNEL_DIR)/modules/ramdisk/modules.load))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_BLOCKLIST_FILE := $(TARGET_KERNEL_DIR)/modules/ramdisk/modules.blocklist
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(TARGET_KERNEL_DIR)/modules/ramdisk/modules.load.recovery))

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(TARGET_KERNEL_DIR)/modules/vendor/,$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules) \
    $(call find-copy-subdir-files,*,$(TARGET_KERNEL_DIR)/modules/ramdisk/,$(TARGET_COPY_OUT_VENDOR_RAMDISK)/lib/modules) \
    $(call find-copy-subdir-files,*,$(TARGET_KERNEL_DIR)/modules/system/,$(TARGET_COPY_OUT_SYSTEM_DLKM)/lib/modules/5.15.78-android13-8-27100863-abS918BXXS3AWHR)

# Include the proprietary files BoardConfig.
include vendor/samsung/dm3q/BoardConfigVendor.mk
