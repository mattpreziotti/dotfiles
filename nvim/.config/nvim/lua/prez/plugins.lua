local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- List Plugins
return packer.startup(function(use)

    -- LSP
    use { 'williamboman/nvim-lsp-installer', requires = 'neovim/nvim-lspconfig', config = function() require('prez.config.lsp.lsp-installer') end }
    use { 'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons', config = function() require('prez.config.lsp.trouble') end }
    use { 'ray-x/lsp_signature.nvim' }

    -- Completion
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            -- Language
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',

            -- Snippets
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',

            -- Misc
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',

            -- icons
            'onsails/lspkind-nvim',
            'hrsh7th/cmp-emoji',
        },
        config = function() require('prez.config.nvim-cmp') end
    }

    -- Testing
    -- use { "rcarriga/vim-ultest", requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins" }

    -- Debugging
    use { 'mfussenegger/nvim-dap', config = function() require("prez.config.debug.nvim-dap") end }
    use { 'theHamsta/nvim-dap-virtual-text', config = function () require("prez.config.debug.nvim-dap-virtual-text") end }
    use { 'leoluz/nvim-dap-go', config = function () require("prez.config.debug.nvim-dap-go") end }

    -- Telescope
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { 'nvim-telescope/telescope-dap.nvim' }
    use {'nvim-telescope/telescope-ui-select.nvim' }
    use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim', config = function() require('prez.config.telescope') end }

    -- Git
    use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' }
    use { 'ldelossa/gh.nvim', requires = 'ldelossa/litee.nvim', config = function() require('prez.config.git') end }

    -- Floaterm
    use { 'voldikss/vim-floaterm', config = function() require('prez.config.floaterm') end }

    -- Lualine
    use { 'nvim-lualine/lualine.nvim', requires = 'kyazdani42/nvim-web-devicons', config = function() require('prez.config.lualine') end }

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function() require('prez.config.nvim-treesitter') end }

    -- Theme
    use { 'folke/tokyonight.nvim', config = function() require("prez.themes.tokyonight") end }

    -- File Tree
    use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons', config = function() require('prez.config.nvim-tree') end }

    -- Startify
    use { 'mhinz/vim-startify', config = function() require("prez.config.vim-startify") end }

    -- Comment things
    use { 'tpope/vim-commentary', config = function() require("prez.config.vim-commentary") end }

    -- Auto pairs
    use { 'windwp/nvim-autopairs', config = function() require("nvim-autopairs").setup{} end }

    -- Tmux
    use { 'preservim/vimux', config = function() require("prez.config.tmux.vimux") end }
    use { 'christoomey/vim-tmux-navigator', config = function() require("prez.config.tmux.vim-tmux-navigator") end }

    -- indent line
    use { 'lukas-reineke/indent-blankline.nvim', config = function() require('prez.config.indent-blankline') end }

    -- Folding
    -- use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async', config = function() require('ufo').setup() end}

    use "wbthomason/packer.nvim" -- Have packer manage itself

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
