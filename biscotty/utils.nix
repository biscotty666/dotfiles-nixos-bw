{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    fastfetch

    # Added for ranger previews
    mupdf
    poppler_utils
    exiftool
    atool
    libarchive
    p7zip
    unrar
    odt2txt
    xlsx2csv
    jq
    mediainfo
    librsvg
    djvulibre
    ffmpeg

    perl
    ffmpegthumbnailer
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
    flatpak
    fzf
    feh
    imagemagick
  ];
}
