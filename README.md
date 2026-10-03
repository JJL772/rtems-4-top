# SLAC RTEMS 4.X Build Area

Top-level build area for RTEMS 4.X at SLAC. Currently set to RTEMS 4.10.2.

## Usage

Source env first to get the compilers on your $PATH:
```
. env.sh
```

Then, configure for your desired platform:
```
./conf-rtems.sh -a powerpc -p 5
make -C src/rtems/build-powerpc-rtems -j$(nproc) install
```

