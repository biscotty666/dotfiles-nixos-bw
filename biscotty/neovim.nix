{ config, pkgs, ... }:

{
  programs.neovim = {
      enable = true;
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
        map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

        nnoremap <C-J> <C-W><C-J>
        nnoremap <C-K> <C-W><C-K>
        nnoremap <C-L> <C-W><C-L>
        nnoremap <C-H> <C-W><C-H>


      '';
      plugins = [
        pkgs.vimPlugins.nvim-tree-lua
        pkgs.vimPlugins.nvim-treesitter
        pkgs.vimPlugins.nvim-treesitter.withAllGrammars
        pkgs.vimPlugins.nvim-treesitter-textobjects
        pkgs.vimPlugins.nvim-lspconfig

        pkgs.vimPlugins.trouble-nvim
        pkgs.vimPlugins.plenary-nvim
        pkgs.vimPlugins.telescope-nvim
        pkgs.vimPlugins.telescope-fzf-native-nvim
        pkgs.vimPlugins.fidget-nvim
        pkgs.vimPlugins.nvim-cmp
        pkgs.vimPlugins.cmp-nvim-lsp
        pkgs.vimPlugins.cmp-buffer
        pkgs.vimPlugins.cmp-cmdline

        pkgs.vimPlugins.clangd_extensions-nvim
        pkgs.vimPlugins.luasnip
        pkgs.vimPlugins.cmp_luasnip
        pkgs.vimPlugins.lspkind-nvim
        pkgs.vimPlugins.nvim-lint
        pkgs.vimPlugins.vim-surround
        pkgs.vimPlugins.vim-obsession
        pkgs.vimPlugins.kommentary
        pkgs.vimPlugins.neoformat
        pkgs.vimPlugins.lazygit-nvim
        pkgs.vimPlugins.gitsigns-nvim
        pkgs.vimPlugins.rainbow
        pkgs.vimPlugins.vim-sleuth
        pkgs.vimPlugins.lualine-nvim
        pkgs.vimPlugins.nvim-web-devicons
        pkgs.vimPlugins.lightspeed-nvim
        pkgs.vimPlugins.leap-nvim
        pkgs.vimPlugins.vim-repeat
        pkgs.vimPlugins.kanagawa-nvim
        {
          plugin = pkgs.vimPlugins.vim-startify;
          config = "let g:startify_change_to_vcs_root = 0";
        }
        {
          plugin = pkgs.vimPlugins.nvim-colorizer-lua;
          config = ''
            packadd! nvim-colorizer.lua
          '';
        }
      ];
    };
}
