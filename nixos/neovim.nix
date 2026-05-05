{ pkgs, config, ... }:

{
  # programs.neovim = {
  #   enable = true;
  #   defaultEditor = true;
  #   viAlias = true;
  #   configure = {
  #     packages.myVimPackage = with pkgs.vimPlugins; {
  #       start = [
  #         nvim-tree-lua
  #  nvim-colorizer-lua
  #         img-clip-nvim
  #       ];
  #     };
  #   };
  # };  
  environment.systemPackages = with pkgs.vimPlugins; [
    nvim-tree-lua
	  nvim-colorizer-lua
    img-clip-nvim
  ];
}
