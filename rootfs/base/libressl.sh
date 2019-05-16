download https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${libressl}.tar.gz

../configure \
    --prefix=/usr
make -j $(nproc)
make install DESTDIR=/rootfs
