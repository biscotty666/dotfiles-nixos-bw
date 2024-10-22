{ config, pkgs, ... }:

{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    font-awesome
    ubuntu_font_family
    proggyfonts
        (nerdfonts.override { fonts = [
        "FantasqueSansMono"
        "FiraCode"
        "FiraMono"
        "Hack"
        "Inconsolata"
        "JetBrainsMono"
        "DroidSansMono"
        ]; })
        #nerdfonts
  ];
}
