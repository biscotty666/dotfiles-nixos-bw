{ config, pkgs, ... }:

{
  environment.etc."nextcloud-admin-pass".text = "PWD";
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud28;
    hostName = "localhost";
    config.adminpassFile = "/etc/nextcloud-admin-pass";
    extraApps = {
      inherit (config.services.nextcloud.package.packages.apps) contacts calendar tasks;
      #news = pkgs.fetchNextcloudApp {
        #sha256 = "1g4fysq02r1kg6c4rlkcbrbyi4gwm60hhy4nxz5njsyxw1zvrylc";
        #url = "https://github.com/nextcloud/news/archive/refs/heads/stable16.zip";
        #license = "gpl3";
      #};
    };
    extraAppsEnable = true;
  };
}
