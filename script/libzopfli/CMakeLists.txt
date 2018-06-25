cmake_minimum_required(VERSION 3.6)
project(zopfli)

set(CMAKE_C_COMPILER "/usr/bin/clang")
set(CMAKE_CXX_COMPILER "/usr/bin/clang++")


include_directories(
		${zlib_header}
		${libzopfli_header}
)

set(zopfli_sources 
		${CMAKE_SOURCE_DIR}/${AOSP}/external/zopfli/src/zopfli/blocksplitter.c
		${CMAKE_SOURCE_DIR}/${AOSP}/external/zopfli/src/zopfli/cache.c
		${CMAKE_SOURCE_DIR}/${AOSP}/external/zopfli/src/zopfli/deflate.c
		${CMAKE_SOURCE_DIR}/${AOSP}/external/zopfli/src/zopfli/gzip_container.c
		${CMAKE_SOURCE_DIR}/${AOSP}/external/zopfli/src/zopfli/hash.c
		${CMAKE_SOURCE_DIR}/${AOSP}/external/zopfli/src/zopfli/katajainen.c
		${CMAKE_SOURCE_DIR}/${AOSP}/external/zopfli/src/zopfli/lz77.c
		${CMAKE_SOURCE_DIR}/${AOSP}/external/zopfli/src/zopfli/squeeze.c
		${CMAKE_SOURCE_DIR}/${AOSP}/external/zopfli/src/zopfli/tree.c
		${CMAKE_SOURCE_DIR}/${AOSP}/external/zopfli/src/zopfli/util.c
		${CMAKE_SOURCE_DIR}/${AOSP}/external/zopfli/src/zopfli/zlib_container.c
		${CMAKE_SOURCE_DIR}/${AOSP}/external/zopfli/src/zopfli/zopfli_lib.c
)

set(zopfli_cflags "-O2 -Wno-unused-parameter -Werror")
set(zopfli_cxxflags ${zopfli_cflags})
set(CMAKE_C_FLAGS ${zopfli_cflags})
set(CMAKE_CXX_FLAGS ${zopfli_cxxflags})

add_library(zopfli STATIC ${zopfli_sources})
target_link_libraries(zopfli)


