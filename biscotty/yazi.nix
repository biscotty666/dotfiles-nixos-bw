{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "y";
    settings = {
      yazi.mgr = {
        ratio = [
          1
          3
          3
        ];
        sort_by = "natural";
        sort_sensitive = true;
        sort_reverse = false;
        sort_dir_first = true;
        linemode = "none";
        show_hidden = true;
        show_symlink = true;
      };
    };
    keymap = {
      mgr.prepend_keymap = [
        {
          on = [ "n" ];
          run = "plugin bookmarks save";
          desc = "Save current position as a bookmark";
        }
        {
          on = [ "'" ];
          run = "plugin bookmarks jump";
          desc = "Jump to a bookmark";
        }
        {
          on = [
            "b"
            "d"
          ];
          run = "plugin bookmarks delete";
          desc = "Delete a bookmark";
        }
        {
          on = [
            "b"
            "D"
          ];
          run = "plugin bookmarks delete_all";
          desc = "Delete all bookmarks";
        }
        {
          on = [ "F" ];
          run = "plugin jump-to-char";
          desc = "Jump to char";
        }
      ];
    };
    plugins = with pkgs.yaziPlugins; {
      inherit
        nord
        yatline
        jump-to-char
        kanagawa
        full-border
        ;
      starship = {
        package = starship;
        setup = true;
      };
      bookmarks = {
        package = bookmarks;
        setup = true;
        settings = {
          last_directory = {
            enable = false;
            persist = false;
            mode = "dir";
          };
          persist = "none";
          desc_format = "full";
          file_pick_mode = "hover";
          custom_desc_input = false;
          show_keys = false;
          notify = {
            enable = false;
            timeout = 1;
            message = {
              new = "New bookmark '<key>' -> '<folder>'";
              delete = "Deleted bookmark in '<key>'";
              delete_all = "Deleted all bookmarks";
            };
          };
        };
      };
    };

    flavors = { inherit (pkgs.yaziPlugins) nord kanagawa; };

    theme.flavor = {
      light = "nord";
      dark = "kanagawa";
    };

    initLua = /* lua */ ''
      require("yatline"):setup({
        theme = require("nord"):setup(),
      })
      require("full-border"):setup {
      	set = "rounded",
      }
    '';

  };
}
