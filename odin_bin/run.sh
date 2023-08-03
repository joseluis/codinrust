#!/bin/sh

echo "- odin_bin/run.sh (static_loading) . . ."
echo "---"
odin build static_loading.odin -file
./static_loading
