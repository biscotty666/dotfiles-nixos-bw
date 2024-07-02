{ config, pkgs, lib, ... }:
with lib;
{
  options.programs.kdeconnect = {
    enable = true;
    package = pkgs.plasma6Packages.kdeconnect-kde;
    indicator = mkOption {
        type = types.bool;
        default = true;
        description = "Whether to enable kdeconnect-indicator service.";
      };
  };
}
