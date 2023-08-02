#!/bin/sh

set -e # stops on error

echo "Trying to export functions from Rust and call them from Odin:"

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
echo "Trying to export functions from Odin and call them from Rust:"

cd odin_dynamiclib
./build.sh
cd ..

# no odin_staticlib for now

cd rust_bin
./run.sh

