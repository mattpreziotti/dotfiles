local M = {}

function M.WinMove(key)
    local curwin = vim.api.nvim_get_current_win()
    vim.api.nvim_command('wincmd ' .. key)
    if (curwin == vim.api.nvim_get_current_win()) then
        if (key == 'j' or key == 'k') then
            vim.api.nvim_command('wincmd s')
        else
            vim.api.nvim_command('wincmd v')
        end
        vim.api.nvim_command('wincmd ' .. key)
    end
end

return M
