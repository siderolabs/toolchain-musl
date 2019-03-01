exportcross

download https://ftp.gnu.org/gnu/gcc/gcc-8.3.0/gcc-8.3.0.tar.xz

../libstdc++-v3/configure \
    --build=${HOST} \
    --host=${TARGET} \
    --target=${TARGET} \
    --prefix=${TOOLCHAIN} \
    --with-gxx-include-dir=${TOOLCHAIN}/${TARGET}/include/c++/8.3.0 \
    --disable-multilib \
    --disable-nls \
    --disable-libstdcxx-threads \
    --disable-libstdcxx-pch
make
make install
