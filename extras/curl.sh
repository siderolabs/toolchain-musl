download https://curl.haxx.se/download/curl-${curl}.tar.xz

../configure \
    --build=aarch64-linux-musl \
    --host=${HOST} \
    --target=${TARGET} \
    --prefix=${TOOLCHAIN} \
    --disable-static \
    --enable-threaded-resolver \
    --with-ca-bundle=${TOOLCHAIN}/etc/ssl/certs/ca-certificates
make -j $(nproc)
make install
