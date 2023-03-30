require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'nightfox',
  },
  sections = {
    lualine_a = {
      {
       'filename',
       path = 1,
     }
    }
    --lualine_x = {},
    --lualine_y = {},
    --lualine_z = {},
  }
}
