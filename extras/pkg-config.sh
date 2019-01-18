download https://pkg-config.freedesktop.org/releases/pkg-config-0.29.2.tar.gz
../configure \
    --prefix=${TOOLCHAIN} \
    --with-internal-glib \
    --disable-host-too
make
make install
