#!/bin/bash

set -eou pipefail

curl --retry 3 --retry-delay 60 -L https://storage.googleapis.com/kubernetes-release/release/v${kubeadm}/bin/linux/arm/kubeadm -o /rootfs/bin/kubeadm
chmod +x /rootfs/bin/kubeadm
