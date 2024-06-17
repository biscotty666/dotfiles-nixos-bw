{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    thunderbird
    jupyter
    audacity
    gimp
    vlc
    libreoffice
    brave
    firefox
    inkscape
    brave
    zeroadPackages.zeroad
    spotify
    discord
    #qgis
  ];
}
