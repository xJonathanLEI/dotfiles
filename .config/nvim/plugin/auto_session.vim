if exists('g:loaded_autosession')
    finish
endif
let g:loaded_autosession = 1

" Disable vim-session's auto save/load
let g:session_autoload = 'no'
let g:session_autosave = 'no'

function AutoLoadSession()
    let l:session_file = substitute(getcwd(), '/', '_', 'g')
    execute "silent! OpenSession!". l:session_file
endfunction

function AutoSaveSession()
    let l:session_file = substitute(getcwd(), '/', '_', 'g')
    execute "SaveSession!". l:session_file
endfunction

cabbrev SaveSession call AutoSaveSession()

" Without this highlighting won't work
set sessionoptions-=options
set sessionoptions+=localoptions
