download https://sourceware.org/ftp/elfutils/${elfutils}/elfutils-${elfutils}.tar.bz2

apk add autoconf automake
case "${elfutils}" in
0.173)
  cd ../
  patch -Np0 -i /src/extras/elfutils-0.173-fix-uninitialized.patch
  patch -Np0 -i /src/extras/elfutils-0.173-musl-cdefs.patch
  patch -Np0 -i /src/extras/elfutils-0.173-musl-fts-obstack.patch
  patch -Np0 -i /src/extras/elfutils-0.173-musl-macros.patch
  patch -Np0 -i /src/extras/elfutils-0.173-musl-qsort_r.patch
  patch -Np0 -i /src/extras/elfutils-0.173-musl-strerror_r.patch
  patch -Np0 -i /src/extras/elfutils-0.173-musl-strndupa.patch
  autoreconf -if
  cd -
esac

cat > ../src/error.h <<-EOF
	#ifndef _ERROR_H_
	#define _ERROR_H_

	#include <stdarg.h>
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include <errno.h>

	static unsigned int error_message_count = 0;

	static inline void error(int status, int errnum, const char* format, ...)
	{
		va_list ap;
		fprintf(stderr, "%s: ", program_invocation_name);
		va_start(ap, format);
		vfprintf(stderr, format, ap);
		va_end(ap);
		if (errnum)
			fprintf(stderr, ": %s", strerror(errnum));
		fprintf(stderr, "\n");
		error_message_count++;
		if (status)
			exit(status);
	}

	#endif	/* _ERROR_H_ */
EOF
cp -v ../src/error.h ${TOOLCHAIN}/include

../configure \
    --prefix=${TOOLCHAIN} \
	  --without-bzlib \
    CFLAGS="${CFLAGS} -fPIC -Wno-error"
make -C lib libeu.a -j $(nproc)
make -C libelf -j $(nproc)
make -C libelf install
