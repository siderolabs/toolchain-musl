export LD_LIBRARY_PATH=${TOOLCHAIN}/lib

download https://curl.haxx.se/download/curl-7.63.0.tar.xz

../configure \
    --prefix=${TOOLCHAIN} \
    --disable-static \
    --enable-threaded-resolver \
    --with-ca-bundle=${TOOLCHAIN}/etc/ssl/certs/ca-certificates
make
make install
