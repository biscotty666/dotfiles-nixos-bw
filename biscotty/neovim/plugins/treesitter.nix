{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;

      nixvimInjections = true;
      folding = true;

      settings = {
        highlight.enable = true;
        indent.enable = true;
      };

    };

    treesitter-refactor = {
      enable = true;
      highlightDefinitions = {
        enable = true;
        # Set to false if you have an `updatetime` of ~100.
        clearOnCursorMove = false;
      };
    };

    treesitter-textobjects.enable = true;

    hmts.enable = true;
  };
}
