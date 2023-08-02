#!/bin/sh

cargo build --release --target-dir .
mv ./release/librust_dynamiclib.so .

strip librust_dynamiclib.so

rm -r ./release/
