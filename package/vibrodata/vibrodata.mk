################################################################################
#
# vibrodata
#
################################################################################

VIBRODATA_VERSION = buildroot
VIBRODATA_SITE = git@github.com:VibroBox/vbox.git
VIBRODATA_SITE_METHOD = git
VIBRODATA_INSTALL_IMAGES = YES

OBFUSCATE_PYTHON = yes

define VIBRODATA_INSTALL_TARGET_CMDS
	echo "Install to target"
	rm -rf $(TARGET_DIR)/home/pi/vibrodata
	$(if $(BR2_PACKAGE_VIBRODATA_OPY),
		echo "Obfuscate vibrodata sources";\
		$(@D)/opy/opy.py $(@D)/vibrodata $(TARGET_DIR)/home/pi/vibrodata $(@D)/opy/opy_config.txt; \
		echo "Fixup permissions after obfuscating"; \
		chmod +x $(TARGET_DIR)/home/pi/vibrodata/*.sh $(TARGET_DIR)/home/pi/vibrodata/*.py $(TARGET_DIR)/home/pi/vibrodata/add_ts \
		,
		echo "Copy vibrodata files"
		cp -rf $(@D)/vibrodata $(TARGET_DIR)/home/pi/
	)
# $(CC) $(@D)/vibrodata/add_ts.c -o $(TARGET_DIR)/home/pi/add_ts
endef


define VIBRODATA_INSTALL_IMAGES_CMDS
	echo "Install files to image"
	cp $(@D)/release_maker/boot_base/vbox.cfg.sample $(BINARIES_DIR)/vbox.cfg
	cp $(@D)/release_maker/boot_base/wifi.conf.sample $(BINARIES_DIR)/wifi.conf
	cp $(@D)/release_maker/boot_base/hostapd.conf.sample $(BINARIES_DIR)/hostapd.conf
endef

$(eval $(generic-package))
