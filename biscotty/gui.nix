{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    thunderbird
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
