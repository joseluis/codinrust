A series of examples that showcases how to interoperate between [Rust] and [Odin]

[Rust]: https://www.rust-lang.org/
[Odin]: https://odin-lang.org/

It shows how to generate both shared and static libraries using C FFI and how to import them both dynamically and statically, everything from both Rust and Odin.

# Platform support

- [x] Linux
- [x] Macos
- [ ] Windows Cygwin (untested)

```
$ ./compile_all.sh
# Compiling libraries in Rust and using them from Odin:
# -----------------------------------------------------
- rust_lib_shared/build.sh . . .
  compiling shared lib . . .
  compiling static lib . . .
- odin_bin/run.sh (dynamic_loading) . . .
---
Hello from Odin. (dynamic loading)
Hello from Rust! (compiled in `rust_lib`)

- odin_bin/run.sh (static_loading) . . .
---
Hello from Odin! (static loading)
Hello from Rust! (compiled in `rust_lib`)
Hello from Rust! (compiled in `rust_lib`)

# Compiling libraries in Odin and using them from Rust:
# -----------------------------------------------------
- odin_lib/build.sh . . .
  compiling shared lib . . .
  compiling static lib . . .
- rust_bin/run.sh (dynamic_loading). . .
---
Hello from Rust. (dynamic loading)
Hello from Odin! (compiled in `odin_lib`)

- rust_bin/run.sh (static_loading). . .
---
Hello from Rust. (static loading)
Hello from Odin! (compiled in `odin_lib`)
Hello from Odin! (compiled in `odin_lib`)
```

