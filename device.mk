#
# Copyright (C) 2015 The CyanogenMod Project
# Copyright (C) 2018 The LineageOS Project
# Copyright (C) 2020 The LineageOS Project
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

LOCAL_PATH := device/oppo/a37f

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Inherit from msm8939-common
$(call inherit-product, device/oppo/msm8939-common/msm8939.mk)

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/mixer_paths_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_mtp.xml

# ACDB Loader calibration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/aanc_tuning_mixer.txt:system/etc/aanc_tuning_mixer.txt \
    $(LOCAL_PATH)/audio/acdbdata/Bluetooth_cal.acdb:system/etc/acdbdata/15399/Bluetooth_cal.acdb \
    $(LOCAL_PATH)/audio/acdbdata/General_cal.acdb:system/etc/acdbdata/15399/General_cal.acdb \
    $(LOCAL_PATH)/audio/acdbdata/Global_cal.acdb:system/etc/acdbdata/15399/Global_cal.acdb \
    $(LOCAL_PATH)/audio/acdbdata/Handset_cal.acdb:system/etc/acdbdata/15399/Handset_cal.acdb \
    $(LOCAL_PATH)/audio/acdbdata/Hdmi_cal.acdb:system/etc/acdbdata/15399/Hdmi_cal.acdb \
    $(LOCAL_PATH)/audio/acdbdata/Headset_cal.acdb:system/etc/acdbdata/15399/Headset_cal.acdb \
    $(LOCAL_PATH)/audio/acdbdata/Speaker_cal.acdb:system/etc/acdbdata/15399/Speaker_cal.acdb \
    $(LOCAL_PATH)/audio/acdbdata/WorkspaceFile.qwsp:system/etc/acdbdata/15399/WorkspaceFile.qwsp

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xxhdpi-3072-dalvik-heap.mk)

# Density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320

# Factory reset protection
PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/platform/soc.0/7824900.sdhci/by-name/config

# Input configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/synaptics_dsx.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/synaptics_dsx.kl \
    $(LOCAL_PATH)/keylayout/synaptics_rmi4_i2c.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/synaptics_rmi4_i2c.kl

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.rc

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/vendor/lib64/libril-qc-qmi-1.so \
    ro.telephony.default_network=9,9 \
    persist.radio.multisim.config=dsds

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

# Call the proprietary setup
$(call inherit-product, vendor/oppo/a37f/a37f-vendor.mk)
