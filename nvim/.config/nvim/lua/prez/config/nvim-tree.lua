require('nvim-tree').setup()
local utils = require('prez.utils')

utils.map('n', '<leader>n', ':NvimTreeToggle<cr>')
