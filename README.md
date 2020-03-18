# aapt-cmake-build
构建android-sdk/build-tools下的一些工具，比如aapt aapt2 aidl zipalign...，支持用Termux进行编译，想要成功编译，Termux需要安装aarch64版本的Linux，推荐ArchLinux，当然也可以装其他的Linux发行版本Ubuntu Debian Kali都可以...
如果你还需要其他的一些tools，adb fastboot dex等等，只需要在script下增加相应的工具的CMakeLists.txt就可以！


Build some tools under android-sdk / build-tools, such as aapt aapt2 aidl zipalign ..., which supports compiling with Termux. To successfully compile, Termux needs to install aarch64 version of Linux. ArchLinux is recommended, of course, you can also install other  The Linux distribution Ubuntu Debian Kali works ...
If you need other tools, adb fastboot dex, etc., just add the cmake script of the corresponding tool under script!


screenshot1.jpg
![image](https://raw.githubusercontent.com/Lzhiyong/aapt-cmake-build/master/screenshot/screenshot1.jpg)

screenshot2.jpg
![image](https://raw.githubusercontent.com/Lzhiyong/aapt-cmake-build/master/screenshot/screenshot2.jpg)

 **** 
aapt aapt2 aidl aidl-cpp 是静态编译的可以在安卓上直接执行，zipalign不是静态链接的(应该也是可以静态链接的)，所以只能在Linux环境下执行

### 如何编译

```bash
# 安装一些必要的工具
# for ArchLinux
pacman -S clang git cmake bison flex curl python2  #archLinux

# for Ubuntu
apt install clang git cmake bison flex curl python2 #ubuntu
```


#### 安装repo
```bash
mkdir ~/bin 
PATH=~/bin:$PATH 
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo 
chmod a+x ~/bin/repo
```

#### 初始化repo项目
```bash
#进入安卓源码目录 
cd aapt-cmake-build/android-8.1
#如果存在repo bundle下载不下来的情况，请使用下面的命令进行手动clone 
#git clone http://mirrors.ustc.edu.cn/aosp/git-repo.git/ .repo/repo 
#初始化并同步源码树，约3G 
repo init -u https://android.googlesource.com/platform/manifest -b android-8.1.0_r1 
repo sync -j8
#源码下载完之后直接执行
./build.sh
```

如果你下载不是android-8.1的源码，你需要修改aapt-cmake-build/CMakeLists.txt

set(AOSP android-8.1) 改成你自己下载对应的安卓版本
```bash
# mv android-8.1 android-9.0
# 修改CMakeLists.txt
set(AOSP android-9.0)
```

项目来源于[lizhangqu](https://github.com/lizhangqu/aapt-cmake-buildscript.git)


