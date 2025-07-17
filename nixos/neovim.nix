{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    configure = {
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [
          nvim-tree-lua
	  nvim-colorizer-lua
        ];
      };
    };
  };  
}
