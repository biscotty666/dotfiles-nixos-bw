{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
#    kdePackages.fcitx5-chinese-addons
    nuspell
    hunspellDicts.en_US
    hunspellDicts.es_ANY
    hunspellDicts.fr-any
 ];

}
