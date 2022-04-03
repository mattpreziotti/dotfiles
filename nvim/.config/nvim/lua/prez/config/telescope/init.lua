local telescope = require'telescope'
local utils = require'prez.utils'

telescope.setup {}
telescope.load_extension('fzf')

-- mappings
utils.map('n', '<leader>ff', ':Telescope find_files<cr>')
utils.map('n', '<leader>fg', ':Telescope live_grep<cr>')
