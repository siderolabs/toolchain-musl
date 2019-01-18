#!/bin/bash

set -eou pipefail

download https://ftp.gnu.org/gnu/tar/tar-1.30.tar.xz

../configure \
    --prefix=${TOOLCHAIN} \
    FORCE_UNSAFE_CONFIGURE=1
make
make install
