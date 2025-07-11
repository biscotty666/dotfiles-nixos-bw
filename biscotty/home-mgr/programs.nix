{ config, pkgs, ... }:

{
  programs = {

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

    lsd = {
      enable = true;
    };

    zellij = {
      enable = true;
      enableZshIntegration = false;
    };

  };
}
