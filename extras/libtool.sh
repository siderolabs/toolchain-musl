download http://ftpmirror.gnu.org/libtool/libtool-${libtool}.tar.gz
../configure \
    --prefix=${TOOLCHAIN}
make -j $(nproc)
make install
