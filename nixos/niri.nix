{ config, pkgs, ... }:

{
  programs.niri.enable = true;

  services = {
    gnome.gnome-keyring.enable = true;
    power-profiles-daemon.enable = true;
    upower.enable = true;
  };

  security.pam.services.swaylock = { };

  environment.systemPackages = with pkgs; [
    alacritty
    waybar
    fuzzel
    swaylock
    mako
    quickshell
    swayidle
    xwayland-satellite
  ];
}
