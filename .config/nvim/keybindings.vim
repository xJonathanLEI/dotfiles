" Alt + Shift + F for formatting
nnoremap <S-A-f> :Format<cr>
inoremap <S-A-f> <c-o>:Format<cr>

" Ctrl + S for saving
nnoremap <c-s> :w<cr>
inoremap <c-s> <c-o>:w<cr>

" Ctrl + B for toggling NERDTree
function! ToggleNerdtree()
    if exists("g:NERDTree")
        if g:NERDTree.IsOpen()
            NERDTreeClose
        else
	    if &buftype ==# 'terminal'
                NERDTreeFocus
            else
                " TODO: only do NERDTreeFind if the file is inside the current
	        " folder
                NERDTreeFind
	    endif
        endif
    endif
endfunc
nnoremap <silent> <C-b> :call ToggleNerdtree()<cr>
inoremap <silent> <C-b> <c-o>:call ToggleNerdtree()<cr>

" // for searching selected text
vnoremap // y/\V<c-r>=escape(@",'/\')<cr><cr>

" Ctrl + F for line search
nnoremap <C-f> :CocList lines<cr>
inoremap <C-f> <c-o>:CocList lines<cr>

" Alt + Shift + S for file content search
nnoremap <S-A-s> :Telescope live_grep<cr>
inoremap <S-A-s> <c-o>:Telescope live_grep<cr>
xnoremap <S-A-s> y:lua require'telescope.builtin'.grep_string({search = vim.fn.getreg()})<cr>

" Ctrl + P for file name search
nnoremap <C-P> :Telescope find_files find_command=rg,--ignore,--hidden,--files,--glob,!.git<cr>
inoremap <C-P> <c-o>:Telescope find_files find_command=rg,--ignore,--hidden,--files,--glob,!.git<cr>

" Ctrl + A for select all
nnoremap <C-a> ggVG<cr>
inoremap <C-a> <c-c>ggVG<cr>

" Esc for exiting terminal mode
tnoremap <Esc> <C-\><C-n>

" Ctrl + X for cutting one line
nnoremap <C-x> dd
inoremap <C-x> <c-o>dd

" Alt + Up/K for moving line upward
function! MoveLineUp()
    let l:current_line_no = line(".")
    if l:current_line_no > 1
	let l:last_line = getline(l:current_line_no - 1)
        let l:current_line = getline(l:current_line_no)
	call setline(l:current_line_no - 1, l:current_line)
        call cursor(l:current_line_no - 1, ".")
	call setline(l:current_line_no, l:last_line)
    endif
endfunc
nnoremap <silent> <A-Up> :call MoveLineUp()<cr>
inoremap <silent> <A-Up> <c-o>:call MoveLineUp()<cr>
nnoremap <silent> <A-k> :call MoveLineUp()<cr>
inoremap <silent> <A-k> <c-o>:call MoveLineUp()<cr>

" Alt + Down/J for moving line downward
function! MoveLineDown()
    let l:current_line_no = line(".")
    let l:last_line_no = line("$")
    if l:current_line_no < l:last_line_no
	let l:next_line = getline(l:current_line_no + 1)
        let l:current_line = getline(l:current_line_no)
	call setline(l:current_line_no + 1, l:current_line)
        call cursor(l:current_line_no + 1, ".")
	call setline(l:current_line_no, l:next_line)
    endif
endfunc
nnoremap <silent> <A-Down> :call MoveLineDown()<cr>
inoremap <silent> <A-Down> <c-o>:call MoveLineDown()<cr>
nnoremap <silent> <A-j> :call MoveLineDown()<cr>
inoremap <silent> <A-j> <c-o>:call MoveLineDown()<cr>

" Alt + Left/H for moving back one word
nnoremap <A-Left> b
nnoremap <A-h> b
inoremap <A-Left> <c-o>b
inoremap <A-h> <c-o>b

" Atl + Right/L for moving forward one word
nnoremap <A-Right> e
nnoremap <A-l> e
inoremap <A-Right> <c-c>ea
inoremap <A-l> <c-c>ea

" Alt + Backspace for deleting word
nnoremap <A-BS> db
inoremap <A-BS> <c-w>

" F12 for toggling mouse support
function! ToggleMouse()
    if &mouse == 'a'
        set mouse=
    else
        set mouse=a
    endif
endfunc
nnoremap <F12> :call ToggleMouse()<cr>
inoremap <F12> <c-o>:call ToggleMouse()<cr>

" 0 for going to first char / start of line
nnoremap <expr> <silent> 0 col('.') == match(getline('.'),'\S')+1 ? '0' : '^'

" Delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Replace currently selected text with default register without yanking it
" TODO: handle last line bug
vnoremap <leader>p "_dP
