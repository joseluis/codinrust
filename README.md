A series of examples that showcases how to interoperate between [Rust] and [Odin]

[Rust]: https://www.rust-lang.org/
[Odin]: https://odin-lang.org/

```
$ ./compile_all.sh
# Compiling libraries in Rust and using them from Odin:
# -----------------------------------------------------
- rust_lib_dynamic/build.sh . . .
  compiling shared lib: *.so | *.dll | *.dylib
- rust_lib_static/build.sh . . .
  compiling static lib: *.a | *.lib
- odin_bin/run.sh
---
Hello from Odin! (static loading)
Hello from Rust! (compiled in `rust_lib_dynamic`)
Hello from Rust! (compiled in `rust_lib_static`)

# Compiling libraries in Odin and using them from Rust:
# -----------------------------------------------------
- odin_lib/build.sh . . .
  compiling shared lib: *.so | *.dll | *.dylib
  compiling static lib: *.a | *.lib
- rust_bin/run.sh . . .
---
Hello from Rust. (dynamic loading)
Hello from Odin! (compiled in `odin_lib`)
```

