{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    thunderbird
    onlyoffice-bin
    libreoffice
    qgis
    freetube
    jupyter
    calibre
    gimp
    vlc
    firefox
    inkscape
    brave
    zeroadPackages.zeroad
    spotify
    discord
    tor-browser
  ];
}
