#!/bin/bash

set -eou pipefail

download https://ftp.gnu.org/gnu/grep/grep-${grep}.tar.xz

../configure \
    --prefix=${TOOLCHAIN}
make -j $(nproc)
make install
