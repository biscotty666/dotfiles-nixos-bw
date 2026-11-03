{
  pkgs,
  ...
}:
{

  environment.systemPackages = with pkgs; [
    libva
    libva-utils
  ];

  boot.kernelPackages = pkgs.linuxPackages_7_2;

  hardware = {
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  nix.settings.system-features = [ "cuda" ];

  hardware = {
    graphics = {
      enable = true;
    };
    nvidia = {
      branch = "legacy_580";
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      prime = {
        sync.enable = true;
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };
}
