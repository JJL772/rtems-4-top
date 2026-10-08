#!/usr/bin/env bash

set -e
cd "$(dirname "${BASH_SOURCE[0]}")"

# Update me when you bump the RTEMS patch version
RT_PATCH=5
PATCH=4

while test $# -gt 0; do
    case $1 in
    -a)
        ARCH=$2
        shift
        ;;
    -r)
        RT_PATCH=$2
        shift
        ;;
    -p)
        PATCH=$2
        shift
        ;;
    -h)
        echo "USAGE: conf-ssrlApps.sh -a ARCH [-p PATCH_LEVEL] [-r RT_PATCH_LVL]"
        exit 0
        ;;
    *)
        ;;
    esac
    shift
done

if [ -z "${ARCH}" ]; then
    echo "Must pass -a ARCH (i386, powerpc, m68k)!"
    exit 1
fi

case "${ARCH}" in
    i386)
        BSPS="pc586"
        ;;
    m68k)
        BSPS="uC5282"
        ;;
    powerpc)
        BSPS="beatnik mvme2100 mvme2307 mvme3100 psim svgm"
        ;;
    *)
        echo "Unsupported architecture. Must be one of: i386, powerpc, m68k"
        exit 1
        ;;
esac

cd src/ssrlApps
mkdir -p build-rtems-${ARCH}

if [ ! -f configure ]; then
    ./bootstrap
fi

cd build-rtems-${ARCH}

../configure \
    --enable-rtemsbsp="$BSPS" \
    --with-rtems-top="$PWD/../../../target/rtems_p${RT_PATCH}" \
    --prefix="$PWD/../../../" \
    --with-package-subdir="target/rtems_p${RT_PATCH}/ssrlApps_p${PATCH}" \

