#default nixpkgs
{ pkgs ? import <nixpkgs> {} }:


# Generate Shell
pkgs.mkShell
{
  buildInputs = [
  pkgs.figlet
  pkgs.emscriptenStdenv
  pkgs.simplehttp2server
  pkgs.wasm3
  ];

  #Run build-task post generation (TODO: makefile)
  shellHook = ''
     ./build_task.sh;
  '';
}
