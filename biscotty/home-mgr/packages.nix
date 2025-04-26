{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    gh
    catimg
    gephi
    ueberzugpp
    pandoc
    zoxide
    hunspellDicts.es_ANY
    hunspellDicts.fr-any
    aspellDicts.en-computers
    aspellDicts.en
    aspellDicts.fr
    aspellDicts.es
  ];
}
