exportcross

download https://ftp.gnu.org/gnu/gcc/gcc-7.4.0/gcc-7.4.0.tar.xz

../libstdc++-v3/configure \
    --build=${HOST} \
    --host=${TARGET} \
    --target=${TARGET} \
    --prefix=${TOOLCHAIN} \
    --with-gxx-include-dir=${TOOLCHAIN}/${TARGET}/include/c++/7.4.0 \
    --disable-multilib \
    --disable-nls \
    --disable-libstdcxx-threads \
    --disable-libstdcxx-pch
make
make install
