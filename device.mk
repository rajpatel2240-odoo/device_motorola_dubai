#
# Copyright (C) 2022 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# A/B
TARGET_IS_VAB := true

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Screen
TARGET_SCREEN_DENSITY := 400

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 400dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

PRODUCT_SHIPPING_API_LEVEL := 31

# Inherit from motorola sm7325-common
$(call inherit-product, device/motorola/sm7325-common/common.mk)

# Overlay
PRODUCT_PACKAGES += \
    FrameworksResDubai \
    LineageSystemUIDubai \
    NfcResDubai \
    SettingsResDubai \
    SettingsProviderResDubai \
    SystemUIResDubai \
    WifiResDubai

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/sku_yupik/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_yupik/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/sku_yupik/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_yupik/mixer_paths.xml \
    $(LOCAL_PATH)/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/audio_ext_spkr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_ext_spkr.conf \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# Camera
PRODUCT_PACKAGES += \
    DubaiCameraService \
    libgui_shim_vendor

# Dex/ART optimization
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := everything
USE_DEX2OAT_DEBUG := false

# Display
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/display_id_4630947043778501762.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_4630947043778501762.xml

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.dubai

# Firmware
$(call inherit-product-if-exists, vendor/motorola/dubai-firmware/dubai/config.mk)

# Init
$(foreach f,$(wildcard $(LOCAL_PATH)/rootdir/etc/init/hw/*.rc),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/$(notdir $f)))
$(foreach f,$(wildcard $(LOCAL_PATH)/rootdir/etc/init/*.rc),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/etc/init/$(notdir $f)))
$(foreach f,$(wildcard $(LOCAL_PATH)/rootdir/bin/*.sh),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/bin/$(notdir $f)))

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/goodix_ts.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/goodix_ts.kl

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_codecs_dolby_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_dolby_audio.xml \
    $(LOCAL_PATH)/media/media_codecs_performance_yupik_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_yupik_v1.xml \
    $(LOCAL_PATH)/media/media_codecs_yupik_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_yupik_v1.xml \
    $(LOCAL_PATH)/media/media_profiles_yupik_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_yupik_v1.xml

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2.vendor \
    android.hardware.nfc@1.2-service.st \
    android.hardware.secure_element@1.2.vendor \
    com.android.nfc_extras \
    libchrome.vendor \
    NfcNci \
    Tag \
    nfc_nci.st21nfc.default

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml

# Sensors
PRODUCT_PACKAGES += \
    sensors.dubai

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal-engine-dubai-game-perf.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine-dubai.conf

# Inherit from vendor blobs
$(call inherit-product, vendor/motorola/dubai/dubai-vendor.mk)

# #BCR
# $(call inherit-product, vendor/bcr/bcr.mk)