call plug#begin('~/.vim/plugged')
" IntelliSense
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'hrsh7th/nvim-compe'
" Startify
Plug 'mhinz/vim-startify'
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" Status Line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Themes
Plug 'joshdick/onedark.vim'
call plug#end()

" Set the theme
source $HOME/.config/nvim/themes/onedark.vim

" Plugin specific settings
source $HOME/.config/nvim/plugins/lspconfig.vim
source $HOME/.config/nvim/plugins/telescope.vim
source $HOME/.config/nvim/plugins/compe.vim
source $HOME/.config/nvim/plugins/airline.vim
source $HOME/.config/nvim/plugins/start-screen.vim
