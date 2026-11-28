{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    vlc
    # thunderbird
    openshot-qt
    proton-vpn
    # geogebra6
    libreoffice-qt
    # kgeotag
    calibre
    obsidian
    wike
    brave
    # slack
    spotify
    # element-desktop
    gimagereader-qt
    # helix
    # zed-editor-fhs
    # blender
    # (blender.override {
    #   config.cudaSupport = true;
    #   config.rocmSupport = false;
    # })

  ];
}
