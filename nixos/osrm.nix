{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    osrm-backend osmium-tool libosmium
  ];
  # services = {
  #   osrm = {
  #     enable = true;
  #     dataFile = "/var/lib/osrm/new-mexico-latest.osm";
  #   };
  # };
}
