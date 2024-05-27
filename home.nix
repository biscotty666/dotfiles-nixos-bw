{ config, pkgs, inputs, ... }:

# let
#   # […]
#   nix-nvim = builtins.fetchGit {
#     url = "https://framagit.org/vegaelle/nix-nvim.git";
#     ref = "main";
#     rev = "2151b0dff09a010cf092d9780c0902affa1acb25";
#   };
# in
# 
{
  imports = [
    ./sh.nix
    ./packages.nix
    ./programs.nix
#    ./services.nix
    ./hyprland.nix
    ./vim.nix
    ./kdeconnect.nix
    ./fonts.nix
    #./neovim.nix
    # (import "${nix-nvim}")
  ];

  home.username = "biscotty";
  home.homeDirectory = "/home/biscotty";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    # kdeconnect
    cowsay
  ];

  programs = {
    #kdeconnect.package = gnomeExtensions.gsconnect;
  };

  services = {

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
    NIXPKGS_ALLOW_UNFREE = 1;
    BARTIB_FILE="/home/biscotty/.local/bartib/activities.bartib";
    RESTIC_REPOSITORY = "$HOME/easydata/backups/sb";
    RESTIC_PASSWORD_FILE="$HOME/.config/restic/restpass";
    FZF_DEFAULT_OPTS="--preview 'bat --color=always {}'";
    NIXOS_OZONE_WL = "1";
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
