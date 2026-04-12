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
}
