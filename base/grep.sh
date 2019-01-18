#!/bin/bash

set -eou pipefail

download https://ftp.gnu.org/gnu/grep/grep-3.1.tar.xz

../configure \
    --prefix=${TOOLCHAIN}
make
make install
