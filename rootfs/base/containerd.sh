#!/bin/bash

set -eou pipefail

export GOPATH=/go
export GO111MODULE=on
export GOARCH=arm
export GOARM=7

mkdir -p $GOPATH/src/github.com/containerd \
    && cd $GOPATH/src/github.com/containerd \
    && git clone https://github.com/containerd/containerd.git \
    && cd $GOPATH/src/github.com/containerd/containerd \
    && git checkout v${containerd}
cd $GOPATH/src/github.com/containerd/containerd \
    && make binaries BUILDTAGS=no_btrfs \
    && cp bin/containerd /rootfs/bin \
    && cp bin/containerd-shim /rootfs/bin
