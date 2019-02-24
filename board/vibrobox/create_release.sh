#!/bin/sh

set -e

RELEASE_DIR="release"
BOOTFS_NAME="boot.tar.bz2"
ROOTFS_NAME="rootfs.tar.bz2"
VERSION_NAME="build-version"


create_md5()
{
    cd $RELEASE_DIR
    md5sum $1 > $1.md5
    cd -
}


echo "Create release in ${BINARIES_DIR}"

cd ${BINARIES_DIR}

rm -rf ${RELEASE_DIR}/*
mkdir -p ${RELEASE_DIR}

rm -rf boot
mcopy -s -i boot.vfat :: boot

tar cf - boot | bzip2 -f > ${RELEASE_DIR}/${BOOTFS_NAME}

create_md5 $BOOTFS_NAME


cp ${ROOTFS_NAME} ${RELEASE_DIR}
create_md5 $ROOTFS_NAME


cp ${VERSION_NAME} ${RELEASE_DIR}
create_md5 $VERSION_NAME


