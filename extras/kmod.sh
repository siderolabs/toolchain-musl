download https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-${kmod}.tar.xz

../configure \
    --prefix=${TOOLCHAIN}
make -j $(nproc)
make install
for target in depmod insmod modinfo modprobe rmmod; do ln -s ../bin/kmod ${TOOLCHAIN}/bin/$target; done
