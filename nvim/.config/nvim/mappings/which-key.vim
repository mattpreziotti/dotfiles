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
let g:which_key_map['s'] = [ ':w' , 'save' ]
let g:which_key_map['S'] = [ ':wq' , 'save & quit' ]
let g:which_key_map['w'] = [ ':bd' , 'close buffer' ]
let g:which_key_map['q'] = [ ':q!' , 'close buffer' ]
let g:which_key_map['%'] = [ ':so %' , 'close buffer' ]
let g:which_key_map['a'] = [ ':G add %' , 'git add' ]
let g:which_key_map['c'] = [ ':cclose' , 'close list' ]
let g:which_key_map['C'] = [ ':lclose' , 'close local list' ]
let g:which_key_map['o'] = [ ':copen' , 'open list' ]
let g:which_key_map['O'] = [ ':lopen' , 'open local list' ]

" l is for lsp
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ 'k' : [':lua vim.lsp.buf.formatting()', 'format file'],
      \ }

" f is for find
let g:which_key_map.f = {
      \ 'name' : '+find' ,
      \ 'f' : [':Telescope find_files', 'file'],
      \ 'g' : [':Telescope live_grep', 'live grep'],
      \ 'w' : ['*', 'word'],
      \ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 's' : [':vertical G', 'status'],
      \ 'c' : [':G commit --quiet', 'commit'],
      \ 'a' : [':Gwrite', 'add current file'],
      \ 'A' : [':G add .', 'add all'],
      \ 'P' : [':G push', 'push'],
      \ 'p' : [':G pull', 'pull'],
      \ 'b' : [':Gbrowse', 'browse'],
      \ 'B' : [':G blame', 'blame'],
      \ 'l' : [':GV', 'log'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
