LOCAL_PATH := device/byd/dilink4

# 与实测可用的 v6 镜像完全一致: 两个 fstab 分工, 缺一不可。
#   recovery.fstab -> AOSP 风格(含 logical 逻辑分区), TWRP 主解析器用
#   twrp.fstab     -> TWRP 风格(display=/backup=/flashimg= 标志 + 显式 mapper 设备)
# TWRP 会依次 Process_Fstab("/etc/recovery.fstab",1) 和 ("/etc/twrp.fstab",2)。
# system-as-root 下 /etc == /system/etc, 两处都装。
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery.fstab:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/recovery.fstab \
    $(LOCAL_PATH)/recovery.fstab:$(TARGET_COPY_OUT_RECOVERY)/root/etc/recovery.fstab \
    $(LOCAL_PATH)/twrp.fstab:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/twrp.fstab \
    $(LOCAL_PATH)/twrp.fstab:$(TARGET_COPY_OUT_RECOVERY)/root/etc/twrp.fstab

# f2fs 用户态工具 (prebuilt, 模块定义见 device/byd/dilink4/Android.mk)
# 缺它们时: /data 能挂载(靠内核驱动), 但无法 fsck 修复 / 格式化 f2fs
PRODUCT_PACKAGES += \
    fsck.f2fs \
    make_f2fs
