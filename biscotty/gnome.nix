{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gnome.gnome-tweaks
    gnome.gnome-weather
    gnomeExtensions.weather-oclock
  ];
}
