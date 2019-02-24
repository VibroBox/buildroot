################################################################################
#
# python-pycurl
#
################################################################################

PYTHON_PYCURL_VERSION = 7.43.0.1
PYTHON_PYCURL_SOURCE = pycurl-$(PYTHON_PYCURL_VERSION).tar.gz
PYTHON_PYCURL_SITE = https://pypi.python.org/packages/77/d9/d272b38e6e25d2686e22f6058820298dadead69340b1c57ff84c87ef81f0
PYTHON_PYCURL_SETUP_TYPE = setuptools
PYTHON_PYCURL_LICENSE = Apache-2.0
PYTHON_PYCURL_LICENSE_FILES = LICENSE
PYTHON_PYCURL_BUILD_OPTS = --curl-config=$(STAGING_DIR)/usr/bin/curl-config --with-openssl
PYTHON_PYCURL_INSTALL_TARGET_OPTS = --curl-config=$(STAGING_DIR)/usr/bin/curl-config --with-openssl
PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS = \
	--prefix=$(TARGET_DIR)/usr \
	--root=/

$(eval $(python-package))
