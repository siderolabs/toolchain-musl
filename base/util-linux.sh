download https://www.kernel.org/pub/linux/utils/util-linux/v2.32/util-linux-${utilLinux}.tar.xz

../configure \
    --prefix=${TOOLCHAIN} \
    --without-python \
    --disable-makeinstall-chown \
    --without-systemdsystemunitdir \
    --without-ncurses \
    PKG_CONFIG=""
make -j $(nproc)
make install
