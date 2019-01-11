#!/bin/bash

set -eou pipefail

download https://ftp.gnu.org/gnu/m4/m4-1.4.18.tar.xz

../configure --prefix=${TOOLCHAIN}
make
make install
