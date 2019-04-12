download https://zlib.net/zlib-${zlib}.tar.xz

../configure \
    --prefix=${TOOLCHAIN}
make -j $(nproc)
make install
