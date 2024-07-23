{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    chroma
    thefuck
    catimg
    unzip
    todoist-electron
    fzf
    feh
    imagemagick
    zsh-forgit
    zsh-fzf-history-search
    zsh-fzf-tab
    brave
    curl
    btop
    zellij
    ranger
    w3m
    browsh
    ueberzug
    gh
    zoxide
    kdePackages.kdeconnect-kde
    distrobox
    bat
#    (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
  ];
}
