download https://ftp.gnu.org/gnu/bc/bc-${bc}.tar.gz

export LD_LIBRARY_PATH=${TOOLCHAIN}/lib

cat > ../bc/fix-libmath_h << "EOF"
#! /bin/bash
sed -e '1   s/^/{"/' \
    -e     's/$/",/' \
    -e '2,$ s/^/"/'  \
    -e   '$ d'       \
    -i libmath.h

sed -e '$ s/$/0}/' \
    -i libmath.h
EOF

sed -i -e '/flex/s/as_fn_error/: ;; # &/' ../configure

../configure \
    --prefix=${TOOLCHAIN} \
    --with-readline \
    --mandir=${TOOLCHAIN}/share/man \
    --infodir=${TOOLCHAIN}/share/info
make -j $(nproc)
make install
