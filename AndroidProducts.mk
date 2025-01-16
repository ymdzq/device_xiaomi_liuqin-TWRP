#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/twrp_liuqin.mk \
    $(LOCAL_DIR)/twrp_yudi.mk

COMMON_LUNCH_CHOICES := \
    twrp_liuqin-user \
    twrp_liuqin-userdebug \
    twrp_liuqin-eng \
    twrp_yudi-user \
    twrp_yudi-userdebug \
    twrp_yudi-eng
