#!/bin/sh

# compile shared lib

echo "- rust_lib_shared/build.sh . . ."
echo "  compiling shared lib . . ."
cargo build --release --target-dir . --quiet --example rust_lib_shared

rm ./librust_lib_shared.* 2>/dev/null

OUT_PATH="./release/examples/"
LIB_NAME="librust_lib_shared"

# linux ?
if mv "${OUT_PATH}${LIB_NAME}.so" . 2>/dev/null; then
	# echo "    found $LIB_NAME.so"
	strip $LIB_NAME.so
	:
else
	# mac?
	if mv "${OUT_PATH}${LIB_NAME}.dylib" . 2>/dev/null; then
		# echo "    found $LIB_NAME.dylib"
		# update library install name to its new location (dyld needs it to find the library)
		install_name_tool -id $(realpath ./librust_lib_shared.dylib) librust_lib_shared.dylib
		# otool -L ./librust_lib_shared.dylib # check the install name
		:
	else
		# windows?
		if mv "${OUT_PATH}${LIB_NAME}.dll" . 2>/dev/null; then
			# echo "    found $LIB_NAME.dll"
			:
		else
			echo "    Error: couldn't find any compiled shared library."
		fi
	fi
fi


# compile static lib

echo "  compiling static lib . . ."
cargo build --release --target-dir . --quiet --example rust_lib_static

rm ./librust_lib_static.* 2>/dev/null

LIB_NAME="librust_lib_static"

# linux | mac ?
if mv "${OUT_PATH}${LIB_NAME}.a" . 2>/dev/null; then
	# echo "    found $LIB_NAME.a"
	# odin apparently can't import it if stripped:
	# strip $LIB_NAME.*
	:
else
	# windows?
	if mv "${OUT_PATH}${LIB_NAME}.lib" . 2>/dev/null; then
		# echo "    found $LIB_NAME.lib"
		:
	else
		echo "    Error: couldn't find any compiled static library."
	fi
fi

rm -r ./release/
