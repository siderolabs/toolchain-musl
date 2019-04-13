download https://ftp.gnu.org/gnu/autoconf/autoconf-${autoconf}.tar.xz
../configure \
    --prefix=${TOOLCHAIN}
make -j $(nproc)
make install
