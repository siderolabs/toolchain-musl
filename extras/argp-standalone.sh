download http://www.lysator.liu.se/~nisse/misc/argp-standalone-${argp}.tar.gz
cd ../

case "${argp}" in
1.3)
patch -p0 </src/extras/argp-standalone-1.3-musl-fix-inline.patch
esac

./configure \
    --prefix=${TOOLCHAIN} \
    --disable-static
make -j $(nproc)
cp -v libargp.a /toolchain/lib/
cp -v argp.h /toolchain/include/
