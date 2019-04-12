#!/toolchain/bin/bash

set -eou pipefail

download https://www.musl-libc.org/releases/musl-${musl}.tar.gz

mkdir /rootfs

../configure \
    --prefix=/ \
    --syslibdir=/lib
make -j $(nproc)
make install DESTDIR=/rootfs
