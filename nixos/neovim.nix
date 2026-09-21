{ pkgs, ... }:

{
  environment.systemPackages = with pkgs.vimPlugins; [
    nvim-tree-lua
    nvim-colorizer-lua
    img-clip-nvim
  ];
}
