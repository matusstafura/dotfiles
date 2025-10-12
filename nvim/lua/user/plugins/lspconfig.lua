local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Explicitly ensure code action capabilities
capabilities.textDocument.codeAction = {
  dynamicRegistration = false,
  codeActionLiteralSupport = {
    codeActionKind = {
      valueSet = {
        "",
        "quickfix", 
        "refactor",
        "refactor.extract",
        "refactor.inline", 
        "refactor.rewrite",
        "source",
        "source.organizeImports",
      },
    },
  },
}

require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = true })

-- LSP keymaps 
local on_attach = function(client, bufnr)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP Hover', buffer = bufnr })
  vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, { desc = 'LSP Go to Implementation', buffer = bufnr })
  vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { desc = 'LSP Go to Definition', buffer = bufnr })
  vim.keymap.set('n', '<leader>gu', vim.lsp.buf.code_action, { desc = 'LSP Code Action', buffer = bufnr })
  vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition, { desc = 'LSP Type Definition', buffer = bufnr })
  vim.keymap.set('n', '<leader>ee', vim.diagnostic.goto_next, { desc = 'LSP Next Diagnostic', buffer = bufnr })
  vim.keymap.set('n', '<leader>oe', "<cmd>Telescope diagnostics<cr>", { desc = 'LSP List Diagnostics', buffer = bufnr })
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'LSP Rename', buffer = bufnr })
  vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, { desc = 'LSP References', buffer = bufnr })
end

vim.diagnostic.config({
  float = {
    border = 'rounded',
    max_width = 50,  -- adjust width
    wrap = true,     -- enable text wrapping
    focusable = false,
  },
})

-- PHP (Intelephense)
vim.lsp.config("intelephense", {
  capabilities = capabilities,
  on_attach = on_attach,
  init_options = {
    licenceKey = vim.env.INTELEPHENSE_LICENSE
  },
  settings = {
    intelephense = {
      diagnostics = {
        undefinedVariables = false, -- disables globally
      },
      environment = {
        includePaths = { "vendor" } -- Adjust this path to your PHP libraries
      },
      files = {
        maxSize = 5000000, -- 5MB
      },
      completion = {
        fullyQualifyGlobalConstantsAndFunctions = false,
        insertUseDeclaration = true   --  👈 this is the key for auto-import
      },
    },
  },
})

vim.lsp.config('GitHub Copilot', {
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Go (gopls)
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
  end,
})

vim.lsp.config("gopls", {
  capabilities = capabilities,
  filetypes = { "go", "gomod" },
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    vim.keymap.set('n', '<leader>co', ":!go test ./... -coverprofile=coverage.out && go tool cover -html=coverage.out<CR>", { buffer = bufnr })
  end,
})

-- Diagnostics UI
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = false,
    virtual_text = false,
    underline = false,
    update_in_insert = false,
  }
)

-- nvim-cmp setup
vim.opt.completeopt = { "menu", "menuone", "noselect" }
local cmp = require "cmp"

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "vsnip" },
  }, {
    { name = "buffer" },
  })
})

-- Filetype-specific cmp sources
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "cmp_git" },
  }, {
    { name = "buffer" },
  })
})
