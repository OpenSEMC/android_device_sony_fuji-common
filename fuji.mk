# Copyright (C) 2012 FXP (FreeXperia)
# Copyright (C) 2013 The Open SEMC Team
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/sony/fuji-common/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# WiFi direct (P2P)
#PRODUCT_COPY_FILES += \
#    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml

# Common Qualcomm scripts
PRODUCT_COPY_FILES += \
    device/sony/fuji-common/rootdir/system/etc/init.qcom.efs.sync.sh:system/etc/init.qcom.efs.sync.sh

# Common Fuji media configs
PRODUCT_COPY_FILES += \
    device/sony/fuji-common/rootdir/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
    device/sony/fuji-common/rootdir/system/etc/media_profiles.xml:system/etc/media_profiles.xml

# QCOM Display
PRODUCT_PACKAGES += \
    copybit.msm8660 \
    gralloc.msm8660 \
    hwcomposer.msm8660 \
    libgenlock \
    libmemalloc \
    liboverlay \
    libqdutils \
    libtilerenderer \
    libI420colorconvert

# Omx
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libc2dcolorconvert \
    libdashplayer \
    libdivxdrmdecrypt \
    libmm-omxcore \
    libstagefrighthw

# NFC Support
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := device/sony/fuji-common/rootdir/system/etc/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := device/sony/fuji-common/rootdir/system/etc/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio_policy.msm8660 \
    audio.primary.msm8660 \
    audio.usb.default
    #audio_policy.conf

# GPS
PRODUCT_PACKAGES += \
    gps.msm8660 \
    librpc

# Light
PRODUCT_PACKAGES += \
    lights.msm8660

# Bluetooth
PRODUCT_PACKAGES += \
    libbt-vendor \
    libbluedroid \
    brcm_patchram_plus

# Bluetooth vendor config
PRODUCT_COPY_FILES += \
    device/sony/fuji-common/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Power HAL
PRODUCT_PACKAGES += \
    power.fuji

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Custom init / uevent
PRODUCT_COPY_FILES += \
    device/sony/fuji-common/rootdir/init.semc.rc:root/init.semc.rc \
    device/sony/fuji-common/rootdir/system/etc/init.fixbt.sh:system/etc/init.fixbt.sh \
    device/sony/fuji-common/rootdir/ueventd.semc.rc:root/ueventd.semc.rc

# Audio policy config
PRODUCT_COPY_FILES += \
    device/sony/fuji-common/config/audio_policy.conf:system/etc/audio_policy.conf

# Post recovery script
PRODUCT_COPY_FILES += \
    device/sony/fuji-common/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

# CNE config
PRODUCT_COPY_FILES += \
   device/sony/fuji-common/rootdir/system/etc/OperatorPolicy.xml:system/etc/OperatorPolicy.xml \
   device/sony/fuji-common/rootdir/system/etc/UserPolicy.xml:system/etc/UserPolicy.xml

# Thermal monitor configuration
PRODUCT_COPY_FILES += \
    device/sony/fuji-common/rootdir/system/etc/thermald-semc.conf:system/etc/thermald-semc.conf

# Xperia Settings (sony-common)
#PRODUCT_PACKAGES += \
#    XperiaSettings

# Extract recovery ramdisks (sony-common)
PRODUCT_PACKAGES += \
    extract_elf_ramdisk

# Wifi
PRODUCT_COPY_FILES += \
    device/sony/fuji-common/rootdir/system/etc/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    device/sony/fuji-common/rootdir/system/etc/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=SonyQualcommRIL \
    ro.telephony.ril.v3=skippinpukcount,qcomdsds \
    ro.telephony.call_ring.multiple=false \
    persist.rild.nitz_plmn= \
    persist.rild.nitz_long_ons_0= \
    persist.rild.nitz_long_ons_1= \
    persist.rild.nitz_long_ons_2= \
    persist.rild.nitz_long_ons_3= \
    persist.rild.nitz_short_ons_0= \
    persist.rild.nitz_short_ons_1= \
    persist.rild.nitz_short_ons_2= \
    persist.rild.nitz_short_ons_3= \
    ril.subscription.types=NV,RUIM \
    DEVICE_PROVISIONED=1 \
    keyguard.no_require_sim=1 \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.use_data_netmgrd=true \
    ro.ril.transmitpower=true

#### Goo Manager support
PRODUCT_PROPERTY_OVERRIDES += \
    ro.goo.developerid=RaymanFX \
    ro.goo.board=$(subst full_,,$(TARGET_PRODUCT)) \
    ro.goo.rom=opensemc_cm \
    ro.goo.version=$(shell date +%s)

# QCOM
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true

# QC Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/system/lib/libqc-opt.so

# Qualcomm random numbers generated
PRODUCT_PACKAGES += qrngd

# OpenGL ES
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    debug.egl.hw=1 \
    debug.sf.hw=1 \
    persist.hwc.mdpcomp.enable=true \
    debug.composition.type=dyn \
    debug.mdpcomp.maxlayer=3 \
    debug.mdpcomp.logs=0

#MR2
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bq.gpu_to_cpu_unsupported=1

# More display props - double check these!
PRODUCT_PROPERTY_OVERRIDES += \
    dev.pm.dyn_samplingrate=1 \
    debug.hwc.dynThreshold=1.9

# Low Power Audio Decoding
#PRODUCT_PROPERTY_OVERRIDES += \
    lpa.decode=false

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

# Include non-opensource parts if available
$(call inherit-product-if-exists, vendor/sony/fuji-common-caf/fuji-common-vendor.mk)
