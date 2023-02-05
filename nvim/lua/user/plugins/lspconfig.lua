require('mason').setup()
require('mason-lspconfig').setup({automatic_installation = true})

require('lspconfig').intelephense.setup({})

require('lspconfig').volar.setup({
  filetypes = { 'vue', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
})

require('lspconfig').tailwindcss.setup({})

require('lspconfig').gopls.setup({
  filetypes = { 'go', 'gomod' },
})
