cmake_minimum_required(VERSION 3.6)
project(aidl-cpp)

set(CMAKE_C_COMPILER "/usr/bin/clang")
set(CMAKE_CXX_COMPILER "/usr/bin/clang++")


# aidl-cpp头文件目录
include_directories(
		${aidl_header}
		${base_header}
		${libcutils_header}
		${libcxx_header}
        ${libcxxabi_header}
        ${compiler_rt_header}
)


# aidl-cpp源文件
set(aidl_cpp_sources ${CMAKE_SOURCE_DIR}/${AOSP}/system/tools/aidl/main_cpp.cpp)

# 设置cflags与cxxflags
set(aidl_cpp_cflags "-Wall -Wextra -Werror -Wno-unused-parameter -Wno-unused-function -Wno-unneeded-internal-declaration -Wno-deprecated-register -Wno-writable-strings --static")
set(aidl_cpp_cxxflags "${aidl_cpp_cflags} -std=gnu++14 -fPIC  ${global_libcxx_cxxflags} -Wno-unused-command-line-argument")
set(CMAKE_C_FLAGS ${aidl_cpp_cflags})
set(CMAKE_CXX_FLAGS ${aidl_cpp_cxxflags})


# 生成aidl-cpp可执行文件
add_executable(aidl-cpp ${aidl_cpp_sources})
target_link_libraries(aidl-cpp aidl_common base)




