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

" base leader mappings
nnoremap <leader>. :Startify<CR>
nmap <leader>/ <Plug>CommentaryLine<CR>
xmap <leader>/ <Plug>Commentary<CR>
nnoremap <leader>% :so %<CR>
nnoremap <leader>a :G add % --verbose<CR>
nnoremap <leader>A :G add . --verbose<CR>
nnoremap <leader>c :G commit<CR>
nnoremap <leader>d :SignifyHunkDiff<CR>
nnoremap <leader>D :SignifyHunkUndo<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>S :wq<CR>
nnoremap <leader>u :G reset HEAD %<CR>
nnoremap <leader>U :G reset HEAD .<CR>
nnoremap <leader>w :bd<CR>

" f is for find
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg :lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fw *

" g is for git
nnoremap <leader>ga :G add % --verbose<CR>
nnoremap <leader>gA :G add . --verbose<CR>
nnoremap <leader>gb :G branch
nnoremap <leader>gB :G blame<CR>
nnoremap <leader>gc :G commit<CR>
nnoremap <leader>gC :G checkout
nnoremap <leader>gd :SignifyHunkDiff<CR>
nnoremap <leader>gD :SignifyHunkUndo<CR>
nnoremap <leader>gf :G fetch<CR>
nnoremap <leader>gg :vertical G<CR>
nnoremap <leader>gl :GV!<CR>
nnoremap <leader>gL :GV<CR>
nnoremap <leader>gp :G push --verbose<CR>
nnoremap <leader>gP :G pull --verbose<CR>
nnoremap <leader>gs :G stash<CR>
nnoremap <leader>gu :G reset HEAD %<CR>
nnoremap <leader>gU :G reset HEAD .<CR>

" l is for lsp
" lsp keymaps are in mappings/lspconfig.vim

" hjkl navigation
nnoremap <expr> <S-J> getcurpos()[1] == line("w$") ? "\<PageDown>" : "L"
nnoremap <expr> <S-K> getcurpos()[1] == line("w0") ? "\<PageUp>" : "H"
nnoremap <S-H> 0
nnoremap <S-L> $

" Pane navigation remaps
source $HOME/.config/nvim/mappings/smart-split.vim 
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

" Emmet
let g:user_emmet_leader_key=','

" Which-key mappings
source $HOME/.config/nvim/mappings/which-key.vim
