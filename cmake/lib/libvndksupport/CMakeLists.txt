cmake_minimum_required(VERSION 3.4.1)

project(libvndksupport)

set(LIBVNDKSUPPORT ${CMAKE_SOURCE_DIR}/${AOSP}/system/core/libvndksupport)


set(LIBVNDKSUPPORT_SRC_FILES
    ${LIBVNDKSUPPORT}/linker.c
    )


include_directories(
    ${libvndksupport_headers}
    ${liblog_headers}
    )

set(CMAKE_C_FLAGS "${GLOBAL_C_FLAGS}")

add_library(vndksupport STATIC ${LIBVNDKSUPPORT_SRC_FILES})
target_link_libraries(vndksupport)
