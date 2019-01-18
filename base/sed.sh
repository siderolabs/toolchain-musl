#!/bin/bash

set -eou pipefail

download https://ftp.gnu.org/gnu/sed/sed-4.5.tar.xz

../configure \
    --prefix=${TOOLCHAIN}
make
make install
