-- #############################################################################
-- BOOTSTRAP PACKER
-- #############################################################################
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim' if fn.empty(fn.glob(install_path)) > 0 then fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Initialize packer
require('packer').init({
  compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'solid' })
    end,
  },
})

-- Install plugins
local use = require('packer').use

use('wbthomason/packer.nvim') -- Let packer manage itself

-- #############################################################################
-- PLUGINS
-- #############################################################################

-- commenting 
-- examples: gcc, gc
use('tpope/vim-commentary')

-- surrounds 
-- examples cs"' cs'<p> cs'<q> ds" ds' ds<p> ds<q>
use('tpope/vim-surround')

-- unix shell commands
-- examples: :Remove :Delete :Move :Rename :Chmod :Mkdir :SudoWrite :SudoEdit
use('tpope/vim-eunuch')

-- better indenting
-- examples: >>, <<
use('tpope/vim-sleuth')

-- repeat commands
-- examples: ., ..
use('tpope/vim-repeat')

-- git support
use({
    'tpope/vim-fugitive',
    requires = 'tpope/vim-rhubarb',
})

-- toggle mappings
use('tpope/vim-unimpaired')

-- go
use({
    'ray-x/go.nvim',
    config = function()
        require('user.plugins.go')
    end,
})

-- lua gui
use('ray-x/guihua.lua')

-- completion
use({
    'hrsh7th/nvim-cmp',
    requires = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'onsails/lspkind-nvim',
    },
    config = function()
        -- require('user.plugins.cmp')
    end,
})

-- easy buffer delete
use({
    'famiu/bufdelete.nvim',
})

use({
    'sickill/vim-pasta',
    config = function()
        vim.g.pasta_disabled_filetypes = { 'fugitive' }
    end,
})

use({
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
  requires = { 
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'nvim-telescope/telescope-live-grep-args.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      'fannheyward/telescope-coc.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  },
  config = function()
      require('user.plugins.telescope')
  end,
})

use({
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
        require('user.plugins.lualine')
    end,
})

use({
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  requires = {
    'nvim-treesitter/playground',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  config = function()
    require('user.plugins.treesitter')
  end,
})

use({
    'voldikss/vim-floaterm',
    config = function() 
        require('user.plugins.floaterm')
    end,
})

use({
    'lewis6991/gitsigns.nvim',
    config = function()
        require('user.plugins.gitsigns')
    end,
})


use({
    'akinsho/nvim-bufferline.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
        require('user.plugins.bufferline')
    end,
})

use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
        require('user/plugins/nvim-tree')
    end,
})

use({ 
    "catppuccin/nvim", as = "catppuccin",
    config = function()
        vim.cmd('colorscheme catppuccin-latte')
        require('catppuccin').setup {
            color_overrides = {
                all = {
                    text = '#000000'
                },
            }
        }
    end,
})

-- Copilot
use({'github/copilot.vim'})

use({
    'neovim/nvim-lspconfig',
    requires = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim'
    },

    config = function()
        require('user.plugins.lspconfig')
    end,
})

use({
  'windwp/nvim-autopairs',
  config = function()
    require('nvim-autopairs').setup()
  end,
})

-- testing
use({
    'vim-test/vim-test' ,
    config = function()
        require('user.plugins.vim-test')
    end,
})

-- dashboard-nvim
use {
  'glepnir/dashboard-nvim',
  config = function()
      require('user.plugins.dashboard')
  end,
  requires = {'nvim-tree/nvim-web-devicons'}
}

P = function(thing)
  print(vim.inspect(thing))
  return thing
end

if packer_bootstrap then
  require('packer').sync()
end

vim.cmd([[
    let b:ale_linters = ['']
]])

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])
