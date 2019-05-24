#!/bin/bash

set -eou pipefail

git clone https://github.com/opencontainers/runc.git
cd runc && git checkout v${runc}
export PKG_CONFIG_PATH=/toolchain/usr/lib/pkgconfig
export GO111MODULE=on
export GOARCH=arm
export GOARM=7
# export CGO_CFLAGS="-I/toolchain/usr/include"
# make EXTRA_LDFLAGS="-w -s -L /toolchain/usr/lib" BUILDTAGS="seccomp" static
make EXTRA_LDFLAGS="-w -s" BUILDTAGS="" static
mv runc /rootfs/bin/runc
chmod +x /rootfs/bin/runc