download https://github.com/pullmoll/musl-obstack/archive/v${muslObstack}/musl-obstack-${muslObstack}.tar.gz
cd ..
./bootstrap.sh
cd -
../configure \
    --prefix=${TOOLCHAIN}
make -j $(nproc)
make install
