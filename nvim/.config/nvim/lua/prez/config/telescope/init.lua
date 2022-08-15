local telescope = require'telescope'
local utils = require'prez.utils'
local builtin = require'telescope.builtin'

telescope.setup {}
telescope.load_extension('fzf')
telescope.load_extension('dap')

-- search mappings
vim.keymap.set('n', '<leader>ff', function() builtin.find_files({results_title=vim.fn.getcwd()}) end)
vim.keymap.set('n', '<leader>fg', function() builtin.live_grep({results_title=vim.fn.getcwd()}) end)
vim.keymap.set('n', '<leader>fd', function() builtin.find_files({
    results_title='dotfiles',
    hidden=true,
    cwd='~/.dotfiles'
}) end)
vim.keymap.set('n', '<leader>b', builtin.buffers)

-- go to mappings
vim.keymap.set('n', 'gd', builtin.lsp_definitions)
vim.keymap.set('n', 'gr', builtin.lsp_references)
vim.keymap.set('n', 'gi', builtin.lsp_implementations)
vim.keymap.set('n', 'gD', builtin.lsp_type_definitions)

-- help mappings
vim.keymap.set('n', '<leader>h', builtin.help_tags)
vim.keymap.set('n', '<leader>dD', builtin.diagnostics)

-- dap mappings
utils.map('n', '<leader>dc', ':Telescope dap configurations<cr>')
utils.map('n', '<leader>ds', ':Telescope dap list_breakpoints<cr>')
