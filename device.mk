LOCAL_PATH := device/byd/dilink4

# ============ fstab 两个文件, 分工不同 ============
#
# 1) recovery.fstab -> build/make 自动安装到 /system/etc/recovery.fstab
#    (它只认 $(TARGET_DEVICE_DIR)/recovery.fstab, 不需要我们写拷贝规则)
#    AOSP 格式, 负责 logical 逻辑分区映射 + 各分区设备路径。
#
# 2) twrp.flags -> TWRP 真正的标志文件
#    TWRP 12.1 partitionmanager.cpp:
#        fstabFile = fopen("/etc/twrp.flags", "rt");
#    不是 twrp.fstab! 名字写错 -> display=/backup=/flashimg= 全失效,
#    表现为备份页列不出分区、无法从 UI 刷 img。
#
# ★ 绝不能装到 recovery/root/etc/ 或 recovery/root/vendor/:
#   本机 system-as-root, 构建时 rsync 同步 out/.../root 到 recovery/root,
#   源目录 etc/vendor 是符号链接; 若提前建成真实目录, rsync 报
#   "cannot delete non-empty directory: root/etc" 直接失败。
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/twrp.flags:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/twrp.flags

# ============ f2fs 用户态工具 ============
# 模块定义见 device/byd/dilink4/Android.mk (prebuilt, 取自实测可用的 v6 镜像)
# 缺它们时 /data 仍能挂载(靠内核 f2fs 驱动), 但无法 fsck 修复 / 格式化
PRODUCT_PACKAGES += \
    fsck_f2fs_recovery \
    make_f2fs_recovery
