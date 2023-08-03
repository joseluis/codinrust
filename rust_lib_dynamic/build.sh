#!/bin/sh

echo "- rust_lib_dynamic/build.sh . . ."
echo "  compiling shared lib (*.so | *.dll | *.dylib) . . ."
cargo build --release --target-dir . --quiet
mv ./release/librust_lib_dynamic.so .

strip librust_lib_dynamic.so

rm -r ./release/
