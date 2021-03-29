# with import <nixpkgs> {}; callPackage /path/to/package.nix {}

# default nixpkgs
{ emscriptenStdenv, fetchFromGitHub, figlet, pkgs  }:


# Generate Shell
emscriptenStdenv.mkDerivation
{
  name = "MegaJohn-Core";
  builder = ./task.sh;
  src = fetchFromGitHub {
    owner = "DarthPJB";
    repo = "MegaJohn-Core";
    rev = "fc382262b9503236ec54c21413581e4f5bfa25e8";
    sha256 = "0qkmcgf70yfbwsgr9xc92bdswkd9m0hfr3y4nyqp1mygag0n9w6s";
    fetchSubmodules = true;
    #nix-prefetch-url --unpack https://github.com/DarthPJB/MegaJohn-Core/archive/fc382262b9503236ec54c21413581e4f5bfa25e8.tar.gz
  };
  buildInputs = [ pkgs.figlet ];

  #Run build-task post generation (TODO: makefile)
  shellHook = ''
    export EMSCRIPTEN_ROOT_PATH='${pkgs.emscripten}/share/emscripten'
    export EMSCRIPTEN='${pkgs.emscripten}/share/emscripten'
    figlet "emscripten build enviroment ready:"
  '';
}
