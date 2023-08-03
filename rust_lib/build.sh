#!/bin/sh

# set -e # stop at first error

echo "- rust_lib_shared/build.sh . . ."
echo "  compiling shared lib (*.so | *.dll | *.dylib) . . ."
cargo build --release --target-dir . --quiet --example rust_lib_shared
mv ./release/examples/librust_lib_shared.so .
strip librust_lib_shared.so

echo "  compiling static lib (*.a | *.lib) . . ."
cargo build --release --target-dir . --quiet --example rust_lib_static
mv ./release/examples/librust_lib_static.a .
# strip librust_lib_static.a # (it seems odin can't import it if stripped)

rm -r ./release/
