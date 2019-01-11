#!/bin/bash

set -eou pipefail

download https://downloads.sourceforge.net/expect/expect5.45.4.tar.gz

cp -v ../configure{,.orig}
sed 's:/usr/local/bin:/bin:' ../configure.orig > ../configure

../configure \
    --prefix=${TOOLCHAIN} \
    --with-tcl=${TOOLCHAIN}/lib \
    --with-tclinclude=${TOOLCHAIN}/include
make
make SCRIPTS="" install
