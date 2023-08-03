//! Call exported functions from Odin using the C interface
//! using static loading (supports shared and static libraries).
//!
//! # Links
//! - <https://doc.rust-lang.org/nomicon/ffi.html#calling-foreign-functions>
//! - <https://doc.rust-lang.org/nomicon/ffi.html#linking>
//! - <https://doc.rust-lang.org/reference/items/external-blocks.html#attributes-on-extern-blocks>

/* load shared lib */

#[link(name = "odin_lib_shared")]
extern "C" {
    #[link_name = "print_hello_odin"]
    fn print_hello_odin_shared_unsafe();
}

/* load static lib */

#[link(name = "odin_lib_static", kind = "static")]
extern "C" {
    #[link_name = "print_hello_odin"]
    fn print_hello_odin_static_unsafe();
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    println!("Hello from Rust. (static loading)");

    // A) Calling unsafe functions directly
    // unsafe { print_hello_odin_shared_unsafe() };
    // unsafe { print_hello_odin_static_unsafe() };

    // B) Create safe wrappers with closures:
    let print_hello_odin_shared = || unsafe { print_hello_odin_shared_unsafe() };
    let print_hello_odin_static = || unsafe { print_hello_odin_static_unsafe() };

    print_hello_odin_shared();
    print_hello_odin_static();

    Ok(())
}
