{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;

        keymaps = {
          silent = true;
          diagnostic = {
            # Navigate in diagnostics
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };

          lspBuf = {
            gd = "definition";
            gD = "references";
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            "<F2>" = "rename";
          };
        };

        servers = {
          clangd.enable = true;
          html.enable = true;
          htmx.enable = true;
          jsonls.enable = true;
                    #ltex.enable = true;
          rust_analyzer = {
            enable = true;
            installRustc = true;
            installCargo = true;
          };
          nixd.enable = true;
          quick_lint_js.enable = true;
          lua_ls.enable = true;
          texlab.enable = true;
          cssls.enable = true;
          emmet_ls.enable = true;
          elmls.enable = true;
          jedi_language_server.enable = true;
          markdown_oxide.enable = true;
          tailwindcss.enable = true;
          ghcide.enable = true;
          hls = {
            enable = true;
            installGhc = true;
          };
        };
      };
    };
  };
}
