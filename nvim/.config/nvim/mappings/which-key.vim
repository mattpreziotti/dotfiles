" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['.'] = 'startify'
let g:which_key_map['/'] = 'comment'
let g:which_key_map['%'] = 'source file'
let g:which_key_map['a'] = 'git add current file'
let g:which_key_map['A'] = 'git add all'
let g:which_key_map['c'] = 'git commit'
let g:which_key_map['d'] = 'git inline diff'
let g:which_key_map['D'] = 'git undo hunk'
let g:which_key_map['n'] = 'nerd tree'
let g:which_key_map['q'] = 'quit'
let g:which_key_map['s'] = 'save'
let g:which_key_map['S'] = 'save & quit'
let g:which_key_map['u'] = 'git unstage buffer'
let g:which_key_map['U'] = 'git unstage all files'
let g:which_key_map['w'] = 'close buffer'

" l is for lsp
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ 'k' : 'format file',
      \ }

" f is for find
let g:which_key_map.f = {
      \ 'name' : '+find' ,
      \ 'f' : 'file',
      \ 'g' : 'live grep',
      \ 'w' : 'word',
      \ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'a' : 'add current file',
      \ 'A' : 'add all',
      \ 'b' : 'branch',
      \ 'B' : 'blame',
      \ 'c' : 'commit',
      \ 'C' : 'checkout',
      \ 'd' : 'inline diff',
      \ 'D' : 'undo hunk',
      \ 'f' : 'fetch',
      \ 'g' : 'status',
      \ 'G' : 'open in Github',
      \ 'l' : 'list buffer commits',
      \ 'L' : 'list commits',
      \ 'p' : 'push',
      \ 'P' : 'pull',
      \ 's' : 'stash',
      \ 'u' : 'unstage current file',
      \ 'U' : 'unstage all files',
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
