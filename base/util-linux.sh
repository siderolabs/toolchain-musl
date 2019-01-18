#!/bin/bash

set -eou pipefail

download https://www.kernel.org/pub/linux/utils/util-linux/v2.32/util-linux-2.32.1.tar.xz

../configure \
    --prefix=${TOOLCHAIN} \
    --without-python \
    --disable-makeinstall-chown \
    --without-systemdsystemunitdir \
    --without-ncurses \
    PKG_CONFIG=""
make
make install
