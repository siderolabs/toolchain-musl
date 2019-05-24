download https://ftp.gnu.org/gnu/diffutils/diffutils-${diffutils}.tar.xz

../configure \
    --prefix=${TOOLCHAIN}
make -j $(nproc)
make install
