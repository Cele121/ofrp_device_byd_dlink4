LOCAL_PATH := device/byd/dilink4

# TWRP 12.1 读哪个 fstab 取决于版本/setup 阶段, 三处全装同一份最稳
# (twrp.fstab 含 display=/backup=/flashimg= 等 TWRP 专用 flag, recovery.fstab 没有)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/twrp.fstab:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/recovery.fstab \
    $(LOCAL_PATH)/twrp.fstab:$(TARGET_COPY_OUT_RECOVERY)/root/etc/twrp.fstab \
    $(LOCAL_PATH)/twrp.fstab:$(TARGET_COPY_OUT_RECOVERY)/root/etc/recovery.fstab
