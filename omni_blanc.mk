#
# Copyright 2012 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)

# Get the prebuilt list of APNs
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

PRODUCT_PACKAGES += \
    charger_res_images \
    charger

PRODUCT_COPY_FILES += \
    device/huawei/blanc/dummykernel:kernel

# Recovery ramdisk, libraries and modules.
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/rootdir/modprobe:recovery/root/sbin/modprobe \
	$(LOCAL_PATH)/rootdir/modprobe_static:recovery/root/sbin/modprobe_static \
	$(LOCAL_PATH)/rootdir/oeminfo_nvm_server:recovery/root/sbin/oeminfo_nvm_server \
	$(LOCAL_PATH)/rootdir/teecd:recovery/root/sbin/teecd \
	$(LOCAL_PATH)/rootdir/toybox_static:recovery/root/sbin/toybox_static \

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
ro.build.version.sdk=  \
ro.build.version.release=  \
ro.build.version.security_patch= 


	
ALLOW_MISSING_DEPENDENCIES := true	

PRODUCT_NAME := omni_blanc
PRODUCT_DEVICE := blanc
PRODUCT_BRAND := kirin970
PRODUCT_MODEL := Mate 10 Pro
PRODUCT_MANUFACTURER := Huawei

# Kernel inline build
#TARGET_KERNEL_CONFIG := blanc_defconfig
#TARGET_VARIANT_CONFIG := blanc_defconfig
#TARGET_SELINUX_CONFIG := blanc_defconfig
