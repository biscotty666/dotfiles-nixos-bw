{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    thunderbird
    jupyter
    calibre
    gimp
    vlc
    libreoffice
    brave
    firefox
    inkscape
    brave
    #zeroadPackages.zeroad
    spotify
    discord
    qgis
  ];
}
