require('user/plugins')
require('user/options')
require('user/keymaps')

pcall(dofile, vim.fn.stdpath("config") .. "/env.lua")
