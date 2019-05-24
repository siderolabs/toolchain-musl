download https://ftp.gnu.org/gnu/texinfo/texinfo-${texinfo}.tar.xz

../configure \
    --prefix=${TOOLCHAIN}
make -j $(nproc)
make install
