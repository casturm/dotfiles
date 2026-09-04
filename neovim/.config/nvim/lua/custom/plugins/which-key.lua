-- which-key: shows a popup of what you can press next.
--
-- Press <space> (leader) and pause ~300ms to see every leader binding.
-- Works for `g`, `]`, `[`, `z` and `"` too.
--
-- The `spec` below only names the groups, so the popup reads
-- "Search / Git / Code" instead of bare letters.

return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    spec = {
      { '<leader>c', group = '[C]ode' },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>g', group = '[G]it' },
      { '<leader>h', group = 'Git [H]unk' },
      { '<leader>p', group = '[P]roject' },
      { '<leader>r', group = '[R]ename / [R]efactor' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>w', group = '[W]orkspace' },
    },
  },
}
