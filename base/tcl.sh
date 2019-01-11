#!/bin/bash

set -eou pipefail

download https://sourceforge.net/projects/tcl/files/Tcl/8.6.8/tcl-core8.6.8-src.tar.gz

../unix/configure --prefix=${TOOLCHAIN}
make
make install
chmod -v u+w ${TOOLCHAIN}/lib/libtcl8.6.so
make install-private-headers
ln -sv tclsh8.6 ${TOOLCHAIN}/bin/tclsh
