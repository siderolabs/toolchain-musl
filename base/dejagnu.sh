#!/bin/bash

set -eou pipefail

download https://ftp.gnu.org/gnu/dejagnu/dejagnu-${dejagnu}.tar.gz

../configure \
    --prefix=${TOOLCHAIN}
make install
