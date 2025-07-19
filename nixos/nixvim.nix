{inputs, ...}: {
  imports = [
    inputs.nixvim.nixosModules.nixvim
    #./autocommands.nix
    #./completion.nix
    #./keymappings.nix
    #./options.nix
    #./plugins
    #./todo.nix
  ];


  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    #vimAlias = true;

    colorschemes.tokyonight.enable = true;
    
    plugins = {
      lualine.enable = true;
    };
  };
}
