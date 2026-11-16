# f2fs 用户态工具 -> 装进 recovery ramdisk
#
# 为什么不用 PRODUCT_PACKAGES += fsck.f2fs:
#   PRODUCT_PACKAGES 的模块装到 out/.../system (系统镜像)。本项目只出 recovery,
#   recovery ramdisk 只收 LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/... 的文件。
#   run#15 实测: 加了 PRODUCT_PACKAGES, 镜像体积 1 字节都没变 -> 工具没进包。
#
# 为什么模块名要加 _recovery 后缀:
#   external/f2fs-tools 已定义 fsck.f2fs / make_f2fs, 同名会报
#   "MODULE.TARGET.EXECUTABLES.fsck.f2fs already defined" (run#14 实测)。
#   用 LOCAL_MODULE_STEM 保证输出文件名仍是 fsck.f2fs / make_f2fs。
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := fsck_f2fs_recovery
LOCAL_MODULE_STEM := fsck.f2fs
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/system/bin
LOCAL_SRC_FILES := prebuilt/f2fs/fsck.f2fs
LOCAL_MULTILIB := 64
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := make_f2fs_recovery
LOCAL_MODULE_STEM := make_f2fs
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/system/bin
LOCAL_SRC_FILES := prebuilt/f2fs/make_f2fs
LOCAL_MULTILIB := 64
include $(BUILD_PREBUILT)
