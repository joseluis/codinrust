A series of examples that showcases how to interoperate between [Rust] and [Odin]

[Rust]: https://www.rust-lang.org/
[Odin]: https://odin-lang.org/

```txt
$ ./compile_all.sh
Compiling libraries in Rust and using them from Odin:
- rust_dynamiclib/build.sh . . .
- rust_staticlib/build.sh . . .
- odin_bin/run.sh
Hello from Odin!
Hello from Rust! (compiled in `rust_dynamiclib`)
Hello from Rust! (compiled in `rust_staticlib`)

Compiling libraries in Odin and using them from Rust:
- odin_dynamiclib/build.sh . . .
- rust_bin/run.sh . . .
Hello from Rust.
Hello from Odin! (compiled in `odin_dynamiclib`)
```

