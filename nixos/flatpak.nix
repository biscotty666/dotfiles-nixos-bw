{ ... }:

{
  services.flatpak = {
    enable = true;
    packages = [
      "app.zen_browser.zen"
      "org.openshot.OpenShot"
      # "md.obsidian.Obsidian"
    ];
    update.auto = {
      enable = true;
      onCalendar = "daily";
    };
  };
}
