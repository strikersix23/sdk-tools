cmake_minimum_required(VERSION 3.14.2)

project(libfastdeploy_host)

set(FASTDEPLOY ${AOSP}/system/core/adb/fastdeploy)

set(LIBFASTDEPLOY_SRC_FILES 
   ${FASTDEPLOY}/deploypatchgenerator/apk_archive.cpp
   ${FASTDEPLOY}/deploypatchgenerator/deploy_patch_generator.cpp
   ${FASTDEPLOY}/deploypatchgenerator/patch_utils.cpp
   )

# check ApkEntry.pb.h
if (EXISTS ${FASTDEPLOY}/proto/system/core/adb/fastdeploy/proto/ApkEntry.pb.cc)
    list(APPEND LIBFASTDEPLOY_SRC_FILES ${FASTDEPLOY}/proto/system/core/adb/fastdeploy/proto/ApkEntry.pb.cc)
else ()
    # generate ApkEntry.pb.h and ApkEntry.pb.cc
    execute_process(
        COMMAND ${CMAKE_BINARY_DIR}/cmake/lib/protobuf/aprotoc
        system/core/adb/fastdeploy/proto/ApkEntry.proto
        --cpp_out=system/core/adb/fastdeploy/proto
        WORKING_DIRECTORY ${AOSP}
        )
endif ()

set(CMAKE_CXX_FLAGS "${GLOBAL_CXX_FLAGS} -Wno-invalid-constexpr")

include_directories(
    ${libziparchive_headers}
    ${libbase_headers}
    ${libcutils_headers}
    ${boringssl_headers}
    ${protobuf_headers}
    ${FASTDEPLOY}/../
    ${FASTDEPLOY}/proto
    ${FASTDEPLOY}/proto/system/core/adb
    )

add_library(fastdeploy_host STATIC ${LIBFASTDEPLOY_SRC_FILES})
target_link_libraries(fastdeploy_host)
