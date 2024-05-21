{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    configure = {
      customRC = ''
        set number relativenumber
        set cc=80
        set list
        set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
        if &diff
          colorscheme blue
        endif
      '';
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [ ctrlp ];
      };
      plugins = [
        pkgs.vimPlugins.nvim-treesitter.withAllGrammars
        {
          plugin = pkgs.vimPlugins.nvim-colorizer-lua;
          config = ''
            packadd! nvim-colorizer.lua
            lua << END
            require 'colorizer'.setup {
              '*'; -- Highlight all files, but customize some others.
              '!vim'; -- Exclude vim from highlighting.
            }
            END
            '';
        }
      ];
    };
  };
}
