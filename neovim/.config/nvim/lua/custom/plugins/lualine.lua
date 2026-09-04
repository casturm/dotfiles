-- Statusline. See `:help lualine.txt`

return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  opts = {
    options = {
      icons_enabled = false,
      -- NOTE: catppuccin dropped the plain `catppuccin` lualine theme; the name
      -- below follows whichever flavour is active. Plain `catppuccin` silently
      -- fell back to `auto`.
      theme = 'catppuccin-nvim',
      component_separators = '|',
      section_separators = '',
    },
  },
}
