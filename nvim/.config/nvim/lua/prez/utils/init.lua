local utils = { }

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

function utils.opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then scopes['o'][key] = value end
end

function utils.map(mode, lhs, rhs, bufnr, opts)
  local options = {noremap = true, silent = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  if bufnr == nil then
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
  else
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, options)
  end
end

function utils.WinMove(key)
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

return utils
