{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    thunderbird
    bartib
    chroma
    kitty
    ktimetracker
    thefuck
    catimg
    spotify
    unzip
    #todoist
    #todoist-electron
    tldr
    # gnome.gnome-tweaks
    flatpak
#    quarto
#    rPackages.quarto
    fzf
    feh
#    neovim
    imagemagick
    discord
    zsh-forgit
    zsh-fzf-history-search
    zsh-fzf-tab
    #qgis
    libreoffice
    brave
    curl
    btop
    zellij
    ranger
    w3m
    ueberzug
    gimp
    vlc
    texlive.combined.scheme-full
    pandoc
    gh
    zoxide
    kdePackages.kdeconnect-kde
    audacity
    distrobox
    obsidian
    bat
#    (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
  ];
}
