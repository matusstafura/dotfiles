local separator = { '"▏"', color = 'StatusLineNonText' }

require('lualine').setup{
  options = { 
    path = 1,
    globalstatus = true,
  },
  sections = {
    lualine_c = {
      {}
    },
    lualine_y = {
      {}
    },
    lualine_z = {
      {}
    },
    lualine_x = {
      {
        'filename',
        path = 3, -- 0 = just filename, 1 = relative path, 2 = absolute path, 3 = absolute path with tilde
        shorting_target = 0,
        -- Prevent lualine from shortening this component
        fmt = function(str)
          return str
        end,
      }
    }
  }
}
