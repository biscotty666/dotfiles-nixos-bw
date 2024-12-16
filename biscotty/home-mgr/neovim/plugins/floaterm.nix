{
  programs.nixvim.plugins.floaterm = {
    enable = true;

    settings = {
        width = 0.8;
        height = 0.8;
        keymaps.toggle = "<leader>,";
        title = "";
    };


  };
}
