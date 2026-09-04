-- Small, config-free editing plugins. One file rather than three, because
-- none of them needs more than a line.

return {
  -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth' },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', event = 'VeryLazy', opts = {} },

  -- Indentation guides, even on blank lines. See `:help ibl`
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    main = 'ibl',
    opts = {},
  },
}
