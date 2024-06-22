{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    fastfetch
    perl
    links2
    stow
    ddgr
    surfraw
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
