// PURPOSE: call exported functions from Rust using the C interface
//
// https://odin-lang.org/news/binding-to-c/

package main

import "core:fmt"
// import "core:c"

foreign import rust_dynamiclib "../rust_dynamiclib/librust_dynamiclib.so"
foreign import rust_staticlib "../rust_staticlib/librust_staticlib.a"

foreign rust_dynamiclib {
	print_hello_rust_dynamiclib :: proc() ---
}
foreign rust_staticlib {
	print_hello_rust_staticlib :: proc() ---
}

main :: proc() {
	fmt.println("Hello from Odin!")

	print_hello_rust_dynamiclib()
	print_hello_rust_staticlib()
}

