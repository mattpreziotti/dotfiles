-- Lists / Header
vim.g['startify_custom_header'] = {
    '    __    __                      __     __  __               ',
    '   /  \\  /  |                    /  |   /  |/  |              ',
    '   $$  \\ $$ |  ______    ______  $$ |   $$ |$$/  _____  ____  ',
    '   $$$  \\$$ | /      \\  /      \\ $$ |   $$ |/  |/     \\/    \\ ',
    '   $$$$  $$ |/$$$$$$  |/$$$$$$  |$$  \\ /$$/ $$ |$$$$$$ $$$$  |',
    '   $$ $$ $$ |$$    $$ |$$ |  $$ | $$  /$$/  $$ |$$ | $$ | $$ |',
    '   $$ |$$$$ |$$$$$$$$/ $$ \\__$$ |  $$ $$/   $$ |$$ | $$ | $$ |',
    '   $$ | $$$ |$$       |$$    $$/    $$$/    $$ |$$ | $$ | $$ |',
    '   $$/   $$/  $$$$$$$/  $$$$$$/      $/     $$/ $$/  $$/  $$/ ',
}

vim.g['startify_lists'] = {
    { ['type'] = 'dir', ['header'] = { '   Recent Files' }},
    { ['type'] = 'sessions',  ['header'] = { '   Sessions' }},
    { ['type'] = 'bookmarks', ['header'] = { '   Bookmarks' }},
}

vim.g['startify_bookmarks'] = {
    { s = '~/.dotfiles/nvim/.config/nvim/lua/prez/settings.lua' },
    { m = '~/.dotfiles/nvim/.config/nvim/lua/prez/mappings.lua' },
    { p = '~/.dotfiles/nvim/.config/nvim/lua/prez/plugins.lua' },
    { z = '~/.dotfiles/zsh/.config/zsh/.zshrc' },
    { t = '~/.dotfiles/tmux/.config/tmux/tmux.conf' },
    { K = '~/.dotfiles/kitty/.config/kitty/kitty.conf' },
}

-- Settings
vim.g['startify_session_autoload'] = 1
vim.g['startify_session_delete_buffers'] = 1
vim.g['startify_change_to_vcs_root'] = 1
vim.g['startify_fortune_use_unicode'] = 1
vim.g['startify_session_persistence'] = 1
vim.g['startify_enable_special'] = 0

-- Mappings
local utils = require'prez.utils'
utils.map('n', '<leader>.', ':Startify<CR>')
utils.map('n', '<leader>S', ':SSave<cr>')
