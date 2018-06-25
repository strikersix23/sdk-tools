cmake_minimum_required(VERSION 3.6)
project(zipalign)

set(CMAKE_C_COMPILER "/usr/bin/clang")
set(CMAKE_CXX_COMPILER "/usr/bin/clang++")


include_directories(
		${zlib_header}
		${libzopfli_header}
		${libutils_header}
		${libcutils_header}
		${androidfw_header}
		${liblog_header}
)

set(zipalign_sources 
		${CMAKE_SOURCE_DIR}/${AOSP}/build/tools/zipalign/ZipAlign.cpp
		${CMAKE_SOURCE_DIR}/${AOSP}/build/tools/zipalign/ZipEntry.cpp
		${CMAKE_SOURCE_DIR}/${AOSP}/build/tools/zipalign/ZipFile.cpp
)

set(zipalign_cflags "-fPIC -std=gnu++14")
set(zipalign_cxxflags ${zipalign_cflags})
set(CMAKE_C_FLAGS ${zipalign_cflags})
set(CMAKE_CXX_FLAGS ${zipalign_cxxflags})

add_executable(zipalign ${zipalign_sources})
target_link_libraries(zipalign androidfw utils cutils log zopfli zlib)


