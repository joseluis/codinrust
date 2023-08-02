// PURPOSE: Export Odin functions using the C interface (dynamic library)
//
// https://odin-lang.org/news/calling-odin-from-python/
// https://odin-lang.org/docs/overview/#explicit-context-definition

package odinlib

import "core:fmt"
import "core:runtime"

@export
print_hello_odin :: proc "c" () {
	context = runtime.default_context()

	fmt.println("Hello from Odin! (shared dynamic lib via C FFI)");
}

@export
add :: proc "c" (a, b: i32) -> i32 {
	return a + b
}

