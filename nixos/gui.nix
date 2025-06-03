{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    vlc
    thunderbird
    floorp
    protonvpn-gui
    brave
    libreoffice
    freetube
    firefox
    spotify
    discord
  ];

}
