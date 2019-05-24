download https://ftp.gnu.org/gnu/patch/patch-${patch}.tar.xz

../configure \
    --prefix=${TOOLCHAIN}
make -j $(nproc)
make install
