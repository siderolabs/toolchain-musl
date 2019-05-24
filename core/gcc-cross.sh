download https://ftp.gnu.org/gnu/mpfr/mpfr-${mpfr}.tar.xz mpfr
download https://ftp.gnu.org/gnu/gmp/gmp-${gmp}.tar.xz gmp
download https://ftp.gnu.org/gnu/mpc/mpc-${mpc}.tar.gz mpc
download https://ftp.gnu.org/gnu/gcc/gcc-${gcc}/gcc-${gcc}.tar.xz

for file in ../gcc/config/{aarch64/aarch64-linux,arm/{linux-eabi,linux-elf},linux,i386/linux{,64}}.h; do
  cp -uv $file{,.orig}
  sed -e "s@/lib\(64\)\?\(32\)\?/ld@${TOOLCHAIN}&@g" \
      -e "s@/usr@${TOOLCHAIN}@g" $file.orig > $file
cat >> $file <<EOF
#undef STANDARD_STARTFILE_PREFIX_1
#undef STANDARD_STARTFILE_PREFIX_2
#define STANDARD_STARTFILE_PREFIX_1 "${TOOLCHAIN}/lib/"
#define STANDARD_STARTFILE_PREFIX_2 ""
EOF
  touch $file.orig
done

sed -e '/mabi.lp64=/s/lib64/lib/' -i.orig ../gcc/config/aarch64/t-aarch64-linux

../configure \
    --build=${BUILD} \
    --host=${HOST} \
    --target=${TARGET} \
    --prefix=${TOOLCHAIN} \
    --with-sysroot=${SYSROOT} \
    --with-local-prefix=${TOOLCHAIN} \
    --with-native-system-header-dir=${TOOLCHAIN}/include \
    --with-newlib \
    --without-headers \
    --disable-nls \
    --disable-shared \
    --disable-multilib \
    --disable-threads \
    --disable-libatomic \
    --disable-libgomp \
    --disable-libmpx \
    --disable-libquadmath \
    --disable-libssp \
    --disable-libvtv \
    --disable-libstdcxx \
    --disable-libcilkrts \
    --disable-libstdcxx-pch \
    --disable-symvers \
    --disable-libitm \
    --disable-gnu-indirect-function \
    --disable-libmudflap \
    --disable-libsanitizer \
    --enable-languages=c,c++
make -j $(nproc)
make install-strip
