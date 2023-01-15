local utils = require'prez.utils'

utils.map('n', '<leader>gp', ':Gitsigns preview_hunk<CR>')
utils.map('n', '<leader>gj', ':Gitsigns next_hunk<CR>')
utils.map('n', '<leader>gk', ':Gitsigns prev_hunk<CR>')
utils.map('n', '<leader>gr', ':Gitsigns reset_hunk<CR>')
utils.map('n', '<leader>gb', ':Gitsigns blame_line<CR>')

require('gitsigns').setup {
    signcolumn = false,
    numhl = true
}
