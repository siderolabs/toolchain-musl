download https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-${linuxKernel}.tar.xz

make -j $(nproc) -C ../ INSTALL_HDR_PATH=dest headers_install ARCH=arm
cp -rv ../dest/include/* ${TOOLCHAIN}/include
