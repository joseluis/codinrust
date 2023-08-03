#!/bin/sh

echo "- rust_bin/run.sh (dynamic_loading). . ."
echo "---"
cargo run --bin dynamic_loading --quiet


# Make sure the libraries compiled in odin can be found.
# This is needed to succesfully run the compiled binary.
export LD_LIBRARY_PATH=$(realpath ../odin_lib):$LD_LIBRARY_PATH
#
# As an alternative, copy the libraries to where they can be found:
#echo "copying odin libraries to the current directory . . ."
#cp ../odin_lib/libodin_lib_* .

echo
echo "- rust_bin/run.sh (static_loading). . ."
echo "---"
cargo run --bin static_loading --quiet
