{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    vlc
    thunderbird
#    floorp-bin
    protonvpn-gui
    brave
    libreoffice
    freetube
    firefox
    spotify
    discord
  ];

}
