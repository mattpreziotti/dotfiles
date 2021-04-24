set path+=**
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent 
set exrc
set number
set nohlsearch
set hidden
set noerrorbells
set nowrap
set incsearch
set termguicolors
set scrolloff=8
set signcolumn=yes
set colorcolumn=80
set completeopt=menuone,noinsert,noselect

call plug#begin('~/.vim/plugged')
" Lsp config
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'nvim-lua/completion-nvim'
Plug 'hrsh7th/nvim-compe'
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Gruvbox theme
Plug 'gruvbox-community/gruvbox'
call plug#end()

colorscheme gruvbox
" Set matching strategy
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
" Disable netrw
" let loaded_netrwPlugin = 1

" General remaps
let mapleader = " "
inoremap fd <Esc>
inoremap df <Esc>
vnoremap fd <Esc>
vnoremap df <Esc>
nnoremap <leader>s :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>c :q!<cr>
nnoremap <leader>w <C-w>

" Telescope remaps
nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>g <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>t <cmd>lua require('telescope.builtin').file_browser()<cr>

lua << EOF
require'lspinstall'.setup() -- important

local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{ on_attach=require'completion'.on_attach }
end
EOF

"autocmd VimEnter * lua require('telescope.builtin').find_files()
"autocmd FileType netrw lua require('telescope.builtin').find_files()
