#!/bin/sh

echo "- odin_lib/build.sh . . ."

# generate dynamic lib
echo "  - compiling shared lib: *.so | *.dll | *.dylib"
odin build odin_lib.odin -file -build-mode:dll

# generate static lib
echo "  - compiling static lib: *.a | *.lib"
odin build odin_lib.odin -file -build-mode:obj
llvm-ar rcs odin_lib.a odin_lib.o
rm odin_lib.o

