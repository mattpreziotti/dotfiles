return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["*"] = {
        keys = {
          { "K", false },
        },
      },
    },
    inlay_hints = {
      enabled = false,
    },
  },
}
