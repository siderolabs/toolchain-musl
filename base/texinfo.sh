#!/bin/bash

set -eou pipefail

download https://ftp.gnu.org/gnu/texinfo/texinfo-6.5.tar.xz

../configure \
    --prefix=${TOOLCHAIN}
make
make install
