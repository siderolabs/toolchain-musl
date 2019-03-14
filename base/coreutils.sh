#!/bin/bash

set -eou pipefail

download https://ftp.gnu.org/gnu/coreutils/coreutils-8.30.tar.xz

../configure \
    --build=${HOST} \
    --host=${HOST} \
    --prefix=${TOOLCHAIN} \
    --enable-install-program=hostname \
    FORCE_UNSAFE_CONFIGURE=1
make
make install
