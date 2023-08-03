#!/bin/sh

set -e # stops on error

echo "# Compiling libraries in Rust and using them from Odin:"
echo "# -----------------------------------------------------"

cd rust_lib_shared
./build.sh
cd ..

cd rust_lib_static
./build.sh
cd ..

cd odin_bin_static_loading
./run.sh
cd ..

echo
echo "# Compiling libraries in Odin and using them from Rust:"
echo "# -----------------------------------------------------"

cd odin_lib
./build.sh
cd ..

cd rust_bin_dynamic_loading
./run.sh

