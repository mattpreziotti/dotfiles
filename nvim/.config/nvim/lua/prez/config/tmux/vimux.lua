local utils = require'prez.utils'

-- Settings
vim.g["VimuxOrientation"] = "h"
vim.g["VimuxHeight"] = 50
vim.g["VimuxResetSequence"] = ""
-- vim.g["VimuxCloseOnExit"] = 1
-- vim.g["VimuxRunnerName"] = "vimux"
vim.g["VimuxRunnerType"] = "window"

-- Mappings
utils.map('n', '<leader>vv', ':VimuxPromptCommand<CR>')
utils.map('n', '<leader>vx', ':VimuxCloseRunner<CR>')
utils.map('n', '<leader>vi', ':VimuxInspectRunner<CR>')
utils.map('n', '<leader>vc', ':VimuxInterruptRunner<CR>')
utils.map('n', '<leader>vd', ':VimuxClearTerminalScreen<CR>')
utils.map('n', '<leader>vj', ':VimuxTogglePane<CR>')
utils.map('n', '<leader>vl', ':VimuxRunLastCommand<CR>')
