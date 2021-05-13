let g:startify_lists = [
          \ { 'type': 'dir',       'header': ['   Project Root '] },
          \ { 'type': 'files',     'header': ['   Recent Files']            },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'm': '~/.config/nvim/mappings/mappings.vim' },
            \ { 'p': '~/.config/nvim/plugins/plugins.vim' },
            \ { 'z': '~/.zshrc' },
            \ ]

let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0

let g:startify_custom_header = [
        \ ' __    __                      __     __  __               ',              
        \ '/  \  /  |                    /  |   /  |/  |              ', 
        \ '$$  \ $$ |  ______    ______  $$ |   $$ |$$/  _____  ____  ', 
        \ '$$$  \$$ | /      \  /      \ $$ |   $$ |/  |/     \/    \ ', 
        \ '$$$$  $$ |/$$$$$$  |/$$$$$$  |$$  \ /$$/ $$ |$$$$$$ $$$$  |',
        \ '$$ $$ $$ |$$    $$ |$$ |  $$ | $$  /$$/  $$ |$$ | $$ | $$ |',
        \ '$$ |$$$$ |$$$$$$$$/ $$ \__$$ |  $$ $$/   $$ |$$ | $$ | $$ |',
        \ '$$ | $$$ |$$       |$$    $$/    $$$/    $$ |$$ | $$ | $$ |',
        \' $$/   $$/  $$$$$$$/  $$$$$$/      $/     $$/ $$/  $$/  $$/ ',
        \]
