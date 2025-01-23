#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Release name
PRODUCT_RELEASE_NAME := mondrian

# Inherit from those products. Most specific first.
# 引用默认的编译配置文件，core_64_bit必须先于其他引用，否则不生效
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Enable virtual A/B OTA
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Configure emulated_storage.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from mondrian device
$(call inherit-product, device/xiaomi/liuqin/device.mk)

PRODUCT_DEVICE := liuqin
PRODUCT_NAME := twrp_mondrian
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi K60
PRODUCT_MANUFACTURER := Xiaomi

# Display
TW_FRAMERATE := 120
TW_Y_OFFSET := 99
TW_H_OFFSET := -99

# Kernel modules
TW_LOAD_VENDOR_MODULES := "adsp_loader_dlkm.ko goodix_core.ko leds-qpnp-vibrator-ldo.ko msm_drm.ko qti_battery_charger_main_m81.ko"

# Haptics
TW_SUPPORT_INPUT_AIDL_HAPTICS := true
TW_SUPPORT_INPUT_AIDL_HAPTICS_FQNAME := "IVibrator/vibratorfeature"
TW_SUPPORT_INPUT_AIDL_HAPTICS_FIX_OFF := true
