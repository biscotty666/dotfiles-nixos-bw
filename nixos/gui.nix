{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vlc
    thunderbird
    openshot-qt
    proton-vpn
    calibre
    kdePackages.tokodon
    slack
    spotify
    element-desktop
    gimagereader-qt
    helix
    zed-editor-fhs
    # (blender.override {
    #   config.cudaSupport = true;
    #   config.rocmSupport = false;
    # })

  ];
}
