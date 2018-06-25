cmake_minimum_required(VERSION 3.6)
project(aidl)

set(CMAKE_C_COMPILER "/usr/bin/clang")
set(CMAKE_CXX_COMPILER "/usr/bin/clang++")

# aidl头文件目录
include_directories(
		${aidl_header}
		${base_header}
		${libcutils_header}
		${libcxx_header}
        ${libcxxabi_header}
        ${compiler_rt_header}
)

# aidl源文件
set(aidl_sources ${CMAKE_SOURCE_DIR}/${AOSP}/system/tools/aidl/main_java.cpp)

# 设置cflags与cxxflags
set(aidl_cflags "-Wall -Wextra -Werror -Wno-unused-parameter -Wno-unused-function -Wno-unneeded-internal-declaration -Wno-deprecated-register -Wno-writable-strings --static")
set(aidl_cxxflags "${aidl_cflags} -std=gnu++14 -fPIC  ${global_libcxx_cxxflags} -Wno-unused-command-line-argument")
set(CMAKE_C_FLAGS ${aidl_cflags})
set(CMAKE_CXX_FLAGS ${aidl_cxxflags})

# 生成aidl可执行文件
add_executable(aidl ${aidl_sources})
target_link_libraries(aidl aidl_common base)



