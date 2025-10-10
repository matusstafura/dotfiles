-- ************************************************************************************
-- GENERAL SETTINGS
-- ************************************************************************************
-- remap backslash to leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- kj to <Esc>
vim.keymap.set('i', 'kj', '<Esc>')
-- save and quit
vim.keymap.set('n', '<Leader>q', '<Esc>:q<CR>', { desc = 'quit' })
vim.keymap.set('n', '<Leader>a', '<Esc>:qa<CR>', { desc = 'quit all' })
vim.keymap.set('n', '<Leader>z', '<Esc>:wq<CR>', { desc = 'save and quit' })
vim.keymap.set('n', '<Leader>s', '<Esc>:w!<CR>', { desc = 'save' })
-- yanking without copying to clipboard
vim.keymap.set("n", "x", '"_x', { desc = 'delete without yank' })
vim.keymap.set("n", "<Leader>p", '"0p', { desc = 'paste from clipboard' })
vim.keymap.set("n", "<Leader>d", '"_d', { desc = 'delete without yank' })
vim.keymap.set('n' , '<Leader>yy', 'gg"*yG', { desc = 'copy all the contents' })
vim.keymap.set('n', '<Leader>cl', 'ggVGc', { desc = 'clear all the contents and keeps clipboard' })
vim.keymap.set('n', '<Leader>cp', 'ggVG"_c<Esc>"+p', { desc = 'clear all the contents and pastes clipboard' })
vim.keymap.set('i', '<Leader>kk', '<Esc>la', { desc = 'jump one place right' })
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
vim.keymap.set('v', 'y', 'myy`y', { desc = 'yank and keep cursor position' })
vim.keymap.set('v', 'J', ":m \'>+1<CR>gv=gv", { desc = 'move lines down' })
vim.keymap.set('v', 'K', ":m \'<-2<CR>gv=gv", { desc = 'move lines up' })
-- ************************************************************************************
-- PLUGIN KEYMAPS
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
vim.keymap.set('n', '<leader>fB', [[<cmd>lua require('telescope').extensions.file_browser.file_browser({ sort_by = 'modified'})<CR>]], { desc = 'file browser' })
vim.keymap.set('n', '<leader>fg', [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]], { desc = 'find grep' })
vim.keymap.set('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { desc = 'find history' })
vim.keymap.set('n', '<leader>fk', [[<cmd>lua require('telescope.builtin').keymaps()<CR>]], { desc = 'find keymaps' })
vim.keymap.set('n', '<leader>fs', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { desc = 'find string under cursor' })
-- [G]
-- git
vim.keymap.set('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_commits()<CR>]], { desc = 'git commits' })
vim.keymap.set('n', '<leader>ga', '<cmd>Git add %<CR>', { desc = 'git add' })
vim.keymap.set('n', '<leader>gd', '<cmd>Gvdiffsplit HEAD~1<CR>', { desc = 'git diff Head~1' })
vim.keymap.set('n', '<leader>gg', '<cmd>Git<CR>', { desc = 'git status' })
vim.keymap.set('n', '<leader>gf', '<cmd>Git diff<CR>', { desc = 'git diff' })
vim.keymap.set('n', '<leader>gc', '<cmd>Git commit<CR>', { desc = 'git commit' })
vim.keymap.set('n', '<leader>gp', '<cmd>Git push<CR>', { desc = 'git push' })
vim.keymap.set('n', '<leader>gl', '<cmd>set diffopt+=vertical | Gdiffsplit HEAD~1<CR>', { desc = 'git diff last commit' })
vim.keymap.set('n', '<leader>hj', ':Gitsigns next_hunk<CR>', { desc = 'next hunk' })
vim.keymap.set('n', '<leader>hk', ':Gitsigns prev_hunk<CR>', { desc = 'prev hunk' })
vim.keymap.set('n', '<leader>hs', ':Gitsigns stage_hunk<CR>', { desc = 'stage hunk' })
vim.keymap.set('n', '<leader>hu', ':Gitsigns undo_stage_hunk<CR>', { desc = 'undo stage hunk' })
vim.keymap.set('n', '<leader>hp', ':Gitsigns preview_hunk<CR>', { desc = 'preview hunk' })
vim.keymap.set('n', '<leader>hr', ':Gitsigns reset_hunk<CR>', { desc = 'reset hunk' })
-- [M]
vim.keymap.set('n', '<Leader>ms', '<Esc>:mksession! ~/nvim-session.vim<CR>', { desc = 'save session' })
vim.keymap.set('n', '<Leader>ml', '<Esc>:source ~/nvim-session.vim<CR>', { desc = 'load session' })
-- [T]
-- terminal
vim.keymap.set('n', '<leader>tt', ':FloatermToggle<CR>', { desc = 'terminal toggle' })
vim.keymap.set('t', '<leader>tt', '<C-\\><C-n>:FloatermToggle<CR>', { desc = 'terminal toggle' })
-- testing
vim.keymap.set('n', '<Leader>tb', ':TestSuite --bail<CR>', { desc = 'test with bail' })
vim.keymap.set('n', '<Leader>tc', ':TestSuite --coverage-html coverage<CR>', { desc = 'test coverage' })
vim.keymap.set('n', '<Leader>tf', ':TestFile<CR>', { desc = 'test file' })
vim.keymap.set('n', '<Leader>tl', ':TestLast<CR>', { desc = 'test last' })
vim.keymap.set('n', '<Leader>tn', ':TestNearest<CR>', { desc = 'test nearest' })
vim.keymap.set('n', '<Leader>ts', ':TestSuite<CR>', { desc = 'test suite' })
vim.keymap.set('n', '<Leader>tv', ':TestVisit<CR>', { desc = 'test visit' })
-- [X]
-- buffer
vim.keymap.set('n', '<leader>xx', ':Bdelete<CR>', { desc = 'buffer delete' })
vim.keymap.set("n", "<leader>xb", function()
  local current = vim.fn.bufnr('%')
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current
      and vim.api.nvim_buf_is_loaded(buf)
      and vim.fn.buflisted(buf) == 1
      and not vim.api.nvim_buf_get_option(buf, 'modified') then
        vim.api.nvim_buf_delete(buf, {})
    end
  end
end, { desc = "Close all saved buffers except current one" })

-- RETHINK
-- only for go projects, different keymap
-- vim.keymap.set('n', '<leader>rm', ':FloatermNew --position=right --width=0.5 --height=0.3 --autoclose=0 go run main.go<CR>')

-- only if python file
-- vim.keymap.set('n', '<leader>py', ':FloatermNew --autoclose=0 python3 %<CR>', { noremap = true, silent = true })

-- only in linux
-- vim.keymap.set('t', '<leader>mn', '[[<cmd>lua require('telescope.builtin').man_pages()<CR>]]', { desc = 'man pages' })
