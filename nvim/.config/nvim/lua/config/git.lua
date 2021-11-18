local utils = require'utils'

-- LazyGit
utils.map('n', '<leader>gg', ':LazyGit<CR>')
utils.map('n', '<leader>gb', ':Git blame<CR>')

-- Git signs
require('gitsigns').setup {
    signcolumn = false,
    numhl = true
}
