cmake_minimum_required(VERSION 3.4.1)

project(libziparchive)

set(LIBZIPARCHIVE ${CMAKE_SOURCE_DIR}/${AOSP}/system/core/libziparchive)

set(LIBZIPARCHIVE_SRC_FILES
    ${LIBZIPARCHIVE}/zip_archive.cc
    ${LIBZIPARCHIVE}/zip_archive_stream_entry.cc
    ${LIBZIPARCHIVE}/zip_writer.cc
    )


include_directories(
    ${libziparchive_headers}
    ${libbase_headers}
    ${liblog_headers}
    ${libutils_headers}
    ${zlib_headers}
    )

set(CMAKE_CXX_FLAGS "${GLOBAL_CXX_FLAGS} -DZLIB_CONST -Werror -Wall -D_FILE_OFFSET_BITS=64 -Wno-missing-field-initializers -Wold-style-cast")

add_library(ziparchive STATIC ${LIBZIPARCHIVE_SRC_FILES})
target_link_libraries(ziparchive)
