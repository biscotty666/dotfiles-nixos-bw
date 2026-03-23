{ config, pkgs, ... }:

{
  programs.niri = {
    enable = true;
  };

  services = {
    gnome.gnome-keyring.enable = true;
    power-profiles-daemon.enable = true;
    upower.enable = true;
    niri-session-manager = {
      enable = true;
      # settings = {
      #   save-interval = 30;
      #   max-backup-count = 3;
      # };
    };
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
    xdg-desktop-portal-gnome
  ];
}
