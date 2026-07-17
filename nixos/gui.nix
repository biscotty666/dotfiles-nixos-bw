{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    vlc
    thunderbird
    obsidian
    floorp-bin
    proton-vpn
    brave
    calibre
    wike
    mastodon
    libreoffice-qt-fresh
    slack
    spotify
    discord
    obs-studio
    gimagereader-qt
    helix
    zed-editor-fhs
  ];

}
