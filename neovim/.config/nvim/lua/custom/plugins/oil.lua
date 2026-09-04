-- oil.nvim: edit the filesystem like a normal buffer.
--
--   -            open the parent directory of the current file
--   <leader>pv   open the parent directory (was `:Ex`)
--
-- Inside an oil buffer you edit with ordinary vim commands: `dd` to delete a
-- file, `cw` to rename one, `o` then a name to create one. Nothing happens on
-- disk until you `:w`.

return {
  'stevearc/oil.nvim',
  -- Load eagerly so oil takes over netrw before a directory argument is
  -- opened (e.g. `nvim .`).
  lazy = false,
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
  },
  keys = {
    { '-', '<CMD>Oil<CR>', desc = 'Open parent directory (oil)' },
    { '<leader>pv', '<CMD>Oil<CR>', desc = '[P]roject [V]iew (oil)' },
  },
}
