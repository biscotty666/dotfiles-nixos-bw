{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    thunderbird
    lua51Packages.haskell-tools-nvim
    firefox
    brave
    zeroadPackages.zeroad
    starship
    lynx
    xclip
# --- hyprland
#    swww
    xdg-desktop-portal-gtk
#    xdg-desktop-portal-hyprland
#    meson
    xwayland
    wayland-protocols
    wayland-utils
    wl-clipboard
    wlroots
    inkscape
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
    tldr
    flatpak
    #quarto
    fzf
    feh
    imagemagick
    discord
    #qgis
    gephi
    ripgrep-all
    ripgrep
    libreoffice
    brave
    curl
    btop
    wget
    bottom
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
#    kdePackages.kdeconnect-kde
    audacity
    distrobox
    bat
#    (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
  ];
}
