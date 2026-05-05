{ config, pkgs, ... }:

{
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa # Music player
    kdepim-runtime # Akonadi agents
    kmahjongg
    kmines
    konversation # IRC client
    kpat # Solitaire
    ksudoku
    ktorrent
  ];
  environment.systemPackages = with pkgs.kdePackages; [

    fcitx5-with-addons
    karousel
    kcolorchooser
    kparts
    parley
    sddm
  ];
}
