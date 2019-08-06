#!/bin/bash

set -eou pipefail

download https://sourceware.org/pub/bzip2/bzip2-${bzip2}.tar.gz
make -C ../ -j $(nproc)
make -C ../ PREFIX=${TOOLCHAIN} install
