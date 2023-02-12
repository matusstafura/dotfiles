require('mason').setup()
require('mason-lspconfig').setup({automatic_installation = true})

vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { buffer = bufnr })
vim.keymap.set('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', { buffer = bufnr })
vim.keymap.set('n', '<leader>ld', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { buffer = bufnr })
vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>', { buffer = bufnr })

-- PHP
require('lspconfig').intelephense.setup({})

-- JavaScript
require('lspconfig').volar.setup({
  filetypes = { 'vue', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
})

-- TailwindCSS
require('lspconfig').tailwindcss.setup({})

-- Go
require('lspconfig').gopls.setup({
  filetypes = { 'go', 'gomod' },
})
