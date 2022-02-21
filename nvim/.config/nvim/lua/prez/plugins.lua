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
    use {
        'neovim/nvim-lspconfig',
        'kabouzeid/nvim-lspinstall',
        'hrsh7th/cmp-nvim-lsp',
        'ray-x/lsp_signature.nvim',
        { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" },
        config = 'require("prez.config.lsp")'
    }

    -- Completion
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
            'onsails/lspkind-nvim'
        },
        config = 'require("prez.config.completion")'
    }

    -- Telescope
    use {
        {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'} },
        {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        config = 'require("prez.config.finder")'
    }

    -- Git
    use {
        'kdheepak/lazygit.nvim', -- This plugin is sweeeeeet
        { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' },
        'tpope/vim-fugitive',
        config = 'require("prez.config.git")'
    }

    -- Lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = 'require("prez.config.statusline")'
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = 'require("prez.config.treesitter")'
    }

    -- Theme
    use {
        'folke/tokyonight.nvim',
        config = 'require("prez.themes.tokyonight")'
    }

    -- File Tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = 'require("prez.config.tree")'
    }

    -- Startify
    use {
        'mhinz/vim-startify',
        config = 'require("prez.config.startify")'
    }

    -- Comment things
    use {
        'tpope/vim-commentary',
        config = 'require("prez.config.comment")'
    }

    -- Auto pairs
    use {
        'windwp/nvim-autopairs',
        config = 'require("nvim-autopairs").setup{}'
    }

    use "wbthomason/packer.nvim" -- Have packer manage itself

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
