-- Set up local options {{{
do
    local nixvim_local_options = { conceallevel = 1 }

    for k, v in pairs(nixvim_local_options) do
        vim.opt_local[k] = v
    end
end
-- }}}

-- Set up keybinds {{{
do
    local __nixvim_binds = { { action = ":Neorg toc<CR>", key = "<C-g>", mode = "n", options = { silent = true } } }
    for i, map in ipairs(__nixvim_binds) do
        vim.keymap.set(map.mode, map.key, map.action, map.options)
    end
end
-- }}}
