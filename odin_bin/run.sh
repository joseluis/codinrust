#!/bin/sh

echo "- odin_bin/run.sh (dynamic_loading) . . ."
echo "---"

rm ./dynamic_loading 2>/dev/null

odin build dynamic_loading.odin -file
./dynamic_loading

echo
echo "- odin_bin/run.sh (static_loading) . . ."
echo "---"

rm ./static_loading 2>/dev/null

odin build static_loading.odin -file
./static_loading

