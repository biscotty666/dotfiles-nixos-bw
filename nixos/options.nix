{ config, pkgs, ... }:

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
  };
}
