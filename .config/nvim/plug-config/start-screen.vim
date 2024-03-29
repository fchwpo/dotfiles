
let g:startify_custom_header = [
        \ '        _   ___    ________          __   ',
        \ '       / | / / |  / / ____/___  ____/ /__ ',
        \ '      /  |/ /| | / / /   / __ \/ __  / _ \',
        \ '     / /|  / | |/ / /___/ /_/ / /_/ /  __/',
        \ '    /_/ |_/  |___/\____/\____/\__,_/\___/ ',
        \]
                                      
let g:startify_session_dir = '~/.config/nvim/session'


let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']                     },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ ]


let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1

let g:webdevicons_enable_startify = 1

function! StartifyEntryFormat()
        return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
    endfunction

let g:startify_bookmarks = [
        \ { 'i': '~/.config/nvim/init.vim' },
        \ { 'z': '~/.zshrc' },
        \ { 'w' : '~/Documents/code/work/projects/webstore' },
        \ { 'c' : '~/Documents/code/work/projects/cms-services' },
        \ { 'o' : '~/Documents/code/work/projects/omni-services' },
        \ { 'p' : '~/Documents/code/work/projects/product-crud' },
        \ { 'j' : '~/Documents/code/work/projects/jd-library'},
        \ { 'n' : '~/Documents/code/work/projects/nest-apis' },
        \ { 'm' : '~/Documents/code/work/projects/justdial-marketplace' },
        \ ]

let g:startify_enable_special = 0
