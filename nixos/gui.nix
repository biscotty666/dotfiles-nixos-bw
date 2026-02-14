{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    vlc
    thunderbird
    obsidian
    floorp-bin
    protonvpn-gui
    brave
    libreoffice-qt-fresh
    spotify
    discord
  ];

}
