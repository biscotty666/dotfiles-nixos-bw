{ config, pkgs, ... }:

{
  programs = {

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
