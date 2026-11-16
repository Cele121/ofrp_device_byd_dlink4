LOCAL_PATH := device/byd/dilink4

# ---- fstab 两个文件, 分工不同, 缺一不可 ----
#
# 1) recovery.fstab -> 由 build/make 自动安装到 /system/etc/recovery.fstab
#    (它只认 $(TARGET_DEVICE_DIR)/recovery.fstab, 无需我们写拷贝规则)
#    内容: AOSP 格式, 负责 logical 逻辑分区映射 + 各分区设备路径
#
# 2) twrp.flags -> TWRP 真正的"标志文件"
#    TWRP 12.1 源码 partitionmanager.cpp:
#        fstabFile = fopen("/etc/twrp.flags", "rt");
#    注意不是 twrp.fstab! 名字写错 -> display=/backup=/flashimg= 全部失效,
#    表现为备份页列不出分区、无法从 UI 刷 img (run#10/#12 实测)。
#    内容: TWRP 格式, 负责显示名、备份、刷镜像、可格式化等标志
#
# 另: 绝不能把文件装到 recovery/root/etc/ 或 recovery/root/vendor/。
# 本机 system-as-root, 构建时 rsync 会把 out/.../root 同步到 recovery/root,
# 源目录里 etc、vendor 是符号链接; 我们若提前建成真实目录, rsync 会报
#   cannot delete non-empty directory: root/etc
# 直接失败 (run#7 实测)。
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/twrp.flags:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/twrp.flags
