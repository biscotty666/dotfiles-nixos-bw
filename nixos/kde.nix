{ pkgs, ... }:

{
  services.desktopManager.plasma6.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa # Music player
    kdepim-runtime # Akonadi agents
    kmahjongg
    kmines
    konversation # IRC client
    kpat # Solitaire
    ksudoku
    kmail
    kmailtransport
    kmail-account-wizard
  ];
  environment.systemPackages = with pkgs.kdePackages; [
    # fcitx5-with-addons
    karousel
    kcolorchooser
    kparts
    parley
    sddm
    tokodon
  ];
}
