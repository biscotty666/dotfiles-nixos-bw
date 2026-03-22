{ pkgs, inputs, ... }:
{
  # import the home manager module
  imports = [
    inputs.noctalia.homeModules.default
  ];

  # configure options
  home.file.".cache/noctalia/wallpapers.json" = {
    text = builtins.toJSON {
      defaultWallpaper = "/home/biscotty/.dotfiles/tree.jpg";
    };
  };
  programs.noctalia-shell = {
    enable = true;
    settings = {
      # configure noctalia here
      bar = {
        density = "default";
        position = "top";
        showCapsule = true;
        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
            {
              id = "SessionMenu";
            }
            {
              id = "Spacer";
            }
            {
              hideUnoccupied = false;
              id = "Workspace";
              labelMode = "none";
            }
            {
              id = "Spacer";
            }
            {
              id = "Taskbar";
              onlyActiveWorkspaces = false;
              showPinnedApps = true;
            }
          ];
          center = [
            {
              id = "plugin:weather-indicator";
            }
            {
              formatHorizontal = "HH:mm";
              formatVertical = "HH mm";
              id = "Clock";
              useMonospacedFont = true;
              usePrimaryColor = true;
            }
          ];
          right = [
            {
              id = "plugin:clipper";
            }
            {
              id = "Volume";
            }
            {
              id = "AudioVisualizer";
            }
            {
              id = "plugin:kde-connect";
            }
            {
              id = "Network";
            }
            {
              id = "Tray";
            }
            {
              id = "Bluetooth";
            }
            {
              alwaysShowPercentage = true;
              id = "Battery";
              warningThreshold = 30;
            }
          ];
        };

      };
      # colorSchemes.predefinedScheme = "Tokyo Night";
      colorShemes.useWallpaperColors = true;
      # colorSchemes.predefinedScheme = "Monochrome";
      general = {
        # avatarImage = "/home/biscotty/Camera/Oily.png";
        radiusRatio = 0.2;
      };
      location = {
        monthBeforeDay = true;
        name = "Albuquerque, NM";
      };
      appLauncher = {
        enableClipboardHistory = true;
        autoPasteClipboard = true;
        pinnedApps = [
          "thunderbird" "obsidian" "spotify"
        ];
      };
      ui = {
        fontDefault = "Roboto";
      };
      dock = {
        enabled = true;
        pinnedApps = [
          "thunderbird" "obsidian" "spotify"
        ];
      };
    };
  # plugins = {
  #   sources = [
  #     {
  #       enabled = true;
  #       name = "Official Noctalia Plugins";
  #       url = "https://github.com/noctalia-dev/noctalia-plugins";
  #     }
  #   ];
  #   states = {
  #     catwalk = {
  #       enabled = true;
  #       sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
  #     };
  #   };
  #   version = 2;
  # };
  }; # this may also be a string or a path to a JSON file.
}
