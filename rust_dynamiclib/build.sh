#!/bin/sh

echo "- rust_dynamiclib/build.sh . . ."
cargo build --release --target-dir . --quiet
mv ./release/librust_dynamiclib.so .

strip librust_dynamiclib.so

rm -r ./release/
