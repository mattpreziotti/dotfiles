require('lualine').setup {
    options = {theme = 'tokyonight'},
    extensions = {'nvim-tree'},
    tabline = {
        lualine_a = {'buffers'},
    }
}
