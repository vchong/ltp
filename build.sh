#!/bin/sh
# Export language settings

export LANG=C
export LC_ALL=C

# Set some useful variables (adapt if you dislike)

WORKING_DIR="$HOME/work/tkts/1695/ltp"

PREFIX="$HOME/work/tkts/1695/opt"

MAKE_JOBS=$(getconf _NPROCESSORS_ONLN)

BUILD_LOG_FILE="build-log.txt"
INSTALL_LOG_FILE="install-log.txt"

# PREREQS on Ubuntu (package-list is incomplete and may vary for other distros)

# Configure LTP

CC=$HOME/work/tcwg/bin/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/bin
CROSS_COMPILER=$CC/arm-linux-gnueabihf
export CC=$CROSS_COMPILER-gcc

export LD=$CROSS_COMPILER-ld

export AR=$CROSS_COMPILER-ar

export STRIP=$CROSS_COMPILER-strip

export RANLIB=$CROSS_COMPILER-ranlib

export CROSS_COMPILE=$CC/arm-linux-gnueabihf-

export ARCH=arm

make autotools
./configure --build=x86_64-unknown-linux-gnu --host=arm-linux-gnueabihf --target=arm-linux-gnueabihf --with-realtime-testsuite LDFLAGS="-static"

# Start building LTP

make -j$MAKE_JOBS 2>&1 | tee ../$BUILD_LOG_FILE

# Install LTP (requires superuser privileges)

# sudo make install 2>&1 | tee ../$INSTALL_LOG_FILE
