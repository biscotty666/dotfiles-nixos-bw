{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    starship
    xclip
# --- hyprland
#    swww
    xdg-desktop-portal-gtk
#    xdg-desktop-portal-hyprland
#    meson
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
    w3m
    ueberzug
    texlive.combined.scheme-full
    pandoc
    zoxide
  ];
}
