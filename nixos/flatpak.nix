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
      "eu.betterbird.Betterbird"
      "com.github.tchx84.Flatseal"
      "org.onlyoffice.desktopeditors"
    ];
    update.auto = {
      enable = true;
      onCalendar = "daily";
    };
  };
}
