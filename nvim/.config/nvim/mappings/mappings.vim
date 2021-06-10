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
function! CleverTab()
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<Tab>"
   else
      return "\<C-N>"
   endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>
nnoremap <leader>j :cn<CR>
nnoremap <leader>k :cp<CR>
inoremap <leader>j :cn<CR>
inoremap <leader>k :cp<CR>

" Navigation remaps
nnoremap <expr> <S-J> getcurpos()[1] == line("w$") ? "\<PageDown>" : "L"
nnoremap <expr> <S-K> getcurpos()[1] == line("w0") ? "\<PageUp>" : "H"
nnoremap <S-H> 0
nnoremap <S-L> $
source $HOME/.config/nvim/mappings/pane.vim 
map <silent> <C-h> <Plug>WinMoveLeft
map <silent> <C-j> <Plug>WinMoveDown
map <silent> <C-k> <Plug>WinMoveUp
map <silent> <C-l> <Plug>WinMoveRight

" Which-key mappings
source $HOME/.config/nvim/mappings/which-key.vim
