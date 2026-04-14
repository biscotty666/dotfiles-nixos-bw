{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    (catppuccin-sddm.override {
      flavor = "mocha";
      accent = "mauve";
    })
    kdePackages.qtmultimedia
    sddm-astronaut
  ];

  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-mocha-mauve";
    wayland.enable = true;
    wayland.compositor = "weston";
  };

  services.xserver.displayManager.setupCommands = "
    xrandr --output eDP-1 --auto --primary
    xrandr --output HDMI-A-1 --auto --noprimary
    ";

  # services.displayManager.gdm.enable = true;

  # services.xserver.displayManager.lightdm = {
  #   enable = true;
  #   greeters.lomiri.enable = true;
  #   # greeters.enso = {
  #   #   enable = true;
  #   #   blur = true;
  #   # };
  #   # greeters.slick.enable = true;
  # };
  # services.displayManager.dms-greeter = {
  #   enable = true;
  #   compositor.name = "niri";
  # };
}
