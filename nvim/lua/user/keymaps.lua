-- ************************************************************************************
-- GENERAL SETTINGS
-- ************************************************************************************
-- remap backslash to leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- save and quit
vim.keymap.set('n', '<Leader>q', '<Esc>:q<CR>')
vim.keymap.set('n', '<Leader>z', '<Esc>:wq<CR>')
vim.keymap.set('n', '<Leader>s', '<Esc>:w!<CR>')
-- kj to <Esc>
vim.keymap.set('i', 'kj', '<Esc>')
-- ************************************************************************************
-- WINDOWS
-- ************************************************************************************
-- windows split and navigation
vim.keymap.set('n', 'sd', ':vsplit<CR>')
vim.keymap.set('n', 'sx', ':split<CR>')
vim.keymap.set('n', 'sh', '<C-w>h')
vim.keymap.set('n', 'sj', '<C-w>j')
vim.keymap.set('n', 'sk', '<C-w>k')
vim.keymap.set('n', 'sl', '<C-w>l')
-- next prev
vim.keymap.set('n', '<C-n>', '<cmd>cnext<CR>')
vim.keymap.set('n', '<C-p>', '<cmd>cprev<CR>')
-- ************************************************************************************
-- MACROS
-- ************************************************************************************
-- copy the contents 
vim.keymap.set('n' , '<Leader>yy', 'gg"*yG')
-- clear the contents
vim.keymap.set('n', '<Leader>cl', 'ggVGs')
-- jump one place right
vim.keymap.set('i', '  ', '<Esc>la')
-- remeber last position
vim.keymap.set('v', 'y', 'myy`y')
-- ************************************************************************************
-- KEYMAPS
-- ************************************************************************************
-- telescope
vim.keymap.set('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
vim.keymap.set('n', '<leader>F', [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<CR>]]) -- luacheck: no max line length
vim.keymap.set('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
vim.keymap.set('n', '<leader>fB', [[<cmd>Telescope file_browser<CR>]])
vim.keymap.set('n', '<leader>fg', [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]])
vim.keymap.set('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])
vim.keymap.set('n', '<leader>gg', [[<cmd>lua require('telescope.builtin').git_commits()<CR>]])
-- copilot
vim.keymap.set('n', '<leader>cod', '<cmd>Copilot disable<CR> <cmd>echo "copilot disabled"<CR>')
vim.keymap.set('n', '<leader>coe', '<cmd>Copilot enable<CR> <cmd>echo "copilot enabled"<CR>')
-- plenary
vim.keymap.set('n', '<Leader>tf', '<Plug>PlenaryTestFile')
