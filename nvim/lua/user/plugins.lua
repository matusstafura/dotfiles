local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
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

use('tpope/vim-commentary')

use('tpope/vim-surround')

use('preservim/nerdtree')

use({
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
  requires = { 
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'nvim-telescope/telescope-live-grep-args.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  },
  config = function()
      require('user.plugins.telescope')
  end,
})

use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
        require('user/plugins/nvim-tree')
    end,
})

use { "catppuccin/nvim", as = "catppuccin" }
vim.cmd('colorscheme catppuccin-mocha')

if packer_bootstrap then
  require('packer').sync()
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])
