#!/bin/sh

echo "- odin_lib/build.sh . . ."

# compile shared lib

echo "  compiling shared lib . . ."

rm ./libodin_lib_shared.* 2>/dev/null

odin build odin_lib.odin -file -build-mode:dll -out:libodin_lib_shared


# compile static lib

echo "  compiling static lib . . ."

rm ./libodin_lib_static.* 2>/dev/null

odin build odin_lib.odin -file -build-mode:obj -reloc-mode:pic -out:libodin_lib_static

ar rcs libodin_lib_static.a libodin_lib_static.*
rm libodin_lib_static.o

