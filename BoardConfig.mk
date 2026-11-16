# BYD DiLink 4.0 (Lagoon/SM6350, ro.board.platform=lito) - TWRP 3.7.x
# 全部参数均为本机实测验证值，改动前请先读 kit 里的 AI_BRIEF.md
DEVICE_PATH := device/byd/dilink4

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a76
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_VARIANT := cortex-a75
TARGET_BOARD_PLATFORM := lito
TARGET_BOOTLOADER_BOARD_NAME := DiLink4.0
TARGET_USES_64_BIT_BINDER := true

# 不编内核: 用 BYD 原厂 kernel (4.19.81-perf)
TARGET_NO_KERNEL := true
BOARD_USES_RECOVERY_AS_BOOT := false
AB_OTA_UPDATER := true

# 分区 / 文件系统
BOARD_USES_METADATA_PARTITION := true
TARGET_USES_MKE2FS := true
TW_INCLUDE_F2FS := true

# 关键: 本机 ro.crypto.state=unencrypted, 必须关掉加密/FBE
# (开着会让 TWRP 的 Set_FBE_Status() 把 /data 标记成加密, 容量恒 0)
TW_INCLUDE_CRYPTO := false
TW_INCLUDE_FBE := false
TW_INCLUDE_FBE_METADATA_DECRYPT := false

# 动态分区 (super @ sda8, 内含 system/vendor/product)
TW_INCLUDE_LOGICAL := true
TW_INCLUDE_FASTBOOTD := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true

# 显示: 无 /dev/fb0, 只走 DRM (3.6+ 原生支持, 不需要移植者的 libfbdrm 垫片)
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
TW_THEME := landscape_hdpi
TW_SCREEN_BLANK_ON_BOOT := false
TW_NO_SCREEN_TIMEOUT := true
TW_BRIGHTNESS_PATH := /sys/class/backlight/panel0-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 110

# 车机没有振动马达 (/sys/class/timed_output 不存在)
TW_NO_VIBRATOR := true

# 存储
RECOVERY_SDCARD_ON_DATA := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/usb_otg"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "usb_otg"

TW_EXCLUDE_TWRPAPP := true
TW_USE_TOOLBOX := true
TW_DEVICE_VERSION := dilink4
TW_DEFAULT_LANGUAGE := zh_CN

# ===== OrangeFox =====
TW_INCLUDE_NANO := true
TW_SKIP_DATA_CHECK := true
OF_DEFAULT_LANGUAGE := zh_CN
OF_DISABLE_MIUI_SPECIFIC_FEATURES := 1
OF_BUILD_TYPE := Unofficial
OF_MAINTAINER := Cele121
OF_DEVICE := dilink4
