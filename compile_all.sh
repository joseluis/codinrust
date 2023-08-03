#!/bin/sh

set -e # stops on error

echo "Compiling libraries in Rust and using them from Odin:"

cd rust_dynamiclib
./build.sh
cd ..

cd rust_staticlib
./build.sh
cd ..

cd odin_bin
./run.sh
cd ..

echo
echo "Compiling libraries in Odin and using them from Rust:"

cd odin_lib
./build.sh
cd ..

cd rust_bin_dynamicload
./run.sh

