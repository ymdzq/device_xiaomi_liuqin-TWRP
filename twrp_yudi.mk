#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Release name
PRODUCT_RELEASE_NAME := yudi

# 引用默认的编译配置文件，core_64_bit必须先于其他引用，否则不生效
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Enable virtual A/B OTA
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Configure emulated_storage.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Inherit from liuqin device
$(call inherit-product, device/xiaomi/liuqin/device.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := liuqin
PRODUCT_NAME := twrp_yudi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Xiaomi Pad 6 Max 14
PRODUCT_MANUFACTURER := Xiaomi

# Display
#TARGET_SCREEN_DENSITY := 400
#TARGET_SCREEN_HEIGHT := 2880
#TARGET_SCREEN_WIDTH := 1800
#TW_X_OFFSET := 180
#TW_W_OFFSET := -360
TW_FRAMERATE := 120
TW_ROTATION := 270

# Kernel modules
TW_LOAD_VENDOR_MODULES := "adsp_loader_dlkm.ko nt36532_touch.ko leds-qpnp-vibrator-ldo.ko msm_drm.ko qti_battery_charger_main.ko"

# Haptics
TW_SUPPORT_INPUT_AIDL_HAPTICS := true
TW_SUPPORT_INPUT_AIDL_HAPTICS_FQNAME := "IVibrator/vibratorfeature"
TW_SUPPORT_INPUT_AIDL_HAPTICS_FIX_OFF := true
