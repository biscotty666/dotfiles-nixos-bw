{
  pkgs,
  ...
}:
{

  environment.systemPackages = with pkgs; [
    libmtp
    libgphoto2
    gphoto2fs
    glib
    kdePackages.kamera
  ];

  programs.gphoto2.enable = true;
  services.gvfs.enable = true;
}
