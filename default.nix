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
  buildInputs = [ pkgs.clang pkgs.wabt pkgs.binaryen pkgs.llvm pkgs.figlet pkgs.emscripten];

# the intention here is to eliminate the use of emscriptenStdenv and instead
# produce a very simple 'pure' C++ -> wasm pipeline.
# Wasmer might be a better option, or using the nix-stdenvwasm paradime.
# for the moment I am even trying to avoid cmake-emcmake entirely.
# this may be a dead-branch, but fundementally I belive in K.I.S.S

# Alternately to emscripten - Based on github.com/tpimh/wasm-toolchain/blob/master/c2wasm
  buildPhase = ''
  mkdir $out
  cd $src/src
  clang++ main.cpp -ObjC++ --compile\
   --target=wasm32-unknown-wasi \
        --optimize=3 --output $out/test.wasm

  '';
#  llc -march=wasm32 -filetype=asm $TMPDIR/main.ll -o $TMPDIR/main.s
#  s2wasm $TMPDIR/main.s -o $TMPDIR/main.wat
#  wat2wasm $TMPDIR/main.wat -o $out/main.wasm


  installPhase = " echo nothing to install";

  shellHook = ''
      figlet Hello Compiled!
  '';
}
