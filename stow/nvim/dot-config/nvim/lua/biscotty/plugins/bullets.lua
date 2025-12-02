-- lua/plugins/bullets.lua (example for a plugin configuration)

return {
  -- Example for configuring a bullet point plugin like "bullet.vim"
  {
    "bullets-vim/bullets.vim",
    config = function()
      -- Example configuration options for bullets.vim
      vim.g.bullets_enabled = 1
      vim.g.bullets_trigger = "<CR>" -- Trigger bullet creation on Enter
      vim.g.bullets_indent_after_colon = 1 -- Indent after a colon
    end,
  },

  -- Or, if implementing custom autocommands for bullet points
}
