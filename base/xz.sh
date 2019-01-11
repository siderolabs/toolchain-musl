#!/bin/bash

set -eou pipefail

download https://tukaani.org/xz/xz-5.2.4.tar.xz

../configure \
    --prefix=${TOOLCHAIN}
make
make install
