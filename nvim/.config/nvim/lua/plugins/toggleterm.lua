return {
  "akinsho/toggleterm.nvim",
  opts = {
    direction = "float",
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "fd", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "df", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
  end,
  keys = {
    { "<leader>tj", [[<Cmd>exe 1 . "ToggleTerm"<CR>]], desc = "Toggle Terminal 1" },
    { "<leader>tk", [[<Cmd>exe 2 . "ToggleTerm"<CR>]], desc = "Toggle Terminal 2" },
    { "<leader>tl", [[<Cmd>exe 3 . "ToggleTerm"<CR>]], desc = "Toggle Terminal 3" },
    { "<leader>t;", [[<Cmd>exe 4 . "ToggleTerm"<CR>]], desc = "Toggle Terminal 4" },
  },
}
