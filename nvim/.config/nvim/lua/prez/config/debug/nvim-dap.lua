local utils = require('prez.utils')

utils.map('n', '<leader>db', ':lua require"dap".toggle_breakpoint()<CR>')
utils.map('n', '<leader>d<CR>', ':lua require"dap".continue()<CR>')
utils.map('n', '<leader>dh', ':lua require"dap".step_out()<CR>')
utils.map('n', '<leader>dj', ':lua require"dap".step_over()<CR>')
utils.map('n', '<leader>dk', ':lua require"dap".step_back()<CR>')
utils.map('n', '<leader>dl', ':lua require"dap".step_into()<CR>')
