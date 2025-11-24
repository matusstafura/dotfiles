require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "php",
    "go",
    "python",
  },
  textobjects = {
    select = {
    enable = true,
    lookahead = true,
    keymaps = {
      -- Functions
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",

      -- Classes
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",

      -- Conditionals
      ["aC"] = "@conditional.outer",
      ["iC"] = "@conditional.inner",

      -- Loops
      ["al"] = "@loop.outer",
      ["il"] = "@loop.inner",

      -- Blocks
      ["ab"] = "@block.outer",
      ["ib"] = "@block.inner",

      -- Parameters
      ["aa"] = "@parameter.outer",
      ["ia"] = "@parameter.inner",
    },
  },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
      },
    },
  },
  highlight = {
    enable = true,
    disable = { 'NvimTree' },
    additional_vim_regex_highlighting = true,
  }
}

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
