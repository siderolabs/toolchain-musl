#!/bin/bash

set -eou pipefail

download https://fossies.org/linux/misc/bzip2-1.0.6.tar.gz
make -C ../
make -C ../ PREFIX=${TOOLCHAIN} install
