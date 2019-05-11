#!/bin/bash

set -eou pipefail

download https://www.kernel.org/pub/linux/utils/boot/syslinux/syslinux-${syslinux}.tar.xz

cd ../

ln -s /toolchain/bin/pwd /bin/pwd
make -j $(nproc) installer
cp bios/extlinux/extlinux /rootfs/bin
mkdir -p /rootfs/usr/lib/syslinux
cp efi64/mbr/gptmbr.bin /rootfs/usr/lib/syslinux/
cp efi64/efi/syslinux.efi /rootfs/usr/lib/syslinux/
cp efi64/com32/elflink/ldlinux/ldlinux.e64 /rootfs/usr/lib/syslinux/