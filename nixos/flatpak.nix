{ ... }:

{
  services.flatpak = {
    enable = true;
    packages = [
      "app.zen_browser.zen"
      "org.openshot.OpenShot"
    ];
    update.auto = {
      enable = true;
      onCalendar = "daily";
    };
  };
}
