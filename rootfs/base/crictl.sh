#!/bin/bash

set -eou pipefail

curl -L https://github.com/kubernetes-sigs/cri-tools/releases/download/v${crictl}/crictl-v${crictl}-linux-arm.tar.gz | tar -xz -C /rootfs/bin
