{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
     pycritty
    yazi
    lazygit
    alacritty-theme
    devenv
    opentabletdriver
    ihp-new
    fastfetch
    pastel
    libqalculate
    zathura
    gocryptfs
    fd
    dropbox
    httpie-desktop
    discordo
    mpv
    mupdf
    poppler_utils
    atool
    p7zip
    unrar
    mediainfo
    djvulibre
    ffmpeg
    ffmpegthumbnailer
    nh
    w3m
    mlocate
    mdcat
    tcpdump
    gdu
    ddgr
    surfraw
    thefuck
    bartib
    unzip
    ripgrep-all
    distrobox
    bat
    ripgrep
    curl
    btop
    wget
    bottom
    zellij
    tldr
    flatpak
    fzf
    feh
    imagemagick
    vim-full # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    git
    alacritty
    restic
    xdg-desktop-portal-gtk
    xdg-utils
    qemu
    mlocate
    dive
    cachix
    sddm-chili-theme
    podman
    helix
    podman-tui
    ueberzugpp
    kdePackages.sddm
    kdePackages.parley
    kdePackages.fcitx5-chinese-addons
    sddm-sugar-dark
    sops
    python312Packages.python-lsp-server
    python312Packages.python-lsp-ruff
    ruff
    python312Packages.jedi-language-server
    stow
 ];

}
