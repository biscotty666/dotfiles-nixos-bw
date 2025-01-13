{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    nushell
    nushellPlugins.query
    nushellPlugins.polars
    nushellPlugins.formats
    nushellPlugins.highlight
    nushellPlugins.units
    nushellPlugins.skim
  ];

}
