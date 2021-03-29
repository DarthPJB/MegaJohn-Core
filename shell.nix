#default nixpkgs
{ pkgs ? import <nixpkgs> {} }:


# Generate Shell
pkgs.mkShell
{
  buildInputs = [ pkgs.emscriptenStdenv pkgs.simplehttp2server];

  #Run build-task post generation (TODO: makefile)
  shellHook = ''
    simplehttp2server -listen localhost:5000&
     ./task.sh;
  '';
}
