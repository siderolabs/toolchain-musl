#!/bin/bash

set -eou pipefail

export CFLAGS="-g0 -Os"
export CXXFLAGS="-g0 -Os"
export LDFLAGS="-s"

download() {
    OPTIND=1

    skip_untar="false"

    while getopts "s" opt; do
      case "$opt" in
        s)
          skip_untar="true"
          ;;
      esac
    done

    shift $((OPTIND-1))

    cd ..

    TAR="tar --strip-components=1"

    if [[ ${1} == *.xz ]]; then
        TAR="${TAR} -xJ"
    elif [[ ${1} == *.gz || ${1} == *.tgz ]]; then
        TAR="${TAR} -xz"
    elif [[ ${1} == *.bz2 ]]; then
        TAR="${TAR} -xj"
    else
        exit 1
    fi

    if [[ ${#} == 2 ]]; then
        mkdir -p ${2}
        TAR="${TAR} -C ${2}"
    fi

    BASE=${1##*/}

    curl --retry 5 --retry-delay 0 --retry-max-time 45 -L -o "${BASE}" ${1}

    for checksum in sha256 sha512; do
      grep -F "${BASE}" /src/checksums.${checksum} | ${checksum}sum -c
    done

    if [ "$skip_untar" == "false" ]; then
      ${TAR} -f "${BASE}" && rm "${BASE}"
    fi

    cd -
}

exportcross() {
    export CC="${TARGET}-gcc"
    export CXX="${TARGET}-g++"
    export AR="${TARGET}-ar"
    export AS="${TARGET}-as"
    export RANLIB="${TARGET}-ranlib"
    export LD="${TARGET}-ld"
    export STRIP="${TARGET}-strip"
}

TMP=$(mktemp -d)
mkdir ${TMP}/build

cd ${TMP}/build

source versions.sh

# Hide build stdout since this makes logs super spammy
source "${1}" >/dev/null

rm -rf ${TMP}