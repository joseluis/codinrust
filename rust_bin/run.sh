#!/bin/sh

echo "- rust_bin/run.sh . . ."
echo "---"
cargo run --bin dynamic_loading --quiet

echo "---"
cargo run --bin static_loading --quiet
