#!/bin/sh
mkdir -p build # comment out for local build container
#(cd build && emcmake cmake -DCMAKE_BUILD_TYPE=Debug ..) &&
# This worked in: trzeci/emscripten:1.39.4-fastcomp
# but not w/ newer versions of emscripten
# (cd build && emconfigure cmake ..) &&
(cd build && emcmake cmake ..) &&
(cd build && emmake make VERBOSE=1 -j 16) &&
cp ./build/extern/openjpeg/bin/openjpegjs.js ./dist && 
cp ./build/extern/openjpeg/bin/openjpegjs.js.mem ./dist &&
cp ./build/extern/openjpeg/bin/openjpegwasm.js ./dist &&
cp ./build/extern/openjpeg/bin/openjpegwasm.wasm ./dist &&
(cd test/node; npm run test)