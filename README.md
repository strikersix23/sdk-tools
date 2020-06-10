aapt-cmake-build has been renamed to build-tools

update android version to android-11

At first, we cannot directly use the termux to build AOSP, because blueprint and soong compilation fails, but if you can successfully compile blueprint and soong, maybe you can use termux to compile AOSP, we only need to replace the prebuilts toolchain.

Since it is not possible to compile android-sdk directly through the mm sdk command, so choose cmake to compile each tool separately.

Building android-sdk/build-tools and platform-tools, such as aapt aapt2 aidl zipalign adb fastboot ... etc, which supports compiling with Termux. 

In order to download the source code more conveniently, termux needs to install aarch64 version of Linux. [TermuxArch](https://github.com/SDRausty/TermuxArch) 
is recommended, Of course you can also install other Linux distributions, ubuntu debian kali ... etc.

ArchLinux only downloads source code, we are not using it to compile.

If you need other tools, please add the cmake script of the corresponding tool under build-tools/cmake

you can use prebuilt ndk-r21 to compile, ndk from [termux-ndk](https://github.com/Lzhiyong/termux-ndk) or use termux's clang to compile, If you want to compile statically with termux, you need install ndk-multilib, pkg install ndk-multilib
and add LDFLAGS="-static -fuse-ld=lld", lld compatibility is better and faster.


The compiled binary files are placed in the [android-sdk](https://github.com/Lzhiyong/termux-ndk/releases)/build-tools and platform-tools

 **** 
### How to build

```bash
# install repo
pacman -S repo

cd build-tools/android-11

# download source code
repo init -u https://android.googlesource.com/platform/manifest -b master --partial-clone

# for china
repo init -u https://android.googlesource.com/platform/manifest -b master --partial-clone

repo sync -c -j4

# download finish, exit ArchLinux
exit


# start building...
cd build-tools && mkdir build && cd build

TOOLCHAIN=/path/to/android-ndk-r21/toolchains/llvm/prebuilt/linux-aarch64

cmake -G 'Ninja' \
    -DCMAKE_C_COMPILER=$TOOLCHAIN/bin/aarch64-linux-android29-clang \
    -DCMAKE_CXX_COMPILER=$TOOLCHAIN/bin/aarch64-linux-android29-clang++ \
    -DCMAKE_SYSROOT=$TOOLCHAIN/sysroot \
    -DCMAKE_BUILD_TYPE=Release \
    ..

ninja -j16
```


If you download the source code that is not android-11, you need to modify build-tools/CMakeLists.txt

set (AOSP android-11) Change to download the corresponding Android version.

the source code of each Android version has been changed, and direct compilation will fail.

You need to refer to the Android.bp file and modify the corresponding CMakeLists.txt

reference [lizhangqu](https://github.com/lizhangqu/aapt-cmake-buildscript.git)



 **** 
screenshot.jpg
![image](https://raw.githubusercontent.com/Lzhiyong/build-tools/master/screenshot/screenshot.jpg)
