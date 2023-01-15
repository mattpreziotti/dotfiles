local telescope = require'telescope'
local utils = require'prez.utils'
local builtin = require'telescope.builtin'

telescope.setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }

      -- pseudo code / specification for writing custom displays, like the one
      -- for "codeactions"
      -- specific_opts = {
      --   [kind] = {
      --     make_indexed = function(items) -> indexed_items, width,
      --     make_displayer = function(widths) -> displayer
      --     make_display = function(displayer) -> function(e)
      --     make_ordinal = function(e) -> string
      --   },
      --   -- for example to disable the custom builtin "codeactions" display
      --      do the following
      --   codeactions = false,
      -- }
    }
  }
}
telescope.load_extension('fzf')
telescope.load_extension('dap')
telescope.load_extension('ui-select')

-- search mappings
vim.keymap.set('n', '<leader>ff', function() builtin.find_files({results_title=vim.fn.getcwd()}) end)
vim.keymap.set('n', '<leader>fg', function() builtin.live_grep({results_title=vim.fn.getcwd()}) end)
vim.keymap.set('n', '<leader>fd', function() builtin.find_files({
    results_title='dotfiles',
    hidden=true,
    cwd='~/.dotfiles'
}) end)
vim.keymap.set('n', '<leader>b', builtin.buffers)

-- go to mappings
vim.keymap.set('n', 'gd', builtin.lsp_definitions)
vim.keymap.set('n', 'gr', builtin.lsp_references)
vim.keymap.set('n', 'gi', builtin.lsp_implementations)
vim.keymap.set('n', 'gD', builtin.lsp_type_definitions)

-- help mappings
vim.keymap.set('n', '<leader>h', builtin.help_tags)
vim.keymap.set('n', '<leader>dD', builtin.diagnostics)

-- dap mappings
utils.map('n', '<leader>dc', ':Telescope dap configurations<cr>')
utils.map('n', '<leader>ds', ':Telescope dap list_breakpoints<cr>')
