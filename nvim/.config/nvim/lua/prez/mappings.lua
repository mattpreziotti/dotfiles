local utils = require('prez.utils')

-- Map leader to space
vim.g.mapleader = ' '
utils.map('n', '<Space>', '<NOP>')

-- fd escape
utils.map('i', 'fd', '<Esc>')
utils.map('v', 'fd', '<Esc>')
utils.map('i', 'df', '<Esc>')
utils.map('v', 'df', '<Esc>')

-- Easier command mode
utils.map('n', ';', ':')
utils.map('v', ';', ':')
utils.map('n', ':', ';')
utils.map('v', ':', ';')

-- Buffers remaps
utils.map('n', '<Tab>', ':bn<cr>')
utils.map('n', '<S-Tab>', ':bp<cr>')

-- Quickfix remaps
utils.map('n', '<C-j>', ':cnext<cr>')
utils.map('n', '<C-k>', ':cprev<cr>')

-- hjkl super navigation
utils.map('n', '<S-h>', '_')
utils.map('n', '<S-j>', '<PageDown>')
utils.map('n', '<S-k>', '<PageUp>')
utils.map('n', '<S-l>', '$')

-- Buffer manipulation
utils.map('n', '<leader>q', ':q<cr>')
utils.map('n', '<leader>Q', ':q!<cr>')
utils.map('n', '<leader>s', ':w<cr>')
utils.map('n', '<leader>w', ':bd<cr>')
utils.map('n', '<leader>%', ':so %<cr>')

-- Smart split
-- utils.map('n', '<leader>j', [[:lua require('prez.utils').WinMove('j')<cr>]])
-- utils.map('n', '<leader>k', [[:lua require('prez.utils').WinMove('k')<cr>]])
-- utils.map('n', '<leader>h', [[:lua require('prez.utils').WinMove('h')<cr>]])
-- utils.map('n', '<leader>l', [[:lua require('prez.utils').WinMove('l')<cr>]])

-- base leader mappings
-- utils.map('n', '<leader>a', ':G add % --verbose<cr>')
-- utils.map('n', '<leader>A', ':G add . --verbose<cr>')
-- utils.map('n', '<leader>c', ':G commit<cr>')
-- utils.map('n', '<leader>d', ':SignifyHunkDiff<cr>')
-- utils.map('n', '<leader>D', ':SignifyHunkUndo<cr>')
-- utils.map('n', '<leader>u', ':G reset HEAD %<cr>')
-- utils.map('n', '<leader>U', ':G reset HEAD .<cr>')
