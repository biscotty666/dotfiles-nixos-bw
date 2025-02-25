{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    ccl
    kdePackages.kcolorchooser
    sqlite
    ghostscript
    gv
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
    pixcat
    gh
    catimg
    gephi
    ueberzugpp
    pandoc
    zoxide
    hunspellDicts.es_ANY
    hunspellDicts.fr-any
    aspellDicts.en-computers
    aspellDicts.en
    aspellDicts.fr
    aspellDicts.es
  ];
}
