# 预编译 f2fs 工具 -- 来自实测能在本车运行的 v6 ramdisk
#
# 为什么用 prebuilt 而不是 external/f2fs-tools 源码构建:
#   - minimal manifest 里没有 external/f2fs-tools, 源码编译要连带 libselinux/libcutils
#     等依赖链, 引入新变量
#   - 这两个二进制来自 v6 镜像, 而 v6 是在这台车上实际启动过的, 兼容性有实证
#   - 已核对动态库依赖, 镜像内全部满足:
#       fsck.f2fs / make_f2fs -> libext2_uuid libsparse libbase libc++ libc libm libdl
#     (sload_f2fs 额外需要 liblz4, 本包未包含; 它是刷稀疏镜像用的, 修复/格式化不需要)
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := fsck.f2fs
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_SUFFIX :=
LOCAL_SRC_FILES := prebuilt/f2fs/fsck.f2fs
LOCAL_MULTILIB := 64
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := make_f2fs
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_SUFFIX :=
LOCAL_SRC_FILES := prebuilt/f2fs/make_f2fs
LOCAL_MULTILIB := 64
include $(BUILD_PREBUILT)
