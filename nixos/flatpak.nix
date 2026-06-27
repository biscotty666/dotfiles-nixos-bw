{ config, ... }:

{
  services.flatpak = {
    enable = true;
    packages = [
      "app.zen_browser.zen"
      "org.beeref.BeeRef"
    ];
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };
  };
}
