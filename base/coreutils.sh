download https://ftp.gnu.org/gnu/coreutils/coreutils-${coreutils}.tar.xz

../configure \
    --prefix=${TOOLCHAIN} \
    --enable-install-program=hostname \
    FORCE_UNSAFE_CONFIGURE=1 \
    TIME_T_32_BIT_OK=yes
make -j $(nproc)
make install
