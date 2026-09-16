{ lib, pkgs, ... }:
{
  programs.niri = {
    enable = true;
  };

  services = {
    gnome.gnome-keyring.enable = true;
    power-profiles-daemon.enable = true;
    upower.enable = true;
    displayManager.defaultSession = lib.mkForce "plasma";
  };

  security.pam.services.swaylock = { };
  security.polkit.enable = true;

  environment.systemPackages = with pkgs; [
    alacritty
    waybar
    fuzzel
    swaylock
    mako
    quickshell
    swayidle
    xwayland-satellite
    xdg-desktop-portal-gnome
  ];
}
