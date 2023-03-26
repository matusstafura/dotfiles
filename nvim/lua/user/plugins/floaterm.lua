vim.g.floaterm_height = 0.3
vim.g.floaterm_wintype = 'split'
vim.keymap.set('n', '<leader>tt', ':FloatermToggle<CR>')
vim.keymap.set('t', '<leader>tt', '<C-\\><C-n>:FloatermToggle<CR>')
vim.keymap.set('n', '<leader>tc', ':FloatermNew<CR>')
vim.keymap.set('n', '<leader>tn', ':FloatermNext<CR>')
vim.keymap.set('n', '<leader>tp', ':FloatermPrev<CR>')
vim.keymap.set('n', '<leader>rm', ':FloatermNew --position=right --width=0.5 --height=0.3 --autoclose=0 go run main.go<CR>')
