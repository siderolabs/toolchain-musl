#!/bin/bash

set -eou pipefail

download https://mirrors.kernel.org/sourceware/lvm2/LVM2.${lvm2}.tgz

# Cause random issues
export PKG_CONFIG_PATH=/rootfs/usr/lib/pkgconfig
# Grab our udev libraries
export CFLAGS="-L/usr/lib -ludev -luuid"
# A bunch of these options are just to suppress compilation errors
# but unfortunately we cant squash all of them because of unskippable
# pkgconfig checks
../configure \
             --with-thin=none                       \
             --with-cache=none                      \
             --disable-udev-systemd-background-jobs \
             --with-systemdsystemunitdir=/dev/null  \
             --disable-selinux                      \
             --enable-cmdlib                        \
             --enable-pkgconfig                     \
             --enable-udev_sync                     \
             --enable-udev_rules                    \
             --with-udev-prefix=/usr

make -j $(nproc) device-mapper

# Install dmsetup
make install_device-mapper

# Jankyness to bypass lvm build so we can
# still get the lvm rules
# lvm rules seem to only depend on dmsetup
# so :yolo:
cd udev
make install_lvm2
cd ..

make install_device-mapper DESTDIR=/rootfs
cd udev
make install_lvm2 DESTDIR=/rootfs
cd ..
