#!/bin/bash

set -eou pipefail

download https://ftp.gnu.org/gnu/dejagnu/dejagnu-1.6.1.tar.gz

../configure \
    --prefix=${TOOLCHAIN}
make install
