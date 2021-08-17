#default nixpkgs
{ pkgs ? import <nixpkgs> {} }:


# Generate Shell
pkgs.mkShell
{
  buildInputs = [
  pkgs.figlet
  pkgs.emscripten
  pkgs.llvm
  pkgs.clang
  pkgs.binaryen
  pkgs.wabt
  pkgs.simplehttp2server
  pkgs.wasm3
  ];

  #Run build-task post generation (TODO: nix-build/default.nix)
  shellHook = ''
     figlet "hacking enviroment active!"
  '';
}
