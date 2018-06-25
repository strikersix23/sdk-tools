# aapt-cmake-build
构建android-sdk/build-tools下的一些工具，比如aapt aapt2 aidl zipalign...支持在arm平台上进行编译，支持直接用手机进行编译，我本人就是用的Termux，然后安装aarch64版本的archLinux来编译的，当然也可以装其他的Linux发行版本Ubuntu Debian Kali...！

下面放两张用Termux编译的图片
![image](https://raw.githubusercontent.com/Lzhiyong/aapt-cmake-build/master/screenshot/termux01.png)


====================================

![image](https://raw.githubusercontent.com/Lzhiyong/aapt-cmake-build/master/screenshot/termux02.png)


aapt aapt2 aidl aidl-cpp 是静态编译的可以在安卓上直接执行，zipalign不是静态链接的(应该也是可以静态链接的)，所以只能在Linux环境下执行

#### 如何编译
安装一些必要的工具
```bash
pacman -S clang git cmake bison flex curl python2  #archLinux
或者
 apt install clang git cmake bison flex curl python2 #ubuntu
```

下载Android源码树  

安装repo
```bash
mkdir ~/bin 
PATH=~/bin:$PATH 
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo 
chmod a+x ~/bin/repo
```

初始化repo项目
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

set(AOSP android-8.1)
改成你自己下载的安卓对应的版本，
比如我下载的是android p的源码android-p
```bash
mv android-8.1 android-p
```
修改CMakeLists.txt
set(AOSP android-p)

##### 最后感谢lizhangqu
 [lizhangqu](https://github.com/lizhangqu/aapt-cmake-buildscript.git)


