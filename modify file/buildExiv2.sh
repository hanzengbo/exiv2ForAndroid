#!/bin/bash

INSTALL_DIR="`pwd`/jni/exiv2"

export NDK=/home/hzb/Android/Sdk/ndk-bundle
export SYSROOT=/home/hzb/android_toolchain_21/sysroot
export TOOLCHAIN=/home/hzb/android_toolchain_21

export PATH=$TOOLCHAIN/bin:$PATH

export ARCH="armeabi-v7a"
export CROSS_COMPILE="arm-linux-androideabi"

export CC="${CROSS_COMPILE}-gcc --sysroot=$SYSROOT"
export CXX="${CROSS_COMPILE}-g++ --sysroot=$SYSROOT"

#export CFLAGS="-D__ANDROID__ -D__ARM_ARCH_7__ -D__ARM_ARCH_7T__ -D__ARM_ARCH_7E__ -D__ARM_ARCH_7TE__ -mandroid --sysroot=$SYSROOT -mthumb -mfloat-abi=softfp -O2 -I${NDK}/sources/cxx-stl/gnu-libstdc++/4.9/include -I${NDK}/sources/cxx-stl/gnu-libstdc++/4.9/include -I${NDK}/sources/cxx-stl/gnu-libstdc++/libs/armeabi-v7a/include"
export CFLAGS="-D__ANDROID__ -D__ARM_ARCH_7__ -D__ARM_ARCH_7T__ -D__ARM_ARCH_7E__ -D__ARM_ARCH_7TE__ -mandroid --sysroot $SYSROOT -march=armv7-a -mfloat-abi=softfp -O2"
#export CFLAGS="-mthumb -O2"

export CXXFLAGS="$CFLAGS"
export LDFLAGS="-Wl,-rpath-link=$SYSROOT/usr/lib/ -L$SYROOT/usr/lib/"
export LIBS="-lstdc++ -lsupc++"

mkdir -p $INSTALL_DIR
./configure --disable-shared --disable-nls --host=arm-linux-androideabi --with-expat=/home/hzb/work/expat --prefix=$INSTALL_DIR 

make
make install

exit 0

#-L/home/hzb/Android/Sdk/ndk-bundle/sources/cxx-stl/gnu-libstdc++/4.9/usr/libs/armeabi-v7a
