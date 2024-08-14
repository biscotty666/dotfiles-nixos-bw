{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    fastfetch
    zathura
    encfs
    fd
    dropbox
        #dropbox-cli
    element-desktop
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
    busybox
    tcpdump
    gdu
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
    #yazi
    flatpak
    fzf
    feh
    imagemagick
  ];
}
