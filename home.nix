{ config, pkgs, ... }:
{
  imports = [
    ./sh.nix
    ./packages.nix
    ./programs.nix
  ];

  home.username = "guest";
  home.homeDirectory = "/home/guest";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    # kdeconnect
    syncthing
  ];

  programs = {
    # kdeconnect.package = gnomeExtensions.gsconnect;
  };

  services = {
    # kdeconnect = {
      # enable = true;
      # indicator = true;
      # package = pkgs.gnomeExtensions.gsconnect;
    # };
    syncthing = {
      enable = true;
      tray.enable = true;
    };

  };
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
