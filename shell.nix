{ pkgs ? import <nixpkgs> {} }:
let
  src = pkgs.nix-gitignore.gitignoreSource [] ./.;
in
pkgs.haskellPackages.shellFor {
  packages = _: [ (pkgs.haskellPackages.callCabal2nix "brainfuck" src {}) ];
  buildInputs = [
    pkgs.haskell-language-server
    pkgs.cabal-install
    pkgs.hlint
  ];
}
