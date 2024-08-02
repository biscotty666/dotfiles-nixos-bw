{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    thunderbird
    qgis
    freetube
    jupyter
    calibre
    gimp
    vlc
    libreoffice
    firefox
    inkscape
    brave
    #zeroadPackages.zeroad
    spotify
    discord
  ];
}
