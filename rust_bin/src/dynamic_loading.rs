// Call exported functions from Odin using the C interface
// using dynamic loading (Only supports shared libraries).
//
// - https://docs.rs/libloading

use libloading::{Library, Symbol};

fn main() -> Result<(), Box<dyn std::error::Error>> {
    println!("Hello from Rust. (dynamic loading)");

    /* load shared lib */

    let lib = unsafe { Library::new("../odin_lib/libodin_lib_shared.so")? };
    let unsafe_print_hello_odin_shared =
        unsafe { lib.get::<Symbol<unsafe extern "C" fn()>>(b"print_hello_odin")? };
    let print_hello_odin_shared = || unsafe { unsafe_print_hello_odin_shared() };

    print_hello_odin_shared();

    Ok(())
}
