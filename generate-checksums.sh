#!/bin/bash

set -eou pipefail

if [ "$#" -ne 1 ]; then
    echo "Please pass stage name"
fi

source versions.sh

stage="$1"

urls=`grep -h 'download ' "${stage}"/*.sh | awk '$2 ~ /^-/ { print $3; next } { print $2 }' | sort | uniq | envsubst`

stage_dir="${PWD}/${stage}"

TMP=$(mktemp -d)
cd $TMP

for url in ${urls}; do
  wget $url
done

for checksum in sha256 sha512; do
  ${checksum}sum * > "${stage_dir}/checksums.${checksum}"
done

rm -rf $TMP

