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

# Inherit some common DerpFest stuff.
$(call inherit-product, vendor/derp/config/common_full_phone.mk)

PRODUCT_NAME := derp_dubai
PRODUCT_DEVICE := dubai
PRODUCT_MANUFACTURER := motorola
PRODUCT_BRAND := motorola
PRODUCT_MODEL := motorola edge 30

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=dubai_g \
    PRIVATE_BUILD_DESC="dubai_g-user 13 T1RD33.116-33-12 d501e0 7757c release-keys"

BUILD_FINGERPRINT := motorola/dubai_g/dubai:13/T1RD33.116-33-12/d501e0-7757c:user/release-keys

# Remove unwanted packages
PRODUCT_PACKAGES += \
    RemovePackages

# Inherit some common Gapps stuff.
$(call inherit-product, vendor/gapps/arm64/arm64-vendor.mk)

BUILD_FINGERPRINT := motorola/dubai_g/dubai:13/T1RD33.116-33-3/f829db-a0c97:user/release-keys

# Remove unwanted packages
PRODUCT_PACKAGES += \
    RemovePackages

# Derp
WITH_GMS := true
TARGET_GAPPS_ARCH := arm64
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_FACE_UNLOCK_SUPPORTED := true
EXTRA_UDFPS_ANIMATIONS := true
TARGET_NOT_USES_BLUR := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_EXCLUDES_AUDIOFX := true
