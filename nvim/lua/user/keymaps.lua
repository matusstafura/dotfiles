-- remap backslash to leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- remap kj to <Esc>
vim.keymap.set('i', 'kj', '<Esc>')

-- save and quit
vim.keymap.set('n', '<Leader>q', '<Esc>:q<CR>')
vim.keymap.set('n', '<Leader>z', '<Esc>:wq<CR>')
vim.keymap.set('n', '<Leader>s', '<Esc>:w!<CR>')

-- windows split and navigation
vim.keymap.set('n', 'sd', ':vsplit<CR>')
vim.keymap.set('n', 'sx', ':split<CR>')
vim.keymap.set('n', 'sh', '<C-w>h')
vim.keymap.set('n', 'sj', '<C-w>j')
vim.keymap.set('n', 'sk', '<C-w>k')
vim.keymap.set('n', 'sl', '<C-w>l')

vim.keymap.set('n', '<Leader>cl', 'ggVGs')
