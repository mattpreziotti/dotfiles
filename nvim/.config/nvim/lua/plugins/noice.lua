return {
  "folke/noice.nvim",
  -- stylua: ignore
  keys = {
    { "<leader>snl", vim.NIL },
    { "<leader>snh", vim.NIL },
    { "<leader>sna", vim.NIL },
    { "<leader>fnl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
    { "<leader>fnh", function() require("noice").cmd("history") end, desc = "Noice History" },
    { "<leader>fna", function() require("noice").cmd("all") end, desc = "Noice All" },
  },
}
