" General remaps
let mapleader = " "
inoremap fd <Esc>
inoremap df <Esc>
vnoremap fd <Esc>
vnoremap df <Esc>

" Easier command mode
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;

" Buffer remaps
nnoremap <Tab> :bn<cr>
nnoremap <S-Tab> :bp<cr>

" Quixfix remaps
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>

" hjkl jumps
nnoremap <expr> <S-J> getcurpos()[1] == line("w$") ? "\<PageDown>" : "L"
nnoremap <expr> <S-K> getcurpos()[1] == line("w0") ? "\<PageUp>" : "H"
nnoremap <S-H> 0
nnoremap <S-L> $

" Pane navigation remaps
source $HOME/.config/nvim/mappings/pane.vim 
map <silent> <leader>hh <Plug>WinMoveLeft
map <silent> <leader>jj <Plug>WinMoveDown
map <silent> <leader>kk <Plug>WinMoveUp
map <silent> <leader>ll <Plug>WinMoveRight

" Clever tab
function! CleverTab()
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<Tab>"
   else
      return "\<C-N>"
   endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>
" hiiiiii
" Which-key mappings
source $HOME/.config/nvim/mappings/which-key.vim
