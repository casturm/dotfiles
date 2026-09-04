-- mini.surround: add / change / delete surrounding quotes, brackets, tags.
--
--   ysiw"   surround inner word with double quotes
--   cs"'    change surrounding " to '
--   ds"     delete surrounding "
--   yss)    surround the whole line with parens
--   (visual) S"   surround the selection
--
-- NOTE: mini.surround's own defaults are `sa`/`sd`/`sr`, which would collide
-- with flash.nvim's `s`. The mappings below are the vim-surround style ones
-- instead, which start with y/c/d and so stay out of flash's way.

return {
  'echasnovski/mini.surround',
  version = '*',
  event = 'VeryLazy',
  opts = {
    mappings = {
      add = 'ys',
      delete = 'ds',
      replace = 'cs',

      -- vim-surround has no equivalent for these; disable rather than
      -- leave them on keys we didn't choose.
      find = '',
      find_left = '',
      highlight = '',
      update_n_lines = '',
      suffix_last = '',
      suffix_next = '',
    },
    -- Makes `cs`/`ds` reach forward to the next surrounding on the line,
    -- which is what vim-surround does.
    search_method = 'cover_or_next',
  },
  config = function(_, opts)
    require('mini.surround').setup(opts)

    -- `yss` = surround the whole line. Needs remap so it expands via `ys`.
    vim.keymap.set('n', 'yss', 'ys_', { remap = true, desc = 'Surround line' })

    -- mini.surround claims visual `s`; use `S` so visual `s` keeps its
    -- built-in meaning and doesn't shadow flash.
    vim.keymap.set('x', 'S', ':<C-u>lua MiniSurround.add("visual")<CR>', { silent = true, desc = 'Surround selection' })
  end,
}
