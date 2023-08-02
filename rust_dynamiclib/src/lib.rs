// PURPOSE: Export Rust functions using the C interface (dynamic library)
//
// https://doc.rust-lang.org/nomicon/ffi.html#calling-rust-code-from-c

#[no_mangle]
pub extern "C" fn print_hello_rust_dynamiclib() {
    println!("Hello from Rust! (shared dynamic lib via C FFI)");
}
