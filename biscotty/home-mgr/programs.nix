{ config, pkgs, ... }:

{
  programs = {

    thefuck.enable = true;

    nixvim = {
      enable = true;
      plugins.lightline.enable = true;
      plugins.web-devicons.enable = true;
      extraPlugins = with pkgs.vimPlugins; [ nvim-web-devicons molokai ];
      colorscheme = "molokai";

    };

    git = {
      enable = true;
      userName = "biscotty666";
      userEmail = "biscotty666@gmail.com";
      extraConfig = { push = { autoSetupRemote = true; }; };
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    vscode.enable = true;
    vscode.profiles.default = {
      extensions = with pkgs.vscode-extensions; [ ecmel.vscode-html-css ];
      enableExtensionUpdateCheck = true;
    };

    lsd = {
      enable = true;
    };

    zellij = {
      enable = true;
      enableZshIntegration = false;
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
