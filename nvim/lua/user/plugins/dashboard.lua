local db = require('dashboard')

db.setup({
theme = 'hyper',
config = {
  header = {
    'asdf'
  },
  packages = {
    enabled = false,
  },
  week_header = {
   enable = true,
  },
  shortcut = {
    {
      icon = ' ',
      icon_hl = '@variable',
      desc = 'Files',
      group = 'Label',
      action = 'Telescope find_files',
      key = 'f',
    },
    {
      icon = ' ',
      desc = 'dotfiles',
      group = 'Label',
      action = 'Telescope find_files cwd=$HOME/Sites/dotfiles',
      key = 'd',
    },
  },
},
})
