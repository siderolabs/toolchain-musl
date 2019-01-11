#!/bin/bash

set -eou pipefail

download https://ftp.gnu.org/gnu/ncurses/ncurses-6.1.tar.gz

sed -i s/mawk// ../configure

../configure \
    --prefix=${TOOLCHAIN} \
    --with-shared \
    --without-debug \
    --without-ada \
    --enable-widec \
    --enable-overwrite
make
make install
