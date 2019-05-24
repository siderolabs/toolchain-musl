download https://ftp.gnu.org/gnu/ncurses/ncurses-${ncurses}.tar.gz

sed -i s/mawk// ../configure

../configure \
    --prefix=${TOOLCHAIN} \
    --with-shared \
    --without-debug \
    --without-ada \
    --enable-widec \
    --enable-overwrite
make -j $(nproc)
make install
