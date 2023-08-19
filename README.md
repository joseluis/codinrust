# codinrust

A series of examples to showcase how to interoperate between
[C], [Odin] and [Rust] languages.

[C]: https://www.gnu.org/software/gnu-c-manual/gnu-c-manual.html
[Rust]: https://www.rust-lang.org/
[Odin]: https://odin-lang.org/

It shows how to generate both shared and static libraries using C FFI, how to
import them both dynamically and statically, in each language.

## Status

- Supported languages
  - [ ] C
  - [x] Odin
  - [x] Rust
- Supported platforms
  - [x] Linux
  - [x] Macos
  - [ ] Windows Cygwin (untested)

## Example

```
$ ./do_all.sh
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
