{ config, pkgs, ... }:

{
  programs = {
    niri.enable = true;
    waybar.enable = true;
  };

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.swaylock = { };

  environment.systemPackages = with pkgs; [
    alacritty
    fuzzel
    swaylock
    mako
    swayidle
    xwayland-satellite
  ];
}
