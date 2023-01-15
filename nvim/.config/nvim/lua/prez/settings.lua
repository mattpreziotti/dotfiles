local utils = require('prez.utils')

local cmd = vim.cmd
local indent = 4

cmd 'syntax enable'
cmd 'filetype plugin indent on'

-- Tabs
utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'tabstop', indent)
utils.opt('o', 'shiftround', true)

-- Buffers
utils.opt('o', 'hidden', true)
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)
utils.opt('w', 'wrap', false)
utils.opt('w', 'signcolumn', 'yes')

-- Search
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'incsearch', true)
utils.opt('o', 'wildmode', 'list:longest')
utils.opt('o', 'hlsearch', false)

-- Panes
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)

-- Clipboard
utils.opt('o', 'clipboard', 'unnamed,unnamedplus')

-- No annoying beep
utils.opt('o', 'errorbells', false)

-- 24-bit colors
utils.opt('o', 'termguicolors', true)

-- Don't show mode (statusline will show)
utils.opt('o', 'showmode', false)

-- global statusline
utils.opt('o', 'laststatus', 3)

-- Highlight on yank
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
