{
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

  services.xserver.videoDrivers = [ "nvidia" ];
  nix.settings.system-features = [ "cuda" ];

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;

    nvidiaSettings = true;

  };
}
