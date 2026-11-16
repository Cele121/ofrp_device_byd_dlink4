$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, vendor/twrp/config/common.mk)
$(call inherit-product, $(LOCAL_PATH)/device.mk)

PRODUCT_DEVICE := dilink4
PRODUCT_NAME := twrp_dilink4
PRODUCT_BRAND := BYD
PRODUCT_MODEL := DiLink4_0_For_BYD_AUTO
PRODUCT_MANUFACTURER := BYD

# ---- 关键: 强制构建 recovery 镜像 ----
# core/board_config.mk 中 BUILDING_RECOVERY_IMAGE 的置位条件:
#   ifdef BOARD_RECOVERYIMAGE_PARTITION_SIZE
#     ifeq (,$(filter true, $(TARGET_NO_KERNEL) $(TARGET_NO_RECOVERY)))
#       BUILDING_RECOVERY_IMAGE := true
#     endif
# 我们 TARGET_NO_KERNEL := true(内核从原厂镜像嫁接), 上述条件不成立
#  -> INSTALLED_RECOVERYIMAGE_TARGET 为空 -> recoveryimage 无依赖瞬间完成
#  -> OFRP 打包脚本静默产出不含镜像的空 zip (run#6 实测现象)
# PRODUCT_BUILD_RECOVERY_IMAGE 是官方旁路, 直接置位绕过该判断
PRODUCT_BUILD_RECOVERY_IMAGE := true
PRODUCT_BUILD_BOOT_IMAGE := false
