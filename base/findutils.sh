#!/bin/bash

set -eou pipefail

download https://ftp.gnu.org/gnu/findutils/findutils-4.6.0.tar.gz

../configure \
    --prefix=${TOOLCHAIN}
make
make install
