#!/bin/bash

set -eou pipefail

download https://releases.pagure.org/libaio/libaio-${libaio}.tar.gz

cd ../src
make -j $(nproc)
make install
cd -
