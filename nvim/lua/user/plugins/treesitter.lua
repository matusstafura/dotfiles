require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    disable = { 'NvimTree' },
    additional_vim_regex_highlighting = true,
  },
  context_commentstring = {
    enable = true,
  },
})
