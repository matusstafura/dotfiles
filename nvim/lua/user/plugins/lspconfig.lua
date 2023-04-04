local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup()
require('mason-lspconfig').setup({automatic_installation = true})

-- PHP
require('lspconfig').intelephense.setup({
  on_attach = function()
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, { buffer = 0 })
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { buffer = 0 })
    vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set('n', '<leader>ee', vim.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set('n', '<leader>oe', "<cmd>Telescope diagnostics<cr>", { buffer = 0 })
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = 0 })
    vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, { buffer = 0 })
  end,
})

-- JavaScript
require('lspconfig').volar.setup({
  capabilities = capabilities,
  filetypes = { 'vue', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
})

-- TailwindCSS
require('lspconfig').tailwindcss.setup({
  capabilities = capabilities,
})

-- Go
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   pattern = '*.go',
--   callback = function()
--     vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
--   end
-- })
vim.diagnostic.config({
    virtual_text = false,
    open_float = true,
    signs = true,
    float = { border = "single" },
})

require('lspconfig').gopls.setup({
  capabilities = capabilities,
  on_attach = function()
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, { buffer = 0 })
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { buffer = 0 })
    vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set('n', '<leader>ee', vim.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set('n', '<leader>oe', "<cmd>Telescope diagnostics<cr>", { buffer = 0 })
    vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, { buffer = 0 })
  end,
  filetypes = { 'go', 'gomod' },
})
--
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
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
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

