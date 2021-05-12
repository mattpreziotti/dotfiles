" General remaps
let mapleader = " "
inoremap fd <Esc>
inoremap df <Esc>
vnoremap fd <Esc>
vnoremap df <Esc>

" File Modifiers 
nnoremap <M-s> :w<cr>
nnoremap <M-S> :wq<cr>
nnoremap <C-q> :q<cr>
"nnoremap <C-Q> :q!<cr>
nnoremap <C-d> :bd<cr>
"nnoremap <M-Q> :bd!<cr>

" Easier command mode
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;

" Buffer remaps
nnoremap <Tab> :bn<cr>
nnoremap <S-Tab> :bp<cr>

" Navigation remaps
nnoremap <expr> <S-J> getcurpos()[1] == line("w$") ? "\<PageDown>" : "L"
nnoremap <expr> <S-K> getcurpos()[1] == line("w0") ? "\<PageUp>" : "H"
nnoremap <S-H> 0
nnoremap <S-L> $

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function s:WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

" Navigate to pane to the left, or create a new pane
nnoremap <Plug>WinMoveLeft :<C-U>call <SID>WinMove('h')<CR>
" Navigate to pane to below, or create a new pane
nnoremap <Plug>WinMoveDown :<C-U>call <SID>WinMove('j')<CR>
" Navigate to pane above, or create a new pane
nnoremap <Plug>WinMoveUp :<C-U>call <SID>WinMove('k')<CR>
" Navigate to pane to the right, or create a new pane
nnoremap <Plug>WinMoveRight :<C-U>call <SID>WinMove('l')<CR>

map <silent> <C-h> <Plug>WinMoveLeft
map <silent> <C-j> <Plug>WinMoveDown
map <silent> <C-k> <Plug>WinMoveUp
map <silent> <C-l> <Plug>WinMoveRight
