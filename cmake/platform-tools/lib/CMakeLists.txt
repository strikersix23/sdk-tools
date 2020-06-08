cmake_minimum_required(VERSION 3.14.2)

project(lib)

add_subdirectory(libsparse)
add_subdirectory(libselinux)
add_subdirectory(libsepol)
add_subdirectory(libpackagelistparser)
add_subdirectory(libpcre2)
add_subdirectory(boringssl)
add_subdirectory(libdiagnose_usb)
add_subdirectory(libcrypto_utils)
add_subdirectory(libusb)
add_subdirectory(libbrotli)
add_subdirectory(liblz4)
add_subdirectory(libext4_utils)
add_subdirectory(liblp)
add_subdirectory(mdnsresponder)

