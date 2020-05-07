cmake_minimum_required(VERSION 3.4.1)

project(build-tools)

# android source code 
set(AOSP android-11)


# headers files
set(native_headers
    ${CMAKE_SOURCE_DIR}/${AOSP}/frameworks/native/include
    )
        
        
set(safe_iop_headers
    ${CMAKE_SOURCE_DIR}/${AOSP}/external/safe-iop/include
    )
        
set(libbacktrace_headers
    ${CMAKE_SOURCE_DIR}/${AOSP}/system/core/libbacktrace
    ${CMAKE_SOURCE_DIR}/${AOSP}/system/core/libbacktrace/include
    )
        
        
set(libsystem_headers
    ${CMAKE_SOURCE_DIR}/${AOSP}/system/core/libsystem/include
    )


set(androidfw_headers
    ${CMAKE_SOURCE_DIR}/${AOSP}/frameworks/base/libs/androidfw/include
    )
        
set(expat_headers
    ${CMAKE_SOURCE_DIR}/${AOSP}/external/expat
    ${CMAKE_SOURCE_DIR}/${AOSP}/external/expat/lib
    )
        
        
set(libpng_headers
    ${CMAKE_SOURCE_DIR}/${AOSP}/external/libpng
    )
        
        
set(protobuf_headers
    ${CMAKE_SOURCE_DIR}/${AOSP}/external/protobuf/android
    ${CMAKE_SOURCE_DIR}/${AOSP}/external/protobuf/src
    )
        
        
set(zlib_headers
    ${CMAKE_SOURCE_DIR}/${AOSP}/external/zlib
    ${CMAKE_SOURCE_DIR}/${AOSP}/external/zlib/src
    )

set(libcxx_headers
    ${CMAKE_SOURCE_DIR}/${AOSP}/external/libcxx/include
    )


set(libcxxabi_headers
    ${CMAKE_SOURCE_DIR}/${AOSP}/external/libcxxabi/include
    )


set(compiler-rt_headers
    ${CMAKE_SOURCE_DIR}/${AOSP}/external/compiler-rt/include
    )


set(libbase_headers
    ${CMAKE_SOURCE_DIR}/${AOSP}/system/core/base/include
    )
        
        
set(libcutils_headers
    ${CMAKE_SOURCE_DIR}/${AOSP}/system/core/libcutils
    ${CMAKE_SOURCE_DIR}/${AOSP}/system/core/libcutils/include
    )
        
        
set(liblog_headers
    ${CMAKE_SOURCE_DIR}/${AOSP}/system/core/liblog
    ${CMAKE_SOURCE_DIR}/${AOSP}/system/core/liblog/include
    )
        
        
set(libutils_headers
    ${CMAKE_SOURCE_DIR}/${AOSP}/system/core/libutils
    ${CMAKE_SOURCE_DIR}/${AOSP}/system/core/libutils/include
    )
        
        
set(libziparchive_headers
    ${CMAKE_SOURCE_DIR}/${AOSP}/system/core/libziparchive
    ${CMAKE_SOURCE_DIR}/${AOSP}/system/core/libziparchive/include
    )
        
        
set(libnativehelper_headers
    ${CMAKE_SOURCE_DIR}/${AOSP}/libnativehelper/include_jni
    )
        
        
set(aapt_headers
    ${CMAKE_SOURCE_DIR}/${AOSP}/frameworks/base/tools/aapt
    )
        
        
set(aapt2_headers
    ${CMAKE_SOURCE_DIR}/${AOSP}/frameworks/base/tools/aapt2
    )
        
set(aidl_headers
    ${CMAKE_SOURCE_DIR}/${AOSP}/system/tools/aidl
    )


set(libzopfli_headers
    ${CMAKE_SOURCE_DIR}/${AOSP}/external/zopfli/src
    )


set(zipalign_headers
    ${CMAKE_SOURCE_DIR}/${AOSP}/build/tools/zipalign
    )

set(libprocessgroup_headers
    ${CMAKE_SOURCE_DIR}/${AOSP}/system/core/libprocessgroup
	${CMAKE_SOURCE_DIR}/${AOSP}/system/core/libprocessgroup/include
	${CMAKE_SOURCE_DIR}/${AOSP}/system/core/libprocessgroup/cgrouprc/include
	)

set(libvndksupport_headers
    ${CMAKE_SOURCE_DIR}/${AOSP}/system/core/libvndksupport/include
	${CMAKE_SOURCE_DIR}/${AOSP}/system/core/libvndksupport/include/vndksupport
	)

set(libjsoncpp_headers
	${CMAKE_SOURCE_DIR}/${AOSP}/external/jsoncpp/include
	)
	
set(libbuildversion_headers
	${CMAKE_SOURCE_DIR}/${AOSP}/build/soong/cc/libbuildversion/include
	)

set(GLOBAL_C_FLAGS "-Wall -fPIC -std=c11")

# use libcxx need set -isystem
set(GLOBAL_CXX_FLAGS "-isystem ${libcxx_headers} -isystem ${libcxxabi_headers} -Wall -nostdinc++ -fPIC -std=c++14")


# default use libcxx and libcxxabi
include_directories(
	${libcxx_headers}
    ${libcxxabi_headers}	
)


add_subdirectory(cmake)
