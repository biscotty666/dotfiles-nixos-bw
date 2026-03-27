{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    vlc
    thunderbird
    obsidian
    floorp-bin
    proton-vpn
    brave
    libreoffice-qt-fresh
    spotify
    discord
  ];

}
