{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gnome-tweaks
    gnome.gnome-weather
    gnomeExtensions.openweather-refined
  ];
}
