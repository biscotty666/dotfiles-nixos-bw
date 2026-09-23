{ ... }:

{
  services.flatpak = {
    enable = true;
    packages = [
      "app.zen_browser.zen"
      "org.libreoffice.LibreOffice"
      "md.obsidian.Obsidian"
      "com.github.hugolabe.Wike"
      "com.discordapp.Discord"
      "com.brave.Browser"
      "org.kde.krita"
    ];
    update.auto = {
      enable = true;
      onCalendar = "daily";
    };
  };
}
