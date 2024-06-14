{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    w3m
    mlocate
    fastfetch
    thefuck
    bartib
    unzip
    ripgrep-all
    gh
    distrobox
    bat
    ripgrep
    curl
    btop
    wget
    bottom
    zellij
    ranger
    tldr
    flatpak
    #quarto
    fzf
    feh
    imagemagick
  ];
}
