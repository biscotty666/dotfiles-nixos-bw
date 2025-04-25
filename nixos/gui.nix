{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    vlc
    thunderbird
    floorp
    obsidian
    protonvpn-gui
    brave
    libreoffice
    freetube
    firefox
    spotify
    discord
  ];

}
