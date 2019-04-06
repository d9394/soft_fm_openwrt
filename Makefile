include $(TOPDIR)/rules.mk

PKG_NAME:=softfm
PKG_VERSION:=1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/jj1bdx/softfm-jj1bdx.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=master
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

PKG_MAINTAINER:=Joris van Rantwijk
#PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/$(BUILD_VARIANT)/$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/softfm-jj1bdx/Default
  TITLE:=SoftFM is a software-defined radio receiver for FM broadcast radio. \
It is written in C++ and uses RTL-SDR to interface with RTL2832-based \
hardware.\
  Version 0.2.3, 16-JAN-2019: this is the final release
  URL:=https://github.com/jj1bdx/softfm-jj1bdx
endef

define Build/Prepare
#        mkdir -p $(PKG_BUILD_DIR)
#        $(CP) /home/openwrt/tmp/SoftFM/* $(PKG_BUILD_DIR)/
       $(call Build/Prepare/Default)
#       export PKG_CONFIG_PATH=$(BUILD_DIR)/rtl-sdr-0.5.3-20150608-/src/
endef

define Package/softfm-jj1bdx
  $(call Package/softfm-jj1bdx/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libusb-1.0 +librtlsdr +libstdcpp +libpthread
endef

define Package/softfm-jj1bdx/description
  SoftFM is a software-defined radio receiver for FM broadcast radio. \
It is written in C++ and uses RTL-SDR to interface with RTL2832-based hardware.
endef

#define Package/csdr/conffiles
#  /etc/config/csdr
#endef

define Package/softfm-jj1bdx/install
        $(INSTALL_DIR) $(1)/usr/bin
        $(INSTALL_BIN) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/bin
#       $(INSTALL_DIR) $(1)/etc/multimon-ng
#       $(INSTALL_DATA) ./files/multimon-ng.template $(1)/etc/multimon-ng/config.template
endef

$(eval $(call BuildPackage,softfm-jj1bdx))
