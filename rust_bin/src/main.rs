// PURPOSE: call exported functions from Odin using the C interface
//
// https://docs.rs/libloading

use libloading::{Library, Symbol};

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let lib = unsafe { Library::new("../odin_dynamiclib/odin_dynamiclib.so")? };

    let unsafe_print_hello_odin =
        unsafe { lib.get::<Symbol<unsafe extern "C" fn()>>(b"print_hello_odin")? };
    let print_hello_odin = || unsafe { unsafe_print_hello_odin() };

    println!("Hello from Rust.");
    print_hello_odin();

    Ok(())
}
