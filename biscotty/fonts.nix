{ config, pkgs, ... }:

{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    google-fonts
    dina-font
    #proggyfonts
    #nerdfonts
    (nerdfonts.override { fonts = [ 
       "FantasqueSansMono" 
       "FiraCode"
       "DroidSansMono"
     ]; })
  ];
}
