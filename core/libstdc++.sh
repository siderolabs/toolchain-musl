exportcross

download https://ftp.gnu.org/gnu/gcc/gcc-${gcc}/gcc-${gcc}.tar.xz

../libstdc++-v3/configure \
    --host=${TARGET} \
    --prefix=${TOOLCHAIN} \
    --with-gxx-include-dir=${TOOLCHAIN}/${TARGET}/include/c++/${gcc} \
    --disable-multilib \
    --disable-nls \
    --disable-libstdcxx-threads \
    --disable-libstdcxx-pch
make -j $(nproc)
make install
