-- Nixvim's internal module table
-- Can be used to share code throughout init.lua
local _M = {}

-- Set up globals {{{
do
    local nixvim_globals = {
        floaterm_height = 0.8,
        floaterm_keymaps = { toggle = "<leader>," },
        floaterm_title = "",
        floaterm_width = 0.8,
        loaded_perl_provider = 0,
        loaded_python_provider = 0,
        loaded_ruby_provider = 0,
        mapleader = " ",
        maplocalleader = " ",
        mkdp_auto_close = 0,
        mkdp_theme = "dark",
        startify_change_to_dir = false,
        startify_custom_header = {
            "",
            "     ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗",
            "     ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║",
            "     ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║",
            "     ██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║",
            "     ██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║",
            "     ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
        },
        startify_files_number = 30,
        startify_lists = { { type = "dir" } },
        startify_skiplist = { "flake.lock" },
        startify_use_unicode = true,
        tagbar_width = 50,
        vimtex_callback_progpath = "nvim",
        vimtex_enabled = true,
        vimtex_quickfix_enabled = true,
        vimtex_quickfix_ignore_filters = {
            "Underfull",
            "Overfull",
            "specifier changed to",
            "Token not allowed in a PDF string",
        },
        vimtex_quickfix_open_on_warning = false,
        vimtex_toc_config = {
            layers = { "content", "todo" },
            mode = 2,
            name = "TOC",
            resize = true,
            show_help = true,
            show_numbers = true,
            split_width = 50,
            todo_sorted = false,
        },
        vimtex_view_method = "zathura",
    }

    for k, v in pairs(nixvim_globals) do
        vim.g[k] = v
    end
end
-- }}}

-- Set up options {{{
do
    local nixvim_options = {
        clipboard = "unnamedplus",
        colorcolumn = "100",
        completeopt = { "menu", "menuone", "noselect" },
        conceallevel = 2,
        cursorcolumn = false,
        cursorline = false,
        expandtab = true,
        fileencoding = "utf-8",
        foldexpr = "nvim_treesitter#foldexpr()",
        foldlevel = 99,
        foldmethod = "expr",
        hidden = true,
        ignorecase = true,
        inccommand = "split",
        incsearch = true,
        laststatus = 3,
        linebreak = true,
        modeline = true,
        modelines = 100,
        mouse = "a",
        mousemodel = "extend",
        number = true,
        relativenumber = true,
        scrolloff = 8,
        shiftwidth = 4,
        signcolumn = "yes",
        smartcase = true,
        spell = true,
        splitbelow = true,
        splitright = true,
        swapfile = false,
        tabstop = 4,
        termguicolors = true,
        textwidth = 0,
        undofile = true,
        updatetime = 100,
        wrap = true,
    }

    for k, v in pairs(nixvim_options) do
        vim.opt[k] = v
    end
end
-- }}}

vim.loader.enable(true)
-- Highlight groups {{
do
    local highlights = { Todo = { bg = "Yellow", fg = "Blue" } }

    for k, v in pairs(highlights) do
        vim.api.nvim_set_hl(0, k, v)
    end
end
-- }}

-- Match groups {{
do
    local match = { TODO = "TODO" }

    for k, v in pairs(match) do
        vim.fn.matchadd(k, v)
    end
end
-- }}

vim.cmd([[let $BAT_THEME = 'molokai'

colorscheme molokai
]])
require("nvim-web-devicons").setup({})

-- nvim-lspconfig {{{
do
    -- inlay hint

    local __lspServers = {
        { name = "texlab" },
        { name = "tailwindcss" },
        { name = "rust_analyzer" },
        { name = "quick_lint_js" },
        { name = "nixd" },
        { name = "markdown_oxide" },
        { name = "lua_ls" },
        { name = "jsonls" },
        { name = "jedi_language_server" },
        { name = "html" },
        { name = "hls" },
        { name = "ghcide" },
        { name = "emmet_ls" },
        { name = "elmls" },
        {
            extraOptions = {
                init_options = {
                    codeAction = true,
                    completion = true,
                    documentFormatting = true,
                    documentRangeFormatting = true,
                    documentSymbol = true,
                    hover = true,
                },
            },
            name = "efm",
        },
        { name = "cssls" },
        { name = "clangd" },
    }

    local __lspCapabilities = function()
        capabilities = vim.lsp.protocol.make_client_capabilities()

        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

        return capabilities
    end

    local __setup = { capabilities = __lspCapabilities() }

    for i, server in ipairs(__lspServers) do
        local options = server.extraOptions

        if options == nil then
            options = __setup
        else
            options = vim.tbl_extend("keep", options, __setup)
        end

        require("lspconfig")[server.name].setup(options)
    end
end
-- }}}

local cmp = require("cmp")
cmp.setup({
    formatting = {
        format = require("lspkind").cmp_format({
            menu = {
                buffer = "[buffer]",
                luasnip = "[snip]",
                neorg = "[neorg]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[api]",
                path = "[path]",
            },
        }),
    },
    mapping = {
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
        ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer", option = { get_bufnrs = vim.api.nvim_list_bufs } },
        { name = "neorg" },
    },
})

require("trim").setup({
    ft_blocklist = { "checkhealth", "floaterm", "lspinfo", "neo-tree", "TelescopePrompt" },
    highlight = true,
})

vim.opt.runtimepath:prepend(vim.fs.joinpath(vim.fn.stdpath("data"), "site"))
require("nvim-treesitter.configs").setup({
    highlight = { enable = true },
    indent = { enable = true },
    parser_install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "site"),
    refactor = {
        highlight_current_scope = { enable = false },
        highlight_definitions = { clear_on_cursor_move = false, enable = true },
        navigation = {
            enable = false,
            keymaps = {
                goto_definition = "gnd",
                goto_next_usage = "<a-*>",
                goto_previous_usage = "<a-#>",
                list_definitions = "gnD",
                list_definitions_toc = "gO",
            },
        },
        smart_rename = { enable = false, keymaps = { smart_rename = "grr" } },
    },
})

require("telescope").setup({
    defaults = {
        file_ignore_patterns = { "^.git/", "^.mypy_cache/", "^__pycache__/", "^output/", "^data/", "%.ipynb" },
        set_env = { COLORTERM = "truecolor" },
    },
})

local __telescopeExtensions = {}
for i, extension in ipairs(__telescopeExtensions) do
    require("telescope").load_extension(extension)
end

require("oil").setup({})

require("obsidian").setup({
    attachments = { img_folder = "Extras/Images" },
    completion = { min_chars = 2, nvim_cmp = true },
    daily_notes = {
        alias_format = "%B %-d, %Y",
        date_format = "%b %d, %Y",
        folder = "Notes/Daily",
        template = "Daily Note",
    },
    disable_frontmatter = false,
    new_notes_location = "notes_subdir",
    notes_subdir = "Notes",
    preferred_link_style = "wiki",
    templates = {
        subdir = "~/Obsidian/Brian2/Templates",
        substitutions = {
            friday = function()
                -- Get the current date
                local currentDate = os.date("*t")

                -- Calculate the difference in days to the first day of the week (Monday)
                local diff = (currentDate.wday + 1) % 7

                -- Subtract the difference to get the date of the first day of the week
                currentDate.day = currentDate.day - diff

                -- Return the date of the first day of the week
                return os.date("%Y-%m-%d", os.time(currentDate))
            end,
            monday = function()
                -- Get the current date
                local currentDate = os.date("*t")

                -- Calculate the difference in days to the first day of the week (Monday)
                local diff = (currentDate.wday + 5) % 7

                -- Subtract the difference to get the date of the first day of the week
                currentDate.day = currentDate.day - diff

                -- Return the date of the first day of the week
                return os.date("%Y-%m-%d", os.time(currentDate))
            end,
            thursday = function()
                -- Get the current date
                local currentDate = os.date("*t")

                -- Calculate the difference in days to the first day of the week (Monday)
                local diff = (currentDate.wday + 2) % 7

                -- Subtract the difference to get the date of the first day of the week
                currentDate.day = currentDate.day - diff

                -- Return the date of the first day of the week
                return os.date("%Y-%m-%d", os.time(currentDate))
            end,
            tuesday = function()
                -- Get the current date
                local currentDate = os.date("*t")

                -- Calculate the difference in days to the first day of the week (Monday)
                local diff = (currentDate.wday + 4) % 7

                -- Subtract the difference to get the date of the first day of the week
                currentDate.day = currentDate.day - diff

                -- Return the date of the first day of the week
                return os.date("%Y-%m-%d", os.time(currentDate))
            end,
            wednesday = function()
                -- Get the current date
                local currentDate = os.date("*t")

                -- Calculate the difference in days to the first day of the week (Monday)
                local diff = (currentDate.wday + 3) % 7

                -- Subtract the difference to get the date of the first day of the week
                currentDate.day = currentDate.day - diff

                -- Return the date of the first day of the week
                return os.date("%Y-%m-%d", os.time(currentDate))
            end,
        },
    },
    workspaces = { { name = "home", path = "~/Obsidian/Brian2" } },
})

require("nvim-autopairs").setup({})

require("luasnip").config.setup({})

require("lualine").setup({
    options = { globalstatus = true },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { "filename", "diff" },
        lualine_x = {
            "diagnostics",
            {
                function()
                    local msg = ""
                    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                    local clients = vim.lsp.get_active_clients()
                    if next(clients) == nil then
                        return msg
                    end
                    for _, client in ipairs(clients) do
                        local filetypes = client.config.filetypes
                        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                            return client.name
                        end
                    end
                    return msg
                end,
                color = { fg = "#ffffff" },
                icon = "",
            },
            "encoding",
            "fileformat",
            "filetype",
        },
    },
})

require("lsp-format").setup({})

require("gitsigns").setup({ signs = { add = { text = "+" }, change = { text = "~" } } })

require("Comment").setup({ opleader = { line = "<C-b>" }, toggler = { line = "<C-b>" } })

require("colorizer").setup({ user_default_options = { names = false } })

require("barbar").setup({})

require("neo-tree").setup({
    close_if_last_window = true,
    document_symbols = { custom_kinds = {} },
    window = { auto_expand_width = true, width = 30 },
})

-- Set up keybinds {{{
do
    local __nixvim_binds = {
        { action = "<cmd>Telescope live_grep<cr>", key = "<C-f>", mode = "n" },
        { action = "<cmd>Telescope git_files<cr>", key = "<C-p>", mode = "n" },
        { action = "<cmd>Telescope buffers<cr>", key = "<leader>b", mode = "n" },
        { action = "<cmd>Telescope diagnostics<cr>", key = "<leader>fd", mode = "n" },
        { action = "<cmd>Telescope find_files<cr>", key = "<leader>ff", mode = "n" },
        { action = "<cmd>Telescope live_grep<cr>", key = "<leader>fg", mode = "n" },
        { action = "<cmd>Telescope help_tags<cr>", key = "<leader>fh", mode = "n" },
        { action = "<cmd>Telescope oldfiles<cr>", key = "<leader>p", mode = "n" },
        { action = "<Cmd>BufferClose<CR>", key = "<C-w>", mode = "n" },
        { action = "<Cmd>BufferNext<CR>", key = "<TAB>", mode = "n" },
        { action = "<Cmd>BufferPrevious<CR>", key = "<S-TAB>", mode = "n" },
        { action = ":resize +2<CR>", key = "<C-Down>", mode = "n", options = { silent = true } },
        { action = ":vertical resize +2<CR>", key = "<C-Left>", mode = "n", options = { silent = true } },
        { action = ":vertical resize -2<CR>", key = "<C-Right>", mode = "n", options = { silent = true } },
        { action = ":resize -2<CR>", key = "<C-Up>", mode = "n", options = { silent = true } },
        { action = ":b#<CR>", key = "<C-c>", mode = "n", options = { silent = true } },
        { action = ":w<CR>", key = "<C-s>", mode = "n", options = { silent = true } },
        { action = ":close<CR>", key = "<C-x>", mode = "n", options = { silent = true } },
        { action = ":move+<CR>", key = "<M-j>", mode = "n", options = { silent = true } },
        { action = ":move-2<CR>", key = "<M-k>", mode = "n", options = { silent = true } },
        { action = "<NOP>", key = "<Space>", mode = "n", options = { silent = true } },
        { action = ":noh<CR>", key = "<esc>", mode = "n", options = { silent = true } },
        { action = "<C-w>h", key = "<leader>h", mode = "n", options = { silent = true } },
        { action = "<C-w>l", key = "<leader>l", mode = "n", options = { silent = true } },
        { action = ":!remi push<CR>", key = "<leader>rp", mode = "n", options = { silent = true } },
        { action = ":w<CR>", key = "<leader>s", mode = "n", options = { silent = true } },
        { action = "^", key = "H", mode = "n", options = { silent = true } },
        { action = "$", key = "L", mode = "n", options = { silent = true } },
        { action = "y$", key = "Y", mode = "n", options = { silent = true } },
        { action = "<gv", key = "<", mode = "v", options = { silent = true } },
        { action = "<gv", key = "<S-TAB>", mode = "v", options = { silent = true } },
        { action = ">gv", key = "<TAB>", mode = "v", options = { silent = true } },
        { action = ">gv", key = ">", mode = "v", options = { silent = true } },
        { action = ":m '>+1<CR>gv=gv", key = "J", mode = "v", options = { silent = true } },
        { action = ":m '<-2<CR>gv=gv", key = "K", mode = "v", options = { silent = true } },
        {
            action = function()
                require("telescope.builtin").live_grep({
                    default_text = "TODO",
                    initial_mode = "normal",
                })
            end,
            key = "<C-t>",
            mode = "n",
            options = { silent = true },
        },
        {
            action = ":Neotree action=focus reveal toggle<CR>",
            key = "<leader>n",
            mode = "n",
            options = { silent = true },
        },
        { action = ":TagbarToggle<cr>", key = "<C-g>", mode = "n", options = { silent = true } },
    }
    for i, map in ipairs(__nixvim_binds) do
        vim.keymap.set(map.mode, map.key, map.action, map.options)
    end
end
-- }}}

-- Set up autogroups {{
do
    local __nixvim_autogroups = { nixvim_binds_LspAttach = { clear = true }, nixvim_lsp_on_attach = { clear = false } }

    for group_name, options in pairs(__nixvim_autogroups) do
        vim.api.nvim_create_augroup(group_name, options)
    end
end
-- }}
-- Set up autocommands {{
do
    local __nixvim_autocommands = {
        {
            callback = function(event)
                do
                    -- client and bufnr are supplied to the builtin `on_attach` callback,
                    -- so make them available in scope for our global `onAttach` impl
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    local bufnr = event.buf
                    if vim.list_contains({ "efm" }, client.name) then
                        require("lsp-format").on_attach(client, bufnr)
                    end
                end
            end,
            desc = "Run LSP onAttach",
            event = "LspAttach",
            group = "nixvim_lsp_on_attach",
        },
        {
            callback = function(args)
                do
                    local __nixvim_binds = {
                        {
                            action = vim.diagnostic.goto_next,
                            key = "<leader>j",
                            mode = "n",
                            options = { desc = "Lsp diagnostic goto_next", silent = true },
                        },
                        {
                            action = vim.diagnostic.goto_prev,
                            key = "<leader>k",
                            mode = "n",
                            options = { desc = "Lsp diagnostic goto_prev", silent = true },
                        },
                        {
                            action = vim.lsp.buf.rename,
                            key = "<F2>",
                            mode = "n",
                            options = { desc = "Lsp buf rename", silent = true },
                        },
                        {
                            action = vim.lsp.buf.hover,
                            key = "K",
                            mode = "n",
                            options = { desc = "Lsp buf hover", silent = true },
                        },
                        {
                            action = vim.lsp.buf.references,
                            key = "gD",
                            mode = "n",
                            options = { desc = "Lsp buf references", silent = true },
                        },
                        {
                            action = vim.lsp.buf.definition,
                            key = "gd",
                            mode = "n",
                            options = { desc = "Lsp buf definition", silent = true },
                        },
                        {
                            action = vim.lsp.buf.implementation,
                            key = "gi",
                            mode = "n",
                            options = { desc = "Lsp buf implementation", silent = true },
                        },
                        {
                            action = vim.lsp.buf.type_definition,
                            key = "gt",
                            mode = "n",
                            options = { desc = "Lsp buf type_definition", silent = true },
                        },
                    }

                    for i, map in ipairs(__nixvim_binds) do
                        local options = vim.tbl_extend("keep", map.options or {}, { buffer = args.buf })
                        vim.keymap.set(map.mode, map.key, map.action, options)
                    end
                end
            end,
            desc = "Load keymaps for LspAttach",
            event = "LspAttach",
            group = "nixvim_binds_LspAttach",
        },
        { command = "norm zz", event = "InsertEnter" },
        { command = "wincmd L", event = "FileType", pattern = "help" },
        { command = "setlocal spell spelllang=en,fr,es", event = "FileType", pattern = { "tex", "latex", "markdown" } },
        { command = 'set filetype=tex "| VimtexTocOpen', event = { "BufEnter", "BufWinEnter" }, pattern = "*.tex" },
        {
            callback = function()
                vim.o.foldmethod = "expr"
                vim.o.foldexpr = "vimtex#fold#level(v:lnum)"
                vim.o.foldtext = "vimtex#fold#text()"
            end,
            event = "FileType",
            pattern = { "tex", "latex" },
        },
        { callback = "vimtex#compiler#compile", event = "User", pattern = "VimtexEventInitPost" },
        { command = "call vimtex#compiler#clean(0)", event = "User", pattern = "VimtexEventQuit" },
    }

    for _, autocmd in ipairs(__nixvim_autocommands) do
        vim.api.nvim_create_autocmd(autocmd.event, {
            group = autocmd.group,
            pattern = autocmd.pattern,
            buffer = autocmd.buffer,
            desc = autocmd.desc,
            callback = autocmd.callback,
            command = autocmd.command,
            once = autocmd.once,
            nested = autocmd.nested,
        })
    end
end
-- }}
