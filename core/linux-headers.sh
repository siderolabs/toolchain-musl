download https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.19.31.tar.xz

make -C ../ INSTALL_HDR_PATH=dest headers_install
cp -rv ../dest/include/* ${TOOLCHAIN}/include
