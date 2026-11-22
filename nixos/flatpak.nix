{
  services.flatpak = {
    enable = true;
    packages = [
      "app.zen_browser.zen"
      # "org.libreoffice.LibreOffice"
      "md.obsidian.Obsidian"
      "com.github.hugolabe.Wike"
      "com.discordapp.Discord"
      "com.brave.Browser"
      "org.kde.krita"
      "eu.betterbird.Betterbird"
      "com.github.tchx84.Flatseal"
      "com.calibre_ebook.calibre"
      "org.geogebra.GeoGebra"
      "org.mozilla.firefox"
      "org.kde.kmymoney"
      "org.gimp.GIMP"
      "org.inkscape.Inkscape"
      "org.kde.digikam"
      "com.github.johnfactotum.Foliate"
      "rocks.koreader.KOReader"
      "org.openshot.OpenShot"
    ];
    update = {
      onActivation = true;
      auto = {
        enable = true;
        onCalendar = "daily";
      };
    };
  };
  # home.sessionVariables = {
  #   XDG_DATA_DIRS = "$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share";
  # };
}
