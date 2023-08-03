#!/bin/sh

echo "- rust_lib_shared/build.sh . . ."
echo "  compiling shared lib (*.so | *.dll | *.dylib) . . ."
cargo build --release --target-dir . --quiet
mv ./release/librust_lib_shared.so .

strip librust_lib_shared.so

rm -r ./release/
