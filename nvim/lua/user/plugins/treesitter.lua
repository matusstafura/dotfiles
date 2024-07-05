require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    disable = { 'NvimTree' },
    additional_vim_regex_highlighting = true,
  }
})
require('ts_context_commentstring').setup({
  enable = true,
  config = {
    css = '// %s',
    scss = '// %s',
    html = '<!-- %s -->',
    javascript = '// %s',
    typescript = '// %s',
    typescriptreact = '// %s',
    ['typescript.tsx'] = '// %s',
    ['typescript.jsx'] = '// %s',
    json = '// %s',
    lua = '-- %s',
    python = '# %s',
    rust = '// %s',
    vue = '<!-- %s -->',
    yaml = '# %s',
  },
})
