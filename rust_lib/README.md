Compiles the rust library as both shared and static C FFI libraries.

In theory Rust only supports a single library per crate, but in practice you can configure any number of examples to be compiled as any kind of library. This is what we do here.
