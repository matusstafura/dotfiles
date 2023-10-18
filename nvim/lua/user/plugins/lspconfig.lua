local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup()
require('mason-lspconfig').setup({automatic_installation = true})

-- LSP keymaps 
local on_attach = function(client, bufnr)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
  vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, { buffer = 0 })
  vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { buffer = 0 })
  vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition, { buffer = 0 })
  vim.keymap.set('n', '<leader>ee', vim.diagnostic.goto_next, { buffer = 0 })
  vim.keymap.set('n', '<leader>oe', "<cmd>Telescope diagnostics<cr>", { buffer = 0 })
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = 0 })
  vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, { buffer = 0 })
end

-- PHP
require('lspconfig').intelephense.setup({
  capabilities = capabilities,
  filetypes = { 'php' },
  on_attach = on_attach,
  handlers = {
    ['textDocument/publishDiagnostics'] = function() end
  }
})

-- JavaScript
require('lspconfig').volar.setup({
  capabilities = capabilities,
  filetypes = { 'vue', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  on_attach = on_attach,
})

-- Rust
require('lspconfig').rust_analyzer.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = {
    "rustup",
    "run",
    "rust-analyzer",
    "stable",
  },
  filetypes = { 'rust' },
})

-- Go
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
  end
})

require('lspconfig').gopls.setup({
  capabilities = capabilities,
  filetypes = { 'go', 'gomod' },
  on_attach = on_attach,
  vim.keymap.set('n', '<leader>co', ":!go test -coverprofile=coverage.out && go tool cover -html=coverage.out<CR>")
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
  signs = false,
  virtual_text = false,
  underline = false,
  update_in_insert = false,
})

-- Set up nvim-cmp.
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), 
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

