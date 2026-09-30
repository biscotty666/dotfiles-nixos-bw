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
      "org.mozilla.thunderbird"
      "org.mozilla.firefox"
      "org.gimp.GIMP"
      "org.inkscape.Inkscape"
      "org.kde.digikam"
      "com.obsproject.Studio"
    ];
    update.auto = {
      enable = true;
      onCalendar = "daily";
    };
  };
}
