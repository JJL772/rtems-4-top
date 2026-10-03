#!/usr/bin/env bash

TOP="$(readlink -f "$(dirname "${BASH_SOURCE[0]}")")"
export PATH="$PATH:${TOP}/host/amd64_linux26/bin"
