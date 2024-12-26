LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SDK_VERSION := 21

LOCAL_MODULE := libxcb

LOCAL_C_INCLUDES := \
	swallow/xorg/proto/xorgproto/include \
	swallow/xorg/lib/libfontenc/include \
	swallow/xorg/lib/libxtrans \
	swallow/xorg/lib/libXau/include \
	swallow/xorg/lib/libXdmcp/include \
	$(LOCAL_PATH) \
	$(LOCAL_PATH)/src

LOCAL_CFLAGS := -DHAVE_CONFIG_H 

LOCAL_SRCS := 	\
	src/*.c \

LOCAL_SRC_FILES := \
	$(foreach F, $(LOCAL_SRCS), $(addprefix $(dir $(F)),$(notdir $(wildcard $(LOCAL_PATH)/$(F))))) \

LOCAL_SHARED_LIBRARIES := libXdmcp libXau


LOCAL_LDLIBS :=  -llog -lc -lm -ldl -lz

include $(BUILD_SHARED_LIBRARY)

