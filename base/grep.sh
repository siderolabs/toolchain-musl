download https://ftp.gnu.org/gnu/grep/grep-${grep}.tar.xz

../configure \
    --prefix=${TOOLCHAIN}
make -j $(nproc)
make install
