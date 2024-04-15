{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    brave
    curl
    btop
    zellij
    gimp
    vlc
    texlive.combined.scheme-full
    pandoc
    gh
    (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
  ];
}
