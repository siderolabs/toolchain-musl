download https://ftp.gnu.org/gnu/gettext/gettext-${gettext}.tar.xz

EMACS="no" ../gettext-tools/configure \
    --prefix=${TOOLCHAIN} \
    --disable-shared
make -C gnulib-lib -j $(nproc)
make -C intl pluralx.c -j $(nproc)
make -C src msgfmt -j $(nproc)
make -C src msgmerge -j $(nproc)
make -C src xgettext -j $(nproc)
cp -v src/{msgfmt,msgmerge,xgettext} ${TOOLCHAIN}/bin
