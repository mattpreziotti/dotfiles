return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- disable hover
    keys[#keys + 1] = { "K", false }
    keys[#keys + 1] = { "gr", "<cmd>Telescope lsp_references show_line=false <cr>" }
    keys[#keys + 1] = { "gI", "<cmd>Telescope lsp_implementations show_line=false <cr>" }
  end,
  opts = {
    inlay_hints = { enabled = false },
    diagnostics = {
      virtual_text = false,
    },
    -- make sure mason installs the server
    servers = {
      ---@type lspconfig.options.tsserver
      tsserver = {
        settings = {
          typescript = {
            format = {
              indentSize = vim.o.shiftwidth,
              convertTabsToSpaces = vim.o.expandtab,
              tabSize = vim.o.tabstop,
            },
          },
          javascript = {
            format = {
              indentSize = 4,
              convertTabsToSpaces = true,
              tabSize = 4,
            },
          },
          completions = {
            completeFunctionCalls = true,
          },
        },
      },
    },
  },
  -- setup = {
  --   tsserver = function(_, opts)
  --     require("lazyvim.util").on_attach(function(client, buffer)
  --       if client.name == "tsserver" then
  --         -- stylua: ignore
  --         vim.keymap.set("n", "<leader>co", "<cmd>TypescriptOrganizeImports<CR>", { buffer = buffer, desc = "Organize Imports" })
  --         -- stylua: ignore
  --         vim.keymap.set("n", "<leader>cR", "<cmd>TypescriptRenameFile<CR>", { desc = "Rename File", buffer = buffer })
  --       end
  --     end)
  --     require("typescript").setup({ server = opts })
  --     return true
  --   end,
  -- },
}
