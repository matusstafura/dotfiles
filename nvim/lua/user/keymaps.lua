-- ************************************************************************************
-- GENERAL SETTINGS
-- ************************************************************************************
-- remap backslash to leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- save and quit
vim.keymap.set('n', '<Leader>q', '<Esc>:q<CR>', { desc = 'quit' })
vim.keymap.set('n', '<Leader>z', '<Esc>:wq<CR>', { desc = 'save and quit' })
vim.keymap.set('n', '<Leader>s', '<Esc>:w!<CR>', { desc = 'save' })
-- kj to <Esc>
vim.keymap.set('i', 'kj', '<Esc>')
-- ************************************************************************************
-- WINDOWS
-- ************************************************************************************
-- windows split and navigation
vim.keymap.set('n', 'sd', ':vsplit<CR>', { desc = 'split vertical' })
vim.keymap.set('n', 'sx', ':split<CR>', { desc = 'split horizontal' })
vim.keymap.set('n', 'sh', '<C-w>h', { desc = 'move left in split' })
vim.keymap.set('n', 'sj', '<C-w>j', { desc = 'move down in split' })
vim.keymap.set('n', 'sk', '<C-w>k', { desc = 'move up in split' })
vim.keymap.set('n', 'sl', '<C-w>l', { desc = 'move right in split' })
vim.keymap.set('n', 'sq', '<C-w>=', { desc = 'equalize splits' })
-- rest
vim.keymap.set('n', 'H', '^', { desc = 'move to the beginning of the line'})
vim.keymap.set('n', 'L', '$', { desc = 'move to the end of the line'})
vim.keymap.set('n', '<C-n>', '<cmd>cnext<CR>')
vim.keymap.set('n', '<C-p>', '<cmd>cprev<CR>')
vim.keymap.set('i', ';;', '<Esc>A;', { desc = 'add semicolon at the end of the line' })
-- ************************************************************************************
-- MACROS
-- ************************************************************************************
vim.keymap.set('n' , '<Leader>yy', 'gg"*yG', { desc = 'copy all the contents' })
vim.keymap.set('n', '<Leader>cl', 'ggVGc', { desc = 'clear all the contents and keeps clipboard' })
vim.keymap.set('n', '<Leader>cp', 'ggVG"_c<Esc>"+p', { desc = 'clear all the contents and pastes clipboard' })
vim.keymap.set('i', '<Leader>kk', '<Esc>la', { desc = 'jump one place right' })
vim.keymap.set('v', 'y', 'myy`y', { desc = 'remeber last position' })
vim.keymap.set('v', 'J', ":m \'>+1<CR>gv=gv", { desc = 'move lines down' })
vim.keymap.set('v', 'K', ":m \'<-2<CR>gv=gv", { desc = 'move lines up' })
vim.keymap.set('x', '<Leader>p', "\"_dP", { desc = 'delete and rewrite' })
-- ************************************************************************************
-- KEYMAPS
-- ************************************************************************************
-- [C]
-- copilot
vim.keymap.set('n', '<leader>cod', '<cmd>Copilot disable<CR> <cmd>echo "copilot disabled"<CR>', { desc = 'copilot disable' })
vim.keymap.set('n', '<leader>coe', '<cmd>Copilot enable<CR> <cmd>echo "copilot enabled"<CR>', { desc = 'copilot enable' })
-- [F] 
-- telescope
vim.keymap.set('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], { desc = 'find files' })
vim.keymap.set('n', '<leader>F', [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<CR>]], { desc = 'find all files' })
vim.keymap.set('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { desc = 'find buffers' })
vim.keymap.set('n', '<leader>fB', [[<cmd>Telescope file_browser<CR>]], { desc = 'find file browser' })
vim.keymap.set('n', '<leader>fg', [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]], { desc = 'find grep' })
vim.keymap.set('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { desc = 'find history' })
-- plenary
-- vim.keymap.set('n', '<Leader>tf', '<Plug>PlenaryTestFile')
-- [G]
-- git
vim.keymap.set('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_commits()<CR>]], { desc = 'git commits' })
vim.keymap.set('n', '<leader>ga', '<cmd>Git add %<CR>', { desc = 'git add' })
vim.keymap.set('n', '<leader>gg', '<cmd>Git<CR>', { desc = 'git status' })
vim.keymap.set('n', '<leader>gf', '<cmd>Git diff<CR>', { desc = 'git diff' })
vim.keymap.set('n', '<leader>gc', '<cmd>Git commit<CR>', { desc = 'git commit' })
vim.keymap.set('n', '<leader>gp', '<cmd>Git push<CR>', { desc = 'git push' })
vim.keymap.set('n', '<leader>gl', '<cmd>set diffopt+=vertical | Gdiffsplit HEAD~1<CR>', { desc = 'git diff last commit' })
vim.keymap.set('n', ']h', ':Gitsigns next_hunk<CR>', { desc = 'next hunk' })
vim.keymap.set('n', '[h', ':Gitsigns prev_hunk<CR>', { desc = 'prev hunk' })
vim.keymap.set('n', '<leader>hs', ':Gitsigns stage_hunk<CR>', { desc = 'stage hunk' })
vim.keymap.set('n', '<leader>hS', ':Gitsigns undo_stage_hunk<CR>', { desc = 'undo stage hunk' })
vim.keymap.set('n', '<leader>hp', ':Gitsigns preview_hunk<CR>', { desc = 'preview hunk' })
vim.keymap.set('n', '<leader>hr', ':Gitsigns reset_hunk<CR>', { desc = 'reset hunk' })
-- [N]
-- nvimtree
vim.keymap.set('n', '<leader>n', ':NvimTreeFindFileToggle<CR>')
-- [T]
-- terminal
vim.keymap.set('n', '<leader>tt', ':FloatermToggle<CR>', { desc = 'terminal toggle' })
vim.keymap.set('t', '<leader>tt', '<C-\\><C-n>:FloatermToggle<CR>', { desc = 'terminal toggle' })
vim.keymap.set('t', '<leader>tp', '<cmd>FloatermPrev<CR>', { desc = 'terminal prev' })
vim.keymap.set('n', '<leader>rm', ':FloatermNew --position=right --width=0.5 --height=0.3 --autoclose=0 go run main.go<CR>')
-- testing
vim.keymap.set('n', '<Leader>tf', ':TestFile<CR>', { desc = 'test file' })
vim.keymap.set('n', '<Leader>tl', ':TestLast<CR>', { desc = 'test last' })
vim.keymap.set('n', '<Leader>tn', ':TestNearest<CR>', { desc = 'test nearest' })
vim.keymap.set('n', '<Leader>tc', ':TestSuite --coverage-html coverage<CR>', { desc = 'test coverage' })
vim.keymap.set('n', '<Leader>ts', ':TestSuite<CR>', { desc = 'test suite' })
vim.keymap.set('n', '<Leader>tv', ':TestVisit<CR>', { desc = 'test visit' })
vim.keymap.set('n', '<Leader>tb', ':TestSuite --bail<CR>', { desc = 'test with bail' })
-- [X]
-- buffer
vim.keymap.set('n', '<leader>xx', ':Bdelete<CR>', { desc = 'buffer delete' })

vim.keymap.set('n', '<leader>fx', ':silent !./vendor/bin/pint %<CR>', { desc = 'pint' })
vim.keymap.set('t', '<leader>mm', '<C-\\><C-n><CR>', { desc = 'terminal toggle' })
