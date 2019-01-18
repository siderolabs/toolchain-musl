#!/bin/bash

set -eou pipefail

download ftp://ftp.astron.com/pub/file/file-5.34.tar.gz

../configure \
    --prefix=${TOOLCHAIN}
make
make install
