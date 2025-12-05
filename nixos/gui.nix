{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    vlc
    thunderbird
    obsidian
    floorp-bin
    protonvpn-gui
    brave
    libreoffice
    freetube
    #firefox
    spotify
    discord
  ];

}
