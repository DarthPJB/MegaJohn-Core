#nix-shell -E "with import <nixpkgs> {}; callPackage ./default.nix {}"
# will use the emscriptenStdenv
# can be executed with wasm3

#does not generate wrapper javascript thing
#  thus is a command-line usable program as a result.
cd src;
figlet "executing EMCC on main.cpp"
emcc -O3 main.cpp -o ../build/main.wasm;
wasm3 ../build/main.wasm;
