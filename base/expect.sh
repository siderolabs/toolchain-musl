download https://downloads.sourceforge.net/expect/expect${expect}.tar.gz

cp -v ../configure{,.orig}
sed 's:/usr/local/bin:/bin:' ../configure.orig > ../configure

../configure \
    --build=arm-linux \
    --host=arm-linux \
    --prefix=${TOOLCHAIN} \
    --with-tcl=${TOOLCHAIN}/lib \
    --with-tclinclude=${TOOLCHAIN}/include
make -j $(nproc)
make SCRIPTS="" install
