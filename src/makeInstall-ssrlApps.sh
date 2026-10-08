#!/usr/bin/env bash
set -e

cd "$(dirname "${BASH_SOURCE[0]}")"
cd ssrlApps
make -C build-rtems-powerpc install

cp -rv ../../target/rtems_p5/ssrlApps_p4/* /srv/tftp/rtems/
