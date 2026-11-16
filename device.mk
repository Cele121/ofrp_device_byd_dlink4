LOCAL_PATH := device/byd/dilink4

# 与实测可用的 v6 镜像保持完全一致。
#
# 关键教训(run#7): 绝不能把文件装到 recovery/root/etc/ 或 recovery/root/vendor/。
# 本机是 system-as-root 布局, 构建时 rsync 要把 out/.../root 同步到 recovery/root,
# 而源目录里的 etc、vendor 是符号链接(指向 /system/...)。若我们提前在这些位置
# 创建了真实目录, rsync 会用
#   could not make way for new symlink: root/etc
#   cannot delete non-empty directory: root/etc
# 直接失败(code 23), 整个构建在 99% 处中断。
#
# recovery.fstab 由 build/make 自动拷贝(它只看 $(TARGET_DEVICE_DIR)/recovery.fstab),
# 所以这里只需要处理 twrp.fstab。
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/twrp.fstab:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/twrp.fstab
