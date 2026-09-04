-- Language servers.
--
-- Add a server by adding an entry to `servers` below; mason installs it
-- automatically on next startup. Each entry is a full lspconfig server config
-- (`cmd`, `settings`, `filetypes`, `root_markers`, ...).
--
--   gd / gr / gI       definition / references / implementation
--   K                  hover docs
--   <leader>rn         rename
--   <leader>ca         code action
--   <leader>ds / ws    document / workspace symbols
--   :Format            format the buffer

-- Telescope pickers, wrapped so telescope only loads when the key is pressed.
local function builtin(name)
  return function()
    require('telescope.builtin')[name]()
  end
end

-- Runs whenever a language server attaches to a buffer.
local function on_attach(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', builtin 'lsp_definitions', '[G]oto [D]efinition')
  nmap('gr', builtin 'lsp_references', '[G]oto [R]eferences')
  nmap('gI', builtin 'lsp_implementations', '[G]oto [I]mplementation')
  nmap('<leader>D', builtin 'lsp_type_definitions', 'Type [D]efinition')
  nmap('<leader>ds', builtin 'lsp_document_symbols', '[D]ocument [S]ymbols')
  nmap('<leader>ws', builtin 'lsp_dynamic_workspace_symbols', '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Anything listed here is installed automatically via mason.
local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- ts_ls = {},
  html = { filetypes = { 'html', 'twig', 'hbs' } },
  lua_ls = {
    settings = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
        -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        -- diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },
  solargraph = {
    cmd = { os.getenv 'HOME' .. '/.rbenv/shims/solargraph', 'stdio' },
    settings = {
      solargraph = {
        completion = true,
        diagnostic = true,
        references = true,
        rename = true,
        symbols = true,
      },
    },
  },
}

return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Needed for `default_capabilities` below
      'hrsh7th/cmp-nvim-lsp',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspAttach', { clear = true }),
        callback = function(event)
          on_attach(nil, event.buf)
        end,
      })

      -- nvim-cmp supports additional completion capabilities, so broadcast
      -- that to servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      -- Defaults merged into every server config.
      vim.lsp.config('*', { capabilities = capabilities })

      -- Per-server overrides.
      for server_name, config in pairs(servers) do
        vim.lsp.config(server_name, config)
      end

      -- mason must be set up before mason-lspconfig.
      require('mason').setup()

      -- mason-lspconfig v2 has no `setup_handlers`; with `automatic_enable`
      -- (the default) it calls `vim.lsp.enable()` for every installed server,
      -- picking up the `vim.lsp.config` entries above.
      require('mason-lspconfig').setup {
        ensure_installed = vim.tbl_keys(servers),
      }
    end,
  },

  {
    -- Lua LSP support for the neovim config itself (replaces the archived
    -- neodev.nvim). Teaches lua_ls about the vim API and your plugins.
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
}
