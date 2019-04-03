download https://github.com/pullmoll/musl-fts/archive/v1.2.7/musl-fts-1.2.7.tar.gz
cd ..
./bootstrap.sh
cd -
../configure \
    --prefix=${TOOLCHAIN}
make
make install
