#!/bin/bash

set -eou pipefail

download https://ftp.gnu.org/gnu/gawk/gawk-4.2.1.tar.xz

../configure \
    --prefix=${TOOLCHAIN}
make
make install
