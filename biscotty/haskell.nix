{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ghc
    #haskellPackages.datasets
    haskellPackages.hspec
    haskellPackages.streaming-bytestring
  ];
}
