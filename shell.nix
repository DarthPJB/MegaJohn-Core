#default nixpkgs
{ pkgs ? import <nixpkgs> {} }:


# Generate Shell
pkgs.mkShell
{
  buildInputs = [ pkgs.emscriptenStdenv ];

  #Run build-task post generation (TODO: makefile)
  shellHook = ''
     ./task.sh;
  '';
}
