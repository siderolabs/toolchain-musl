exportcross

download https://ftp.gnu.org/gnu/binutils/binutils-2.31.1.tar.xz
../configure \
    --build=${HOST} \
    --host=${HOST} \
    --prefix=${TOOLCHAIN} \
    --with-sysroot \
    --with-lib-path=${TOOLCHAIN}/lib \
    --disable-nls \
    --disable-werror
make
make install
make -C ld clean
make -C ld LIB_PATH=/lib
cp -v ld/ld-new ${TOOLCHAIN}/bin
