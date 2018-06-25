cmake_minimum_required(VERSION 3.6)
project(libpng)

if(UNIX AND NOT APPLE)
    SET (CMAKE_C_COMPILER "/usr/bin/clang")
    SET (CMAKE_CXX_COMPILER "/usr/bin/clang++")
endif()

set(libpng_sources
        ${CMAKE_SOURCE_DIR}/${AOSP}/external/libpng/png.c
        ${CMAKE_SOURCE_DIR}/${AOSP}/external/libpng/pngerror.c
        ${CMAKE_SOURCE_DIR}/${AOSP}/external/libpng/pngget.c
        ${CMAKE_SOURCE_DIR}/${AOSP}/external/libpng/pngmem.c
        ${CMAKE_SOURCE_DIR}/${AOSP}/external/libpng/pngpread.c
        ${CMAKE_SOURCE_DIR}/${AOSP}/external/libpng/pngread.c
        ${CMAKE_SOURCE_DIR}/${AOSP}/external/libpng/pngrio.c
        ${CMAKE_SOURCE_DIR}/${AOSP}/external/libpng/pngrtran.c
        ${CMAKE_SOURCE_DIR}/${AOSP}/external/libpng/pngrutil.c
        ${CMAKE_SOURCE_DIR}/${AOSP}/external/libpng/pngset.c
        ${CMAKE_SOURCE_DIR}/${AOSP}/external/libpng/pngtrans.c
        ${CMAKE_SOURCE_DIR}/${AOSP}/external/libpng/pngwio.c
        ${CMAKE_SOURCE_DIR}/${AOSP}/external/libpng/pngwrite.c
        ${CMAKE_SOURCE_DIR}/${AOSP}/external/libpng/pngwtran.c
        ${CMAKE_SOURCE_DIR}/${AOSP}/external/libpng/pngwutil.c
        ${CMAKE_SOURCE_DIR}/${AOSP}/external/libpng/contrib/intel/intel_init.c
        ${CMAKE_SOURCE_DIR}/${AOSP}/external/libpng/contrib/intel/filter_sse2_intrinsics.c
        ${CMAKE_SOURCE_DIR}/${AOSP}/external/libpng/arm/arm_init.c
		${CMAKE_SOURCE_DIR}/${AOSP}/external/libpng/arm/filter_neon_intrinsics.c
		${CMAKE_SOURCE_DIR}/${AOSP}/external/libpng/arm/filter_neon.S
        )

enable_language(ASM)
set_source_files_properties(${CMAKE_SOURCE_DIR}/${AOSP}/external/libpng/arm/filter_neon.S PROPERTIES COMPILE_FLAGS "${CMAKE_ASM_FLAGS} ${CMAKE_CXX_FLAGS} -x assembler-with-cpp")
include_directories(
        ${libpng_header}
        ${zlib_header}
)


set(ENABLE_NEON ON)

set(libpng_cflag "-std=gnu89 -Wall -Werror -Wno-unused-parameter -DPNG_INTEL_SSE_OPT=1")

if(UNIX)
    set(libpng_cflag "${libpng_cflag} -fPIC")
endif()

#添加宏定义，目的是为了移除一部分实现，如断言，否则编译成功，执行可能有问题
set(libpng_cflag "${libpng_cflag} -DNDEBUG -UDEBUG")

set(CMAKE_C_FLAGS ${libpng_cflag})
if(UNIX)
    if(USE_32BITS)
        message(STATUS "using 32bits")
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m32")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m32")
    endif()
endif()
add_library(png STATIC ${libpng_sources})
target_link_libraries(png zlib)