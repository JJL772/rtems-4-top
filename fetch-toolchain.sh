#!/usr/bin/env bash

set -e
cd "$(dirname "${BASH_SOURCE[0]}")"

wget https://github.com/JJL772/slac-rtems-docker/releases/download/base/rtems-4.10.2-toolchain.tar.gz

tar -xvf rtems-4.10.2-toolchain.tar.gz

