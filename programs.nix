{ config, pkgs, ... }:

{
  programs = {

#     git = {
#      enable = true;
#      userName = "biscotty666";
#      userEmail = "biscotty666@gmail.com";
#      extraConfig = {
#        push = { autoSetupRemote = true; };
#      };
#    };
    zsh = {
#      enable = true;
      sessionVariables = {
        EDITOR = "vim";
        NIXPKGS_ALLOW_UNFREE = 1;
      };
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
      enableAliases = true;
    };

    zellij = {
      enable = true;
      enableZshIntegration = true;
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
