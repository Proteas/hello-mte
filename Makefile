# Xcode-v12.0-Beta1

export DEVELOPER_DIR := $(shell xcode-select --print-path)

# iOS
SDK_iOS 		= $(shell xcodebuild -version -sdk iphoneos Path)
MIN_VER_iOS 	= -miphoneos-version-min=14.0
CC_iOS 			= $(shell xcrun --sdk iphoneos --find clang)

ARCH_iOS 		= -arch arm64e

SDK_SETTINGS_iOS = -isysroot $(SDK_iOS) -I$(SDK_iOS)/usr/include -I$(SDK_iOS)/usr/local/include

COMPILE_iOS_BIN = $(CC_iOS) $(ARCH_iOS) $(MIN_VER_iOS) $(SDK_SETTINGS_iOS)
# ============================================================================ #

CFLAGS					= -g -O0 -Wno-array-bounds
LDFLAGS					= $(CFLAGS)
# ============================================================================ #

MAIN_FILE	= hello.c

all: $(MAIN_FILE)
	@$(COMPILE_iOS_BIN) $(MAIN_FILE) $(CFLAGS) -o hello
	@$(COMPILE_iOS_BIN) $(MAIN_FILE) $(CFLAGS) -o hello-mte -march=armv8.5-a+memtag -fsanitize=memtag
	
clean:
	@rm -rf hello hello.dSYM hello-mte hello-mte.dSYM
	