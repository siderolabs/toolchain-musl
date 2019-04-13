#!/bin/bash

set -eou pipefail

download https://www.cpan.org/src/5.0/perl-${perl}.tar.xz

cd ../

sh Configure \
    -des \
    -Dprefix=${TOOLCHAIN} \
    -Dlibs=-lm \
    -Uloclibpth \
    -Ulocincpth
make -j $(nproc)
cp -v perl cpan/podlators/scripts/pod2man ${TOOLCHAIN}/bin
mkdir -pv ${TOOLCHAIN}/lib/perl5/${perl}
cp -Rv lib/* ${TOOLCHAIN}/lib/perl5/${perl}
