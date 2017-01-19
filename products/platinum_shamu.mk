# Inherit AOSP device configuration for mako
$(call inherit-product, device/moto/shamu/aosp_shamu.mk)

# Inherit common product files
$(call inherit-product, vendor/platinum/configs/common.mk)

# Setup device specific product configuration
PRODUCT_NAME := platinum_shamu
PRODUCT_BRAND := google
PRODUCT_DEVICE := shamu
PRODUCT_MODEL := Nexus 6
PRODUCT_MANUFACTURER := motorola

# Build prop fingerprint overrides
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME="shamu" BUILD_FINGERPRINT="google/shamu/shamu:7.0/NBD90Z/3254009:user/release-keys" PRIVATE_BUILD_DESC="shamu-user 7.0 NBD90Z 3254009 release-keys"
