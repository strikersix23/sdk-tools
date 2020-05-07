cmake_minimum_required(VERSION 3.4.1)

project(zlib)


set(ZLIB ${CMAKE_SOURCE_DIR}/${AOSP}/external/zlib)


set(ZLIB_SRC_FILES
	${ZLIB}/src/adler32.c
    ${ZLIB}/src/compress.c
    ${ZLIB}/src/crc32.c
    ${ZLIB}/src/deflate.c
    ${ZLIB}/src/gzclose.c
    ${ZLIB}/src/gzlib.c
    ${ZLIB}/src/gzread.c
    ${ZLIB}/src/gzwrite.c
    ${ZLIB}/src/infback.c
    ${ZLIB}/src/inflate.c
    ${ZLIB}/src/inftrees.c
    ${ZLIB}/src/inffast.c
    ${ZLIB}/src/trees.c
    ${ZLIB}/src/uncompr.c
    ${ZLIB}/src/zutil.c
	)

set(CMAKE_C_FLAGS "${GLOBAL_C_FLAGS} -O3 -DUSE_MMAP -DZLIB_CONST -Wall -Werror")

add_library(z STATIC ${ZLIB_SRC_FILES})
target_link_libraries(z)
