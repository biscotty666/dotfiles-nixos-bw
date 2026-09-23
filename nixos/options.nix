{ pkgs, ... }:

{
  programs = {
    kdeconnect = {
      enable = true;
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    fzf = {
      fuzzyCompletion = true;
      keybindings = true;
    };

    virt-manager.enable = true;

    nix-index = {
      enable = true;
      enableZshIntegration = true;
    };
    command-not-found.enable = false;
    nix-index-database.comma.enable = true;
    zsh.interactiveShellInit = ''
      source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh
    '';
  };
}
