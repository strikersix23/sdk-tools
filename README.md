aapt-cmake-build has been renamed to build-tools

update android version to android-11

Building android-sdk/build-tools, such as aapt aapt2 aidl zipalign ... which supports compiling with Termux. 

Termux needs to install aarch64 version of Linux. [TermuxArch](https://github.com/SDRausty/TermuxArch) 
is recommended, of course you can also install other.  The Linux distribution Ubuntu Debian Kali works ...

ArchLinux only downloads source code, we are not using it to compile.

If you need other tools, adb fastboot dexdump  etc., just add the cmake script of the corresponding tool under build-tools/cmake

you need ndk toolchain to compile.

download [aarch64-linux-android](https://github.com/Lzhiyong/termux-ndk/releases)

 **** 
### How to build

```bash
# install repo
pacman -S repo

cd build-tools/android-11

# download source code
repo init -u https://android.googlesource.com/platform/manifest -b master

# for china
repo init -u https://aosp.tuna.tsinghua.edu.cn/platform/manifest -b master

repo sync -c -j4

# download finish, exit ArchLinux
exit


# start building...
cd build-tools && mkdir build

cmake -G 'Ninja' \
	-DCMAKE_C_COMPILER=your_path/aarch64-linux-android/bin/clang \
	-DCMAKE_CXX_COMPILER=your_path/aarch64-linux-android/bin/clang++ \
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