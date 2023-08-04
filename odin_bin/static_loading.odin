// Call exported functions from Rust using the C interface
// using static loading (supports shared and static libraries).
//
// # Links
// - https://odin-lang.org/news/binding-to-c/
// - https://odin-lang.org/news/binding-to-c/#foreign-blocks

package main

import "core:fmt"

when ODIN_OS == .Linux {
	foreign import rust_lib_shared "../rust_lib/librust_lib_shared.so"
	foreign import rust_lib_static "../rust_lib/librust_lib_static.a"
} else when ODIN_OS == .Darwin {
	foreign import rust_lib_shared "../rust_lib/librust_lib_shared.dylib"
	foreign import rust_lib_static "../rust_lib/librust_lib_static.a"
} else when ODIN_OS == .Windows {
	foreign import rust_lib_shared "../rust_lib/librust_lib_shared.dll"
	foreign import rust_lib_static "../rust_lib/librust_lib_static.lib"
}

foreign rust_lib_shared {
	@(link_name = "print_hello_rust_lib")
	print_hello_rust_lib_shared :: proc() ---
}
foreign rust_lib_static {
	@(link_name = "print_hello_rust_lib")
	print_hello_rust_lib_static :: proc() ---
}

main :: proc() {
	fmt.println("Hello from Odin! (static loading)")

	print_hello_rust_lib_shared()
	print_hello_rust_lib_static()
}

