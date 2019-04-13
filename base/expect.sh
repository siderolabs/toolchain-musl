#!/bin/bash

set -eou pipefail

download https://downloads.sourceforge.net/expect/expect${expect}.tar.gz

cp -v ../configure{,.orig}
sed 's:/usr/local/bin:/bin:' ../configure.orig > ../configure

../configure \
    --prefix=${TOOLCHAIN} \
    --with-tcl=${TOOLCHAIN}/lib \
    --with-tclinclude=${TOOLCHAIN}/include
make -j $(nproc)
make SCRIPTS="" install
