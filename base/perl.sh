#!/bin/bash

set -eou pipefail

download https://www.cpan.org/src/5.0/perl-5.28.0.tar.xz

cd ../

sh Configure \
    -des \
    -Dprefix=${TOOLCHAIN} \
    -Dlibs=-lm \
    -Uloclibpth \
    -Ulocincpth
make
cp -v perl cpan/podlators/scripts/pod2man ${TOOLCHAIN}/bin
mkdir -pv ${TOOLCHAIN}/lib/perl5/5.28.0
cp -Rv lib/* ${TOOLCHAIN}/lib/perl5/5.28.0
