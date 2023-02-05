-- remap backslash to leader key
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- remap kj to <Esc>
vim.keymap.set('i', 'kj', '<Esc>')

-- save and quit
vim.keymap.set('n', '<Leader>q', '<Esc>:q!<CR>')
vim.keymap.set('n', '<Leader>z', '<Esc>:wq<CR>')
vim.keymap.set('n', '<Leader>s', '<Esc>:w!<CR>')
vim.keymap.set('i', '<Leader>s', '<Esc>:w!<CR>')


