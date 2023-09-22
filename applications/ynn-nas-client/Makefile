
#
# Copyright (C) 2015-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v3.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ynn-nas-client
PKG_VERSION:=1.0.0
PKG_RELEASE:=RELEASE-test
PKG_SOURCE:=$(PKG_NAME)-binary-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://test.movienn.com/nas/
PKG_HASH:=6748828744f00de726b2e8b6086e774e8f35c75e1a8dfdf2bac1e806e4a6788a

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
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ynn-torrent $(1)/usr/sbin/ynn-torrent
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ynn-tunnel $(1)/usr/sbin/ynn-tunnel
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/check-client-update.sh $(1)/usr/sbin/ynn-plugins/check-client-update.sh
	$(INSTALL_CONF) ./files/ynn-torrent.json $(1)/etc/config/ynn-torrent.json
	$(INSTALL_CONF) ./files/ynnclient.config $(1)/etc/config/ynnclient
	$(INSTALL_BIN) ./files/ynn-torrent.init $(1)/etc/init.d/ynn-torrent
	$(INSTALL_BIN) ./files/ynn-tunnel.init $(1)/etc/init.d/ynn-tunnel
	$(INSTALL_BIN) ./files/ynn-nas-client.init $(1)/etc/init.d/ynn-nas-client
	$(INSTALL_BIN) ./files/ynnclient.uci-default $(1)/etc/uci-defaults/ynnclient
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
