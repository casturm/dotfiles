-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Options ]]
-- See `:help vim.o`

vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.wrap = false

-- Keep this many lines of context above/below the cursor.
vim.o.scrolloff = 8

-- No swap or backup files; keep undo history on disk instead.
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true

-- Highlight search matches; <Esc> clears the highlight (mapped below).
vim.o.hlsearch = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Keep signcolumn on by default so the gutter doesn't jump around
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- ctags file used by RTags below
vim.o.tags = '.tags'

-- [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`

-- Leader is <Space>; stop it doing anything on its own.
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Clear search highlight
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })

-- NOTE: <leader>pv opens oil.nvim -- see lua/custom/plugins/oil.lua
vim.keymap.set('n', '<leader>v', ':vsplit ', { noremap = true, desc = 'Vertical split (type a path)' })

-- Move the selected lines up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Join lines without moving the cursor
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join line (keep cursor)' })

-- Keep the cursor centred when jumping around
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
-- NOTE: nvim 0.11 maps ]d / [d by default; these keep the float open on jump.
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Regenerate ruby ctags
-- NOTE: was `rT`, which shadowed the built-in `r` operator (`rT` = replace char with T).
local function regenerate_tags()
  vim.cmd [[!ctags -f .tags --languages=ruby --exclude=.git -R .]]
end
vim.keymap.set('n', '<leader>rt', regenerate_tags, { desc = '[R]egenerate [T]ags (ctags, ruby)' })

-- [[ Highlight on yank ]]
-- See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
  pattern = '*',
  callback = function()
    vim.hl.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- [[ Plugins ]]
--
-- Every file in `lua/custom/plugins/*.lua` returns a lazy.nvim plugin spec
-- (or a list of them) and is picked up automatically by the import below.
-- To add a plugin, drop in a new file -- nothing here needs to change.
-- To disable one, delete the file or set `enabled = false` in its spec.
--
-- See: https://github.com/folke/lazy.nvim#-structuring-your-plugins
require('lazy').setup({
  { import = 'custom.plugins' },
}, {})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
