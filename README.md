编译android-sdk/build-tools下的一些工具，比如aapt aapt2 aidl zipalign...，支持用Termux进行编译，想要成功编译，Termux需要安装aarch64版本的Linux，推荐[TermuxArch](https://github.com/SDRausty/TermuxArch)
，当然也可以装其他的Linux发行版本Ubuntu Debian Kali都可以...
如果你还需要其他的一些tools，adb fastboot dex等等，只需要在aapt-cmake-build/script下增加相应的工具的CMakeLists.txt就可以！


Build some tools under android-sdk / build-tools, such as aapt aapt2 aidl zipalign ..., which supports compiling with Termux. To successfully compile, Termux needs to install aarch64 version of Linux. [TermuxArch](https://github.com/SDRausty/TermuxArch)
 is recommended, of course, you can also install other  The Linux distribution Ubuntu Debian Kali works ...
If you need other tools, adb fastboot dex, etc., just add the cmake script of the corresponding tool under aapt-cmake-build/script.


 **** 
### 如何编译

```bash
# install repo
pacman -S repo

# install some necessary tools
pacman -S clang git cmake bison flex curl python2 

cd aapt-cmake-build/android-8.1

# download source code
repo init -u https://android.googlesource.com/platform/manifest -b android-8.1.0_r1 

# for china
repo init -u https://aosp.tuna.tsinghua.edu.cn/platform/manifest -b android-8.1.0_r1

repo sync -c -j4

# download finish
./build.sh
```


如果你下载不是android-8.1的源码，你需要修改aapt-cmake-build/CMakeLists.txt

set(AOSP android-8.1) 改成你自己下载对应的安卓版本.

每个安卓版本源码都会有很大的改动, 如果就这样直接编译肯定是会报错的

你需要参照Android.bp文件，修改对应的CMakeLists.txt


```bash
# mv android-8.1 android-9.0
# modify CMakeLists.txt
set(AOSP android-9.0)
```

项目参考于[lizhangqu](https://github.com/lizhangqu/aapt-cmake-buildscript.git)



 **** 
screenshot1.jpg
![image](https://raw.githubusercontent.com/Lzhiyong/aapt-cmake-build/master/screenshot/screenshot1.jpg)

screenshot2.jpg
![image](https://raw.githubusercontent.com/Lzhiyong/aapt-cmake-build/master/screenshot/screenshot2.jpg)

