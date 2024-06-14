{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ghc
    #haskellPackages.datasets
    haskellPackages.hspec
    haskellPackages.streaming-bytestring
    haskellPackages.gi-gtk
    haskellPackages.gtk3
    haskellPackages.Cabal_3_10_3_0
    haskellPackages.cabal-install
    gtk3
    lua51Packages.haskell-tools-nvim
  ];
}
