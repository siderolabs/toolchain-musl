#!/bin/bash

set -eou pipefail

download https://ftp.gnu.org/gnu/gettext/gettext-0.19.8.1.tar.xz

EMACS="no" ../gettext-tools/configure --prefix=${TOOLCHAIN} --disable-shared
make -C gnulib-lib
make -C intl pluralx.c
make -C src msgfmt
make -C src msgmerge
make -C src xgettext
cp -v src/{msgfmt,msgmerge,xgettext} ${TOOLCHAIN}/bin
