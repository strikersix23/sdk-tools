#!/bin/bash

#使用cmake生成构建文件，并最小化编译产物，这一步的生成主要是为了生成protobuffer相关文件
cmake -H"./" -B"./bin" -DCMAKE_BUILD_TYPE=MinSizeRel
#生成aapt2所需的protobuffer头文件和cpp文件
cmake --build "./bin" --target protobuffer_h -- -j 8
#重新生成构建文件，因为之前生成的时候，protobuffer相关文件不存在，需要重新生成，如果可以直接编译通过，这一步可省略
cmake -H"./" -B"./bin" -DCMAKE_BUILD_TYPE=MinSizeRel
#编译aapt
cmake --build "./bin" --target aapt -- -j 8
#编译aapt2
cmake --build "./bin" --target aapt2 -- -j 8
#编译aapt2_jni
cmake --build "./bin" --target aapt2_jni -- -j 8
cmake --build "./bin" --target aidl -- -j 8
cmake --build "./bin" --target aidl-cpp -- -j 8

cmake --build "./bin" --target zipalign -- -j 8






