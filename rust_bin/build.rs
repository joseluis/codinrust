// The build script is always executed.
//
// In order to configure sections depending on the current binary
// it's necessary to use binary required-features:
// https://users.rust-lang.org/t/conditional-compilation-based-on-binary-being-compiled/29035/3

fn main() {
    // needed for compilation of `static_loadin`
    println!("cargo:rustc-link-search=../odin_lib/");

}
