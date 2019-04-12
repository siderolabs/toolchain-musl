download https://github.com/pullmoll/musl-fts/archive/v${muslFts}/musl-fts-${muslFts}.tar.gz
cd ..
./bootstrap.sh
cd -
../configure \
    --prefix=${TOOLCHAIN}
make -j $(nproc)
make install
