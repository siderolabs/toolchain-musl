download https://ftp.gnu.org/gnu/sed/sed-${sed}.tar.xz

../configure \
    --prefix=${TOOLCHAIN}
make -j $(nproc)
make install
