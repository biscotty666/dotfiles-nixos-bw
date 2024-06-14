{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ghc
    #haskellPackages.datasets
    haskellPackages.hspec
    haskellPackages.streaming-bytestring
    haskellPackages.gi-gtk
    haskellPackages.gtk3
    gtk3
    lua51Packages.haskell-tools-nvim
  ];
}
