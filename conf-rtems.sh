#!/usr/bin/env bash

set -e
cd "$(dirname "${BASH_SOURCE[0]}")"

# Update me when you bump the RTEMS patch version
PATCH=5

while test $# -gt 0; do
    case $1 in
    -a)
        ARCH=$2
        shift
        ;;
    -p)
        PATCH=$2
        shift
        ;;
    -h)
        echo "USAGE: conf-rtems.sh -a ARCH [-p PATCH_LEVEL]"
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

cd src/rtems
mkdir -p build-rtems-${ARCH}

if [ ! -f configure ]; then
    ./bootstrap
fi

cd build-rtems-${ARCH}

../configure \
    --enable-rtemsbsp="$BSPS" \
    --target="${ARCH}-rtems" \
    --prefix="$PWD/../../../target/rtems_p${PATCH}" \
    --enable-cxx \
    --enable-posix \
    --disable-tests \
    --disable-rdbg \
    RTEMS_CFLAGS="-g -fno-strict-aliasing"

