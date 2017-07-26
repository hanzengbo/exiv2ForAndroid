#!/bin/bash

export INSTALL_DIR="`pwd`/jni/expat"
export NDK=/home/hzb/Android/Sdk/ndk-bundle
export SYSROOT=/home/hzb/android_toolchain_21/sysroot
export TOOLCHAIN=/home/hzb/android_toolchain_21

export CROSS_COMPILE="arm-linux-androideabi"
export PATH="$TOOLCHAIN/bin:$PATH"
export ARCH="armeabi-v7a"
export CC="${CROSS_COMPILE}-gcc --sysroot=$SYSROOT"
export LD="${CROSS_COMPILE}-ld --sysroot=$SYSROOT"
export CFLAGS="-D__ANDROID__ -D__ARM_ARCH_7__ -D__ARM_ARCH_7T__ -D__ARM_ARCH_7E__ -D__ARM_ARCH_7TE__ -mandroid --sysroot $SYSROOT -march=armv7-a -mfloat-abi=softfp -mthumb -O2"
export LDFLAGS='-s'

mkdir -p $INSTALL_DIR
./configure --host=arm-linux-androideabi --prefix=$INSTALL_DIR

make
make install

exit 0

#CFLAGS=-O2 LDFLAGS=-s ./configure --host=arm-linux-androideabi --prefix=$INSTALL_DIR

#/home/hzb/Android/Sdk/ndk-bundle/platforms/android-9/arch-arm/usr/lib
