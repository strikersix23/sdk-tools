cmake_minimum_required(VERSION 3.6)
project(aidl-common)

set(CMAKE_C_COMPILER "/usr/bin/clang")
set(CMAKE_CXX_COMPILER "/usr/bin/clang++")

find_package(BISON REQUIRED)
find_package(FLEX REQUIRED)

#if(BISON_FOUND)
#enfif()

#if(FLEX_FOUND)
#enfif()

# bison和flex生成对应的c++头文件和源文件
bison_target(
	LangParser ${CMAKE_SOURCE_DIR}/${AOSP}/system/tools/aidl/aidl_language_y.yy ${CMAKE_SOURCE_DIR}/${AOSP}/system/tools/aidl/aidl_language_y.cpp
	DEFINES_FILE ${CMAKE_SOURCE_DIR}/${AOSP}/system/tools/aidl/aidl_language_y.h
)
flex_target(
	LangScanner ${CMAKE_SOURCE_DIR}/${AOSP}/system/tools/aidl/aidl_language_l.ll ${CMAKE_SOURCE_DIR}/${AOSP}/system/tools/aidl/aidl_language_l.cpp
	DEFINES_FILE ${CMAKE_SOURCE_DIR}/${AOSP}/system/tools/aidl/aidl_language_l.h
)
add_flex_bison_dependency(LangScanner LangParser)

# aidl-common头文件目录
include_directories(
		${aidl_header}
		${base_header}
		${libcutils_header}
		${libcxx_header}
        ${libcxxabi_header}
        ${compiler_rt_header}
)

# aidl-common源文件
set(aidl_common_sources 
		${CMAKE_SOURCE_DIR}/${AOSP}/system/tools/aidl/aidl.cpp
		${CMAKE_SOURCE_DIR}/${AOSP}/system/tools/aidl/aidl_language.cpp
		${BISON_LangParser_OUTPUTS}
    	${FLEX_LangScanner_OUTPUTS}
		${CMAKE_SOURCE_DIR}/${AOSP}/system/tools/aidl/ast_cpp.cpp
		${CMAKE_SOURCE_DIR}/${AOSP}/system/tools/aidl/ast_java.cpp
		${CMAKE_SOURCE_DIR}/${AOSP}/system/tools/aidl/code_writer.cpp
		${CMAKE_SOURCE_DIR}/${AOSP}/system/tools/aidl/generate_cpp.cpp
		${CMAKE_SOURCE_DIR}/${AOSP}/system/tools/aidl/generate_java.cpp
		${CMAKE_SOURCE_DIR}/${AOSP}/system/tools/aidl/generate_java_binder.cpp
		${CMAKE_SOURCE_DIR}/${AOSP}/system/tools/aidl/import_resolver.cpp
		${CMAKE_SOURCE_DIR}/${AOSP}/system/tools/aidl/line_reader.cpp
		${CMAKE_SOURCE_DIR}/${AOSP}/system/tools/aidl/io_delegate.cpp
		${CMAKE_SOURCE_DIR}/${AOSP}/system/tools/aidl/options.cpp
		${CMAKE_SOURCE_DIR}/${AOSP}/system/tools/aidl/type_cpp.cpp
		${CMAKE_SOURCE_DIR}/${AOSP}/system/tools/aidl/type_java.cpp
		${CMAKE_SOURCE_DIR}/${AOSP}/system/tools/aidl/type_namespace.cpp
)


# 设置cflags与cxxflags
set(aidl_common_cflags "-Wall -Wextra -Werror -Wno-unused-parameter -Wno-unused-function -Wno-unneeded-internal-declaration -Wno-deprecated-register -Wno-writable-strings")
set(aidl_common_cxxflags "${aidl_common_cflags} -std=gnu++14 -fPIC  ${global_libcxx_cxxflags} -Wno-unused-command-line-argument")
set(CMAKE_C_FLAGS ${aidl_common_cflags})
set(CMAKE_CXX_FLAGS ${aidl_common_cxxflags})

# 生成libaidl_common.a
add_library(aidl_common STATIC ${aidl_common_sources})
target_link_libraries(aidl_common base cutils)




