local utils = require'utils'

-- LazyGit
utils.map('n', '<leader>gg', ':LazyGit<CR>')

-- Git signs
require('gitsigns').setup {
    signcolumn = false,
    numhl = true
}
