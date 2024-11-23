{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    thunderbird
    obsidian
    onlyoffice-bin
    protonvpn-gui
    libreoffice
    qgis
    freetube
    jupyter
    gimp
    vlc
    firefox
    inkscape
    brave
    zeroadPackages.zeroad
    spotify
    discord
  ];
}
