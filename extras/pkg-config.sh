download https://pkg-config.freedesktop.org/releases/pkg-config-${pkgConfig}.tar.gz
../configure \
    --prefix=${TOOLCHAIN} \
    --with-internal-glib \
    --disable-host-too
make -j $(nproc)
make install
