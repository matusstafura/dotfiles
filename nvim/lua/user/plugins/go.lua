require('go').setup()
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

vim.cmd([[
  let g:go_fmt_command = "goimports"
  let g:go_auto_type_info = 1
  let g:go_auto_sameids = 1
  let g:go_auto_type_duration = 200
  let g:go_list_type_duration = 100
  let g:go_doc_popup_window = 1
  let g:go_auto_make = 0
  let g:go_def_mapping_enabled = 0
  let g:go_jump_to_error = 0
]])


