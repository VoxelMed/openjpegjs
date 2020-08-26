#!/bin/sh
#rm -rf build
mkdir -p build
#(cd build && emconfigure cmake -DCMAKE_BUILD_TYPE=Debug ..) &&
# Old: (cd build && emconfigure cmake ..) &&
(cd build && emcmake make .) &&
(cd build && emmake make VERBOSE=1 -j 16) &&
cp ./build/extern/openjpeg/bin/openjpegjs.js ./dist && 
cp ./build/extern/openjpeg/bin/openjpegjs.js.mem ./dist &&
cp ./build/extern/openjpeg/bin/openjpegwasm.js ./dist &&
cp ./build/extern/openjpeg/bin/openjpegwasm.wasm ./dist &&
(cd test/node; npm run test)
