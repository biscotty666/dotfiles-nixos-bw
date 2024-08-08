{ config, pkgs, ... }:

{
  programs = {

    kitty = {
      enable = true;
      font = {
        name = "FiraCode Nerd Font";
        size = 12;
      };
      theme = "Monokai Soda";
            #theme = "Molokai";
    };

    git = {
      enable = true;
      userName = "biscotty666";
      userEmail = "biscotty666@gmail.com";
      extraConfig = {
        push = { autoSetupRemote = true; };
      };
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        ecmel.vscode-html-css
      ];
      enableExtensionUpdateCheck = true;
    };

    lsd = {
      enable = true;
            #      enableAliases = true;
    };

    zellij = {
      enable = true;
#      enableZshIntegration = true;
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
  };
}
