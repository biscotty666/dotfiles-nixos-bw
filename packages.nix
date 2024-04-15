{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    thunderbird
    spotify
    discord
    vscode
    qgis
    brave
    curl
    btop
    zellij
    gimp
    vlc
    texlive.combined.scheme-full
    pandoc
    gh
    zoxide
    audacity
    obsidian
    (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
  ];
}
