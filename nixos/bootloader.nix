{ config, pkgs, ... }:

{
  boot.loader = {
    systemd-boot.enable = false;
    efi.canTouchEfiVariables = true;
    limine = {
      enable = true;
      style = {
        wallpapers = [
          pkgs.nixos-artwork.wallpapers.dracula.gnomeFilePath
          pkgs.nixos-artwork.wallpapers.mosaic-blue.gnomeFilePath
          pkgs.nixos-artwork.wallpapers.waterfall.gnomeFilePath
          pkgs.nixos-artwork.wallpapers.watersplash.gnomeFilePath
          pkgs.nixos-artwork.wallpapers.nineish-catppuccin-macchiato.gnomeFilePath
        ];
      };

    };
  };
}
