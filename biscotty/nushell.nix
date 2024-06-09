{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nushell
    nushellPlugins.query
    nushellPlugins.gstat
    nushellPlugins.net
    nushellPlugins.formats
    cargo
    gcc
  ];
}
