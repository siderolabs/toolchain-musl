download ftp://ftp.astron.com/pub/file/file-${file}.tar.gz

../configure \
    --prefix=${TOOLCHAIN}
make -j $(nproc)
make install
