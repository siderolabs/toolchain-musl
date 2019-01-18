download https://ftp.gnu.org/gnu/binutils/binutils-2.31.1.tar.xz

../configure \
    --build=${HOST} \
    --host=${HOST} \
    --target=${TARGET} \
    --prefix=${TOOLCHAIN} \
    --with-sysroot=${SYSROOT} \
    --with-lib-path=${TOOLCHAIN}/lib \
    --disable-nls \
    --disable-werror
make
make install
