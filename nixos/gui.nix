{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    vlc
    thunderbird
    obsidian
    openshot-qt
    # floorp-bin
    proton-vpn
    brave
    calibre
    wike
    kdePackages.tokodon
    libreoffice-qt-stable
    slack
    spotify
    discord
    gimagereader-qt
    helix
    zed-editor-fhs
    # (blender.override {
    #   config.cudaSupport = true;
    #   config.rocmSupport = false;
    # })

  ];

}
