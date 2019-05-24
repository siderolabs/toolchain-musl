download https://tukaani.org/xz/xz-${xz}.tar.xz

../configure \
    --prefix=${TOOLCHAIN}
make -j $(nproc)
make install
