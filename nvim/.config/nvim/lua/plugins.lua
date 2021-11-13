-- Install packer on initial clone
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- List Plugins
return require('packer').startup(function(use)

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        'kabouzeid/nvim-lspinstall',
        'hrsh7th/cmp-nvim-lsp',
        'ray-x/lsp_signature.nvim',
        { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" },
        config = require'config.lsp'
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
        config = require'config.completion'
    }

    -- Telescope
    use {
        {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'} },
        {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        config = require'config.finder'
    }

    -- Git
    use {
        'kdheepak/lazygit.nvim', -- This plugin is sweeeeeet
        { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' },
        config = require'config.git'
    }

    -- Lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = require'config.statusline'
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = require'config.treesitter'
    }

    -- Theme
    use {
        'folke/tokyonight.nvim',
        config = require'themes.tokyonight'
    }

    -- File Tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = require'config.tree'
    }

    -- Startify
    use {
        'mhinz/vim-startify',
        config = require'config.startify'
    }

    -- Comment things
    use {
        'tpope/vim-commentary',
        config = require'config.comment'
    }

    -- Auto pairs
    use {
        'windwp/nvim-autopairs',
        config = require('nvim-autopairs').setup{}
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
