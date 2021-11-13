require('nvim-tree').setup()
local utils = require('utils')

utils.map('n', '<leader>n', ':NvimTreeToggle<cr>')
