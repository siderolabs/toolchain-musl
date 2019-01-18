#!/bin/bash

set -eou pipefail


download https://ftp.gnu.org/gnu/bash/bash-4.4.18.tar.gz

../configure \
    --prefix=${TOOLCHAIN} \
    --without-bash-malloc
make
make
make install
