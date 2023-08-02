//! How to export Rust functions using the C interface (static library)
//
// https://doc.rust-lang.org/nomicon/ffi.html#calling-rust-code-from-c

#[no_mangle]
pub extern "C" fn print_hello_rust_staticlib() {
    println!("Hello from Rust! (compiled in `rust_staticlib`)");
}
