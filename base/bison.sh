download https://ftp.gnu.org/gnu/bison/bison-${bison}.tar.xz

../configure \
    --prefix=${TOOLCHAIN} \
    FORCE_UNSAFE_CONFIGURE=1
make -j $(nproc)
make install
