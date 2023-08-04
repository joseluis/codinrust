// Call exported functions from Rust using the C interface
// using dynamic loading (supports shared libraries).
//
// # Links
// - https://pkg.odin-lang.org/core/dynlib/

package main

import "core:dynlib"
import "core:fmt"

main :: proc() {
	fmt.println("Hello from Odin. (dynamic loading)")

	// load dynamic library

	library_names := []string{
		"../rust_lib/librust_lib_shared.so",
		"../rust_lib/librust_lib_shared.dylib",
		"../rust_lib/librust_lib_shared.dll"
	};

	rust_lib_shared: dynlib.Library
	ok1: bool
	for library_name, _ in library_names {
		rust_lib_shared, ok1 = dynlib.load_library(library_name)
		if ok1 {
			break
		}
	}

	// load function

	raw_print_hello_rust_lib_shared, ok2 := dynlib.symbol_address(
		rust_lib_shared,
		"print_hello_rust_lib",
	)
	if !ok2 {
		fmt.println("There was an error loading the function.")
		return
	}

	print_hello_rust_lib_shared := cast(proc())raw_print_hello_rust_lib_shared

	print_hello_rust_lib_shared()

	did_unload := dynlib.unload_library(rust_lib_shared)
	if !did_unload {
		fmt.println("There was an error unloading the library.")
		return
	}
}

