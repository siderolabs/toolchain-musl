download https://github.com/westes/flex/releases/download/v${flex}/flex-${flex}.tar.gz

sed -i "/math.h/a #include <malloc.h>" ../src/flexdef.h

../configure \
    --prefix=${TOOLCHAIN}
make -j $(nproc)
make install
