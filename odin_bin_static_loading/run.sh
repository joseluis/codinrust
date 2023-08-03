#!/bin/sh

echo "- odin_bin_static_loading/run.sh . . ."
echo "---"
odin build main.odin -file
./main
