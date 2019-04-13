# syntax=docker/dockerfile:experimental

# The common stage provides...

FROM alpine:3.8 AS common
ENV ARCH x86_64
ENV VENDOR talos
ENV HOST x86_64-linux-musl
ENV BUILD x86_64-linux-musl
ENV TARGET ${ARCH}-${VENDOR}-linux-musl
ENV SYSROOT /${VENDOR}
ENV TOOLCHAIN /toolchain
ENV PATH ${TOOLCHAIN}/bin:$PATH
RUN apk --no-cache add bash bison build-base bzip2 coreutils curl diffutils findutils gawk grep gzip patch perl tar texinfo xz
RUN mkdir -p ${SYSROOT}${TOOLCHAIN}
RUN ln -sv ${SYSROOT}${TOOLCHAIN} ${TOOLCHAIN}
RUN [ "ln", "-svf", "/bin/bash", "/bin/sh" ]
COPY build.sh /bin
COPY versions.sh /bin
COPY common/version-check.sh /bin
RUN version-check.sh

# The core stage provides...

FROM common AS core
WORKDIR /src
COPY core/checksums.* .
WORKDIR /src/core
# binutils-cross
COPY core/binutils-cross.sh .
RUN build.sh /src/core/binutils-cross.sh
# gcc-cross
COPY core/gcc-cross.sh .
RUN build.sh /src/core/gcc-cross.sh
# linux-headers
COPY core/linux-headers.sh .
RUN build.sh /src/core/linux-headers.sh
# musl
COPY core/musl.sh .
RUN build.sh /src/core/musl.sh
# libstdc++
COPY core/libstdc++.sh .
RUN build.sh /src/core/libstdc++.sh
# binutils-native
COPY core/binutils-native.sh .
RUN build.sh /src/core/binutils-native.sh
# gcc-native
COPY core/gcc-native.sh .
RUN build.sh /src/core/gcc-native.sh

# The base stage provides...

FROM common AS base
COPY --from=core ${SYSROOT} ${SYSROOT}
WORKDIR /src
COPY base/checksums.* .
WORKDIR /src/base
# tcl
COPY base/tcl.sh .
RUN build.sh /src/base/tcl.sh
# expect
COPY base/expect.sh .
RUN build.sh /src/base/expect.sh
# dejagnu
COPY base/dejagnu.sh .
RUN build.sh /src/base/dejagnu.sh
# m4
COPY base/m4.sh .
RUN build.sh /src/base/m4.sh
# ncurses
COPY base/ncurses.sh .
RUN build.sh /src/base/ncurses.sh
# bash
COPY base/bash.sh .
RUN build.sh /src/base/bash.sh
# bison
COPY base/bison.sh .
RUN build.sh /src/base/bison.sh
# bzip2
COPY base/bzip2.sh .
RUN build.sh /src/base/bzip2.sh
# coreutils
COPY base/coreutils.sh .
RUN build.sh /src/base/coreutils.sh
# diffutils
COPY base/diffutils.sh .
RUN build.sh /src/base/diffutils.sh
# file
COPY base/file.sh .
RUN build.sh /src/base/file.sh
# findutils
COPY base/findutils.sh .
RUN build.sh /src/base/findutils.sh
# gawk
COPY base/gawk.sh .
RUN build.sh /src/base/gawk.sh
# gettext
COPY base/gettext.sh .
RUN build.sh /src/base/gettext.sh
# grep
COPY base/grep.sh .
RUN build.sh /src/base/grep.sh
# gzip
COPY base/gzip.sh .
RUN build.sh /src/base/gzip.sh
# make
COPY base/make.sh .
RUN build.sh /src/base/make.sh
# patch
COPY base/patch.sh .
RUN build.sh /src/base/patch.sh
# perl
COPY base/perl.sh .
RUN build.sh /src/base/perl.sh
# sed
COPY base/sed.sh .
RUN build.sh /src/base/sed.sh
# tar
COPY base/tar.sh .
RUN build.sh /src/base/tar.sh
# texinfo
COPY base/texinfo.sh .
RUN build.sh /src/base/texinfo.sh
# util
COPY base/util-linux.sh .
RUN build.sh /src/base/util-linux.sh
# xz
COPY base/xz.sh .
RUN build.sh /src/base/xz.sh

# The extras stage provides...

FROM common AS extras
COPY --from=base ${SYSROOT} ${SYSROOT}
WORKDIR /src
COPY extras/checksums.* .
WORKDIR /src/extras
# ca-certificates
COPY extras/ca-certificates.sh .
RUN build.sh /src/extras/ca-certificates.sh
# zlib
COPY extras/zlib.sh .
RUN build.sh /src/extras/zlib.sh
# libressl
COPY extras/libressl.sh .
RUN build.sh /src/extras/libressl.sh
# curl
COPY extras/curl.sh .
RUN build.sh /src/extras/curl.sh
# flex
COPY extras/flex.sh .
RUN build.sh /src/extras/flex.sh
# autoconf
COPY extras/autoconf.sh .
RUN build.sh /src/extras/autoconf.sh
# automake
COPY extras/automake.sh .
RUN build.sh /src/extras/automake.sh
# libtool
COPY extras/libtool.sh .
RUN build.sh /src/extras/libtool.sh
# pkg-config
COPY extras/pkg-config.sh .
RUN build.sh /src/extras/pkg-config.sh
# argp-standalone
COPY extras/argp-standalone.sh .
COPY extras/patches/argp-standalone-1.3-musl-fix-inline.patch .
RUN build.sh /src/extras/argp-standalone.sh
# fts-standalone
COPY extras/fts-standalone.sh .
RUN build.sh /src/extras/fts-standalone.sh
# obstack-standalone
COPY extras/obstack-standalone.sh .
RUN build.sh /src/extras/obstack-standalone.sh
# elfutils
COPY extras/elfutils.sh .
COPY extras/patches/elfutils-0.173-fix-uninitialized.patch .
COPY extras/patches/elfutils-0.173-musl-cdefs.patch .
COPY extras/patches/elfutils-0.173-musl-fts-obstack.patch .
COPY extras/patches/elfutils-0.173-musl-macros.patch .
COPY extras/patches/elfutils-0.173-musl-qsort_r.patch .
COPY extras/patches/elfutils-0.173-musl-strerror_r.patch .
COPY extras/patches/elfutils-0.173-musl-strndupa.patch .
RUN build.sh /src/extras/elfutils.sh
# bc
COPY extras/bc.sh .
RUN build.sh /src/extras/bc.sh
# git
COPY extras/git.sh .
RUN build.sh /src/extras/git.sh
# cpio
COPY extras/cpio.sh .
RUN build.sh /src/extras/cpio.sh
# cleanup
COPY extras/strip.sh .
RUN ./strip.sh

# The golang stage provides...

FROM extras AS golang
WORKDIR /src
COPY golang/checksums.* .
WORKDIR /src/golang
# common Go env
ENV CGO_ENABLED 0
# go
COPY golang/go.sh .
RUN build.sh /src/golang/go.sh

# The protoc stage provides...

FROM golang AS protoc
WORKDIR /src
COPY protoc/checksums.* .
WORKDIR /src/protoc
# protoc
COPY protoc/protoc.sh .
COPY protoc/patches/musl-fix.patch .
RUN build.sh /src/protoc/protoc.sh
# protoc-gen-go
COPY protoc/protoc-gen-go.sh .
RUN build.sh /src/protoc/protoc-gen-go.sh

# The toolchain stage provides the final image for the toolchain.

FROM scratch AS toolchain
ENV PATH /toolchain/bin
COPY --from=protoc /talos/toolchain /toolchain
COPY build.sh /toolchain/bin
COPY versions.sh /toolchain/bin
SHELL [ "/toolchain/bin/bash", "-c" ]
RUN mkdir /bin
RUN mkdir /tmp
RUN ln -sv bash /bin/sh
RUN ln -sv /toolchain/bin/bash /bin/bash
WORKDIR /src
COPY toolchain/checksums.* .
WORKDIR /src/toolchain
COPY toolchain/musl.sh .
RUN build.sh /src/toolchain/musl.sh
COPY toolchain/adjust.sh .
RUN ./adjust.sh
COPY toolchain/linux.sh .
RUN build.sh /src/toolchain/linux.sh
ENV GOROOT /toolchain/go
ENV CGO_ENABLED 0
ENV PATH /bin:/usr/bin:/usr/local/bin:/toolchain/bin:/toolchain/go/bin
