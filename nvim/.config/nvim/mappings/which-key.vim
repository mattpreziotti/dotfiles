" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100

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
let g:which_key_map['/'] = [ '<Plug>NERDCommenterToggle'  , 'comment' ]
" let g:which_key_map['e'] = [ ':CocCommand explorer'       , 'explorer' ]
" let g:which_key_map['f'] = [ ':Files'                     , 'search files' ]
" let g:which_key_map['h'] = [ '<C-W>s'                     , 'split below']
" let g:which_key_map['r'] = [ ':Ranger'                    , 'ranger' ]
" let g:which_key_map['T'] = [ ':Rg'                        , 'search text' ]
" let g:which_key_map['v'] = [ '<C-W>v'                     , 'split right']
" let g:which_key_map['z'] = [ 'Goyo'                       , 'zen' ]

" f is for find
let g:which_key_map.f = {
      \ 'name' : '+find' ,
      \ 'f' : [':Telescope find_files', 'file'],
      \ 'w' : ['*', 'word'],
      \ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 's' : [':G', 'status'],
      \ 'c' : [':G commit', 'commit'],
      \ 'A' : [':G add .', 'add all'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
