#!/bin/bash

set -eou pipefail

download https://ftp.gnu.org/gnu/gzip/gzip-1.9.tar.xz

../configure \
    --prefix=${TOOLCHAIN}
make
make install
