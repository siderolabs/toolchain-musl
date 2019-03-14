#!/bin/bash

set -eou pipefail

download https://ftp.gnu.org/gnu/bison/bison-3.0.5.tar.xz

../configure \
    --build=${HOST} \
    --host=${HOST} \
    --prefix=${TOOLCHAIN} \
    FORCE_UNSAFE_CONFIGURE=1
make
make install
