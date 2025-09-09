-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- ff escape
map("i", "ff", "<esc>")
map("v", "ff", "<esc>")

-- Easier command mode
map("n", ";", ":")
map("v", ";", ":")
map("n", ":", ";")
map("v", ":", ";")

-- hjkl super navigation
map("n", "<S-h>", "_")
map("n", "<S-j>", "<PageDown>")
map("n", "<S-k>", "<PageUp>")
map("n", "<S-l>", "$")
