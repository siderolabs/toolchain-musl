#!/bin/bash

set -eou pipefail

mkdir -p /rootfs/etc/ssl/certs
curl -o /rootfs/etc/ssl/certs/ca-certificates.crt https://curl.haxx.se/ca/cacert.pem
