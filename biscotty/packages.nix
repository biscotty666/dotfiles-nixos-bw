{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    thunderbird
    # Haskell
    ghc
    #haskellPackages.datasets
    haskellPackages.hspec
    haskellPackages.streaming-bytestring
    lua51Packages.haskell-tools-nvim

    #vim-full
    firefox
    brave
    zeroadPackages.zeroad
#    zeroadPackages.zeroad-unwrapped
    starship
    lynx
    xclip
# --- hyprland
    swww
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    meson
    xwayland
    wayland-protocols
    wayland-utils
    wl-clipboard
    wlroots
# --- hyprland
    inkscape
    #nextcloud-client
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
    #qgis
    gephi
    ripgrep-all
    ripgrep
    libreoffice
    brave
    curl
    btop
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
    #obsidian
    bat
#    (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
  ];
}
