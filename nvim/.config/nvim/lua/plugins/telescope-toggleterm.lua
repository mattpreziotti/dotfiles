return {
  "https://git.sr.ht/~havi/telescope-toggleterm.nvim",
  event = "TermOpen",
  dependencies = {
    "akinsho/toggleterm.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("telescope").load_extension("toggleterm")
  end,
  keys = {
    { "<leader>ft", ":Telescope toggleterm<CR>", desc = "Terminal Picker" },
  },
}
