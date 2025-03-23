return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    local icons = require("lazyvim.config").icons
    local custom_tokyonight = require("lualine.themes.tokyonight")

    -- Transparent background
    for mode in pairs(custom_tokyonight) do
      for section in pairs(custom_tokyonight[mode]) do
        if section == "a" then
          custom_tokyonight[mode][section].fg = custom_tokyonight[mode][section].bg
        end
        custom_tokyonight[mode][section].bg = "None"
      end
    end

    return {
      options = {
        theme = custom_tokyonight,
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
        component_separators = "",
        section_separators = "",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "neo-tree" },
    }
  end,
}
