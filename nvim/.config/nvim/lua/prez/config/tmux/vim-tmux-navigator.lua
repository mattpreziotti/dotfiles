local M = {}
local utils = require('prez.utils')

local function direction(key)
    if (key == 'h') then
        vim.cmd('TmuxNavigateLeft')
    end
    if (key == 'j') then
        vim.cmd('TmuxNavigateDown')
    end
    if (key == 'k') then
        vim.cmd('TmuxNavigateUp')
    end
    if (key == 'l') then
        vim.cmd('TmuxNavigateRight')
    end
end

function M.WinMove(key)
    local curwin = vim.api.nvim_get_current_win()
    print(vim.inspect(curwin))
    direction(key)
    if (curwin == vim.api.nvim_get_current_win()) then
        if (key == 'j' or key == 'k') then
            vim.cmd('wincmd s')
        else
            vim.cmd('wincmd v')
        end
        direction(key)
    end
end

vim.g["tmux_navigator_no_mappings"] = 1
utils.map('n', '<C-h>', [[:lua require('prez.config.tmux.vim-tmux-navigator').WinMove('h')<cr>]])
utils.map('n', '<C-j>', [[:lua require('prez.config.tmux.vim-tmux-navigator').WinMove('j')<cr>]])
utils.map('n', '<C-k>', [[:lua require('prez.config.tmux.vim-tmux-navigator').WinMove('k')<cr>]])
utils.map('n', '<C-l>', [[:lua require('prez.config.tmux.vim-tmux-navigator').WinMove('l')<cr>]])

return M
