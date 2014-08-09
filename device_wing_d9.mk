$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/softwinners/wing_d9/wing_d9-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/softwinners/wing_d9/overlay

LOCAL_PATH := device/softwinners/wing_d9
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_NAME := full_wing_d9
PRODUCT_DEVICE := wing_d9

# Custom stuff
PRODUCT_COPY_FILES += \
	device/softwinners/wing_d9/modules/disp.ko:recovery/root/disp.ko \
	device/softwinners/wing_d9/modules/hdmi.ko:recovery/root/hdmi.ko \
	device/softwinners/wing_d9/modules/lcd.ko:recovery/root/lcd.ko \
	device/softwinners/wing_d9/modules/nand.ko:recovery/root/nand.ko \
	device/softwinners/wing_d9/modules/gslX680.ko:recovery/root/gslX680.ko \
	device/softwinners/wing_d9/extra/init_partitions.sh:recovery/root/sbin/init_partitions.sh \
	device/softwinners/wing_d9/extra/ueventd.sun7i.rc:recovery/root/ueventd.sun7i.rc
