#!/bin/sh
#

cargo build --release --target-dir .
mv ./release/librust_staticlib.a .

# strip librust_staticlib.a # odin can't import it if it's stripped

rm -r ./release/
