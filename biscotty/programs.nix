{ config, pkgs, ... }:

{
  programs = {

    thefuck.enable = true;

    helix = {
      enable = true;
      settings = {
        theme = "autumn_night_transparent";
        editor.cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
      languages.language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt-classic}/bin/nixfmt";
        }
        {
          name = "rust";
          auto-format = true;
        }
      ];
      themes = {
        autumn_night_transparent = {
          "inherits" = "autumn_night";
          "ui.background" = { };
        };
      };
    };

    nixvim = {
      enable = true;
      plugins.lightline.enable = true;
      plugins.web-devicons.enable = true;
      extraPlugins = with pkgs.vimPlugins; [ nvim-web-devicons molokai ];
      colorscheme = "molokai";

    };
    kitty = {
      enable = true;
      font = {
        #name = "NotoSansM Nerd Font Mono";
        name = "FiraCode Nerd Font Regular";
        size = 12;
      };
      themeFile = "Molokai";
      settings = { cursor = "#caec4d"; };
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

    vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [ ecmel.vscode-html-css ];
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
