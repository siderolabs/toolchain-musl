#!/bin/bash

set -eou pipefail

download http://ftp.gnu.org/pub/gnu/gperf/gperf-${gperf}.tar.gz

../configure \
    --prefix=${TOOLCHAIN}
make -j $(nproc)
make install
