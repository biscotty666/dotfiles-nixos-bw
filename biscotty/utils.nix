{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    fastfetch
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
        #flatpak
    fzf
    feh
    imagemagick
  ];
}
