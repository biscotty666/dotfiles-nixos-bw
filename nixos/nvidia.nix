{
  config,
  lib,
  pkgs,
  ...
}:
{

  environment.systemPackages = with pkgs; [
    libva
    libva-utils
  ];

  hardware.graphics = {
    enable = true;
  };

  # nixpkgs.config = {
  #   cudaSupport = true;
  #   allowUnfree = true;
  # };
  services.xserver.videoDrivers = [ "nvidia" ];
  nix.settings.system-features = [ "cuda" ];

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;

    nvidiaSettings = true;

    # prime = {
    #   sync.enable = true;
    #   intelBusId = "PCI:0:2:0";
    #   nvidiaBusId = "PCI:1:0:0";
    # };

  };
}
