local telescope = require('telescope')
local actions = require('telescope.actions')
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local conf = require("telescope.config").values

vim.cmd([[
  highlight link TelescopePromptTitle PMenuSel
  highlight link TelescopePreviewTitle PMenuSel
  highlight link TelescopePromptNormal NormalFloat
  highlight link TelescopePromptBorder FloatBorder
  highlight link TelescopeNormal CursorLine
  highlight link TelescopeBorder CursorLineBg
]])

telescope.setup({
  defaults = {
    path_display = { truncate = 1 },
    prompt_prefix = '   ',
    selection_caret = '  ',
    layout_config = {
      prompt_position = 'top',
    },
    sorting_strategy = 'ascending',
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<C-Down>'] = actions.cycle_history_next,
        ['<C-Up>'] = actions.cycle_history_prev,
        ["<C-d>"] = actions.delete_buffer,
      },
      n = {
        ["<C-d>"] = actions.delete_buffer,
      }
    },
    file_ignore_patterns = { '.git/' },
  },
  pickers = {
    find_files = {
      hidden = true,
      width = 0.2,
      file_ignore_patterns = { '%.jpg', '%.jpeg', '%.png', 'node_modules/', '.git/' },
    },
    buffers = {
      previewer = false,
      layout_config = {
        width = 80,
      },
    },
    oldfiles = {
      prompt_title = 'History',
    },
    lsp_references = {
      previewer = false,
    },
  },
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('live_grep_args')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('coc')

-- cht.sh integration
local function chtsh()
  local input = vim.fn.input('Query (lang keywords): ')
  if input == '' then return end
  
  local parts = vim.split(input, ' ', { trimempty = true })
  if #parts < 2 then
    print('\nUsage: <language> <keywords...>')
    return
  end
  
  local lang = parts[1]
  table.remove(parts, 1)
  local query = table.concat(parts, '+')
  local url = 'cht.sh/' .. lang .. '/' .. query .. '?style=paraiso-dark'
  
  -- Open in floaterm
  vim.cmd('FloatermNew --autoclose=0 curl -s "' .. url .. '"')
end

vim.keymap.set('n', '<leader>fc', chtsh, { desc = 'Cheat Sheet (cht.sh)' })
