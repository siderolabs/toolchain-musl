#!/bin/bash

set -eou pipefail

mkdir -p /rootfs/opt/cni/bin
curl -L https://github.com/containernetworking/cni/releases/download/v${cni}/cni-arm-v${cni}.tgz | tar -xz -C /rootfs/opt/cni/bin
curl -L https://github.com/containernetworking/plugins/releases/download/v${cniPlugins}/cni-plugins-arm-v${cniPlugins}.tgz | tar -xz -C /rootfs/opt/cni/bin
