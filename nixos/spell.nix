{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    nuspell
    hunspellDicts.en_US
    hunspellDicts.es_ANY
    hunspellDicts.fr-any
    aspell
    aspellDicts.fr
    aspellDicts.es
    aspellDicts.en
  ];

}
