{ pkgs, ...}: {
  services.locate = {
    enable = true;
    package = pkgs.mlocate;
    interval = "hourly";
    localuser = null;
  };
}
