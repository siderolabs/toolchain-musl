
#!/bin/bash

set -eou pipefail

download https://github.com/seccomp/libseccomp/releases/download/v${libseccomp}/libseccomp-${libseccomp}.tar.gz

../configure \
    --prefix=/usr \
    --disable-static
make -j $(nproc)
make install DESTDIR=/rootfs
make install DESTDIR=/toolchain
