{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    thunderbird
    floorp
    obsidian
        #    onlyoffice-bin
    protonvpn-gui
    brave
    libreoffice
    freetube
    jupyter
    gimp
    vlc
    firefox
        #inkscape
        #    zeroadPackages.zeroad
    spotify
    discord
  ];
}
