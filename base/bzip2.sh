download https://fossies.org/linux/misc/bzip2-${bzip2}.tar.gz
make -C ../ -j $(nproc)
make -C ../ PREFIX=${TOOLCHAIN} install
