{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    fastfetch
    perl
    nh
    w3m
    mlocate
    mdcat
    busybox
    gdu
    links2
    stow
    ddgr
    surfraw
    #thefuck
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
    tldr
    yazi
    ranger
    flatpak
    fzf
    feh
    imagemagick
  ];
}
