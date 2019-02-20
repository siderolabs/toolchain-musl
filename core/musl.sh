download https://www.musl-libc.org/releases/musl-1.1.21.tar.gz

../configure \
    --prefix=${TOOLCHAIN} \
    --syslibdir=${TOOLCHAIN}/lib \
    CROSS_COMPILE=${TARGET}-
make
make install

echo 'int main(){}' > dummy.c
${TARGET}-gcc dummy.c
readelf -l a.out | grep ": ${TOOLCHAIN}"
