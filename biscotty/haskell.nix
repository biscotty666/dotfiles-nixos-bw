{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ghc
    ghcid
    #haskellPackages.datasets
    haskellPackages.ghcid
    haskellPackages.hspec
    haskellPackages.streaming-bytestring
    haskellPackages.random
    haskellPackages.gi-gtk
    haskellPackages.gtk
    haskellPackages.gi-glib
    haskellPackages.http-conduit
    haskellPackages.ihaskell
    stylish-haskell
    tree-sitter-grammars.tree-sitter-haskell
    haskellPackages.Cabal_3_10_3_0
    haskellPackages.bytestring_0_12_1_0
    haskellPackages.cabal-install
    # haskellPackages.cabal
    gtk3
    pkg-config
    gobject-introspection
    #ihaskell
        #    lua51Packages.haskell-tools-nvim
  ];
}
