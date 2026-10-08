# Environment configuration script for use with the fish shell
set TOP (readlink -f (dirname (status --current-filename)))

export RTEMS_TOP="$TOP"
export PATH="$TOP/host/amd64_linux26/bin:$TOP/tools/bin:$PATH"
