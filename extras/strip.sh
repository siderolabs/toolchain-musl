#!/bin/bash

set -eou pipefail

strip --strip-debug ${TOOLCHAIN}/lib/* || true
/usr/bin/strip --strip-unneeded ${TOOLCHAIN}/{,s}bin/* || true
rm -rf ${TOOLCHAIN}/{,share}/{info,man,doc}
rm -rf ${TOOLCHAIN}/bin/${ARCH}-${VENDOR}-*
rm -rf ${TOOLCHAIN}/${ARCH}-${VENDOR}-*
find ${TOOLCHAIN}/{lib,libexec} -name \*.la -delete
