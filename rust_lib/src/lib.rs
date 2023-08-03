//! How to export Rust functions using the C interface (shared library)
//
// https://doc.rust-lang.org/nomicon/ffi.html#calling-rust-code-from-c

#[no_mangle]
pub extern "C" fn print_hello_rust_lib() {
    println!("Hello from Rust! (compiled in `rust_lib`)");
}
