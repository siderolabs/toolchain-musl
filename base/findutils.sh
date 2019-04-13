#!/bin/bash

set -eou pipefail

download https://ftp.gnu.org/gnu/findutils/findutils-${findutils}.tar.gz

../configure \
    --prefix=${TOOLCHAIN}
make -j $(nproc)
make install
