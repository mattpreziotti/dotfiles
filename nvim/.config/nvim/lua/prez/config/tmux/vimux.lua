local utils = require'prez.utils'

-- Mappings
utils.map('n', '<leader>vv', ':VimuxPromptCommand<CR>')
utils.map('n', '<leader>vc', ':VimuxCloseRunner<CR>')
utils.map('n', '<leader>vi', ':VimuxInspectRunner<CR>')
utils.map('n', '<leader>vz', ':VimuxZoomRunner<CR>')
utils.map('n', '<leader>vt', ':VimuxTogglePane<CR>')
utils.map('n', '<leader>vl', ':VimuxRunLastCommand<CR>')
