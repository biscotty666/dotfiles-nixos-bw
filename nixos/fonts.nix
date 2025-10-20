{ config, pkgs, ... }:

{
  fonts.fontconfig.enable = true;
  environment.systemPackages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    arphic-uming
    roboto
    roboto-mono
    roboto-serif
    babelstone-han
    noto-fonts-color-emoji
    liberation_ttf
    fira-sans
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    font-awesome
    ubuntu_font_family
    proggyfonts
    nerd-fonts.inconsolata
    nerd-fonts.fantasque-sans-mono
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.hack
    nerd-fonts.droid-sans-mono
    nerd-fonts.mononoki
    nerd-fonts.hasklug
        #        (nerdfonts.override { fonts = [
        #        "FantasqueSansMono"
        #        "FiraCode"
        #        "FiraMono"
        #        "Hack"
        #        "Inconsolata"
        #        "JetBrainsMono"
        #        "DroidSansMono"
        #        ]; })
        #        #nerdfonts
  ];
}
