#!/bin/bash

set -eou pipefail

download https://github.com/dosfstools/dosfstools/releases/download/v${dosfstools}/dosfstools-${dosfstools}.tar.xz

../configure \
    --prefix=/ \
    --enable-compat-symlinks
make -j $(($(nproc) / 2))
make install DESTDIR=/rootfs
