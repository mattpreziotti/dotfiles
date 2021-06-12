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
let g:which_key_map['.'] = [ ':Startify' , 'startify' ]
let g:which_key_map['/'] = [ '<Plug>NERDCommenterToggle'  , 'comment' ]
let g:which_key_map['%'] = [ ':so %' , 'source file' ]
let g:which_key_map['a'] = [ ':G add %' , 'git add current file' ]
let g:which_key_map['A'] = [ ':G add .' , 'git add all' ]
let g:which_key_map['c'] = [ ':G commit' , 'git commit' ]
let g:which_key_map['d'] = [':SignifyHunkDiff', 'git inline diff']
let g:which_key_map['D'] = [':SignifyHunkUndo', 'git undo hunk']
let g:which_key_map['n'] = [ ':NERDTreeToggle' , 'nerd tree' ]
let g:which_key_map['q'] = [ ':q!' , 'quit' ]
let g:which_key_map['s'] = [ ':w' , 'save' ]
let g:which_key_map['S'] = [ ':wq' , 'save & quit' ]
let g:which_key_map['u'] = [':G reset HEAD %', 'git unstage buffer']
let g:which_key_map['U'] = [':G reset HEAD .', 'git unstage all files']
let g:which_key_map['w'] = [ ':bd' , 'close buffer' ]

" l is for lsp
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ 'k' : ['vim#lsp#buf#formatting()', 'format file'],
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
      \ 'a' : [':G add %', 'add current file'],
      \ 'A' : [':G add .', 'add all'],
      \ 'b' : [':G blame', 'blame'],
      \ 'B' : [':Gbrowse', 'open file in Github'],
      \ 'c' : [':G commit', 'commit'],
      \ 'd' : [':SignifyHunkDiff', 'inline diff'],
      \ 'D' : [':SignifyHunkUndo', 'undo hunk'],
      \ 'f' : [':G fetch', 'fetch'],
      \ 'g' : [':vertical G', 'status'],
      \ 'l' : [':GV!', 'list buffer commits'],
      \ 'L' : [':GV', 'list commits'],
      \ 'p' : [':G push -v', 'push'],
      \ 'P' : [':G pull -v', 'pull'],
      \ 's' : [':G stash', 'stash'],
      \ 'u' : [':G reset HEAD %', 'unstage buffer'],
      \ 'U' : [':G reset HEAD .', 'unstage all files'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
