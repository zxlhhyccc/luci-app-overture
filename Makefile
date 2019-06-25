include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-overture
PKG_VERSION:=0.0.1
PKG_RELEASE:=1


PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=LuCI Support for overture
	PKGARCH:=all

endef

define Package/$(PKG_NAME)/description
	LuCI Support for overture.
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/postinst
endef

define Package/$(PKG_NAME)/conffiles
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) ./files/luci/controller/*.lua $(1)/usr/lib/lua/luci/controller/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/overture
	$(INSTALL_DATA) ./files/luci/model/cbi/overture/*.lua $(1)/usr/lib/lua/luci/model/cbi/overture/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/root/etc/init.d/overture $(1)/etc/init.d/overture
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
