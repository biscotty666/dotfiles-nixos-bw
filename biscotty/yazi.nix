{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "y";
    # settings = {
    #   yazi.mgr = {
    #     ratio = [
    #       1
    #       3
    #       3
    #     ];
    #     sort_by = "natural";
    #     sort_sensitive = true;
    #     sort_reverse = false;
    #     sort_dir_first = true;
    #     linemode = "none";
    #     show_hidden = true;
    #     show_symlink = true;
    #   };
    # };
    keymap = {
      mgr.prepend_keymap = [
        # Bookmarks
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
        # Jump-to-char
        {
          on = [ "F" ];
          run = "plugin jump-to-char";
          desc = "Jump to char";
        }
        # wl-clipboard
        {
          on = [ "<C-y>" ];
          run = "plugin wl-clipboard";
          desc = "Yank file to clipboard";
        }
        # kde-connect
        {
          on = [ "<C-s>" ];
          run = "plugin kdeconnect-send";
          desc = "Send selected files via KDE Connect";
        }
      ];
    };
    plugins = with pkgs.yaziPlugins; {
      inherit
        kdeconnect-send
        nord
        yatline
        jump-to-char
        kanagawa
        full-border
        wl-clipboard
        office
        piper
        glow
        rich-preview
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
          persist = "all";
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

    flavors = { inherit (pkgs.yaziPlugins) yatline-catppuccin nord kanagawa; };

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

  xdg.configFile."yazi/yazi.toml".text = ''
    [mgr]

    linemode = "none"
    ratio = [1, 3, 3]
    show_hidden = true
    show_symlink = true
    sort_by = "natural"
    sort_dir_first = true
    sort_reverse = false
    sort_sensitive = true

    [plugin]

    prepend_preloaders = [
      # Office Documents
      { mime = "application/openxmlformats-officedocument.*", run = "office" },
      { mime = "application/oasis.opendocument.*", run = "office" },
      { mime = "application/ms-*", run = "office" },
      { mime = "application/msword", run = "office" },
      { url = "*.docx", run = "office" },
    ]

    prepend_previewers = [
      # Office Documents
      { mime = "application/openxmlformats-officedocument.*", run = "office" },
      { mime = "application/oasis.opendocument.*", run = "office" },
      { mime = "application/ms-*", run = "office" },
      { mime = "application/msword", run = "office" },
      { url = "*.docx", run = "office" },
      { url = "*.csv", run = 'piper -- bat -p --color=always  "$1"' },
      # { url = "*.csv", run = "rich-preview"}, # for csv files
      { url = "*.md", run = "rich-preview" }, # for markdown (.md) files
      { url = "*.rst", run = "rich-preview"}, # for restructured text (.rst) files
      { url = "*.ipynb", run = "rich-preview"}, # for jupyter notebooks (.ipynb)
      { url = "*.json", run = "rich-preview"}, # for json (.json) files
      #    { url = "*.lang_type", run = "rich-preview"} # for particular language files eg. .py, .go., .lua, etc.

    ]

  '';
}
