#
# Copyright (C) 2023-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)


# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

# DebugFS
PRODUCT_SET_DEBUGFS_RESTRICTIONS := true

# Display
PRODUCT_PACKAGES += \
    vendor.qti.hardware.display.composer-service



# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Recovery
PRODUCT_PACKAGES += \
    init_xiaomi_stone.recovery


# Rootdir
PRODUCT_PACKAGES += \
    charger_fstab.qti \
    recovery.fstab


# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 31


LOCAL_PATH := $(call my-dir)

# Device uses dynamic partitions (matches your BoardConfig)
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Make sure this device dir is a Soong namespace (for prebuilt files if needed)
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# ------------------------------------------------------------------
# Prebuilt recovery root from root/
# ------------------------------------------------------------------

# /root/bin
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/root/bin/init.class_main.sh:$(TARGET_COPY_OUT_RECOVERY)/root/bin/init.class_main.sh \
    $(LOCAL_PATH)/root/bin/init.kernel.post_boot-blair.sh:$(TARGET_COPY_OUT_RECOVERY)/root/bin/init.kernel.post_boot-blair.sh \
    $(LOCAL_PATH)/root/bin/init.qcom.early_boot.sh:$(TARGET_COPY_OUT_RECOVERY)/root/bin/init.qcom.early_boot.sh \
    $(LOCAL_PATH)/root/bin/init.qcom.sh:$(TARGET_COPY_OUT_RECOVERY)/root/bin/init.qcom.sh \
    $(LOCAL_PATH)/root/bin/init.qti.early_init.sh:$(TARGET_COPY_OUT_RECOVERY)/root/bin/init.qti.early_init.sh \
    $(LOCAL_PATH)/root/bin/init.qti.kernel.sh:$(TARGET_COPY_OUT_RECOVERY)/root/bin/init.qti.kernel.sh \
    $(LOCAL_PATH)/root/bin/vendor_modprobe.sh:$(TARGET_COPY_OUT_RECOVERY)/root/bin/vendor_modprobe.sh

# /root/etc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/root/etc/charger_fstab.qti:$(TARGET_COPY_OUT_RECOVERY)/root/etc/charger_fstab.qti \
    $(LOCAL_PATH)/root/etc/init.qcom.rc:$(TARGET_COPY_OUT_RECOVERY)/root/etc/init.qcom.rc \
    $(LOCAL_PATH)/root/etc/init.qti.kernel.rc:$(TARGET_COPY_OUT_RECOVERY)/root/etc/init.qti.kernel.rc \
    $(LOCAL_PATH)/root/etc/init.recovery.qcom.rc:$(TARGET_COPY_OUT_RECOVERY)/root/etc/init.recovery.qcom.rc \
    $(LOCAL_PATH)/root/etc/init.stnfc.rc:$(TARGET_COPY_OUT_RECOVERY)/root/etc/init.stnfc.rc \
    $(LOCAL_PATH)/root/etc/init.target.rc:$(TARGET_COPY_OUT_RECOVERY)/root/etc/init.target.rc \
    $(LOCAL_PATH)/root/etc/ueventd.qcom.rc:$(TARGET_COPY_OUT_RECOVERY)/root/etc/ueventd.qcom.rc

# /root/system/bin
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/root/system/bin/android.hardware.gatekeeper@1.0-service-qti:$(TARGET_COPY_OUT_RECOVERY)/root/system/bin/android.hardware.gatekeeper@1.0-service-qti \
    $(LOCAL_PATH)/root/system/bin/android.hardware.keymaster@4.1-service-qti:$(TARGET_COPY_OUT_RECOVERY)/root/system/bin/android.hardware.keymaster@4.1-service-qti \
    $(LOCAL_PATH)/root/system/bin/qseecomd:$(TARGET_COPY_OUT_RECOVERY)/root/system/bin/qseecomd

# /root/system/etc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/root/system/etc/powerhint.json:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/powerhint.json \
    $(LOCAL_PATH)/root/system/etc/recovery.fstab:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/recovery.fstab \
    $(LOCAL_PATH)/root/system/etc/task_profiles.json:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/task_profiles.json \
    $(LOCAL_PATH)/root/system/etc/twrp.flags:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/twrp.flags

# /root/vendor/etc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/root/vendor/etc/charger_fstab.qti:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/etc/charger_fstab.qti \
    $(LOCAL_PATH)/root/vendor/etc/gpfspath_oem_config.xml:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/etc/gpfspath_oem_config.xml \
    $(LOCAL_PATH)/root/vendor/etc/vintf/compatibility_matrix.xml:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/etc/vintf/compatibility_matrix.xml \
    $(LOCAL_PATH)/root/vendor/etc/vintf/manifest.xml:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/etc/vintf/manifest.xml \
    $(LOCAL_PATH)/root/vendor/etc/vintf/manifest/android.hardware.boot@1.1.xml:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/etc/vintf/manifest/android.hardware.boot@1.1.xml \
    $(LOCAL_PATH)/root/vendor/etc/vintf/manifest/android.hardware.health@2.1.xml:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/etc/vintf/manifest/android.hardware.health@2.1.xml \
    $(LOCAL_PATH)/root/vendor/etc/vintf/manifest/android.hardware.usb@1.2-service.xml:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/etc/vintf/manifest/android.hardware.usb@1.2-service.xml \
    $(LOCAL_PATH)/root/vendor/etc/vintf/manifest/power.xml:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/etc/vintf/manifest/power.xml

# /root/vendor/ueventd.rc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/root/vendor/ueventd.rc:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/ueventd.rc

# /root/vendor/lib64
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/root/vendor/lib64/libGPreqcancel.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libGPreqcancel.so \
    $(LOCAL_PATH)/root/vendor/lib64/libGPreqcancel_svc.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libGPreqcancel_svc.so \
    $(LOCAL_PATH)/root/vendor/lib64/libQSEEComAPI.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libQSEEComAPI.so \
    $(LOCAL_PATH)/root/vendor/lib64/libcurl.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libcurl.so \
    $(LOCAL_PATH)/root/vendor/lib64/libdiag.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libdiag.so \
    $(LOCAL_PATH)/root/vendor/lib64/libdisplayconfig.qti.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libdisplayconfig.qti.so \
    $(LOCAL_PATH)/root/vendor/lib64/libdrm.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libdrm.so \
    $(LOCAL_PATH)/root/vendor/lib64/libdrmfs.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libdrmfs.so \
    $(LOCAL_PATH)/root/vendor/lib64/libdrmtime.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libdrmtime.so \
    $(LOCAL_PATH)/root/vendor/lib64/libhidltransport.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libhidltransport.so \
    $(LOCAL_PATH)/root/vendor/lib64/libhwbinder.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libhwbinder.so \
    $(LOCAL_PATH)/root/vendor/lib64/libjsoncpp.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libjsoncpp.so \
    $(LOCAL_PATH)/root/vendor/lib64/libkeymasterdeviceutils.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libkeymasterdeviceutils.so \
    $(LOCAL_PATH)/root/vendor/lib64/libkeymasterprovision.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libkeymasterprovision.so \
    $(LOCAL_PATH)/root/vendor/lib64/libkeymasterutils.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libkeymasterutils.so \
    $(LOCAL_PATH)/root/vendor/lib64/libkeystore-engine-wifi-hidl.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libkeystore-engine-wifi-hidl.so \
    $(LOCAL_PATH)/root/vendor/lib64/libkeystore-wifi-hidl.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libkeystore-wifi-hidl.so \
    $(LOCAL_PATH)/root/vendor/lib64/libops.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libops.so \
    $(LOCAL_PATH)/root/vendor/lib64/libqcbor.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libqcbor.so \
    $(LOCAL_PATH)/root/vendor/lib64/libqdutils.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libqdutils.so \
    $(LOCAL_PATH)/root/vendor/lib64/libqisl.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libqisl.so \
    $(LOCAL_PATH)/root/vendor/lib64/libqservice.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libqservice.so \
    $(LOCAL_PATH)/root/vendor/lib64/libqti_vndfwk_detect.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libqti_vndfwk_detect.so \
    $(LOCAL_PATH)/root/vendor/lib64/libqtikeymaster4.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libqtikeymaster4.so \
    $(LOCAL_PATH)/root/vendor/lib64/librecovery_updater.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/librecovery_updater.so \
    $(LOCAL_PATH)/root/vendor/lib64/librecovery_updater_msm.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/librecovery_updater_msm.so \
    $(LOCAL_PATH)/root/vendor/lib64/librpmb.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/librpmb.so \
    $(LOCAL_PATH)/root/vendor/lib64/libsecureui_svcsock.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libsecureui_svcsock.so \
    $(LOCAL_PATH)/root/vendor/lib64/libsoc_helper.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libsoc_helper.so \
    $(LOCAL_PATH)/root/vendor/lib64/libspcom.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libspcom.so \
    $(LOCAL_PATH)/root/vendor/lib64/libspl.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libspl.so \
    $(LOCAL_PATH)/root/vendor/lib64/libsqlite.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libsqlite.so \
    $(LOCAL_PATH)/root/vendor/lib64/libssd.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libssd.so \
    $(LOCAL_PATH)/root/vendor/lib64/libtime_genoff.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libtime_genoff.so \
    $(LOCAL_PATH)/root/vendor/lib64/libvndfwk_detect_jni.qti.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libvndfwk_detect_jni.qti.so \
    $(LOCAL_PATH)/root/vendor/lib64/vendor.display.config@1.0.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/vendor.display.config@1.0.so \
    $(LOCAL_PATH)/root/vendor/lib64/vendor.display.config@2.0.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/vendor.display.config@2.0.so \
    $(LOCAL_PATH)/root/vendor/lib64/vendor.qti.hardware.tui_comm@1.0.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/vendor.qti.hardware.tui_comm@1.0.so \
    $(LOCAL_PATH)/root/vendor/lib64/vendor.qti.hardware.wifi.keystore@1.0.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/vendor.qti.hardware.wifi.keystore@1.0.so

# /root/vendor/lib64/hw
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/root/vendor/lib64/hw/android.hardware.usb-service.qti:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/hw/android.hardware.usb-service.qti