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
  home.file = {
    ".local/bin/unlock-vaults.sh" = {
      source = scripts/unlock-vaults.sh;
      executable = true;
    };
    ".local/bin/restic-backup.sh" = {
      source = scripts/restic-backup.sh;
      executable = true;
    };
    ".local/bin/fix-enet.sh" = {
      source = scripts/fix-enet.sh;
      executable = true;
    };
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
    RESTIC_REPOSITORY = "$HOME/seagate/backups/sb";
    RESTIC_PASSWORD_FILE = "$HOME/.config/restic/restpass";
    FZF_DEFAULT_OPTS = "--preview 'bat --color=always {}'";
    NIXOS_OZONE_WL = "1";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
