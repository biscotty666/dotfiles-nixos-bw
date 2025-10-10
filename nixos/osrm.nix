{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    osmium-tool libosmium
  ];
  services = {
    osrm = {
      enable = true;
      dataFile = "/home/biscotty/.var/lib/osrm/new-mexico-latest.osm.pbf";
    };
  };
}
