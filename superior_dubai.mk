#
# Copyright (C) 2022-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from dubai device
$(call inherit-product, device/motorola/dubai/device.mk)

# Inherit some common superior stuff.
$(call inherit-product, vendor/superior/config/common.mk)

PRODUCT_NAME := superior_dubai
PRODUCT_DEVICE := dubai
PRODUCT_MANUFACTURER := Motorola
PRODUCT_BRAND := Motorola
PRODUCT_MODEL := Motorola Edge 30

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=dubai_g \
    PRIVATE_BUILD_DESC="dubai_g-user 13 T1RD33.116-33-13 441420-2d5de8 release-keys"

#SuperiorExtended
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_SHIPS_PREBUILT_GCAM := false
TARGET_INCLUDE_MATLOG := true
USE_MOTO_CALCULATOR := true
TARGET_SUPPORTS_BLUR := true
SUPERIOR_UDFPS_ANIMATIONS := true
USE_MOTO_CLOCK := true
SYSTEM_OPTIMIZE_JAVA := true
SYSTEMUI_OPTIMIZE_JAVA := true
BUILD_WITH_GAPPS := true
USE_QUICKPIC := true
USE_DUCKDUCKGO := false
USE_ViaBrowser := false
TARGET_BUILD_VIMUSIC := false