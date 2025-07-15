-- Set up keybinds {{{
do
    local __nixvim_binds = { { action = ":VimtexView<cr>", key = "m", mode = "n" } }
    for i, map in ipairs(__nixvim_binds) do
        vim.keymap.set(map.mode, map.key, map.action, map.options)
    end
end
-- }}}
