{ config, pkgs, lib, ... }:
with lib;
{
  options.programs.kdeconnect = {
    enable = mkEnableOption (lib.mdDoc ''
      kdeconnect.

      Note that it will open the TCP and UDP port from
      1714 to 1764 as they are needed for it to function properly.
      You can use the {option}`package` to use
      `gnomeExtensions.gsconnect` as an alternative
      implementation if you use Gnome
    '');
    package = mkPackageOption pkgs [ "plasma6Packages" "kdeconnect-kde" ] {
    #package = mkPackageOption pkgs [ "plasma5Packages" "kdeconnect-kde" ] {
      #example = literalExpression "pkgs.kdePackages.kdeconnect-kde";
      example = "gnomeExtensions.gsconnect";
    };
    #indicator = mkOption {
        #type = types.bool;
        #default = true;
        #description = "Whether to enable kdeconnect-indicator service.";
      #};
  };
}
