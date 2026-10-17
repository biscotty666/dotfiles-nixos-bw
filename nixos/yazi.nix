{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;
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
        ];
      };
    };
    plugins = {
      bookmarks = pkgs.yaziPlugins.bookmarks.overrideAttrs (oldAttrs: {
        src = pkgs.fetchFromGitHub {
          owner = "sidhantunnithan";
          repo = "bookmarks.yazi";
          rev = "a61e524a2b74f8f09e5af2265df0a32605f7528c";
          sha256 = "u5AtP6Mp6OwLQps10PNV1xjwjwfDmZxND0NDnIuqZRY=";
        };
      });
    };
  };
}
