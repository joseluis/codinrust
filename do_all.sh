#!/bin/sh

set -e # stops on error

echo "# Compiling libraries in Rust and using them from Odin:"
echo "# -----------------------------------------------------"

cd rust_lib
./build.sh
cd ..

cd odin_bin
./run.sh
cd ..

echo
echo "# Compiling libraries in Odin and using them from Rust:"
echo "# -----------------------------------------------------"

cd odin_lib
./build.sh
cd ..

cd rust_bin
./run.sh

