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
    rev = "a0ed7b65df9f752132a1165dfb0315da7289b2e5";
    sha256 = "1vrshq1z6i8s3zs41bs2v2pldfax26sv6fv5w4ci80wfqglcfmdz";
    fetchSubmodules = true;
    #nix-prefetch-url --unpack https://github.com/DarthPJB/MegaJohn-Core/archive/a0ed7b65df9f752132a1165dfb0315da7289b2e5.tar.gz
  };
  buildInputs = [ pkgs.figlet ];

  #Run build-task post generation (TODO: makefile)
  shellHook = ''
    export EMSCRIPTEN_ROOT_PATH='${pkgs.emscripten}/share/emscripten'
    export EMSCRIPTEN='${pkgs.emscripten}/share/emscripten'
    figlet "emscripten build enviroment ready:"
  '';
}
