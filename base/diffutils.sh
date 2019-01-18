#!/bin/bash

set -eou pipefail

download https://ftp.gnu.org/gnu/diffutils/diffutils-3.6.tar.xz

../configure \
    --prefix=${TOOLCHAIN}
make
make install
