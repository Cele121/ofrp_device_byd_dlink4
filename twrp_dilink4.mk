$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, vendor/twrp/config/common.mk)
$(call inherit-product, $(LOCAL_PATH)/device.mk)

PRODUCT_DEVICE := dilink4
PRODUCT_NAME := twrp_dilink4
PRODUCT_BRAND := BYD
PRODUCT_MODEL := DiLink4_0_For_BYD_AUTO
PRODUCT_MANUFACTURER := BYD
