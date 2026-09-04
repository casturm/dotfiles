-- flash.nvim: jump anywhere on screen.
--
--   s + 2 chars   labels every match; press the label to jump
--   S             jump to a treesitter node (function, block, ...)
--
-- NOTE: `s` is only mapped in normal and visual mode, NOT operator-pending.
-- That keeps `ds"` / `cs"` (mini.surround) working, at the cost of not being
-- able to do `d` + flash-jump.

return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {},
  keys = {
    {
      's',
      mode = { 'n', 'x' },
      function()
        require('flash').jump()
      end,
      desc = 'Flash jump',
    },
    {
      'S',
      mode = { 'n' },
      function()
        require('flash').treesitter()
      end,
      desc = 'Flash treesitter',
    },
  },
}
