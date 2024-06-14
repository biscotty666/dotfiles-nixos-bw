{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ghc
    ghcid
    #haskellPackages.datasets
    haskellPackages.ghcid
    haskellPackages.hspec
    haskellPackages.streaming-bytestring
    haskellPackages.gi-gtk
    haskellPackages.gtk3
    haskellPackages.ihaskell
    stylish-haskell
    tree-sitter-grammars.tree-sitter-haskell
#    haskellPackages.Cabal_3_10_3_0
#    haskellPackages.cabal-install
    gtk3
    #ihaskell
    lua51Packages.haskell-tools-nvim
  ];
}
