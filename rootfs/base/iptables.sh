#!/bin/bash

set -eou pipefail

download http://www.netfilter.org/projects/iptables/files/iptables-${iptables}.tar.bz2

../configure \
     --prefix=/usr \
     --libexecdir=/usr/libexec \
     --disable-static \
     --sbindir=/sbin \
     --disable-nftables \
     --enable-libipq \
     --with-xtlibdir=/lib/xtables
make -j $(nproc)
make install DESTDIR=/rootfs
