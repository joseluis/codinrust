#!/bin/sh

echo "- odin_lib/build.sh . . ."

# generate dynamic lib
odin build odin_lib.odin -file -build-mode:dll

# generate static lib
odin build odin_lib.odin -file -build-mode:obj
llvm-ar rcs odin_lib.a odin_lib.o

