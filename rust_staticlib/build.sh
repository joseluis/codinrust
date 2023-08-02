#!/bin/sh
#

echo "- rust_staticlib/build.sh . . ."
cargo build --release --target-dir . --quiet
mv ./release/librust_staticlib.a .

# strip librust_staticlib.a # odin can't import it if it's stripped

rm -r ./release/
