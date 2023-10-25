
#
# Copyright (C) 2015-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v3.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ynn-nas-client
PKG_VERSION:=1.1.0
PKG_RELEASE:=RELEASE-test
PKG_SOURCE:=$(PKG_NAME)-binary-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://172.16.102.3/nas/
PKG_HASH:=c2de9820bb1e4e10593fd825784068bde434c68efda29be365454b6ef010d16d

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-binary-$(PKG_VERSION)

PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Nas Servers
	TITLE:=Ynn Nas Client
	PKGARCH:=all
	URL:=https://www.movienn.com/
    DEPENDS:=+libstdcpp
endef

define Package/$(PKG_NAME)/description
  Ynn Nas Client is a film download control tool
endef

define Package/$(PKG_NAME)/conffiles
/etc/config/ynnclient
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
if [ -z "$${IPKG_INSTROOT}" ]; then
	[ -f /etc/uci-defaults/ynnclient ] && /etc/uci-defaults/ynnclient && rm -f /etc/uci-defaults/ynnclient
fi
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/sbin/ynn-plugins $(1)/etc/config $(1)/etc/init.d $(1)/etc/uci-defaults 
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ynn-nas-client $(1)/usr/sbin/ynn-nas-client
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ynn-tunnel $(1)/usr/sbin/ynn-tunnel
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/check-client-update.sh $(1)/usr/sbin/ynn-plugins/check-client-update.sh
	$(INSTALL_CONF) ./files/ynnclient.config $(1)/etc/config/ynnclient
	$(INSTALL_BIN) ./files/ynn-tunnel.init $(1)/etc/init.d/ynn-tunnel
	$(INSTALL_BIN) ./files/ynn-nas-client.init $(1)/etc/init.d/ynn-nas-client
	$(INSTALL_BIN) ./files/ynnclient.uci-default $(1)/etc/uci-defaults/ynnclient
	$(CP) $(PKG_BUILD_DIR)/3rdpart $(1)/usr/lib/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
