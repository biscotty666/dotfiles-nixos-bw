{ pkgs, lib, config, inputs, ... }:

let
    startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
      ${pkgs.waybar}/bin/waybar &
      ${pkgs.swww}/bin/swww init &
  
      sleep 1
  
      ${pkgs.swww}/bin/swww img ${./wallpaper.png} &
    '';
in
{

  wayland.windowManager.hyprland = {
    enable = true;

    xwayland.enable = true;
    package = pkgs.hyprland;
    plugins = [
      #inputs.hyprbars.packages.${pkgs.system}.default
      #inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
    ];

    settings = {
       exec-once = ''${startupScript}/bin/start'';
           "$mod" = "SUPER";
    bind =
      [
        "$mod, F, exec, firefox"
        "$mod, O, exec, obsidian"
        ", Print, exec, grimblast copy area"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );
    };
  };


  home.file."~/.config/hypr/hyprland.conf".text = ''
    decoration {
      shadow_offset = 0 5
      col.shadow = rgba(00000099)
    }

    $mod = SUPER

    bindm = $mod, mouse:272, movewindow
    bindm = $mod, mouse:273, resizewindow
    bindm = $mod ALT, mouse:272, resizewindow
  '';


    wayland.windowManager.sway = {
    enable = true;
    #config = rec {
      #modifier = "Mod4";
      # Use kitty as default terminal
      #terminal = "kitty";
      #startup = [
        # Launch Firefox on start
        #{command = "firefox";}
      #];
    #};
  };
}

