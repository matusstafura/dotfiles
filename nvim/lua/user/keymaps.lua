vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', '<Leader>q', '<Esc>:q!<CR>')
vim.keymap.set('n', '<Leader>z', '<Esc>:wq<CR>')
vim.keymap.set('n', '<Leader>s', '<Esc>:w!<CR>')

vim.keymap.set('n', '<Leader>ff', '<Esc>:Telescope find_files<CR>')
vim.keymap.set('n', '<Leader>fg', '<Esc>:Telescope live_grep<CR>')

