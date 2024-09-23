{ config, pkgs, ... }:

{
  programs = {

    thefuck.enable = true;

    nixvim = {
      enable = true;
      plugins.lightline.enable = true;
      plugins.web-devicons.enable = true;
      extraPlugins = with pkgs.vimPlugins; [
            nvim-web-devicons
            molokai
      ];
      colorscheme = "molokai";

    };
    kitty = {
      enable = true;
      font = {
                #name = "NotoSansM Nerd Font Mono";
        name = "FiraCode Nerd Font Regular";
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
