-- remap backslash to leader key
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- remap jj to <Esc>
vim.keymap.set('i', 'jj', '<Esc>')

-- save and quit
vim.keymap.set('n', '<Leader>q', '<Esc>:q!<CR>')
vim.keymap.set('n', '<Leader>z', '<Esc>:wq<CR>')
vim.keymap.set('n', '<Leader>s', '<Esc>:w!<CR>')
vim.keymap.set('i', '<Leader>s', '<Esc>:w!<CR>')


