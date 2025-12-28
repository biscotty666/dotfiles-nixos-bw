{ pkgs, ... }:
{
  i18n.extraLocales = [
    "zh_CN.UTF-8/UTF-8"
  ];
  i18n.inputMethod = {
  type = "fcitx5";
  enable = true;
  fcitx5 = {
    waylandFrontend = true;
    addons = with pkgs; [
      fcitx5-mozc
      ];
   };
  };
}
