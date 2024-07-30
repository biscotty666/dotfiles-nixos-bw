{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    ccl
    sqlite
    sqlite-utils
    perl
    exiftool
    libarchive
    odt2txt
    librsvg
    xlsx2csv
    jq
    starship
    xclip
    xsel
    xwayland
    wayland-protocols
    wayland-utils
    wl-clipboard
    wlroots
    inetutils
    chroma
    # for kitty
    kitty
    kitty-img
    kitty-themes
    pixcat
    termpdfpy
    catimg
    gephi
    ueberzugpp
    texlive.combined.scheme-full
    pandoc
    zoxide
  ];
}
