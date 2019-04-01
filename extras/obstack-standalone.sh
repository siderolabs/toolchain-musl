download https://github.com/pullmoll/musl-obstack/archive/v1.1/musl-obstack-1.1.tar.gz
cd ..
./bootstrap.sh
cd -
../configure \
    --prefix=${TOOLCHAIN}
make
make install
