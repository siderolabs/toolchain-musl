download https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz

sed -i "/math.h/a #include <malloc.h>" ../src/flexdef.h

../configure \
    --prefix=${TOOLCHAIN}
make
make install
