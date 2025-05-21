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
  ];
}
