cmake_minimum_required(VERSION 3.4.1)

project(expat)

set(EXPAT ${CMAKE_SOURCE_DIR}/${AOSP}/external/expat)


# libexpat
set(EXPAT_SRC_FILES
    ${EXPAT}/lib/loadlibrary.c
    ${EXPAT}/lib/xmlparse.c
    ${EXPAT}/lib/xmlrole.c
    ${EXPAT}/lib/xmltok.c
    )


include_directories(
    ${expat_headers}
    )

set(CMAKE_CXX_FLAGS "${GLOBAL_CXX_FLAGS} -Wall -Werror -Wmissing-prototypes -Wstrict-prototypes -Wno-unused-function -Wno-unused-parameter -Wno-missing-field-initializers -fexceptions -DHAVE_EXPAT_CONFIG_H -UWIN32_LEAN_AND_MEAN")


add_library(expat STATIC ${EXPAT_SRC_FILES})
target_link_libraries(expat)

