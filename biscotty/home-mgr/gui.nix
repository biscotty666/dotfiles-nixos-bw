{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    thunderbird
    floorp
    obsidian
    protonvpn-gui
    brave
    libreoffice
    freetube
    vlc
    firefox
    spotify
    discord
  ];
}
