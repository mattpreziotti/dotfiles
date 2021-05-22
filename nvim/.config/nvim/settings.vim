set path+=**
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent 
set exrc
set number
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set nowrap
set incsearch
set termguicolors
set signcolumn=yes
set colorcolumn=80
set completeopt=menuone,noinsert,noselect

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:startify_session_dir = '~/.config/nvim/session'