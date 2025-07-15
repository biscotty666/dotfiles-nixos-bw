{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    vlc
    thunderbird
    floorp
    protonvpn-gui
    protonvpn-cli
    brave
    libreoffice
    freetube
    firefox
    spotify
    discord
  ];

}
