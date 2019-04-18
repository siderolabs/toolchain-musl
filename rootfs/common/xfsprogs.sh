#!/bin/bash

set -eou pipefail

download https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/xfsprogs-${xfsprogs}.tar.xz

cd ../

make -j $(nproc) \
    DEBUG=-DNDEBUG \
    INSTALL_USER=0 \
    INSTALL_GROUP=0 \
    LOCAL_CONFIGURE_OPTIONS="--prefix=/"
make install DESTDIR=/rootfs
