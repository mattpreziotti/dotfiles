call plug#begin('~/.vim/plugged')
" IntelliSense
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'hrsh7th/nvim-compe'
" Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
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
Plug 'morhetz/gruvbox'
" Icons
Plug 'kyazdani42/nvim-web-devicons'
" Which Key
Plug 'liuchengxu/vim-which-key'
" NerdTree
Plug 'preservim/nerdtree'
call plug#end()

" Set the theme
source $HOME/.config/nvim/themes/gruvbox.vim

lua << EOF
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
EOF

" Plugin specific settings
source $HOME/.config/nvim/plugins/lspconfig.vim
source $HOME/.config/nvim/plugins/compe.vim
source $HOME/.config/nvim/plugins/signify.vim
source $HOME/.config/nvim/plugins/start-screen.vim
source $HOME/.config/nvim/plugins/telescope.vim
source $HOME/.config/nvim/plugins/airline.vim
