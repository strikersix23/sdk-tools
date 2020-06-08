#!/bin/bash

# check git
if [ ! -x "$(command -v git)" ]; then
  echo 'Warnning: git is not installed.' 
  pkg install git
fi

# check ninja
if [ ! -x "$(command -v ninja)" ]; then
  echo 'Warnning: ninja is not installed.'
  pkg install ninja
fi

# check boringssl
if [ ! -f "boringssl/CMakeLists.txt" ];then
  git clone https://github.com/google/boringssl
fi

# check build directory
if [ ! -d "build" ];then
  mkdir build && cd build
else
  cd build
fi

# set ndk toolchain
# /path/to/android-ndk-r21/toolchains/llvm/prebuilt/linux-aarch64
TOOLCHAIN=$HOME/android/android-ndk-r21/toolchains/llvm/prebuilt/linux-aarch64

cmake -G 'Ninja' \
    -DCMAKE_C_COMPILER=$TOOLCHAIN/bin/aarch64-linux-android29-clang \
    -DCMAKE_CXX_COMPILER=$TOOLCHAIN/bin/aarch64-linux-android29-clang++ \
    -DCMAKE_SYSROOT=$TOOLCHAIN/sysroot \
    -DCMAKE_BUILD_TYPE=Release \
    ../boringssl
    
ninja -j16

