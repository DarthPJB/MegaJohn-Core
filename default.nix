#default nixpkgs
{ pkgs ? import <nixpkgs> {} }:


# Generate Shell
pkgs.emscriptenStdenv.mkDerivation
{
  name = "MegaJohn-Core";
  builder = ./task.sh;
  src = fetchFromGitHub {
    owner = "DarthPJB";
    repo = "MegaJohn-Core";
    rev = "4f9d46c17538eda0fe6083edb821802875bb5690";
    sha256 = "10y6735a7gahbmqs8r38gar2qgkvxhv8k37slwzj3gvv1dbnzym6";
  };
  buildInputs = [ pkgs.cowsay ];

  #Run build-task post generation (TODO: makefile)
  shellHook = ''
    cowsay "this is awesome build enviroment in NixOS"
    echo EMSCRIPTEN_ROOT_PATH='${emscripten}/share/emscripten'
    echo EMSCRIPTEN='${emscripten}/share/emscripten'
  '';
}
