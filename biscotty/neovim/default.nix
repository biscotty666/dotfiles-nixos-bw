{
  pkgs,
  lib,
  ...
}: let
  fromGitHub = rev: ref: repo:
    pkgs.vimUtils.buildVimPlugin {
      pname = "${lib.strings.sanitizeDerivationName repo}";
      version = ref;
      src = builtins.fetchGit {
        url = "https://github.com/${repo}.git";
        ref = ref;
        rev = rev;
      };
    };
  vPlugs = pkgs.vimPlugins;
  vPlugs-nvtsp = pkgs.vimPlugins.nvim-treesitter-parsers;
in {
  home.packages = with pkgs; [
    vscode-extensions.ms-vscode.cpptools
    vscode-extensions.vadimcn.vscode-lldb
  ];
  programs = {
    neovim = {
      extraConfig = ''
        set mouse=a
        syntax on

        set tabstop=4
        set softtabstop=4
        set shiftwidth=4
        set autoindent
        set smartindent
        set smarttab
        set expandtab
        set list
        set listchars=eol:.,tab:>-,trail:~,extends:>,precedes:<
        set fileformat=unix
        set textwidth=79
        
        set cursorline
        set number
        set relativenumber
        set scrolloff=8
        set signcolumn=yes
        set showcmd
        set noshowmode
        set conceallevel=1
        set shortmess+=c
        set formatoptions-=cro

        set ignorecase
        set smartcase
        set incsearch
        set hlsearch

        set foldmethod=indent
        set foldlevel=99

        set clipboard=unnamedplus

        nnoremap <space> za

        au BufRead, BufNewFile *.py,*.pyw *.c *.h match BadWhitespace /\s\+$/

        let g:ycm_autoclose_preview_window_after_completion=1
        let g:loaded_netrwPlugin = 1
        let g:loaded_netrw = 1
        map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

        nnoremap <C-J> <C-W><C-J>
        nnoremap <C-K> <C-W><C-K>
        nnoremap <C-L> <C-W><C-L>
        nnoremap <C-H> <C-W><C-H>

        inoremap [ []<Left>
        inoremap ( ()<Left>
        inoremap { {}<Left>
        inoremap " ""<Left>
        inoremap < <><Left>
        inoremap ` ``<Left>


      '';
      plugins = [
        ## Theme
        {
          # plugin = pkgs.vimPlugins.tokyonight-nvim;
          # config = "vim.cmd[[colorscheme tokyonight-night]]";
          plugin = pkgs.vimPlugins.molokai;
          config = "vim.cmd[[colorscheme molokai]]";
          type = "lua";
        }

        ## Treesitter
        {
          plugin = pkgs.vimPlugins.nvim-treesitter;
          config = builtins.readFile config/setup/treesitter.lua;
          type = "lua";
        }
        {
          plugin = vPlugs.obsidian-nvim;
          config = builtins.readFile config/setup/obsidian.lua;
          type = "lua";
        }
        pkgs.vimPlugins.nvim-treesitter.withAllGrammars
        vPlugs-nvtsp.html
        vPlugs-nvtsp.haskell
        pkgs.vimPlugins.nvim-treesitter-parsers.svelte
        pkgs.vimPlugins.nvim-treesitter-parsers.regex
        pkgs.vimPlugins.nvim-treesitter-parsers.python
        pkgs.vimPlugins.nvim-treesitter-parsers.nix
        pkgs.vimPlugins.nvim-treesitter-parsers.r
        pkgs.vimPlugins.nvim-treesitter-parsers.css
        pkgs.vimPlugins.nvim-treesitter-parsers.javascript
        pkgs.vimPlugins.nvim-treesitter-parsers.markdown
        pkgs.vimPlugins.nvim-treesitter-textobjects
        vPlugs.markdown-preview-nvim
        vPlugs.markdown-nvim
        vPlugs.nvim-tree-lua
        # pkgs.luajitPackages.lua-utils-nvim
        pkgs.lua54Packages.lua-utils-nvim
        vPlugs.nvim-web-devicons 
        {
          plugin = pkgs.vimPlugins.nvim-lspconfig;
          config = builtins.readFile config/setup/lspconfig.lua;
          type = "lua";
        }

        pkgs.vimPlugins.plenary-nvim

        ## Telescope
        {
          plugin = pkgs.vimPlugins.telescope-nvim;
          config = builtins.readFile config/setup/telescope.lua;
          type = "lua";
        }
        pkgs.vimPlugins.telescope-fzf-native-nvim
        pkgs.vimPlugins.harpoon

        ## cmp
        {
          plugin = pkgs.vimPlugins.nvim-cmp;
          config = builtins.readFile config/setup/cmp.lua;
          type = "lua";
        }
        pkgs.vimPlugins.cmp-nvim-lsp
        pkgs.vimPlugins.cmp-buffer
        pkgs.vimPlugins.cmp-cmdline
        pkgs.vimPlugins.cmp_luasnip

        ## Tpope
        pkgs.vimPlugins.vim-surround
        pkgs.vimPlugins.vim-sleuth
        pkgs.vimPlugins.vim-repeat
        {
          plugin = fromGitHub "afd76df166ed0f223ede1071e0cfde8075cc4a24" "main" "TabbyML/vim-tabby";
          config = ''
            vim.cmd([[
              let g:tabby_keybinding_accept = '<Tab>'
            ]])
          '';
          type = "lua";
        }

        ## QoL
        pkgs.vimPlugins.lspkind-nvim
        pkgs.vimPlugins.rainbow
        pkgs.vimPlugins.nvim-web-devicons
        pkgs.vimPlugins.surround-nvim
        pkgs.vimPlugins.lazygit-nvim
        pkgs.vimPlugins.nvim-code-action-menu
        {
          plugin = pkgs.vimPlugins.neorg;
          config = builtins.readFile config/setup/neorg.lua;
          type = "lua";
        }
        {
          # Updated 07/06/24
          plugin = fromGitHub "30fe1b3de2b7614f061be4fc9c71984a2b87e50a" "main" "m-demare/hlargs.nvim";
          config = "require('hlargs').setup()";
          type = "lua";
        }
        {
          # Updated 07/06/24
          plugin = fromGitHub "a0ae099c7eb926150ee0a126b1dd78086edbe3fc" "main" "apple/pkl-neovim";
        }
        {
          # Updated 07/06/24
          plugin = fromGitHub "c6bd6d93e4724ac2dc0cae73ebe1d568bf406537" "main" "epwalsh/obsidian.nvim";
          config = ''
            require("obsidian").setup({
              workspaces = {
                {
                  name = "Brian2",
                  path = "~/Obsidian/Brian2",
                },
              },
            })
          '';
          type = "lua";
        }
        (fromGitHub "8843b72822151bb7792f3fdad4b63df0bc1dd4a6" "main" "MattCairns/telescope-cargo-workspace.nvim")
        {
          plugin = pkgs.vimPlugins.oil-nvim;
          config = "require('oil').setup()";
          type = "lua";
        }
        {
          plugin = pkgs.vimPlugins.fidget-nvim;
          config = "require('fidget').setup{}";
          type = "lua";
        }
        {
          plugin = pkgs.vimPlugins.trouble-nvim;
          config = "require('trouble').setup {}";
          type = "lua";
        }
        {
          plugin = pkgs.vimPlugins.luasnip;
          config = builtins.readFile config/setup/luasnip.lua;
          type = "lua";
        }
        {
          plugin = pkgs.vimPlugins.comment-nvim;
          config = "require('Comment').setup()";
          type = "lua";
        }
        {
          plugin = pkgs.vimPlugins.gitsigns-nvim;
          config = "require('gitsigns').setup()";
          type = "lua";
        }
        {
          plugin = pkgs.vimPlugins.lualine-nvim;
          config = ''
            require('lualine').setup {
                options = {
                    theme = 'molokai',
                }
            }
          '';
          type = "lua";
        }
        {
          plugin = pkgs.vimPlugins.noice-nvim;
          config = ''
            require("noice").setup({
              lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                  ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                  ["vim.lsp.util.stylize_markdown"] = true,
                  ["cmp.entry.get_documentation"] = true,
                },
              },
              -- you can enable a preset for easier configuration
              presets = {
                bottom_search = true, -- use a classic bottom cmdline for search
                command_palette = true, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false, -- add a border to hover docs and signature help
              },
            })
          '';
          type = "lua";
        }

        ## Debugging
        pkgs.vimPlugins.nvim-dap-ui
        pkgs.vimPlugins.nvim-dap-virtual-text
        {
          plugin = pkgs.vimPlugins.nvim-dap;
          config = builtins.readFile config/setup/dap.lua;
          type = "lua";
        }
        {
          plugin = pkgs.vimPlugins.rustaceanvim;
          config = ''
            vim.g.rustaceanvim = {
              -- Plugin configuration
              tools = {
              },
              -- LSP configuration
              server = {
                on_attach = function(client, bufnr)
                  -- you can also put keymaps in here
                end,
                settings = {
                  -- rust-analyzer language server configuration
                  ['rust-analyzer'] = {
                   cargo = {
                      allFeatures = true,
                      loadOutDirsFromCheck = true,
                      runBuildScripts = true,
                    },
                    checkOnSave = {
                      allFeatures = true,
                      command = "clippy",
                      extraArgs = { "--no-deps" },
                    },
                    procMacro = {
                      enable = true,
                      ignored = {
                        ["async-trait"] = { "async_trait" },
                        ["napi-derive"] = { "napi" },
                        ["async-recursion"] = { "async_recursion" },
                      },
                    },
                  },
                },
              },
              -- DAP configuration
              dap = {
              },
            }
          '';
          type = "lua";
        }
      ];

      extraLuaConfig = ''
        ${builtins.readFile config/mappings.lua}
        ${builtins.readFile config/options.lua}
      '';
      enable = true;
      viAlias = true;
      vimAlias = false;
    };
  };
}
