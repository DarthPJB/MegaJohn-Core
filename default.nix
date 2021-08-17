with import <nixpkgs> {};

# default nixpkgs
#{ emscriptenStdenv, fetchFromGitHub, figlet, pkgs  }:


# Generate Shell
stdenvNoCC.mkDerivation
{
  name = "MegaJohn-Core";
#  builder = ./task.sh;
#  src = fetchFromGitHub {
#    owner = "DarthPJB";
#    repo = "MegaJohn-Core";
#    rev = "a0ed7b65df9f752132a1165dfb0315da7289b2e5";
#sha256 = "1vrshq1z6i8s3zs41bs2v2pldfax26sv6fv5w4ci80wfqglcfmdz";
#    fetchSubmodules = true;
#  };
  src = ./.;

  autoreconfPhase = " echo autoreconfPhase not used...";
  configurePhase =  " echo configure not used";
  buildInputs = [ pkgs.figlet pkgs.emscripten];

  buildPhase = ''
  HOME=$TMPDIR
  mkdir $out
  emcc -O3 src/main.cpp -o $out/main.wasm
  '';

  # Alternately to emscripten - https://github.com/tpimh/wasm-toolchain/blob/master/c2wasm
# using  wabt binaryen llvm
  installPhase = " echo Looool";

  #Run build-task post generation (TODO: makefile)
  shellHook = ''

  '';
}
