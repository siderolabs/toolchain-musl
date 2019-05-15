#!/bin/bash

set -eou pipefail

download http://www.dest-unreach.org/socat/download/socat-${socat}.tar.gz

../configure \
     --prefix=/usr
make -j $(nproc)
make install DESTDIR=/rootfs
