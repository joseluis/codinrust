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

	when ODIN_OS == .Linux {
		rust_lib_shared, ok1 := dynlib.load_library("../rust_lib/librust_lib_shared.so")
	} else when ODIN_OS == .Darwin {
		rust_lib_shared, ok1 := dynlib.load_library("../rust_lib/librust_lib_shared.dylib")
	} else when ODIN_OS == .Windows {
		rust_lib_shared, ok1 := dynlib.load_library("../rust_lib/librust_lib_shared.dll")
	}
	if !ok1 {
		fmt.println("There was an error loading the library.")
		return
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

