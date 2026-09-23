{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;

    package = pkgs.obs-studio.override {
      cudaSupport = true;
    };

    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-vaapi # optional AMD hardware acceleration
      obs-gstreamer
      obs-vkcapture
      obs-noise
      pixel-art
      input-overlay
      obs-3d-effect
      obs-retro-effects
      obs-vintage-filter
      obs-composite-blur
      obs-scale-to-sound
      obs-media-controls
      # obs-move-transition
      obs-wayland-hotkeys
      advanced-scene-switcher
    ];
  };
}
