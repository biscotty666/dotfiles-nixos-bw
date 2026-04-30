{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./sh.nix
    ./nvim-spell.nix
    # ./noctalia.nix
    # ./plasma.nix
    ./scripts/scripts.nix
    # inputs.niri.homeModules.config
  ];

  home.username = "biscotty";
  home.homeDirectory = "/home/biscotty";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [

  ];

  programs = {

  };

  services = {

  };

  home.sessionVariables = {
    #    EDITOR = "vim";
    NIXPKGS_ALLOW_UNFREE = 1;
    BARTIB_FILE = "/home/biscotty/.local/bartib/activities.bartib";
    RESTIC_REPOSITORY = "$HOME/seagate/backups/sb";
    RESTIC_PASSWORD_FILE = "$HOME/.config/restic/restpass";
    FZF_DEFAULT_OPTS = "--preview 'bat --color=always {}'";
    NIXOS_OZONE_WL = "1";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
