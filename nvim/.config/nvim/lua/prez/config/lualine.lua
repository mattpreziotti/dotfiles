require('lualine').setup {
    options = {
      theme = 'tokyonight'
    },
    extensions = {'nvim-tree'},
    sections = {
      lualine_c = {
        {
          'filename',
          path = 1
        }
      }
    }
}
