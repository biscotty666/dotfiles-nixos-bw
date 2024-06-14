{ pkgs, ...}: {
  services.kdeconnect = {
    enable = true;
    package = pkgs.kdePackages.kdeconnect-kde;
    indicator = true;
  };
  services.locate = {
    enable = true;
    locate = pkgs.mlocate;
    interval = "hourly";
  };
}
