vim.cmd([[
  augroup FormatOnSave
    autocmd!
    autocmd BufWritePre * silent! Neoformat
  augroup END
]])
