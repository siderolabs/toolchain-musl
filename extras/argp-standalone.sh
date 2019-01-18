download http://www.lysator.liu.se/~nisse/misc/argp-standalone-1.3.tar.gz
cd ../
patch -p0 </src/extras/argp-standalone-1.3-musl-fix-inline.patch
./configure \
    --prefix=${TOOLCHAIN} \
    --disable-static
make
cp -v libargp.a /toolchain/lib/
cp -v argp.h /toolchain/include/
