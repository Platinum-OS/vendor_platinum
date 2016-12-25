# Brand
PRODUCT_BRAND ?= platinum

# Local path for prebuilts
LOCAL_PATH:= vendor/platinum/prebuilts/common/system

# Common build prop overrides 
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.android.dataroaming=false \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.setupwizard.rotation_locked=true \
    keyguard.no_require_sim=true \
    ro.facelock.black_timeout=400 \
    ro.facelock.det_timeout=1500 \
    ro.facelock.rec_timeout=2500 \
    ro.facelock.lively_timeout=2500 \
    ro.facelock.est_max_time=600 \
    ro.facelock.use_intro_anim=false \
    ro.build.selinux=1 \
    ro.adb.secure=0 \
    persist.sys.dun.override=0 \
    persist.service.adb.enable=1 \
    net.tethering.noprovisioning=true

# Pull in Prebuilt applications for phones
$(call inherit-product-if-exists, vendor/prebuilt/prebuilt.mk)

# Common overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/platinum/overlays/common

# Needed Packages
PRODUCT_PACKAGES += Launcher3

# Import library to fix trusted face issues
PRODUCT_PACKAGES += \
libprotobuf-cpp-full \

# Proprietary latinime libs needed for Keyboard swyping
ifneq ($(filter platinum_shamu platinum_hammerhead,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/lib/libjni_latinime.so:system/lib/libjni_latinime.so
else
PRODUCT_COPY_FILES += \
    vendor/platinum/prebuilts/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so
endif

# Enable sip+voip on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Blobs for media effects
 ifneq ($(filter platinum_shamu,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES +=  \
    $(LOCAL_PATH)/vendor/media/LMspeed_508.emd:system/vendor/media/LMspeed_508.emd \
    $(LOCAL_PATH)/vendor/media/PFFprec_600.emd:system/vendor/media/PFFprec_600.emd
endif

# Backuptool support
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/addon.d/50-platinum.sh:system/addon.d/50-platinum.sh \
    $(LOCAL_PATH)/bin/backuptool.functions:system/bin/backuptool.functions \
    $(LOCAL_PATH)/bin/backuptool.sh:system/bin/backuptool.sh

# Bootanimation support
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/bootanimation.zip:system/media/bootanimation.zip

## Don't compile SystemUITests
EXCLUDE_SYSTEMUI_TESTS := true
