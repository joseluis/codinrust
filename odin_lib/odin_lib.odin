// Export Odin functions using the C interface (both dynamic and static libraries)
//
// # Links
// - https://odin-lang.org/news/calling-odin-from-python/
// - https://odin-lang.org/docs/overview/#explicit-context-definition

package odinlib

import "core:fmt"
import "core:runtime"

@(export)
print_hello_odin :: proc "c" () {
	context = runtime.default_context()

	fmt.println("Hello from Odin! (compiled in `odin_lib`)")
}

@(export)
add :: proc "c" (a, b: i32) -> i32 {
	return a + b
}

