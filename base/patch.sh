#!/bin/bash

set -eou pipefail

download https://ftp.gnu.org/gnu/patch/patch-2.7.6.tar.xz

../configure \
    --prefix=${TOOLCHAIN}
make
make install
