#!/bin/bash

set -eou pipefail

download https://dev.gentoo.org/~blueness/eudev/eudev-${eudev}.tar.gz

# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/eudev.html
cat > config.cache << "EOF"
HAVE_BLKID=1
BLKID_LIBS="-lblkid"
BLKID_CFLAGS="-I${TOOLCHAIN}/include"
EOF

../configure \
  --prefix=/usr \
  --bindir=/bin \
  --sbindir=/bin \
  --disable-manpages \
  --enable-hwdb \
  --disable-static
make -j $(nproc)
make install
make install DESTDIR=/rootfs
