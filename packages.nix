{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    thunderbird
#    zeroadPackages.zeroad-data
#    zeroadPackages.zeroad-unwrapped
    xclip
    nushellFull
    nushellPlugins.query
    nushellPlugins.gstat
    nushellPlugins.net
    nushellPlugins.formats
    conda
    inkscape
    nextcloud-client
    bartib
    inetutils
    chroma
    kitty
    fastfetch
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
    gephi
    ripgrep-all
    ripgrep
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
