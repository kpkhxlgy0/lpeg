LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := cch_lpeg_static
LOCAL_MODULE_FILENAME := lpeg
LOCAL_SRC_FILES := $(TARGET_ARCH_ABI)/liblpeg.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../../include
include $(PREBUILT_STATIC_LIBRARY)
