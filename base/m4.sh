download https://ftp.gnu.org/gnu/m4/m4-${m4}.tar.xz

../configure \
    --prefix=${TOOLCHAIN}
make -j $(nproc)
make install
