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
        'williamboman/nvim-lsp-installer',
        'ray-x/lsp_signature.nvim',
        { 'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons' },
        { 'neovim/nvim-lspconfig', config = function() require('prez.config.lsp') end },
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
            'hrsh7th/cmp-nvim-lsp',
            'onsails/lspkind-nvim'
        },
        config = function() require('prez.config.completion') end
    }

    -- Telescope
    use {
        {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        {
            'nvim-telescope/telescope.nvim',
            requires = 'nvim-lua/plenary.nvim',
            config = function() require('prez.config.finder') end
        },
    }

    -- Git
    use {
        'kdheepak/lazygit.nvim',
        'tpope/vim-fugitive',
        {
            'lewis6991/gitsigns.nvim',
            requires = 'nvim-lua/plenary.nvim',
            config = function() require('prez.config.git') end
        }
    }

    -- Lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function() require('prez.config.statusline') end
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require('prez.config.treesitter') end
    }

    -- Theme
    use {
        'folke/tokyonight.nvim',
        config = function() require("prez.themes.tokyonight") end
    }

    -- File Tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('prez.config.tree') end
    }

    -- Startify
    use {
        'mhinz/vim-startify',
        config = function() require("prez.config.startify") end
    }

    -- Comment things
    use {
        'tpope/vim-commentary',
        config = function() require("prez.config.comment") end
    }

    -- Auto pairs
    use {
        'windwp/nvim-autopairs',
        config = function() require("nvim-autopairs").setup{} end
    }

    use "wbthomason/packer.nvim" -- Have packer manage itself

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
