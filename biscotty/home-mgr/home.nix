{ config, pkgs, inputs, ... }:

{
  imports = [
    ./sh.nix
    ./spell.nix
    ./vault.nix
    ./kitty.nix
    ./packages.nix
    ./programs.nix
    ./zsh.nix
    ./gui.nix
    ./services.nix
    ./fonts.nix
    ./neovim
  ];

  home.username = "biscotty";
  home.homeDirectory = "/home/biscotty";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs;
    [

    ];

  programs = {

  };

  services = {

  };
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
    #    EDITOR = "vim";
    NIXPKGS_ALLOW_UNFREE = 1;
    BARTIB_FILE = "/home/biscotty/.local/bartib/activities.bartib";
    RESTIC_REPOSITORY = "$HOME/easydata/backups/sb";
    RESTIC_PASSWORD_FILE = "$HOME/.config/restic/restpass";
    FZF_DEFAULT_OPTS = "--preview 'bat --color=always {}'";
    NIXOS_OZONE_WL = "1";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
