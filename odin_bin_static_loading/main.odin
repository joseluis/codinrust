// PURPOSE: call exported functions from Rust using the C interface
//
// https://odin-lang.org/news/binding-to-c/

package main

import "core:fmt"
// import "core:c"

foreign import rust_lib_shared "../rust_lib_shared/librust_lib_shared.so"
foreign import rust_lib_static "../rust_lib_static/librust_lib_static.a"

foreign rust_lib_shared {
	print_hello_rust_lib_shared :: proc() ---
}
foreign rust_lib_static {
	print_hello_rust_lib_static :: proc() ---
}

main :: proc() {
	fmt.println("Hello from Odin! (static loading)")

	print_hello_rust_lib_shared()
	print_hello_rust_lib_static()
}

