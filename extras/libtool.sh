download http://ftpmirror.gnu.org/libtool/libtool-${libtool}.tar.gz
../configure \
    --build=${BUILD} \
    --host=${HOST} \
    --target=${TARGET} \
    --prefix=${TOOLCHAIN}
make -j $(nproc)
make install
