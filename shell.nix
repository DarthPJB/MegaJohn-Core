#default nixpkgs
{ pkgs ? import <nixpkgs> {} }:


# Generate Shell
pkgs.mkShell
{
  buildInputs = [pkgs.figlet pkgs.emscriptenStdenv pkgs.simplehttp2server];

  #Run build-task post generation (TODO: makefile)
  shellHook = ''
     ./task.sh;
  '';
}
