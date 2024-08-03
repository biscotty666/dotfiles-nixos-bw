{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    thunderbird
    onlyoffice-bin
    qgis
    freetube
    jupyter
    calibre
    gimp
    vlc
    firefox
    inkscape
    brave
    #zeroadPackages.zeroad
    spotify
    discord
  ];
}
