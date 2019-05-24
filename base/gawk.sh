download https://ftp.gnu.org/gnu/gawk/gawk-${gawk}.tar.xz

../configure \
    --prefix=${TOOLCHAIN}
make -j $(nproc)
make install
