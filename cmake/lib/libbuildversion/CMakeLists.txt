cmake_minimum_required(VERSION 3.4.1)

project(libbuildversion)

set(LIBUILDVERSION ${CMAKE_SOURCE_DIR}/${AOSP}/build/soong/cc/libbuildversion)


set(LIBUILDVERSION_SRC_FILES
    ${LIBUILDVERSION}/libbuildversion.cpp
    )


set(CMAKE_CXX_FLAGS "${GLOBAL_CXX_FLAGS} -fvisibility=hidden")

include_directories(
    ${libbuildversion_headers}
    )


add_library(buildversion STATIC ${LIBUILDVERSION_SRC_FILES})
target_link_libraries(buildversion)
