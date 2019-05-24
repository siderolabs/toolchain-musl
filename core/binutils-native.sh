exportcross

download https://ftp.gnu.org/gnu/binutils/binutils-${binutils}.tar.xz
../configure \
    --build=${BUILD} \
    --host=${HOST} \
    --prefix=${TOOLCHAIN} \
    --with-sysroot \
    --with-lib-path=${TOOLCHAIN}/lib \
    --disable-nls \
    --disable-werror
make -j $(nproc)
make install
make -C ld clean
make -C ld LIB_PATH=/lib
cp -v ld/ld-new ${TOOLCHAIN}/bin
