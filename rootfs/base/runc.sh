#!/bin/bash

set -eou pipefail

curl -L https://github.com/opencontainers/runc/releases/download/v${runc}/runc.amd64 -o /rootfs/bin/runc
chmod +x /rootfs/bin/runc
