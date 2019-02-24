################################################################################
#
# pbzip2
#
################################################################################

PBZIP2_VERSION = 1.1.13
PBZIP2_SOURCE = pbzip2-$(PBZIP2_VERSION).tar.gz
PBZIP2_SITE = https://launchpad.net/pbzip2/1.1/$(PBZIP2_VERSION)/+download
PBZIP2_LICENSE = bzip2 license
PBZIP2_LICENSE_FILES = COPYING

define PBZIP2_BUILD_CMDS
	$(TARGET_MAKE_ENV) \
		$(MAKE) -C $(@D)  $(TARGET_CONFIGURE_OPTS)
endef

# make sure busybox doesn't get overwritten by make install
define PBZIP2_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) \
		PREFIX=$(TARGET_DIR)/usr -C $(@D) install
	$(PBZIP2_INSTALL_TARGET_SHARED_CMDS)
endef

$(eval $(generic-package))
