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
        showCapsule = false;
        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
          ];
          center = [
            {
              hideUnoccupied = false;
              id = "Workspace";
              labelMode = "none";
            }
          ];
          right = [
            {
              id = "plugin:clipper";
            }
            {
              id = "plugin:kde-connect";
            }
            {
              id = "Network";
            }
            {
              id = "Bluetooth";
            }
            {
              alwaysShowPercentage = true;
              id = "Battery";
              warningThreshold = 30;
            }
            {
              formatHorizontal = "HH:mm";
              formatVertical = "HH mm";
              id = "Clock";
              useMonospacedFont = true;
              usePrimaryColor = true;
            }
          ];
        };

      };
      colorSchemes.predefinedScheme = "Monochrome";
      general = {
        # avatarImage = "/home/biscotty/Camera/Oily.png";
        radiusRatio = 0.2;
      };
      location = {
        monthBeforeDay = true;
        name = "Albuquerque, NM";
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
