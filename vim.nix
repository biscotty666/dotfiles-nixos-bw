{ config, pkgs, ... }:

{
  programs.vim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [ 
        vim-multiple-cursors
        lightline-vim
        nerdtree
        gitgutter
        vim-nerdtree-tabs
        vim-nerdtree-syntax-highlight
        awesome-vim-colorschemes
        zoxide-vim
      ];
      settings = { ignorecase = true; };
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

        set background=dark
        colorscheme molokai

      '';
    };
}
