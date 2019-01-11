#!/toolchain/bin/bash

set -eou pipefail

download https://www.musl-libc.org/releases/musl-1.1.20.tar.gz

mkdir /rootfs

../configure \
    --prefix=/ \
    --syslibdir=/lib
make
make install DESTDIR=/rootfs
