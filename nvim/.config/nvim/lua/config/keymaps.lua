-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- fd escape
map("i", "fd", "<esc>")
map("v", "fd", "<esc>")
map("i", "df", "<esc>")
map("v", "df", "<esc>")

-- save
map("n", "<leader>s", "<cmd>w<cr><esc>", { desc = "Save file" })

-- lazy
map("n", "<leader>.", "<cmd>:Lazy<cr>", { desc = "Lazy" })
vim.keymap.del("n", "<leader>l")

-- Easier command mode
map("n", ";", ":")
map("v", ";", ":")
map("n", ":", ";")
map("v", ":", ";")

-- buffer tab
map("n", "<tab>", ":bn<cr>", { desc = "Next Buffer" })
map("n", "<S-Tab>", ":bp<cr>", { desc = "Previous Bufer" })

-- hjkl super navigation
map("n", "<S-h>", "_")
map("n", "<S-j>", "<PageDown>")
map("n", "<S-k>", "<PageUp>")
map("n", "<S-l>", "$")
