download https://www.musl-libc.org/releases/musl-${musl}.tar.gz

../configure \
    --prefix=${TOOLCHAIN} \
    --syslibdir=${TOOLCHAIN}/lib \
    CROSS_COMPILE=${TARGET}-
make -j $(nproc)
make install

echo 'int main(){}' > dummy.c
${TARGET}-gcc dummy.c
readelf -l a.out | grep ": ${TOOLCHAIN}"
