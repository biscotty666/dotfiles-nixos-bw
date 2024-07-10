{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    ccl
    starship
    xclip
    xwayland
    wayland-protocols
    wayland-utils
    wl-clipboard
    wlroots
    inetutils
    chroma
    kitty
    catimg
    gephi
    ueberzug
    texlive.combined.scheme-full
    pandoc
    zoxide
  ];
}
