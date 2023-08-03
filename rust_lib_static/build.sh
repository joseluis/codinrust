#!/bin/sh
#

echo "- rust_lib_static/build.sh . . ."
echo "  compiling static lib: *.a | *.lib"
cargo build --release --target-dir . --quiet
mv ./release/librust_lib_static.a .

# it seems odin can't import it when stripped
# strip librust_lib_static.a

rm -r ./release/
